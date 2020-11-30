package egovframework.cms.boardCfg;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cms.boardCfg.service.BoardCfgService;
import egovframework.common.controller.DefaultController;
import egovframework.common.helper.EgovHttpRequestHelper;
import egovframework.common.util.Pager;
import egovframework.common.util.StringUtil;

/**
 * 설 명 : 게시판 관리
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
public class BoardCfgController extends DefaultController {

	// 검색 파라미터
	private List<String> searchParam = Arrays.asList("page", "pMENU_NO", "pBBS_TY", "pUSE_AT", "pSCH_KEY", "pSCH_VALUE");

	@Resource(name = "BoardCfgService")
	private BoardCfgService boardCfgService;

	/**
	 * <pre>
	 * 1. 개요 : 게시판 리스트
	 * 2. 처리내용 : 리스트를 출력한다.
	 * </pre>
	 * @Method Name : boardCfgList
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/boardCfg")
	public ModelAndView boardCfgList() throws Exception {

		/************** 프로그램 로직 **************/
		commandMap.put("pUSE_AT", StringUtil.noNull(commandMap.get("pUSE_AT"), "Y"));

		// 페이징 처리
		int totalCnt = boardCfgService.getBoardCfgCount(commandMap);
		int pageSize = 10;
		int page = StringUtil.toInt(commandMap.get("page"), 1);
		int startRow = page * pageSize - pageSize + 1;
		Pager pager = new Pager(page, totalCnt, pageSize);
		commandMap.put("startRow", startRow);
		commandMap.put("endRow", startRow + pageSize - 1);

		List<Map<String, Object>> dataList = boardCfgService.getBoardCfgList(commandMap);
		// 게시판 타입 정보
		List<Map<String, Object>> blbdTypeList = getComCodeList("3");

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
		String resultURL = "cms/boardCfg/boardCfgList";
		mav.addObject("dataList", dataList);
		mav.addObject("blbdTypeList", blbdTypeList);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("parameters", parameters);
		mav.addObject("resultMessage", resultMessage);
		mav.addObject("pager", pager);// 도메인 정보
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : 게시판 상세 조회
	 * 2. 처리내용 : 게시판 상세내역을 출력한다.
	 * </pre>
	 * @Method Name : boardCfgForm
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/boardCfg/form")
	public ModelAndView boardCfgForm() throws Exception {

		/************** 프로그램 로직 **************/
		String mode = MODE_WRITE;
		Map<String, Object> boardCfgView = boardCfgService.getBoardCfg(commandMap);

		if (!StringUtil.isBlank(boardCfgView)) {
			mode = MODE_MODIFY;
		}
		// 게시판 타입 정보
		List<Map<String, Object>> blbdTypeList = getComCodeList("3");
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
		String resultURL = "cms/boardCfg/boardCfgForm";
		mav.addObject("vo", boardCfgView);
		mav.addObject("blbdTypeList", blbdTypeList);
		mav.addObject("parameters", parameters);
		mav.addObject("resultMessage", resultMessage);
		mav.addObject("mode", mode);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : 게시판 CUD 처리
	 * 2. 처리내용 : 등록, 수정, 운영 여부 등을 처리 한다.
	 * </pre>
	 * @Method Name : boardCfgCUD
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/boardCfg/cud", method = RequestMethod.POST)
	public ModelAndView boardCfgCUD() throws Exception {

		/************** 프로그램 로직 **************/
		String mode = StringUtil.noNull(commandMap.get("mode"));
		String parameters = getRequestToQueryString(searchParam);

		if (mode.equals(MODE_WRITE)) {
			commandMap.put("INS_IP", EgovHttpRequestHelper.getRequestIp());
			boardCfgService.insertBoardCfg(commandMap);
		} else if (mode.equals(MODE_MODIFY)) {
			boardCfgService.updateBoardCfg(commandMap);
		} else {
			String blbd = (String) commandMap.get("BBS_NO_REF");
			String blbdArr[] = blbd.split("\\|");
			commandMap.put("blbdArr", blbdArr);
			boardCfgService.deleteBoardCfg(commandMap);
		}
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		flashMap.put("msg", setMessage(mode));
		setFlashMap(flashMap, request);
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "";
		if (mode.equals(MODE_DELETE)) {
			resultURL = "redirect:/cms/boardCfg/" + parameters;
		} else {
			resultURL = "redirect:/cms/boardCfg/form" + parameters + "&BBS_NO=" + StringUtil.noNull(commandMap.get("BBS_NO"));
		}
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;

	}

	/**
	 * <pre>
	 * 1. 개요 : 게시판 팝업 창
	 * 2. 처리내용 : 메뉴관리에서 사용되며 게시판 목록을 팝업창에 출력한다.
	 * </pre>
	 * @Method Name : popBoard
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = {"/cms/boardPop/", "/cms/menu/boardPop"})
	public ModelAndView popBoard() throws Exception {
		/************** 프로그램 로직 **************/
		commandMap.put("USE_AT", StringUtil.noNull(commandMap.get("USE_AT"), Y));
		List<Map<String, Object>> dataList = boardCfgService.getPopBoardList(commandMap);
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "/cms/boardCfg/boardSearchPop";
		mav.setViewName(resultURL);
		mav.addObject("dataList", dataList);
		/************** ModelView 로직 **************/
		return mav;

	}

}
