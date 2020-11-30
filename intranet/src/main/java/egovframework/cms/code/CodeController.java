package egovframework.cms.code;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cms.code.service.CodeService;
import egovframework.common.controller.DefaultController;
import egovframework.common.util.StringUtil;


/**
 * 설 명 : 코드 관리
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
public class CodeController extends DefaultController {

	// 검색 파라미터
	private List<String> searchParam = Arrays.asList("pMENU_NO", "PRE_UPPER_CODE_NO", "UPPER_CODE_NO", "CODE_LEVEL", "USE_AT");
	@Resource(name = "CodeService")
	private CodeService codeService;

	
	/**
	 * <pre>
	 * 1. 개요 : 코드 리스트 조회
	 * 2. 처리내용 : 리스트를 출력한다.
	 * </pre>
	 * @Method Name : codeList
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/code")
	public ModelAndView codeList() throws Exception {

		/************** 프로그램 로직 **************/
		String UPPER_CODE_NO 		= StringUtil.noNull(commandMap.get("UPPER_CODE_NO"), "0");
		String CODE_LEVEL 	= StringUtil.noNull(commandMap.get("CODE_LEVEL"), "1");
		commandMap.put("UPPER_CODE_NO", UPPER_CODE_NO);

		List<Map<String, Object>> codeList = codeService.getCodeList(commandMap);
		List<Map<String, Object>> codePath = codeService.getLocation(commandMap);
		
		String PRE_UPPER_CODE_NO = "";
		if(!CODE_LEVEL.equals("1")){
			if(CODE_LEVEL.equals("2")){
				PRE_UPPER_CODE_NO = "0";
			}else if(CODE_LEVEL.equals("3")){
				PRE_UPPER_CODE_NO = StringUtil.noNull(codePath.get(0).get("CODE_NO"));
			}else if(CODE_LEVEL.equals("4")){
				PRE_UPPER_CODE_NO = StringUtil.noNull(codePath.get(1).get("CODE_NO"));
			}
		}
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
		resultURL = "cms/code/codeList";
		mav.addObject("codeList", codeList);
		mav.addObject("codePath", codePath);
		mav.addObject("UPPER_CODE_NO", UPPER_CODE_NO);
		mav.addObject("PRE_UPPER_CODE_NO", PRE_UPPER_CODE_NO);
		mav.addObject("CODE_LEVEL", CODE_LEVEL);
		mav.addObject("parameters", parameters);
		mav.addObject("resultMessage", resultMessage);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

	
	/**
	 * <pre>
	 * 1. 개요 : 코드 CUD 처리
	 * 2. 처리내용 : 등록, 수정, 사용 여부 등을 처리 한다.
	 * </pre>
	 * @Method Name : codeCUD
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/code/cud", method = RequestMethod.POST)
	public ModelAndView codeCUD() throws Exception {
		/************** 프로그램 로직 **************/
		String mode = StringUtil.noNull(commandMap.get("mode"));
		if (mode.equals(MODE_WRITE)) {
			// 중복체크
			if (codeService.getCode(commandMap) != null) {
				return getErrorModel(ERROR_ALERT_AND_BACK, "중복된 코드가 있습니다.");
			}
			codeService.insertCode(commandMap);
		} else if (mode.equals(MODE_MODIFY)) {
			// 중복체크
			Map<String, Object> reMap = codeService.getCode(commandMap);
			if (reMap != null && !StringUtil.noNull(reMap.get("CODE_NO")).equals(StringUtil.noNull(commandMap.get("CODE_NO")))) {
				return getErrorModel(ERROR_ALERT_AND_BACK, "중복된 코드가 있습니다.");
			}
			codeService.updateCode(commandMap);
		} else if (mode.equals(MODE_PROC)) {
			String useAt = StringUtil.noNull(commandMap.get("USEAT"), "N");
			String[] codeNos = request.getParameterValues("chkbox");
			for (int i = 0; i < codeNos.length; i++) {
				if (codeNos[i] != null) {
					commandMap.put("USE_AT", useAt);
					commandMap.put("CODE_NO", codeNos[i]);
					codeService.deleteCode(commandMap);
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
		String resultURL = "redirect:/cms/code/" + parameters;
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
}
