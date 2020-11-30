package egovframework.cms.board;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cms.board.service.BoardService;
import egovframework.cms.boardCfg.service.BoardCfgService;
import egovframework.common.controller.DefaultController;
import egovframework.common.jfile.service.JFileDetails;
import egovframework.common.jfile.service.JFileService;
import egovframework.common.util.Pager;
import egovframework.common.util.StringUtil;

/**
 * 설 명 : 게시글 관리
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
public class BoardController extends DefaultController {	

	@Resource(name = "BoardService")
	private BoardService boardService;
	@Resource(name = "BoardCfgService")
	private BoardCfgService boardCfgService;
	@Autowired
	private JFileService jFileService;

	// 검색파라미터
	private List<String> searchParam = Arrays.asList("pMENU_NO", "searchType", "searchWord", "S_ANSWER_STTUS", "page");

	/**
	 * <pre>
	 * 1. 개요 : 게시글 리스트
	 * 2. 처리내용 : 리스트를 출력한다.
	 * </pre>
	 * @Method Name : boardList
	 * @param BBS_NO
	 * @param webPath
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/{webPath}/board/{BBS_NO}")
	public ModelAndView boardList(@PathVariable int BBS_NO, @PathVariable String webPath) throws Exception {
		/************** 프로그램 로직 **************/
		// 게시판 ID 세팅
		commandMap.put("BBS_NO", BBS_NO);
		// 게시판에 등록된 셋팅값 가져오기
		Map<String, Object> boardCfg = boardCfgService.getBoardCfg(commandMap);

		List<Map<String, Object>> repStat = null;

		// 데이터가 존재 하지 않을 경우
		if (boardCfg == null) {
			return getErrorModel(ERROR_ALERT_AND_BACK, egovMessageSource.getMessage("info.nodata.msg"));
		}

		// 댓글형인 경우 값 새팅- 쿼리문이 틀려짐
		if ("Y".equals(boardCfg.get("ANSWER_USE_AT"))) {
			commandMap.put("ANSWER_USE_AT", boardCfg.get("ANSWER_USE_AT"));
		}

		if ("M".equals(boardCfg.get("BBS_TY"))) {
			// 답변 처리 상태 코드
			repStat = getComCodeList("4");
		}

		commandMap.put("BBS_TY", boardCfg.get("BBS_TY") );
		
		// 페이징 처리
		int totalCnt = boardService.getBoardCount(commandMap);
		int pageSize = 10;
		int page = StringUtil.toInt(commandMap.get("page"), 1);
		int startRow = page * pageSize - pageSize + 1;
		Pager pager = new Pager(page, totalCnt, pageSize);
		commandMap.put("startRow", startRow);
		commandMap.put("endRow", startRow + pageSize - 1);

		String parameters = getRequestToQueryString(searchParam);

		List<Map<String, Object>> dataList = boardService.getBoardList(commandMap);

		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));

		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();

		String resultURL = "";
		String blbdTyp = StringUtil.noNull(boardCfg.get("BBS_TY"));
		if (blbdTyp.equals("P")) { // 포토게시판
			resultURL = "cms/board/photo/photoList";
		} else { // 일반, 민원 게시판
			resultURL = "cms/board/boardList";
		}
		mav.addObject("boardCfg", boardCfg);
		mav.addObject("parameters", parameters);
		mav.addObject("dataList", dataList);
		mav.addObject("repStat", repStat);
		mav.addObject("pager", pager);
		mav.addObject("resultMessage", resultMessage);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시글 상세
	 * 2. 처리내용 : 상세 정보를 출력한다.
	 * </pre>
	 * @Method Name : boardView
	 * @param BBS_NO
	 * @param BBSCTT_NO
	 * @param webPath
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/{webPath}/board/{BBS_NO}/{BBSCTT_NO}")
	public ModelAndView boardView(@PathVariable int BBS_NO, @PathVariable int BBSCTT_NO, @PathVariable String webPath) throws Exception {
		/************** 프로그램 로직 **************/
		// 게시판 ID 세팅
		commandMap.put("BBS_NO", BBS_NO);
		commandMap.put("BBSCTT_NO", BBSCTT_NO);

		// 게시판에 등록된 셋팅값 가져오기
		Map<String, Object> boardCfg = boardCfgService.getBoardCfg(commandMap);
		
		// 상세보기 데이터 가져오기
		Map<String, Object> dataMap = boardService.getBoard(commandMap);
		// 데이터가 존재 하지 않을 경우
		if (dataMap == null) {
			return getErrorModel(ERROR_ALERT_AND_BACK, egovMessageSource.getMessage("info.nodata.msg"));
		}
		//비공개 일경우 ID 체크
		/*if(StringUtil.noNull(boardCfg.get("SCRSNT_USE_AT")).equals("Y")){*/
		if(!StringUtil.noNull(dataMap.get("OTHBC_AT")).equals("Y")){
			if(!StringUtil.noNull(commandMap.get("gUserId")).equals(StringUtil.noNull(dataMap.get("REGISTER_ID")))){
				return getErrorModel(ERROR_ALERT_AND_BACK, egovMessageSource.getMessage("admin.access.fail"));	
			}
		}
				
		// 조회수 증가
		boardService.updateHit(commandMap);
		// 파일 리스트
		String fileId = StringUtil.noNull(dataMap.get("FILE_ID"));
		List<JFileDetails> fileList = null;
		if (!fileId.equals(""))
			fileList = jFileService.getAttachFiles(fileId);

		String parameters = getRequestToQueryString(searchParam);

		// Map<String, Object> pre 	= boardService.getPreView(commandMap);
		// Map<String, Object> next = boardService.getNextView(commandMap);

		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));

		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "";
		String blbdTyp = StringUtil.noNull(boardCfg.get("BBS_TY"));
		if (blbdTyp.equals("P")) { // 포토게시판
			resultURL = "cms/board/photo/photoView";
		} else { // 일반,민원 게시판
			resultURL = "cms/board/boardView";
		}
		mav.addObject("boardCfg", boardCfg);
		mav.addObject("dataMap", dataMap);
		mav.addObject("fileList", fileList);
		//mav.addObject("pre", pre); mav.addObject("next", next);
		mav.addObject("parameters", parameters);
		mav.addObject("resultMessage", resultMessage);
		
		
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/

		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : 게시글 등록/수정 폼
	 * 2. 처리내용 : 게시글 상세정보를 출력한다.
	 * </pre>
	 * @Method Name : boardForm
	 * @param BBS_NO
	 * @param webPath
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/{webPath}/board/{BBS_NO}/form")
	public ModelAndView boardForm(@PathVariable int BBS_NO, @PathVariable String webPath) throws Exception {

		/************** 프로그램 로직 **************/
		// 게시판에 등록된 셋팅값 가져오기
		Map<String, Object> boardCfg = boardCfgService.getBoardCfg(commandMap);

		Map<String, Object> map = new HashMap<String, Object>();
		String mode = StringUtil.noNull(commandMap.get("MODE"));

		// 수정폼 데이타 불러오기
		Map<String, Object> dataMap = boardService.getBoard(commandMap);
		
		// 관리자및 등록자만 접근 가능하도록
		/*if (!isAdminCheck() || (!StringUtil.noNull(commandMap.get("gUserId")).equals(StringUtil.noNull(dataMap.get("REGISTER_ID"))))) {
			return getErrorModel(ERROR_ALERT_AND_BACK, egovMessageSource.getMessage("admin.access.fail"));
		}*/
		
		String parameters = getRequestToQueryString(searchParam);
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/

		ModelAndView mav = new ModelAndView();
		String resultURL = "";
		String blbdTyp = StringUtil.noNull(boardCfg.get("BBS_TY"));
		if (mode.equals(MODE_REPLY)) {
			// 답변 처리 상태 코드
			List<Map<String, Object>> repStat = getComCodeList("4");
			mav.addObject("repStat", repStat);
			resultURL =  "cms/board/boardReply";
		} else if (mode.equals("answer")) {
			if (blbdTyp.equals("P")) { // 포토게시판
				/*resultURL = "cms/board/photo/photoAnswer";*/
				resultURL = "cms/board/boardAnswer";
			} else { // 일반, 민원 게시판
				resultURL = "cms/board/boardAnswer";
			}
			if (dataMap != null) {
				// 파일 리스트
				String fileId = StringUtil.noNull(dataMap.get("FILE_ID"));
				List<JFileDetails> fileList = null;
				if (!fileId.equals(""))
					fileList = jFileService.getAttachFiles(fileId);
				mav.addObject("fileList", fileList);
			}

		} else {
			if (blbdTyp.equals("P")) { // 포토게시판
				// resultURL = "cms/board/photo/photoEdit";
				resultURL = "cms/board/boardEdit";
			} else { // 일반,민원 게시판
				resultURL = "cms/board/boardEdit";
			}
		}
		
		//JfileUpload 필요 정보
		Map<String, Object> jQueyFileInfo = new HashMap<String, Object>();
		jQueyFileInfo.put("FILE_UP_SIZE", boardCfg.get("FILE_UP_SIZE"));
		jQueyFileInfo.put("FILE_UP_CNT", boardCfg.get("FILE_UP_CNT"));
		jQueyFileInfo.put("FILE_ID", dataMap==null||mode.equals("answer")?"":dataMap.get("FILE_ID"));
		
		mav.addObject("parameters", parameters);
		mav.addObject("mode", mode);
		mav.addObject("boardCfg", boardCfg);
		mav.addObject("dataMap", dataMap);
		mav.addObject("user", map);
		mav.addObject("jQueyFileInfo", jQueyFileInfo);
		mav.setViewName(resultURL);
		
		/************** ModelView 로직 **************/
		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : 게시글 CUD
	 * 2. 처리내용 : 등록, 수정, 삭제 등을 처리 한다.
	 * </pre>
	 * @Method Name : boardCUD
	 * @param BBS_NO
	 * @param webPath
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/{webPath}/board/{BBS_NO}/cud", method = RequestMethod.POST)
	public ModelAndView boardCUD(@PathVariable int BBS_NO, @PathVariable String webPath) throws Exception {

		/************** 프로그램 로직 **************/
		String mode = StringUtil.noNull(commandMap.get("MODE"));
		if (mode.equals(MODE_WRITE)) {
			commandMap.put("GROUP_BBSCTT_NO", 0);
			commandMap.put("BBSCTT_ORDR", 0);
			commandMap.put("ROOT_BBSCTT_NO", 0);
			// 게시 글 등록
			boardService.inertBoard(commandMap);
		} else if (mode.equals(MODE_MODIFY)) {
			boardService.updateBoard(commandMap);
		} else if (mode.equals(MODE_ANSWER)) {
			// 부모글 등록
			String UPPER_BBSCTT_NO = StringUtil.noNull(commandMap.get("UPPER_BBSCTT_NO"));
			commandMap.put("ROOT_BBSCTT_NO", commandMap.get("BBSCTT_NO"));
			commandMap.put("UPPER_BBSCTT_NO", UPPER_BBSCTT_NO);
			String artc = StringUtil.noNull(commandMap.get("GROUP_BBSCTT_NO"));
			int GROUP_BBSCTT_NO = Integer.parseInt(artc);
			GROUP_BBSCTT_NO++;
			commandMap.put("GROUP_BBSCTT_NO", GROUP_BBSCTT_NO);
			int BBSCTT_ORDR = boardService.getMaxOrd(commandMap);
			commandMap.put("BBSCTT_ORDR", BBSCTT_ORDR);
			boardService.inertBoard(commandMap);
		} else if (mode.equals(MODE_REPLY)) {
			boardService.updateBoardReply(commandMap);
		} else {
			boardService.deleteBoard(commandMap);
		}

		Map<String, Object> flashMap = new HashMap<String, Object>();
		flashMap.put("msg", setMessage(mode));
		setFlashMap(flashMap, request);

		String parameters = getRequestToQueryString(searchParam);
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "";
		if (mode.equals(MODE_WRITE) || mode.equals(MODE_MODIFY) || mode.equals(MODE_REPLY)) {
			resultURL = "redirect:/web/board/" + commandMap.get("BBS_NO") + "/" + commandMap.get("BBSCTT_NO") + "/" + parameters;
		} else {
			resultURL = "redirect:/web/board/" + commandMap.get("BBS_NO") + "/" + parameters;
		}
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	@RequestMapping(value = "/{webPath}/photo/replyAjax")
	public ModelAndView vacationList() throws Exception {
		/************** 프로그램 로직 **************/
		List<Map<String,Object>> resultList = boardService.getReplyList(commandMap);
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String parameters = getRequestToQueryString(searchParam);
		String resultURL = "/cms/board/photo/photoReply";
		mav.setViewName(resultURL);
		mav.addObject("userYn", commandMap.get("gUserId"));
		mav.addObject("parameters",parameters);
		mav.addObject("resultList",resultList);
		/************** ModelView 로직 **************/
		return mav;
	};
	@ResponseBody
	@RequestMapping(value = "/web/board/reply/cud")
	public Map<String, Object> replyAjax() throws Exception {
		String mode = StringUtil.noNull(commandMap.get("MODE"));
		if (mode.equals(MODE_WRITE)) {
			commandMap.put("BBSCTT_SJ", "PHOTO_");
			commandMap.put("GROUP_BBSCTT_NO", 0);
			commandMap.put("BBSCTT_ORDR", 0);
			commandMap.put("ROOT_BBSCTT_NO", 0);
			// 게시 글 등록
			boardService.inertBoard(commandMap);
		}else if(mode.equals(MODE_MODIFY)){
			String[] lineId = request.getParameterValues("Edit_BBSCTT_CN");
			commandMap.put("BBSCTT_CN", lineId[ Integer.parseInt(StringUtil.noNull(commandMap.get("C_Index")))] );
			
			commandMap.put("BBSCTT_NO", StringUtil.noNull(commandMap.get("REPLY_ID")) );
			boardService.updateBoard(commandMap);
		}else if(mode.equals(MODE_DELETE)){
			commandMap.put("BBSCTT_NO", StringUtil.noNull(commandMap.get("REPLY_ID")) );
			boardService.deleteBoard(commandMap);
		}
		Map<String, Object> result = new HashMap<String, Object>();
		return result;
	}

}
