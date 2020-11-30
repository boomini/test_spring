package egovframework.cms.stat;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cms.menu.service.MenuService;
import egovframework.cms.stat.service.StatService;
import egovframework.common.controller.DefaultController;
import egovframework.common.util.StringUtil;

/**
 * 설 명 : 접속 통계 관리
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
 *  2018. 8. 01     LCY         accessStat()-subcmd 추가 탭이동시 조건 초기화 수정       
 * </pre>
 */
@Controller
public class StatController extends DefaultController {

	@Resource(name = "StatService")
	private StatService statService;

	@Resource(name = "MenuService")
	private MenuService menuService;

	// 검색 파라미터
	//private List<String> searchParam = Arrays.asList("pMENU_NO");

	/**
	 * 접속 로그 통계
	 * @return
	 * @throws Exception
	 */
	
	
	/**
	 * <pre>
	 * 1. 개요 :  접속 통계
	 * 2. 처리내용 : 접속 통계 화면 출력을 한다.
	 * </pre>
	 * @Method Name : accessStat
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/accessStat")
	public ModelAndView accessStat() throws Exception {
		/**************** 프로그램 로직 ****************/
		String statTyp = StringUtil.noNull(commandMap.get("STAT_TYP")).equals("") ? "D" : StringUtil.noNull(commandMap.get("STAT_TYP"));
		
		String subCmd = StringUtil.noNull(commandMap.get("subCmd"));

		String yy = (subCmd.equals("") || subCmd.equals("tab"))  ? StringUtil.getCurDateStr("yyyy") : commandMap.get("YY").toString();
		String mm = (subCmd.equals("") || subCmd.equals("tab"))  ? StringUtil.getCurDateStr("MM") : commandMap.get("MM").toString();
		
		commandMap.put("YY", yy);
		commandMap.put("MM", mm);


		if (StringUtil.noNull(commandMap.get("MENU_SE")).equals("")) {
			commandMap.put("MENU_SE", 1);
		}
		commandMap.put("STAT_TYP", statTyp);
		List<Map<String, Object>> statList = statService.getAccessStatList(commandMap);
		
		/**************** 프로그램 로직 ****************/
		
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "cms/stat/accessStat";
		mav.addObject("statList", statList);
		mav.addObject("commandMap", commandMap);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴 접속 통계 - 현재 사용하지 않는다.
	 * 2. 처리내용 : 접속 통계를 출력한다.
	 * </pre>
	 * @Method Name : menuStat
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value = "/cms/menuStat")
	public ModelAndView menuStat() throws Exception {
		/**************** 프로그램 로직 ****************/

		String statTyp = StringUtil.noNull(commandMap.get("STAT_TYP")).equals("") ? "D" : StringUtil.noNull(commandMap.get("STAT_TYP"));
		String dt_from = "";
		if (statTyp.equals("D")) {
			dt_from = StringUtil.noNull(commandMap.get("DT")).equals("") ? StringUtil.getCurDateStr("yyyy-MM-dd") : commandMap.get("DT").toString();
			commandMap.put("DT", dt_from);

		} else if (statTyp.equals("M")) {
			String yy = StringUtil.noNull(commandMap.get("YY")).equals("") ? StringUtil.getCurDateStr("yyyy") : commandMap.get("YY").toString();
			String mm = StringUtil.noNull(commandMap.get("MM")).equals("") ? StringUtil.getCurDateStr("MM") : commandMap.get("MM").toString();
			dt_from = yy + "-" + mm + "-01";
			commandMap.put("YY", yy);
			commandMap.put("MM", mm);

		} else if (statTyp.equals("Y")) {
			String yy = StringUtil.noNull(commandMap.get("YY")).equals("") ? StringUtil.getCurDateStr("yyyy") : commandMap.get("YY").toString();
			dt_from = yy + "-01-01";
			commandMap.put("YY", yy);
		}

		commandMap.put("STAT_TYP", statTyp);
		List<Map<String, Object>> statList = null;
		List<Map<String, Object>> menuList = null;

		// 디폴트값 설정
		commandMap.put("MENU_SE", StringUtil.noNull(commandMap.get("MENU_SE"), "1"));

		commandMap.put("MENU_LEVEL", "1");
		commandMap.put("DEPTH_ID", commandMap.get("ONE_DEPTH_ID"));
		statList = menuService.getSelDptList(commandMap);
		int totCnt = 0;

		for (int i = 0; i < statList.size(); i++) { // 2뎁스메뉴 셋팅
			Map<String, Object> map = (Map<String, Object>) statList.get(i);

			Map<String, Object> arrMap = new HashMap<String, Object>();
			arrMap.put("MENU_NO", map.get("MENU_NO"));
			arrMap.put("STAT_TYP", statTyp);
			arrMap.put("DT_FROM", dt_from);
			List<Map<String, Object>> subList = statService.getAccessMenuStatList(arrMap);
			map.put("subList", subList);
			totCnt+=subList.size();
		}

		// 1뎁스 메뉴 정보
		commandMap.put("MENU_LEVEL", "1"); // 1뎁스 메뉴를 가져온다.
		commandMap.put("USE_AT", "Y"); // 1뎁스 메뉴를 가져온다.
		commandMap.remove("ONE_DEPTH_ID"); // 전체 조회
		menuList = menuService.getOneDptList(commandMap);

		/**************** 프로그램 로직 ****************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "cms/stat/menuStat";
		mav.addObject("statList", statList);
		mav.addObject("menuList", menuList);
		mav.addObject("totCnt", totCnt);
		mav.addObject("commandMap", commandMap);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

}
