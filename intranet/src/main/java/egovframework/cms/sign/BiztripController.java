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
import egovframework.cms.sign.service.BiztripService;
import egovframework.cms.sign.service.ExpenseService;
import egovframework.common.controller.DefaultController;
import egovframework.common.jfile.service.JFileService;
import egovframework.common.util.Pager;
import egovframework.common.util.StringUtil;


@Controller
public class BiztripController extends DefaultController {
	
	@Resource(name="BiztripService")
	private BiztripService biztripService;
	
	@Autowired
	private JFileService jfileservice;
	
	// 검색 파라미터
	private List<String> searchParam	= Arrays.asList( "pMENU_NO", "page");
	@RequestMapping(value = "/cms/sign/biztrip")
	public ModelAndView vacationList() throws Exception {
		/************** 프로그램 로직 **************/
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String parameters = getRequestToQueryString(searchParam);
		String resultURL = "cms/sign/biztrip/list";
		mav.setViewName(resultURL);
		mav.addObject("parameters",parameters);
		/************** ModelView 로직 **************/
		return mav;
	}
	@RequestMapping(value = "/cms/sign/biztrip/listajax")
	public ModelAndView vacationListAjax() throws Exception {
		ModelAndView mav = new ModelAndView();

		/************** 프로그램 로직 **************/
		int totalCnt = biztripService.getListCount(commandMap);
		int pageSize = 10;
		int page = StringUtil.toInt(commandMap.get("page"), 1);
		int startRow = page * pageSize - pageSize + 1;
		Pager pager = new Pager(page, totalCnt, pageSize);
		commandMap.put("startRow", startRow);
		commandMap.put("endRow", startRow + pageSize - 1);
		
		List<Map<String, Object>> list = biztripService.getList(commandMap);
		String parameters = getRequestToQueryString(searchParam);
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		String resultURL = "/cms/sign/biztrip/listTable";
		mav.addObject("list", list);
		mav.addObject("pager", pager);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("parameters", parameters);
		mav.addObject("resultMessage", resultMessage);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/

		return mav;
	}
	// 등록화면
	@RequestMapping(value = "/cms/sign/biztrip/reg")
	public ModelAndView vacationReg() throws Exception {
		/************** 프로그램 로직 **************/
		HashMap<String, Object> member = biztripService.getMember(commandMap);
		List<Map<String, Object>> signList = biztripService.getMemberList(commandMap);
		
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String parameters = getRequestToQueryString(searchParam);
		String resultURL = "cms/sign/biztrip/Regist";
		mav.setViewName(resultURL);
		mav.addObject("member", member);
		mav.addObject("signList", signList);
		mav.addObject("parameters",parameters);
		/************** ModelView 로직 **************/
		return mav;
	}
	//수정화면, 사인화면
	@RequestMapping(value = "/cms/sign/biztrip/view")
	public ModelAndView vacationEdit() throws Exception {
		/************** 프로그램 로직 **************/
		HashMap<String,Object> result = biztripService.getData(commandMap);
		List<Map<String, Object>> SignLineList = biztripService.getSignLineList(commandMap);
		String resultURL = "cms/sign/biztrip/View";
		
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String parameters = getRequestToQueryString(searchParam);
		mav.setViewName(resultURL);
		mav.addObject("parameters",parameters);
		mav.addObject("result",result);
		mav.addObject("signList",SignLineList);
		
		/************** ModelView 로직 **************/
		return mav;
	}
	@RequestMapping(value = "/cms/sign/biztrip/edit")
	public ModelAndView vacationView() throws Exception {
		/************** 프로그램 로직 **************/
		HashMap<String,Object> result = biztripService.getData(commandMap);
		List<Map<String, Object>> signLine = biztripService.getSignLineList(commandMap);
		
		String resultURL = "cms/sign/biztrip/Edit";
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String parameters = getRequestToQueryString(searchParam);
		mav.setViewName(resultURL);
		mav.addObject("parameters",parameters);
		mav.addObject("result",result);
		mav.addObject("signLine",signLine);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	@RequestMapping(value = "/cms/sign/biztrip/report")
	public ModelAndView rePortVacation() throws Exception {
		/************** 프로그램 로직 **************/
		HashMap<String,Object> sign = biztripService.getData(commandMap);
		List<Map<String, Object>> SignLineList = biztripService.getSignLineList(commandMap);
		
		
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String parameters = getRequestToQueryString(searchParam);
		String resultURL = "/cms/sign/biztrip/Report";
		mav.setViewName(resultURL);
		mav.addObject("parameters",parameters);
		mav.addObject("sign",sign);
		mav.addObject("signList",SignLineList);
		
		
		/************** ModelView 로직 **************/
		return mav;
	}
	// 검색 파라미터
		@RequestMapping(value = "/cms/sign/biztrip/cud")
		public ModelAndView vacationC() throws Exception {
			/************** 프로그램 로직 **************/
			String mode = StringUtil.noNull( commandMap.get("mode") );
			if(mode.equals("Reg")){
				biztripService.insert(commandMap,request);
			}else if(mode.equals("Edit")){
				biztripService.update(commandMap,request);
			}else if(mode.equals("Sign")){
				biztripService.sign(commandMap);
			}
			/************** 프로그램 로직 **************/
			/************** ModelView 로직 **************/
			// return Model 정보 생성
			ModelAndView mav = new ModelAndView();
			String parameters = getRequestToQueryString(searchParam);
			String resultURL = "redirect:/cms/sign/biztrip" + parameters;
			mav.setViewName(resultURL);
			mav.addObject("parameters",parameters);
			/************** ModelView 로직 **************/
			return mav;
		}
}
