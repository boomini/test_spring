package egovframework.cms.login;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cms.log.access.service.AccessLogService;
import egovframework.cms.member.MemberVo;
import egovframework.cms.member.service.MemberService;
import egovframework.cms.popup.service.PopupService;
import egovframework.common.controller.DefaultController;
import egovframework.common.helper.EgovHttpRequestHelper;
import egovframework.common.helper.EgovUserDetailsHelper;
import egovframework.common.jfile.JProperties;
import egovframework.common.util.EgovFileScrty;
import egovframework.common.util.EgovWebUtil;
import egovframework.common.util.StringUtil;

/**
 * 설 명 : 로그인 처리
 * 
 * @author 개발팀 Bang-ji-hwan
 * @since 2013. 8. 31
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일        수정자              수정내용
 *  -------       --------    ---------------------------
 *  2013. 8. 31     bjh                최초 생성
 *      </pre>
 */
@Controller
public class LoginController extends DefaultController {

	@Resource(name = "MemberService")
	private MemberService memberService;

	@Resource(name = "AccessLogService")
	private AccessLogService accessLogService;
	
	@Resource(name = "popupService")
	private PopupService popupService;

	/**
	 * <pre>
	 * 1. 개요 : 로그인 화면
	 * 2. 처리내용 : 로그인 화면을 출력한다.
	 * </pre>
	 * 
	 * @Method Name : loginView
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/web/login" })
	public ModelAndView loginView() throws Exception {

		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String resultURL = "/cms/login/login";
		if (isAuthUserChecked()) {
			resultURL = "redirect:/cms/main";
		}else{
			commandMap.put("GROUP_ID", "9999");
			/* 팝업 */
			List<Map<String, Object>> popup = popupService.mainPopupList(commandMap);
			mav.addObject("popup",popup);
		}
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : 로그인 처리
	 * 2. 처리내용 : 로그인 처리를 한다.
	 * </pre>
	 * 
	 * @Method Name : loginPorc
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/web/loginProc", method = RequestMethod.POST)
	public ModelAndView loginPorc() throws Exception {
		/************** 프로그램 로직 **************/
		HttpSession session = request.getSession(true);
		session.removeAttribute(SESSION_KEY_USER);

		String userId = StringUtil.noNull(commandMap.get("userId"));
		String passwd = StringUtil.noNull(commandMap.get("passwd"));
		String encPasswd = EgovFileScrty.encryptPassword(passwd, userId);
		String loginPath = "/web/login?pMENU_NO=11";

		MemberVo memberVo = memberService.memberLogin(commandMap);

		if (!StringUtil.isBlank(memberVo)) {

			// 로그인 실패 횟수 5번 이상시 로그인 못합
			if (memberVo.getLogin_fail_co() > 5) {
				return getErrorModel(ERROR_ALERT_AND_REDIRECT, egovMessageSource.getMessage("user.passwd3.fail"), loginPath);
			}

			// 비밀번호 오류
			if (!memberVo.getPassword().equals(encPasswd)) {
				commandMap.put("failLogin", "Y");
				memberService.loginFailCountChg(commandMap);
				return getErrorModel(ERROR_ALERT_AND_REDIRECT, egovMessageSource.getMessage("user.login.fail"), loginPath);
			}

			// 승인대기처리
			if (memberVo.getUse_at().equals("C")) {
				return getErrorModel(ERROR_ALERT_AND_REDIRECT, egovMessageSource.getMessage("user.login.fail2"), loginPath);
			}

			// 반려처리
			if (memberVo.getUse_at().equals("R")) {//반려는 없지만 시스템 오픈시 몇몇 권한들 차단용으로 만들어 놓음
				//String returnPrvonsh = memberVo.getReturn_prvonsh();
				return getErrorModel(ERROR_ALERT_AND_REDIRECT, egovMessageSource.getMessage("user.login.failtemp"), loginPath);
				//return getErrorModel(ERROR_ALERT_AND_REDIRECT, "현재 회원님은 \n'" + returnPrvonsh + "'\n사유로 반려되었습니다. ", loginPath);
			}

			// 슈퍼그룹인지확인
			if (memberVo.getAuthor_code().equals("0000") && memberVo.getUser_id().equals("admin")) {
				if(!EgovUserDetailsHelper.SYSTEM_MODE.equals("TEST") && !EgovHttpRequestHelper.getRequestIp().equals(memberVo.getUser_ip())){//슈퍼관리자는 IP등록을 필수로 체크하여 로그인을 시킴
					return getErrorModel(ERROR_ALERT_AND_REDIRECT, egovMessageSource.getMessage("admin.access.fail"), loginPath);
				}
				memberVo.setAdmin(true);
			}

			LoginManager lm = LoginManager.getInstance();

			lm.isUsing(userId);// 기존 접속 정보 체크 후 종료
			lm.setSession(session, userId);// 새접속 정보 생성

			session.setAttribute(SESSION_KEY_USER, memberVo);
			session.removeAttribute("cmsTopMenuListSession");
			// 메뉴권한정보
			Map<String, Object> userMap = new HashMap<String, Object>();
			userMap.put("authGrp", memberVo.getAuthor_code());
			session.setAttribute("CMS_AUTH_URLS", memberService.getAuthUrlList(userMap));
			session.setMaxInactiveInterval(StringUtil.toInt(JProperties.getString("SESSION_TIME"), 3000));
			// 접속 로그
			accessLog(request, memberVo);

			// 로그인 실패횟수 초기화
			commandMap.put("failLogin", "N");
			memberService.loginFailCountChg(commandMap);

		} else {
			return getErrorModel(ERROR_ALERT_AND_REDIRECT, egovMessageSource.getMessage("user.login.fail"), loginPath);
		}
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String resultURL = "redirect:/web/main";
		// String resultURL = "redirect:/cms/loginFirstUrl";
		if (!StringUtil.isBlank(session.getAttribute("requestUri"))) {
			resultURL = "redirect:" + session.getAttribute("requestUri");
		}
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

	@RequestMapping(value = "/cms/loginFirstUrl")
	public ModelAndView loginFirstUrl() throws SQLException {
		/************** 프로그램 로직 **************/
		HttpSession session = request.getSession(true);
		List<Map<String, Object>> topList = (List<Map<String, Object>>) session.getAttribute("cmsTopMenuListSession");
		String menuNo = "";
		for (int i = 0; i < topList.size(); i++) {
			Map<String, Object> m = (Map<String, Object>) topList.get(i);
			menuNo = StringUtil.noNull(m.get("MENU_NO"));
			if (i == 0)
				break;
		}

		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "redirect:/cms/link?pMENU_NO=" + menuNo;
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : 로그아웃
	 * 2. 처리내용 : 로그아웃 처리를 한다.
	 * </pre>
	 * 
	 * @Method Name : loginOut
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/web/loginOut")
	public ModelAndView loginOut() throws Exception {

		/************** ModelView 로직 **************/
		HttpSession session = request.getSession(true);
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		String resultURL = "redirect:/web/";
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/

		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : 접속 정보 저장
	 * 2. 처리내용 : 로그인 접속 정보를 저장한다.
	 * </pre>
	 * 
	 * @Method Name : loginOut
	 * @param request
	 * @param memberVo
	 * @throws Exception
	 */
	public void accessLog(HttpServletRequest request, MemberVo memberVo) throws Exception {
		String INS_IP = EgovHttpRequestHelper.getRequestIp();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("LOGIN_ID", memberVo.getUser_id());
		param.put("ACCES_IP", INS_IP);
		param.put("ACCES_SE", "2"); // 1:방문 , 2:로그인
		param.put("ACCES_CN", "로그인");
		accessLogService.insertAccessLog(param);
	}

	/**
	 * <pre>
	 * 1. 개요 : ajax호출시 로그인 정보가 없을때 처리
	 * 2. 처리내용 :
	 * </pre>
	 * 
	 * @Method Name : ajaxAccessInfoFailAJax
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajaxAccessInfoFail")
	@ResponseBody
	public Map<String, Object> ajaxAccessInfoFailAJax() throws Exception {
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("message", "로그인 정보가 없습니다.\n다시 로그인 해주세요.");
		result.put("errorCode", "401");
		return result;
	}

}
