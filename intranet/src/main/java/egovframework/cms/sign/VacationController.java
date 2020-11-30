package egovframework.cms.sign;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.emory.mathcs.backport.java.util.Collections;
import egovframework.cms.sign.service.VacationService;
import egovframework.common.controller.DefaultController;
import egovframework.common.jfile.service.JFileService;
import egovframework.common.util.Pager;
import egovframework.common.util.StringUtil;


@Controller
public class VacationController extends DefaultController {
	
	@Resource(name="VacationService")
	private VacationService vacationService;
	
	@Autowired
	private JFileService jfileservice;
	
	// 검색 파라미터
	private List<String> searchParam	= Arrays.asList( "pMENU_NO", "page");
	@RequestMapping(value = "/cms/sign/vac")
	public ModelAndView vacationList() throws Exception {
		/************** 프로그램 로직 **************/
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String parameters = getRequestToQueryString(searchParam);
		String resultURL = "cms/sign/vacation/vacationList";
		mav.setViewName(resultURL);
		mav.addObject("parameters",parameters);
		/************** ModelView 로직 **************/
		return mav;
	}
	@RequestMapping(value = "/cms/sign/vac/listajax")
	public ModelAndView vacationListAjax() throws Exception {
		ModelAndView mav = new ModelAndView();

		/************** 프로그램 로직 **************/
		int totalCnt = vacationService.getVacCount(commandMap);
		int pageSize = 10;
		int page = StringUtil.toInt(commandMap.get("page"), 1);
		int startRow = page * pageSize - pageSize + 1;
		Pager pager = new Pager(page, totalCnt, pageSize);
		commandMap.put("startRow", startRow);
		commandMap.put("endRow", startRow + pageSize - 1);
		
		List<Map<String, Object>> bannerList = vacationService.getVacList(commandMap);
		String parameters = getRequestToQueryString(searchParam);
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		String resultURL = "/cms/sign/vacation/vacationListTable";
		mav.addObject("list", bannerList);
		mav.addObject("pager", pager);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("parameters", parameters);
		mav.addObject("resultMessage", resultMessage);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/

		return mav;
	}
	// 등록화면
	@RequestMapping(value = "/cms/sign/vac/reg")
	public ModelAndView vacationReg() throws Exception {
		/************** 프로그램 로직 **************/
		HashMap<String, Object> member = vacationService.getMember(commandMap);
		List<Map<String, Object>> resultList = vacationService.getMemberList(commandMap);
		
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String parameters = getRequestToQueryString(searchParam);
		String resultURL = "cms/sign/vacation/vacationReg";
		mav.setViewName(resultURL);
		mav.addObject("member", member);
		mav.addObject("resultList", resultList);
		mav.addObject("parameters",parameters);
		/************** ModelView 로직 **************/
		return mav;
	}
	@RequestMapping(value = "/cms/sign/vac/view")
	public ModelAndView vacationView() throws Exception {
		/************** 프로그램 로직 **************/
		HashMap<String,Object> sign = vacationService.getSignCheck(commandMap);
		List<Map<String, Object>> SignLineList = vacationService.getSignLineList(commandMap);
		
		String resultURL = "cms/sign/vacation/vacationView";
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String parameters = getRequestToQueryString(searchParam);
		mav.setViewName(resultURL);
		mav.addObject("parameters",parameters);
		mav.addObject("sign",sign);
		mav.addObject("signList",SignLineList);
		/************** ModelView 로직 **************/
		return mav;
	}
	@RequestMapping(value = "/cms/sign/vac/edit")
	public ModelAndView vacationEdit() throws Exception {
		/************** 프로그램 로직 **************/
		HashMap<String,Object> sign = vacationService.getSignCheck(commandMap);
		List<Map<String, Object>> SignLineList = vacationService.getSignLineList(commandMap);
		
		String resultURL = "cms/sign/vacation/vacationEdit";
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String parameters = getRequestToQueryString(searchParam);
		mav.setViewName(resultURL);
		mav.addObject("parameters",parameters);
		mav.addObject("sign",sign);
		mav.addObject("signList",SignLineList);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	@RequestMapping(value = "/cms/sign/vac/report")
	public ModelAndView rePortVacation() throws Exception {
		/************** 프로그램 로직 **************/
		HashMap<String,Object> sign = vacationService.getSignCheck(commandMap);
		List<Map<String, Object>> SignLineList = vacationService.getSignLineList(commandMap);
		
		
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String parameters = getRequestToQueryString(searchParam);
		String resultURL = "/cms/sign/vacation/vacationReport";
		mav.setViewName(resultURL);
		mav.addObject("parameters",parameters);
		mav.addObject("sign",sign);
		mav.addObject("signList",SignLineList);
		/************** ModelView 로직 **************/
		return mav;
	}
	// 검색 파라미터
		@RequestMapping(value = "/cms/sign/vac/cud")
		public ModelAndView vacationC() throws Exception {
			/************** 프로그램 로직 **************/
			String mode = StringUtil.noNull( commandMap.get("mode") );
			if(mode.equals("Reg")){
				vacationService.insertVac(commandMap,request);
			}else if(mode.equals("Edit")){
				vacationService.updateVac(commandMap,request);
			}else if(mode.equals("Delete")){
				vacationService.deleteVac(commandMap);
			}else if(mode.equals("Sign")){
				vacationService.signVac(commandMap);
			}
			
			
			/************** 프로그램 로직 **************/
			/************** ModelView 로직 **************/
			// return Model 정보 생성
			ModelAndView mav = new ModelAndView();
			String parameters = getRequestToQueryString(searchParam);
			String resultURL = "cms/sign/vacation/vacationList";
			mav.setViewName(resultURL);
			mav.addObject("parameters",parameters);
			/************** ModelView 로직 **************/
			return mav;
		}
	// 검색 파라미터
	@RequestMapping(value = "/cms/comPop/memList")
	public ModelAndView memberList() throws Exception {
		/************** 프로그램 로직 **************/
		List<Map<String, Object>> resultList = vacationService.getMemberList(commandMap);
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String parameters = getRequestToQueryString(searchParam);
		String resultURL = "/cms/sign/vacation/getMemList";
		mav.setViewName(resultURL);
		mav.addObject("parameters", parameters);
		mav.addObject("resultList", resultList);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	
}
