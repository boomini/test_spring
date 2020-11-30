package egovframework.cms.useIpMn;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cms.useIpMn.service.UseIpMnService;
import egovframework.common.controller.DefaultController;
import egovframework.common.util.StringUtil;

/**
 * 설 명 : 접근제어 IP 관리
 * @author 개발팀 Bang-ji-hwan
 * @since 2013. 8. 31
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일        수정자              수정내용
 *  -------       --------    ---------------------------
 *  2013. 8. 31     bjh                최초 생성
 * </pre>
 */
@Controller
public class UseIpMnController extends DefaultController {

	// 검색 파라미터
	private List<String> searchParam = Arrays.asList("pMENU_NO", "MNGR_IP");

	@Resource(name = "UseIpMnService")
	private UseIpMnService useIpMnService;

	/**
	 * <pre>
	 * 1. 개요 : 허용IP관리 리스트
	 * 2. 처리내용 : 리스트를 출력한다.
	 * </pre>
	 * @Method Name : useIpMnList
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/useIpMn")
	public ModelAndView useIpMnList() throws Exception {

		/************** 프로그램 로직 **************/
		List<Map<String, Object>> useIpMnList = useIpMnService.getUseIpMnList(commandMap);
		// 파라미터 정보
		String parameters = getRequestToQueryString(searchParam);
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String resultURL = "";
		resultURL = "cms/useIpMn/useIpMnList";
		mav.addObject("useIpMnList", useIpMnList);
		mav.addObject("parameters", parameters);
		mav.addObject("resultMessage", resultMessage);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : ㅍ허용IP관리 CUD 처리
	 * 2. 처리내용 : 등록, 수정, 사용 여부 등을 처리 한다.
	 * </pre>
	 * @Method Name : useIpMnCUD
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/useIpMn/cud", method = RequestMethod.POST)
	public ModelAndView useIpMnCUD() throws Exception {
		
		/************** 프로그램 로직 **************/
		String mode = StringUtil.noNull(commandMap.get("mode"));
		if (mode.equals(MODE_WRITE)) {
			// 중복체크
			if (useIpMnService.getUseIpMn(commandMap) != null) {
				return getErrorModel(ERROR_ALERT_AND_BACK, "중복된 허용IP관리가 있습니다.");
			}
			useIpMnService.insertUseIpMn(commandMap);
		} else if (mode.equals(MODE_MODIFY)) {
			useIpMnService.updateUseIpMn(commandMap);
		} else if (mode.equals(MODE_PROC)) {
			String useAt = StringUtil.noNull(commandMap.get("USEAT"), "N");
			String[] useIpMns = request.getParameterValues("chkbox");
			for (int i = 0; i < useIpMns.length; i++) {
				if (useIpMns[i] != null) {
					commandMap.put("USE_AT", useAt);
					commandMap.put("SN", useIpMns[i]);
					useIpMnService.deleteUseIpMn(commandMap);
				}
			}
		}
		String parameters = getRequestToQueryString(searchParam);
		Map<String, Object> flashMap = new HashMap<String, Object>();
		flashMap.put("msg", setMessage(mode));
		setFlashMap(flashMap, request);
		/************** 프로그램 로직 **************/
		
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "redirect:/cms/useIpMn/" + parameters;
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
}
