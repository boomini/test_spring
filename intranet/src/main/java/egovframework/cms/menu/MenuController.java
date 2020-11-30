package egovframework.cms.menu;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cms.menu.service.MenuService;
import egovframework.common.controller.DefaultController;
import egovframework.common.util.StringUtil;

/**
 * 설 명 : 메뉴 관리
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
public class MenuController extends DefaultController {

	// 검색 파라미터-
	private List<String> searchParam = Arrays.asList("MENU_SE", "ONE_DEPTH_ID", "pMENU_NO");

	@Resource(name = "MenuService")
	private MenuService menuService;

	/**
	 * <pre>
	 * 1. 개요 : 메뉴 리스트
	 * 2. 처리내용 : 리스트를 출력한다.
	 * </pre>
	 * @Method Name : menuList
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/menu")
	public ModelAndView menuList() throws Exception {
		/**************** 프로그램 로직 ****************/
		List<Map<String, Object>> list = null;
		List<Map<String, Object>> oneAllList = null;

		// 디폴트값 설정
		commandMap.put("MENU_SE", StringUtil.noNull(commandMap.get("MENU_SE"), "1"));
		commandMap.put("MENU_LEVEL", "1");
		commandMap.put("DEPTH_ID", commandMap.get("ONE_DEPTH_ID"));
		list = menuService.getSelDptList(commandMap);

		for (int i = 0; i < list.size(); i++) { // 2뎁스메뉴 셋팅
			Map<String, Object> map = (Map<String, Object>) list.get(i);
			map.put("UPPER_MENU_NO", map.get("MENU_NO"));
			Map<String, Object> arrMap = new HashMap<String, Object>();
			arrMap.put("MENU_NO", map.get("MENU_NO"));
			List<Map<String, Object>> subList = menuService.getTreeList(arrMap);
			map.put("subList", subList);
		}
		// 1뎁스 메뉴 정보
		commandMap.put("MENU_LEVEL", "1"); // 1뎁스 메뉴를 가져온다.
		commandMap.remove("ONE_DEPTH_ID"); // 전체 조회
		oneAllList = menuService.getOneDptList(commandMap);
		// 파라미터 정보
		String parameters = getRequestToQueryString(searchParam);

		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));

		/**************** 프로그램 로직 ****************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		mav.addObject("resultMessage", resultMessage);
		String resultURL = "cms/menu/menuList";
		// 검색조건
		mav.addObject("oneAllList", oneAllList);
		mav.addObject("parameters", parameters);
		// 뷰단
		mav.addObject("dataList", list);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : 메뉴 등록/수정 폼
	 * 2. 처리내용 : 상세내역을 출력한다.
	 * </pre>
	 * @Method Name : menuForm
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/menu/form")
	public ModelAndView menuForm() throws Exception {
		/**************** 프로그램 로직 ****************/
		Map<String, Object> menuView = menuService.getMenu(commandMap);

		String mode = StringUtil.isBlank(menuView) ? MODE_WRITE : MODE_MODIFY; // 쓰기/수정 모드 선택

		// 컨텐츠 형식
		List<Map<String, Object>> conTypeList = getComCodeList("2");

		// 파라미터 정보
		String parameters = getRequestToQueryString(searchParam);
		/**************** 프로그램 로직 ****************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "cms/menu/menuForm";
		mav.addObject("menuView", menuView);
		mav.addObject("conTypeList", conTypeList);
		mav.addObject("parameters", parameters);
		mav.addObject("mode", mode);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : 메뉴 CUD 처리
	 * 2. 처리내용 : 등록,수정,삭제를 한다.
	 * </pre>
	 * @Method Name : menuCUD
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/menu/cud", method = RequestMethod.POST)
	public ModelAndView menuCUD() throws Exception {

		/**************** 프로그램 로직 ****************/
		String mode = StringUtil.noNull(commandMap.get("mode"));
		// 정보 저장
		if (mode.equals(MODE_WRITE)) {
			menuService.insertMenu(commandMap);
			// 정보 수정
		} else if (mode.equals(MODE_MODIFY)) {
			menuService.updateMenu(commandMap);
			// 정보 삭제
		} else if (mode.equals(MODE_DELETE)) {
			menuService.deleteMenu(commandMap);
			// 정렬 수정
		} else if (mode.equals(SORT_SAVE)) {
			String[] menuArr = StringUtil.toStringArray(commandMap.get("MENU_NO_REF").toString(), "\\|");
			String[] sortArr = StringUtil.toStringArray(commandMap.get("SORT_REF").toString(), "\\|");
			for (int i = 0; i < menuArr.length; i++) {
				if (!StringUtil.isBlank(menuArr[i])) {
					commandMap.put("MENU_NO", menuArr[i]);
					commandMap.put("SORT_ORDR", sortArr[i]);
					menuService.updateOrder(commandMap);
				}
			}
		}

		Map<String, Object> flashMap = new HashMap<String, Object>();
		flashMap.put("msg", setMessage(mode));
		setFlashMap(flashMap, request);
		// 파리미터 정보
		String parameters = getRequestToQueryString(searchParam);

		/**************** 프로그램 로직 ****************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "redirect:/cms/menu/" + parameters;
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : 메뉴 권한 리스트
	 * 2. 처리내용 : 리스트를 출력한다.
	 * </pre>
	 * @Method Name : menuAuthList
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/menuAuth")
	public ModelAndView menuAuthList() throws Exception {
		/**************** 프로그램 로직 ****************/
		List<Map<String, Object>> list = null;
		List<Map<String, Object>> menuAuthList = null;
		List<Map<String, Object>> perList = getComCodeList("50");
		commandMap.put("GROUP_ID", StringUtil.noNull(commandMap.get("GROUP_ID"), "0200"));
		menuAuthList = menuService.getMenuAuthList(commandMap);

		commandMap.put("MENU_SE", StringUtil.noNull(commandMap.get("MENU_SE"), "1"));
		commandMap.put("MENU_LEVEL", "1");
		commandMap.put("DEPTH_ID", commandMap.get("ONE_DEPTH_ID"));
		list = menuService.getSelDptList(commandMap);

		for (int i = 0; i < list.size(); i++) { // 2뎁스메뉴 셋팅
			Map<String, Object> map = (Map<String, Object>) list.get(i);
			map.put("UPPER_MENU_NO", map.get("MENU_NO"));
			Map<String, Object> arrMap = new HashMap<String, Object>();
			arrMap.put("MENU_NO", map.get("MENU_NO"));
			arrMap.put("USE_AT", "Y");
			List<Map<String, Object>> subList = menuService.getTreeList(arrMap);
			map.put("subList", subList);
		}
		
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		/**************** 프로그램 로직 ****************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "cms/menu/menuAuth";
		// 뷰단
		mav.addObject("dataList", list);
		mav.addObject("menuAuthList", menuAuthList);
		mav.addObject("perList", perList);
		mav.addObject("resultMessage", resultMessage);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : 메뉴와 그룹 연결
	 * 2. 처리내용 : 그룹별 메뉴를 등록한다.
	 * </pre>
	 * @Method Name : manuAuthProc
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/menu/authSave", method = RequestMethod.POST)
	public ModelAndView manuAuthProc() throws Exception {

		/************** 프로그램 로직 **************/
		// 파라미터 정보
		String parameters = getRequestToQueryString(Arrays.asList("MENU_SE", "GROUP_ID", "pMENU_NO"));
		String resultURL = "redirect:/cms/menuAuth/" + parameters;
		// 권한 초기화
		menuService.deleteMenuAuth(commandMap);
		
		String[] useAuths = StringUtil.toStringArray(request.getParameter("useAuths"), "\\|");
		String[] insAuths = StringUtil.toStringArray(request.getParameter("insAuths"), "\\|");
		String[] updAuths = StringUtil.toStringArray(request.getParameter("updAuths"), "\\|");
		String[] delAuths = StringUtil.toStringArray(request.getParameter("delAuths"), "\\|");
		
		for (int i = 0; i < useAuths.length; i++) {
			if (!StringUtil.isBlank(useAuths[i])) {
				commandMap.put("MENU_NO", useAuths[i]);
				commandMap.put("USE_AUTHOR_AT", "Y");
				commandMap.put("REGISTE_AUTHOR_AT", menuChecked(insAuths,useAuths[i])?"Y":"N");
				commandMap.put("CHANGE_AUTHOR_AT", menuChecked(updAuths,useAuths[i])?"Y":"N");
				commandMap.put("DELETE_AUTHOR_AT", menuChecked(delAuths,useAuths[i])?"Y":"N");
				menuService.insertMenuAuth(commandMap);
			}
		}

		Map<String, Object> flashMap = new HashMap<String, Object>();
		flashMap.put("msg", setMessage(MODE_PROC));
		setFlashMap(flashMap, request);
		
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	
	public boolean menuChecked(String[] param, String menuNo){
		boolean returnVal = false;
		for (int i = 0; i < param.length; i++) {
			if(param[i].equals(menuNo)){
				returnVal = true;
				break;
			}
		}
		return returnVal; 
	}

}
