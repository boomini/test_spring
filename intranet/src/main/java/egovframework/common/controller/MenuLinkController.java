package egovframework.common.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cms.contents.service.ContentsService;
import egovframework.cms.member.MemberVo;
import egovframework.cms.menu.service.MenuService;
import egovframework.common.util.EgovWebUtil;
import egovframework.common.util.StringUtil;

/**
 * 메뉴 연결관리 공통 컨트롤러
 * @author 방지환
 *
 */
@Controller
public class MenuLinkController extends DefaultController {

	@Resource(name = "MenuService")
	private MenuService menuService;

	@Resource(name = "ContentsService")
	private ContentsService contentsService;

	/**
	 * 메뉴 연결 관리
	 * 
	 * @return ModelAndView
	 * @param commandMap
	 *            : 모든 파라미터 정보, method = GET
	 * @exception Exception
	 *                Exception
	 */
	@RequestMapping(value = "/{webPath}/link")
	public ModelAndView linkCon(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String, Object> commandMap, @PathVariable String webPath) throws Exception {

		/************** 프로그램 로직 **************/
		String resultURL = "";
		// 웹취약점 조치
		String pMENU_NO = StringUtil.noNull(request.getParameter("pMENU_NO"));
		String MENU_NO = StringUtil.noNull(request.getParameter("MENU_NO"));
		String menuId = pMENU_NO.equals("") ? MENU_NO : pMENU_NO;
		commandMap.put("pMENU_NO", menuId);
		Map<String, Object> menuMap = (Map<String, Object>) request.getAttribute("menuMap");
		if (menuMap != null) {
			String menuParameter = "pMENU_NO";
			String cntnsTyp = StringUtil.noNull(menuMap.get("CNTNTS_TY"));
			Map<String, Object> paramMap = new HashMap<String, Object>();
			if ("H".equals(cntnsTyp)) { // HTML콘텐츠일 경우
				resultURL = "redirect:/"+webPath+"/contents/contentView/?" + menuParameter + "="
						+ StringUtil.noNull(menuMap.get("MENU_NO")) + "&cntnts_no="
						+ StringUtil.noNull(menuMap.get("CNTNTS_NO"));
			} else if ("D".equals(cntnsTyp)) { // 디렉토리 일경우 (한단계 하위 메뉴로 이동)
				MemberVo memberVo = (MemberVo) getAuthenticatedUser();
				if (memberVo != null) {
					paramMap.put("authGrp", memberVo.getAuthor_code());
				}
				paramMap.put("MENU_AUTH_YN", "Y");
				paramMap.put("MENU_NO", menuId);
				paramMap.put("MENU_SE", EgovWebUtil.getMenuGubnVal(request));
				Map<String, Object> map = menuService.getChildMenu(paramMap);
				if (map == null) {
					return getErrorModel(ERROR_ALERT_AND_REDIRECT, "[LCY]\n로그인 정보가 없습니다.\n다시 로그인 해주세요.","/web/login?pMENU_NO=11");
							
				}
				resultURL = "redirect:/web/link/?" + menuParameter + "=" + map.get("MENU_NO");
			} else if ("B".equals(cntnsTyp)) { // 게시판일 경우
				resultURL = "redirect:/web/board/" + StringUtil.noNull(menuMap.get("BBS_NO")) + "/?" + menuParameter + "=" + menuId;
			} else if ("L".equals(cntnsTyp)) { // 링크일 경우
				String token =StringUtil.noNull(menuMap.get("LINK_URL")).contains("?")?"&":"?" ;
				resultURL = "redirect:" + StringUtil.noNull(menuMap.get("LINK_URL")) + token + menuParameter + "=" + menuId;
			}
		}

		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/**
	 * JSP 호출작업만 처리하는 공통 함수
	 * @param linkPage
	 * @return
	 */
	@RequestMapping(value="/ComPageLink.do")
	public String moveToPage(@RequestParam("link") String linkPage) throws Exception {
		String link = linkPage;
		// service 사용하여 리턴할 결과값 처리하는 부분은 생략하고 단순 페이지 링크만 처리함
		if (linkPage==null || linkPage.equals("")){
			link="cmmn/accessDenie";
		}
		return link;
	}

}
