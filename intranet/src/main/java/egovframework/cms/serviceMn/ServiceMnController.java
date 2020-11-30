package egovframework.cms.serviceMn;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cms.serviceMn.service.ServiceMnService;
import egovframework.common.codeUtil.service.CodeUtilService;
import egovframework.common.controller.DefaultController;
import egovframework.common.util.Pager;
import egovframework.common.util.StringUtil;


/**
 * 설 명 :서비스관리
 * @author 개발팀 Bang-ji-hwan
 * @since 2018. 8. 24.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일        수정자              수정내용
 *  -------       --------    ---------------------------
 *  2018. 8. 24.     bjh                최초 생성
 * </pre>
 */
@Controller
public class ServiceMnController extends DefaultController {
	
	// 측정망 입력기한 리스트 검색 파라미터
	private List<String> mesureInputItemMnParam = Arrays.asList("pMENU_NO", "pTargetGbn", "pUseTarget");
	// 측정망 입력기한 리스트 검색 파라미터
	private List<String> mesureInputTmMnParam = Arrays.asList("pMENU_NO", "ATTR_1", "page");
	//지하수측정망 조사지점 생성 파라미터
	private List<String> waterSpotCrParam = Arrays.asList("pMENU_NO", "pGubun");
	//토양측정망 조사지점 생성 파라미터
	private List<String> soilSpotCrParam = Arrays.asList("pMENU_NO");
	// 골프장 농약관리검색 파라미터
	private List<String> golfCropMnParam = Arrays.asList("pMENU_NO","page", "pUseCode", "pUseYn", "pesticideName");
	// 골프장 입력기한 검색 파라미터
	private List<String> golfInputTmMnParam = Arrays.asList("pMENU_NO","page", "pGubunCode", "pYear");

	@Resource(name = "ServiceMnService")
	private ServiceMnService serviceMnService;
	
	@Resource(name = "CodeUtilService")
	private CodeUtilService codeUtilService;
	
	
	/**
	 * <pre>
	 * 1. 개요 : 측정망 입력항목 관리 화면
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : mesureInputItemMn
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/mesureInputItemMn")
	public ModelAndView mesureInputItemMn() throws Exception {
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		String key = StringUtil.noNull(flashMap.get("key"));
		Map<String, Object> paramMap = (Map<String, Object>) flashMap.get("paramMap");
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "cms/serviceMn/mesureInputItemMn";
		mav.setViewName(resultURL);
		mav.addObject("paramMap", paramMap);
		mav.addObject("resultMessage", resultMessage);
		mav.addObject("key", key);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 측정망 입력항목 관리 설정 리스트 Ajax
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : mesureInputItemMnListAjax
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/mesureInputItemMn/setListAjax")
	public ModelAndView mesureInputItemMnListAjax(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> commandMap) throws Exception {
		/************** 프로그램 로직 **************/
		List<Map<String, Object>> list = serviceMnService.getMesureInputItemMnList(commandMap);
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "/cms/serviceMn/mesureInputItemMnListTable";
		mav.addObject("list", list);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 측정망 등록항목 리스트 Ajax
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : mesureInputItemMnListAjax
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/mesureInputItemMn/regListAjax")
	public ModelAndView mainMesureInputItemMnList(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> commandMap) throws Exception {
		/************** 프로그램 로직 **************/
		List<Map<String, Object>> list = serviceMnService.getMainMesureInputItemMnList(commandMap);
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "/cms/serviceMn/mesureInputItemMnListTable2";
		mav.addObject("list", list);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 측정망 입력 항목 저장
	 * 2. 처리내용 : 
	 * </pre>
	 * @Method Name : mainMesureInputItemMnCUD
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/mesureInputItemMn/cud", method = RequestMethod.POST)
	public ModelAndView mainMesureInputItemMnCUD(HttpServletRequest request) throws Exception {
		/************** 프로그램 로직 **************/
		String mode = StringUtil.noNull(commandMap.get("mode"));
		serviceMnService.saveMainMesureInputItem(request, commandMap);
		Map<String, Object> paramMap = getRequestToHashMap(mesureInputItemMnParam);
		
		String key = "key_"+StringUtil.noNull(commandMap.get("YEAR"))+StringUtil.noNull(commandMap.get("QUARTER"));//로우 위치찾기용
		
		Map<String, Object> flashMap = new HashMap<String, Object>();
		flashMap.put("msg", setMessage(mode));
		flashMap.put("key", key);
		flashMap.put("paramMap", paramMap);
		setFlashMap(flashMap, request);
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "redirect:/cms/mesureInputItemMn/?pMENU_NO=" + StringUtil.noNull(request.getParameter("pMENU_NO"));
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 측정항목 조회 팝업 창
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : cropIngredientPop
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/mesureInputItemMn/mesureItemListPop")
	public ModelAndView mesureItemListPop() throws Exception {
		
		/************** 프로그램 로직 **************/
		int totalCnt = serviceMnService.getMesureItemCount(commandMap);
		int pageSize = 10;
		int page = StringUtil.toInt(commandMap.get("page"), 1);
		int startRow = page * pageSize - pageSize + 1;
		Pager pager = new Pager(page, totalCnt, pageSize);
		commandMap.put("startRow", startRow);
		commandMap.put("endRow", startRow + pageSize - 1);
		List<Map<String, Object>> list = serviceMnService.getMesureItemList(commandMap);
		
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		/************** 프로그램 로직 **************/
		
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "/cms/serviceMn/mesureItemListPop";
		mav.addObject("list", list);
		mav.addObject("pager", pager);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("resultMessage", resultMessage);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 측정항목 등록/수정/삭제 처리
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : mesureInputTmCUD
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/mesureInputItemMn/mesureItem/cud", method = RequestMethod.POST)
	public ModelAndView mesureItemCUD() throws Exception {
		/************** 프로그램 로직 **************/
		String mode = StringUtil.noNull(commandMap.get("mode"));
		if (mode.equals(MODE_WRITE)) {
			serviceMnService.insertmesureItem(commandMap);
		} else if (mode.equals(MODE_MODIFY)) {
			serviceMnService.updatemesureItem(commandMap);
		} else if (mode.equals(MODE_DELETE)) {
			serviceMnService.deletemesureItem(commandMap);
		}
		Map<String, Object> flashMap = new HashMap<String, Object>();
		flashMap.put("msg", setMessage(mode));
		setFlashMap(flashMap, request);
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "redirect:/cms/mesureInputItemMn/mesureItemListPop/";
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/******************************************************************************************************************************************************************************************************************/

	/**
	 * <pre>
	 * 1. 개요 : 측정망 입력기한 리스트
	 * 2. 처리내용 : 측정망 입력기한 리스트
	 * </pre>
	 * @Method Name : mesureInputTmMn
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/mesureInputTmMn")
	public ModelAndView mesureInputTmMn() throws Exception {

		/************** 프로그램 로직 **************/
		List<Map<String, Object>> list = serviceMnService.getMesureInputTmMnList(commandMap);
		
		List<Map<String, Object>> year = codeUtilService.getComboYear(commandMap);
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "cms/serviceMn/mesureInputTmMnList";
		mav.addObject("list", list);
		mav.addObject("year", year);
		mav.addObject("resultMessage", resultMessage);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 측정망 입력기한 등록/수정/삭제 처리
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : mesureInputTmCUD
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/mesureInputTmMn/cud", method = RequestMethod.POST)
	public ModelAndView mesureInputTmCUD() throws Exception {
		/************** 프로그램 로직 **************/
		String mode = StringUtil.noNull(commandMap.get("mode"));
		if (mode.equals(MODE_WRITE)) {
			// 중복체크
			if (serviceMnService.getMesureInputTmMn(commandMap) != null) {
				return getErrorModel(ERROR_ALERT_AND_BACK, "해단 년도는 이미 등록이 되어있습니다.");
			}
			serviceMnService.insertMesureInputTmMn(commandMap);
		} else if (mode.equals(MODE_MODIFY)) {
			serviceMnService.updateMesureInputTmMn(commandMap);
		} else if (mode.equals(MODE_PROC)) {
			String targetGbn = StringUtil.noNull(commandMap.get("ATTR_1"));
			String[] years = request.getParameterValues("chkbox");
			for (int i = 0; i < years.length; i++) {
				if (years[i] != null) {
					commandMap.put("TARGET_GBN", targetGbn);
					commandMap.put("YEAR", years[i]);
					serviceMnService.deleteMesureInputTmMn(commandMap);
				}
			}
		}
		String parameters = getRequestToQueryString(mesureInputTmMnParam);
		Map<String, Object> flashMap = new HashMap<String, Object>();
		flashMap.put("msg", setMessage(mode));
		setFlashMap(flashMap, request);
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "redirect:/cms/mesureInputTmMn/" + parameters;
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/******************************************************************************************************************************************************************************************************************/
	
	
	
	/**
	 * <pre>
	 * 1. 개요 : 지하수 측정망 조사지점 생성 화면
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : waterSpotCr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/waterSpotCr")
	public ModelAndView waterSpotCr() throws Exception {
		//일단 보류
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		Map<String, Object> paramMap = (Map<String, Object>) flashMap.get("paramMap");
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "cms/serviceMn/waterSpotCr";
		mav.setViewName(resultURL);
		mav.addObject("paramMap", paramMap);
		mav.addObject("resultMessage", resultMessage);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 지하수 측정망 조사지점 리스트 Ajax
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : waterSpotCrListAjax
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/waterSpotCr/listAjax")
	public ModelAndView waterSpotCrListAjax(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> commandMap) throws Exception {
		/************** 프로그램 로직 **************/
		//일단 보류
		//4월~10월 : H1 (상반기)
		//11월~3월 : H2 (하반기)
		
		List<Map<String, Object>> list = serviceMnService.getWaterSpotCrList(commandMap);
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "/cms/serviceMn/waterSpotCrListTable";
		mav.addObject("list", list);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 지하수 측정망 조사지점 생성하기
	 * </pre>
	 * @Method Name : waterSpotCrCUD
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/waterSpotCr/cud", method = RequestMethod.POST)
	public ModelAndView waterSpotCrCUD(HttpServletRequest request) throws Exception {
		/************** 프로그램 로직 **************/
		String mode = StringUtil.noNull(commandMap.get("mode"));
		
		commandMap.put("pGwmyr", commandMap.get("NEXT_YEAR"));
		commandMap.put("pGwmod", commandMap.get("NEXT_BANGI"));
		if (serviceMnService.getWaterSpotCrList(commandMap).size()  > 0) {
			return getErrorModel(ERROR_ALERT_AND_BACK, "이미 생성된 자료가 존재합니다.");
		}
		serviceMnService.insertWaterSpotCr(request, commandMap);
		
		String parameters = getRequestToQueryString(waterSpotCrParam);
		Map<String, Object> flashMap = new HashMap<String, Object>();
		flashMap.put("msg", setMessage(mode));
		setFlashMap(flashMap, request);
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "redirect:/cms/waterSpotCr/" + parameters;
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	
	/**
	 * <pre>
	 * 1. 개요 : 토양 측정망 조사지점 생성 화면
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : soilSpotCr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/soilSpotCr")
	public ModelAndView soilSpotCr() throws Exception {
		//일단 보류
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		Map<String, Object> paramMap = (Map<String, Object>) flashMap.get("paramMap");
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "cms/serviceMn/soilSpotCr";
		mav.setViewName(resultURL);
		mav.addObject("paramMap", paramMap);
		mav.addObject("resultMessage", resultMessage);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 토양 측정망 조사지점 리스트 Ajax
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : soilSpotCrListAjax
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/soilSpotCr/listAjax")
	public ModelAndView soilSpotCrListAjax(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> commandMap) throws Exception {
		/************** 프로그램 로직 **************/
		List<Map<String, Object>> list = serviceMnService.getSoilSpotCrList(commandMap);
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "/cms/serviceMn/soilSpotCrListTable";
		mav.addObject("list", list);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 토양 측정망 조사지점 생성하기
	 * </pre>
	 * @Method Name : soilSpotCrCUD
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/soilSpotCr/cud", method = RequestMethod.POST)
	public ModelAndView soilSpotCrCUD(HttpServletRequest request) throws Exception {
		/************** 프로그램 로직 **************/
		String mode = StringUtil.noNull(commandMap.get("mode"));
		
		commandMap.put("pSmyr", commandMap.get("NEXT_YEAR"));
		if (serviceMnService.getSoilSpotCrList(commandMap).size()  > 0) {
			return getErrorModel(ERROR_ALERT_AND_BACK, "이미 생성된 자료가 존재합니다.");
		}
		serviceMnService.insertSoilSpotCr(request, commandMap);
		
		String parameters = getRequestToQueryString(soilSpotCrParam);
		Map<String, Object> flashMap = new HashMap<String, Object>();
		flashMap.put("msg", setMessage(mode));
		setFlashMap(flashMap, request);
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "redirect:/cms/soilSpotCr/" + parameters;
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	
	
	
	
	/********************************************************************************************* 골프장 *********************************************************************************************/
	
	/**
	 * <pre>
	 * 1. 개요 : 골프장 농약관리 화면
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : golfCropMn
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/golfCropMn")
	public ModelAndView golfCropMn() throws Exception {
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		String parameters = getRequestToQueryString(golfCropMnParam);
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "cms/serviceMn/golfCropMn";
		mav.setViewName(resultURL);
		mav.addObject("parameters", parameters);
		mav.addObject("resultMessage", resultMessage);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 골프장 농약관리 리스트 Ajax
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : golfCropMnListAjax
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/golfCropMn/listAjax")
	public ModelAndView golfCropMnListAjax() throws Exception {
		ModelAndView mav = new ModelAndView();

		/************** 프로그램 로직 **************/
		int totalCnt = serviceMnService.golfCropMnCount(commandMap);
		int pageSize = 10;
		int page = StringUtil.toInt(commandMap.get("page"), 1);
		int startRow = page * pageSize - pageSize + 1;
		Pager pager = new Pager(page, totalCnt, pageSize);
		commandMap.put("startRow", startRow);
		commandMap.put("endRow", startRow + pageSize - 1);
		List<Map<String, Object>> list = serviceMnService.golfCropMnList(commandMap);
		/************** 프로그램 로직 **************/

		
		/************** ModelView 로직 **************/
		String resultURL = "/cms/serviceMn/golfCropMnListTable";
		mav.addObject("list", list);
		mav.addObject("pager", pager);
		mav.addObject("totalCnt", totalCnt);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/

		return mav;
	}
	
	
	/**
	 * <pre>
	 * 1. 개요 : 골프장 농약관리 등록 폼 
	 * 2. 처리내용 : 
	 * </pre>
	 * @Method Name : golfCropMnForm
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/golfCropMn/form")
	public ModelAndView golfCropMnForm() throws Exception {
		/************** 프로그램 로직 **************/
		// 상세보기
		Map<String, Object> vo = serviceMnService.getGolfCropMn(commandMap);
		List<Map<String, Object>> cmiList = serviceMnService.cropMainIngredientList(commandMap);
		String mode = vo == null ? MODE_WRITE : MODE_MODIFY;
		String parameters = getRequestToQueryString(golfCropMnParam);
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		
		//작물구분
		commandMap.put("ATTR_1", "PD070000");
		List<Map<String, Object>> codeList = codeUtilService.getComCodeList2(commandMap);
		//유요성분
		commandMap.put("ATTR_1", "PD060000");
		List<Map<String, Object>> validCode = codeUtilService.getComCodeList2(commandMap);
		/************** 프로그램 로직 **************/
		
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "cms/serviceMn/golfCropMnForm";
		mav.setViewName(resultURL);
		mav.addObject("vo", vo);
		mav.addObject("mode", mode);
		mav.addObject("codeList", codeList);
		mav.addObject("validCode", validCode);
		mav.addObject("cmiList", cmiList);
		mav.addObject("parameters", parameters);
		mav.addObject("resultMessage", resultMessage);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 골프장 농약관리 CUD 처리
	 * 2. 처리내용 : 등록, 수정, 삭제 등을 처리 한다.
	 * </pre>
	 * @Method Name : golfCropMnCUD
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/golfCropMn/cud", method = RequestMethod.POST)
	public ModelAndView golfCropMnCUD(HttpServletRequest request) throws Exception {
		/************** 프로그램 로직 **************/
		String mode = StringUtil.noNull(commandMap.get("mode"));
		if (mode.equals(MODE_WRITE)){
			// 중복체크
			if (serviceMnService.getGolfCropMn(commandMap) != null) {
				return getErrorModel(ERROR_ALERT_AND_BACK, "이미 등록되어 있습니다.");//현재 체크값이 없어 작동하지 않는다. -- 중복값을 확인하여 넣어줘야 될듯
			}
			serviceMnService.insertGolfCropMn(request, commandMap);
		}else if(mode.equals(MODE_MODIFY)) {
			serviceMnService.updateGolfCropMn(request, commandMap);
		}else if (mode.equals(MODE_DELETE)) {
			serviceMnService.deleteGolfCropMn(commandMap);
		}else if (mode.equals(MODE_PROC)) {
			String[] seqs = request.getParameterValues("chkbox");
			for (int i = 0; i < seqs.length; i++) {
				if (seqs[i] != null) {
					commandMap.put("PESTICIDE_SEQ", seqs[i]);
					serviceMnService.updateGolfCropUseYnMn(commandMap);
				}
			}
		}
		
		String parameters = getRequestToQueryString(golfCropMnParam);
		Map<String, Object> flashMap = new HashMap<String, Object>();
		flashMap.put("msg", setMessage(mode));
		setFlashMap(flashMap, request);
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "redirect:/cms/golfCropMn/" + parameters;
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 골프장 성분조회 팝업 창
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : cropIngredientPop
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/golfCropMn/cropIngredientPop")
	public ModelAndView cropIngredientPop() throws Exception {
		
		/************** 프로그램 로직 **************/
		int totalCnt = serviceMnService.cropIngredientCount(commandMap);
		int pageSize = 10;
		int page = StringUtil.toInt(commandMap.get("page"), 1);
		int startRow = page * pageSize - pageSize + 1;
		Pager pager = new Pager(page, totalCnt, pageSize);
		commandMap.put("startRow", startRow);
		commandMap.put("endRow", startRow + pageSize - 1);
		List<Map<String, Object>> list = serviceMnService.cropIngredientList(commandMap);
		/************** 프로그램 로직 **************/
		
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "/cms/serviceMn/cropIngredientPop";
		mav.addObject("list", list);
		mav.addObject("pager", pager);
		mav.addObject("totalCnt", totalCnt);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/******************************************************************************************************************************************************************************************************************/
	
	/**
	 * <pre>
	 * 1. 개요 : 골프장 입력기한 화면
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : golfInputTmMn
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/golfInputTmMn")
	public ModelAndView golfInputTmMn() throws Exception {
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		String parameters = getRequestToQueryString(golfInputTmMnParam);
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "cms/serviceMn/golfInputTmMn";
		mav.setViewName(resultURL);
		mav.addObject("parameters", parameters);
		mav.addObject("resultMessage", resultMessage);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 골프장 입력기한 리스트 Ajax
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : golfInputTmMnListAjax
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/golfInputTmMn/listAjax")
	public ModelAndView golfInputTmMnListAjax() throws Exception {
		ModelAndView mav = new ModelAndView();

		/************** 프로그램 로직 **************/
		int totalCnt = serviceMnService.getGolfInputTmMnCount(commandMap);
		int pageSize = 10;
		int page = StringUtil.toInt(commandMap.get("page"), 1);
		int startRow = page * pageSize - pageSize + 1;
		Pager pager = new Pager(page, totalCnt, pageSize);
		commandMap.put("startRow", startRow);
		commandMap.put("endRow", startRow + pageSize - 1);
		List<Map<String, Object>> list = serviceMnService.getGolfInputTmMnList(commandMap);
		/************** 프로그램 로직 **************/

		
		/************** ModelView 로직 **************/
		String resultURL = "/cms/serviceMn/golfInputTmMnListTable";
		mav.addObject("list", list);
		mav.addObject("pager", pager);
		mav.addObject("totalCnt", totalCnt);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/

		return mav;
	}
	
	
	/**
	 * <pre>
	 * 1. 개요 : 골프장 입력기한 등록 폼 
	 * 2. 처리내용 : 
	 * </pre>
	 * @Method Name : golfInputTmMnForm
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/golfInputTmMn/form")
	public ModelAndView golfInputTmMnForm() throws Exception {
		/************** 프로그램 로직 **************/
		// 상세보기
		Map<String, Object> vo = serviceMnService.getGolfInputTmMn(commandMap);
		String mode = vo == null ? MODE_WRITE : MODE_MODIFY;
		String parameters = getRequestToQueryString(golfInputTmMnParam);
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		/************** 프로그램 로직 **************/
		
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "cms/serviceMn/golfInputTmMnForm";
		mav.setViewName(resultURL);
		mav.addObject("vo", vo);
		mav.addObject("mode", mode);
		mav.addObject("parameters", parameters);
		mav.addObject("resultMessage", resultMessage);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 골프장 입력기한 CUD 처리
	 * 2. 처리내용 : 등록, 수정, 삭제 등을 처리 한다.
	 * </pre>
	 * @Method Name : golfInputTmMnCUD
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/golfInputTmMn/cud", method = RequestMethod.POST)
	public ModelAndView golfInputTmMnCUD() throws Exception {
		/************** 프로그램 로직 **************/
		String mode = StringUtil.noNull(commandMap.get("mode"));
		// 파일 등록 관리
		if (mode.equals(MODE_WRITE)){
			// 중복체크
			if (serviceMnService.getGolfInputTmMn(commandMap) != null) {
				return getErrorModel(ERROR_ALERT_AND_BACK, "이미 등록되어 있습니다.");
			}
			serviceMnService.insertGolfInputTmMn(commandMap);
		}else if(mode.equals(MODE_MODIFY)) {
			serviceMnService.updateGolfInputTmMn(commandMap);
		}else if (mode.equals(MODE_DELETE)) {
			serviceMnService.deleteGolfInputTmMn(commandMap);
		}
		
		String parameters = getRequestToQueryString(golfInputTmMnParam);
		Map<String, Object> flashMap = new HashMap<String, Object>();
		flashMap.put("msg", setMessage(mode));
		setFlashMap(flashMap, request);
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "redirect:/cms/golfInputTmMn/" + parameters;
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

}
