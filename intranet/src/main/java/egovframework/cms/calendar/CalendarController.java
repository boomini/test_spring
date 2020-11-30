package egovframework.cms.calendar;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cms.calendar.service.CalendarService;
import egovframework.common.controller.DefaultController;
import egovframework.common.jfile.org.json.JSONArray;
import egovframework.common.jfile.org.json.JSONObject;
import egovframework.common.util.StringUtil;

@Controller
public class CalendarController extends DefaultController {
	
	@Resource(name = "CalendarService")
	private CalendarService calendarService;
	
	
	// 검색 파라미터
	private List<String> searchParam	= Arrays.asList( "pMENU_NO", "page");
	
	@RequestMapping(value = "/cms/cal/list")
	public ModelAndView list() throws Exception {
		/************** 프로그램 로직 **************/
		List<Map<String,Object>> resultList = calendarService.getList(commandMap);
		
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String parameters = getRequestToQueryString(searchParam);
		String resultURL = "cms/cal/Calendar";
		mav.setViewName(resultURL);
		mav.addObject("resultList",resultList);
		mav.addObject("parameters",parameters);
		mav.addObject("resultMessage",resultMessage);
		/************** ModelView 로직 **************/
		return mav;
	};
	
	@ResponseBody
	@RequestMapping(value ={"/cms/cal/Ajax","/web/cal/Ajax"})
	public List<Map<String,Object>> Ajax() throws Exception {
		/************** 프로그램 로직 **************/
		List<Map<String,Object>> resultList = calendarService.getList(commandMap);
		/************** 프로그램 로직 **************/
		return resultList;
	};
	
	@RequestMapping(value = "/cms/cal/page/{RV}")
	public ModelAndView regist( @PathVariable String RV) throws Exception {
		/************** 프로그램 로직 **************/
		String resultURL = null; 
		Map<String,Object>  result = null;
		if( RV.equals("Regist")){
			resultURL = "cms/cal/Regist"; 
		}else if( RV.equals("Edit")){
			result = calendarService.get(commandMap);
			resultURL = "cms/cal/Edit";
		}else if( RV.equals("View")){
			result = calendarService.get(commandMap);
			resultURL = "cms/cal/View";
		}
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String parameters = getRequestToQueryString(searchParam);
		mav.setViewName(resultURL);
		mav.addObject("parameters",parameters);
		mav.addObject("result", result);
		/************** ModelView 로직 **************/
		return mav;
	};
	
	@RequestMapping(value = "/cms/cal/cud")
	public ModelAndView CUD() throws Exception {
		/************** 프로그램 로직 **************/
		String mode = StringUtil.noNull( commandMap.get("mode") );
		try{
			if(mode.equals("Regist")){
				calendarService.insert(commandMap);
			}else if(mode.equals("Edit")){
				calendarService.update(commandMap);
			}else if(mode.equals("Delete")){
				calendarService.delete(commandMap);
			}
		}catch(Exception e){
			Map<String, Object> flashMap = new HashMap<String, Object>();
			flashMap.put("msg", "데이터를 확인해주세요.");
			setFlashMap(flashMap, request);
		}
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String parameters = getRequestToQueryString(searchParam);
		String resultURL = "redirect:/cms/cal/list" + parameters;
		mav.setViewName(resultURL);
		mav.addObject("parameters",parameters);
		/************** ModelView 로직 **************/
		return mav;
	}
	
}
