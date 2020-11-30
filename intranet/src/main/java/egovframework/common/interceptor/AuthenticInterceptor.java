package egovframework.common.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import egovframework.cms.member.MemberVo;
import egovframework.cms.member.service.MemberService;
import egovframework.common.helper.EgovHttpRequestHelper;
import egovframework.common.helper.EgovUserDetailsHelper;
import egovframework.common.util.StringUtil;

/**
 * 인증여부 체크 인터셉터 
 * 전자정부 공통 서비스 참조
 * 수정자 : 방지환
 */
public class AuthenticInterceptor extends HandlerInterceptorAdapter {

	@Resource(name = "MemberService")
	private MemberService memberService;

	private Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * 세션에 계정정보(MemberVo)가 있는지 여부로 인증 여부를 체크한다. 
	 * 계정정보(MemberVo)가 없다면, 로그인 페이지로 이동한다.
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		// 테스트 모드일경우 통과
		if (EgovUserDetailsHelper.SYSTEM_MODE.equals("TEST")) {
			//return true;
		}
		
		//application/x-www-form-urlencoded; charset=UTF-8
		String contentType = StringUtil.noNull(request.getContentType());
				
		HttpSession session = request.getSession(true);
		MemberVo userMemberVo = (MemberVo) EgovUserDetailsHelper.getAuthenticatedUser();
		
		String requestURI = request.getRequestURI(); // 요청 URI
		String webPath = "cms";
		if (requestURI.startsWith("/cms")) {
			webPath = "cms";
		}
		
		if (userMemberVo == null) { // 로그인을 하지 않은 상태 
			session.invalidate();
			if (log.isInfoEnabled()) {
				log.info("session is null");
			}
			String viewUrl = "cmmn/errorMessage";
			//허용된 IP만 접근하도록 처러
			String userIp = EgovHttpRequestHelper.getRequestIp();
			Map param = new HashMap();
			param.put("userIp", userIp);
			int ipCkCnt = memberService.getMngrUseIpCheckCnt(param);
			if(ipCkCnt < 1){
				ModelAndView model = new ModelAndView(viewUrl);
				model.addObject("ERROR_TYPE", "AlertAndRedirect");
				model.addObject("REDIRECT_URL", "/web/login?pMENU_NO=11");
				model.addObject("ERROR_MESSAGE", "[LCY 정보시스템]\n 접근할 수 없는 IP입니다.");
				throw new ModelAndViewDefiningException(model);
			}
			//Ajax 처리
			if (contentType.equals("application/x-www-form-urlencoded; charset=UTF-8"))
			{
				viewUrl = "redirect:/ajaxAccessInfoFail";
			}
			ModelAndView model = new ModelAndView(viewUrl);
			model.addObject("ERROR_TYPE", "AlertAndRedirect");
			model.addObject("REDIRECT_URL", "/web/login?pMENU_NO=11");
			model.addObject("ERROR_MESSAGE", "[LCY 정보시스템]\n로그인 정보가 없습니다.\n다시 로그인 해주세요.");
			throw new ModelAndViewDefiningException(model);
		} else { // 로그인을 한 상태 
			if (userMemberVo != null) {
				if (log.isInfoEnabled()) {
					log.info("user session is OK!!");
				}
			}
		}
		
		return true;
	}

}
