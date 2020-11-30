package egovframework.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import egovframework.cms.log.access.service.AccessLogService;
import egovframework.cms.log.menu.service.AccessMenuLogService;
import egovframework.cms.member.MemberVo;
import egovframework.cms.menu.service.MenuService;
import egovframework.common.helper.EgovHttpRequestHelper;
import egovframework.common.helper.EgovUserDetailsHelper;
import egovframework.common.util.EgovWebUtil;
import egovframework.common.util.StringUtil;

/**
 * 기본 공통 컨트롤러
 * 
 * @author 개발팀 Bang-ji-hwan
 * @since 2013.08.31
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2013.08.31  bjh            최초 생성
 *
 * </pre>
 */
@Controller
public class DefaultController extends CommonController {

	static Logger logger = Logger.getLogger(DefaultController.class);

	@Resource(name = "MenuService")
	protected MenuService menuService;

	@Resource(name = "AccessLogService")
	private AccessLogService accessLogService;

	@Resource(name = "AccessMenuLogService")
	private AccessMenuLogService accessMenuLogService;
	
	/**
	 * TOP 메뉴 정보 세팅
	 * 
	 * @return
	 * @throws Exception
	 */
	@ModelAttribute("cmsTopMenuList")
	public List<Map<String, Object>> init(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> commandMap) throws Exception {
		
		this.request = request;
		this.response = response;
		this.commandMap = commandMap;
		this.commandMap.putAll(getAuthUserInfo());// gUserId,gUserIp 자동 세팅
		
		// 관리자 메뉴 권한 체크
		menuAuthCheck();
		List<Map<String, Object>> topMenuList = null;
		
		//String contentType = StringUtil.noNull(request.getContentType());
		//if (contentType.indexOf("application/x-www-form-urlencoded; charset=UTF-8") > -1) {// ajax인경우 아랫부분을 탈 필요가 없어서 추가
			//return topMenuList;
		//}
		
		menuInfo();
		
		HttpSession session = request.getSession(true);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("MENU_SE", EgovWebUtil.getMenuGubnVal(request));
		paramMap.put("USE_AT", "Y");
		paramMap.put("TOPMENU_USE_AT", "Y");
		paramMap.put("MENU_AUTH_YN", "Y");
		
		MemberVo memberVo = (MemberVo) getAuthenticatedUser();
		if (memberVo != null)
			paramMap.put("authGrp", memberVo.getAuthor_code());

		if (session.getAttribute("cmsTopMenuListSession") != null && session.getAttribute("MENU_SE").equals(EgovWebUtil.getMenuGubnVal(request))) {
			topMenuList = (List) session.getAttribute("cmsTopMenuListSession");
		} else {
			accessLog();// 접속로그 저장 최초 1번
			topMenuList = menuService.getTopMenuList(paramMap);
			session.setAttribute("cmsTopMenuListSession", topMenuList);
			session.setAttribute("MENU_SE", EgovWebUtil.getMenuGubnVal(request));
		}
		return topMenuList;
	}


	/**
	 * 현재메뉴 정보, Left 메뉴, 현제 메뉴 Path
	 * 
	 * @throws Exception
	 */
	public void menuInfo() throws Exception {

		if (!StringUtil.noNull(commandMap.get("pMENU_NO")).equals("")) {
			MemberVo memberVo = (MemberVo) getAuthenticatedUser();
			// 현재 메뉴 정보
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("pMENU_NO", commandMap.get("pMENU_NO"));
			paramMap.put("MENU_NO", commandMap.get("pMENU_NO"));
			paramMap.put("MENU_SE", EgovWebUtil.getMenuGubnVal(request));
			paramMap.put("USE_AT", "Y");
			if (memberVo != null)
				paramMap.put("authGrp", memberVo.getAuthor_code());
			Map<String, Object> menuMap = menuService.getMenu(paramMap);
			if (!linkCk() && menuMap != null) {
				paramMap.put("UPPER_MENU_NO", menuMap.get("MENU_NO"));
				List<Map<String, Object>> menuLocationList = menuService.getThisLocationList(paramMap);
				paramMap.clear();

				if (menuLocationList.size() > 0) {
					paramMap.put("MENU_NO", ((Map<String, Object>) menuLocationList.get(0)).get("MENU_NO"));
				}

				List<Map<String, Object>> leftMenuList = null;
				paramMap.put("USE_AT", "Y");
				paramMap.put("MENU_AUTH_YN", "Y");

				if (memberVo != null)
					paramMap.put("authGrp", memberVo.getAuthor_code());
				paramMap.put("WEB_LEFT", "Y");
				leftMenuList = menuService.getTreeList(paramMap);
				request.setAttribute("cmsLeftMenuList", leftMenuList);
				request.setAttribute("menuLocationList", menuLocationList);
			}
			request.setAttribute("menuMap", menuMap);
		}

	}


	/**
	 * 관리자 권한 체크
	 * 
	 * @throws Exception
	 */
	public void menuAuthCheck() throws Exception {

		// 테스트 모드일경우 통과
		if (EgovUserDetailsHelper.SYSTEM_MODE.equals("TEST")) {
			return;
		}

		String requestURI = request.getRequestURI(); // 요청 URI
		MemberVo memberVo = (MemberVo) getAuthenticatedUser();

		if (memberVo != null /* || !memberVo.getIsAdmin() */) {
			HttpSession session = request.getSession(true);
			/* 예외 항목들 이것들을 어디다 따로 빼지 음 .... */
			List<String> list = new ArrayList<String>();
			list.add("/cms/link/");
			list.add("/cms/link");
			list.add("/cms/");
			list.add("/cms");
			list.add("/cms/main/");
			list.add("/cms/main");
			list.add("/.*ajax.*");
			list.add("/.*Ajax.*");
			list.add("/.*Table.*");
			list.add("/.*Json.*");
			list.add("/.*/pop[A-Z].*");
			list.add("/editor/upload.*");
			list.add("/.*file/viewImag.*");
			list.add("/.*file/download.*");
			list.add("/jfile/.*");
			list.add("/cms/codeUtil/.*");
			list.add("/web");
			list.add("/web/.*");
			list.add("/cms/depoly/.*");
			list.add("/cms/bigDataExcelDown");
			list.add("/cms/bigDataExcelDown/");
			list.add("/cms/htmlDataExcelDown");
			list.add("/cms/htmlDataExcelDown/");
			list.add("/cms/excelUpload");
			list.add("/cms/excelUpload/");
			list.add("/cms/examInfoMn/excelFormDown");
			list.add("/cms/examInfoMn/excelFormDown/");
			list.add("/cms/purifierEfficiencyMn/excelFormDown");
			list.add("/cms/purifierEfficiencyMn/excelFormDown/");
			list.add("/cms/excelUploadView");
			list.add("/cms/excelUploadView/");
			list.add("/cms/member/pwdChgPopup/");/* 비빌번호 변경*/
			list.add("/cms/member/pwdChgPopup");/* 비빌번호 변경 */
			list.add("/cms/member/passwdChg");/* 비빌번호 변경 */
			list.add("/cms/member/passwdChg/");/* 비빌번호 변경 */
			list.add("/.*Etc.*");

			Boolean isPermittedURL = false;
			Boolean isPermittedURL2 = false;

			/* 공통허용 권한 체크 */
			for (int i = 0; i < list.size(); i++) {
				String urlPattern = request.getContextPath() + (String) list.get(i);
				if (Pattern.matches(urlPattern, requestURI)) {// 정규표현식을 이용해서 요청
					isPermittedURL = true; // URI가 허용된 URL에 맞는지 점검함.
				}
			}

			/* URL 권한 체크 */
			List<Map<String, Object>> list2 = (List<Map<String, Object>>) session.getAttribute("CMS_AUTH_URLS");
			if (list2 != null) {
				for (int i = 0; i < list2.size(); i++) {
					Map<String, Object> map = (Map<String, Object>) list2.get(i);
					String urlPattern = request.getContextPath() + map.get("URL");
					if (Pattern.matches(urlPattern, requestURI)) {// 정규표현식을 이용해서
																	// 요청
						isPermittedURL2 = true;// URI가 허용된 URL에 맞는지 점검함.
					}
				}
			}

			if (!isPermittedURL && !isPermittedURL2) {
				throw new ModelAndViewDefiningException(getErrorModel(ERROR_ALERT_AND_BACK, "접근 권한이 없습니다."));
			}

		}

	}
	

	// linkUrl은 DB호출 제외 - 속도개선을 위해 사용
	public boolean linkCk() {
		boolean returnVal = false;
		String requestURI = request.getRequestURI(); // 요청 URI
		
		if (requestURI.startsWith("/cms/link")) {
			returnVal = true;
		} else if (requestURI.startsWith("/web/link")) {
			returnVal = true;
		}
		return returnVal;
	}

	// public static void main(String[] args) {
	// String requestURI = "/cms/stockBury/monitorWell/getStockInfo/popInfoInfo";
	// String urlPattern = "/.*/pop[A-Z].*";
	// System.out.println(Pattern.matches(urlPattern, requestURI));

	// }

	/**
	 * 접속 로그 저장 최초 1번만
	 * 
	 * @param request
	 * @param memberVo
	 * @throws Exception
	 */
	public void accessLog() throws Exception {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("cmsTopMenuListSession") == null) {
			String INS_IP = EgovHttpRequestHelper.getRequestIp();
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("ACCES_IP", INS_IP);
			param.put("ACCES_SE", "1"); // 1:방문 , 2:로그인
			param.put("ACCES_CN", "최초접속방문");
			accessLogService.insertAccessLog(param);
		}
	}

}
