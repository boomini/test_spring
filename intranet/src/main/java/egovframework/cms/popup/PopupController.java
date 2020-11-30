package egovframework.cms.popup;

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
import org.springframework.web.servlet.ModelAndView;

import egovframework.cms.popup.service.PopupService;
import egovframework.common.controller.DefaultController;
import egovframework.common.util.Pager;
import egovframework.common.util.StringUtil;


/**
 * 설 명 : 팝업관리
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
public class PopupController extends DefaultController {

	@Resource(name = "popupService")
	private PopupService popupService;

	// 검색 파라미터-
	private List<String> searchParam = Arrays.asList("pMENU_NO", "searchType", "searchWord", "page");

	/**
	 * <pre>
	 * 1. 개요 : 팝업 리스트
	 * 2. 처리내용 : 리스트를 출력한다.
	 * </pre>
	 * @Method Name : popupList
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/popup")
	public ModelAndView popupList() throws Exception {

		/************** 프로그램 로직 **************/
		// 페이징 처리
		int totalCnt = popupService.getPopupCount(commandMap);
		int pageSize = 10;
		int page = StringUtil.toInt(commandMap.get("page"), 1);
		int startRow = page * pageSize - pageSize + 1;
		Pager pager = new Pager(page, totalCnt, pageSize);
		commandMap.put("startRow", startRow);
		commandMap.put("endRow", startRow + pageSize - 1);
		List<Map<String, Object>> popupList = popupService.getPopupList(commandMap);

		String parameters = getRequestToQueryString(searchParam);
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "cms/popup/popupList";
		mav.addObject("list", popupList);
		mav.addObject("parameters", parameters);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("pager", pager);
		mav.addObject("resultMessage", resultMessage);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : 팝업 CUD 처리
	 * 2. 처리내용 : 등록, 수정, 삭제 등을 처리 한다.
	 * </pre>
	 * @Method Name : popupCUD
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/popup/cud", method = RequestMethod.POST)
	public ModelAndView popupCUD(HttpServletRequest req, HttpServletResponse res) throws Exception {
		/************** 프로그램 로직 **************/
		String mode = StringUtil.noNull(commandMap.get("mode"));
		// 파일 등록 관리
		if (mode.equals(MODE_WRITE) || mode.equals(MODE_MODIFY)) {
			// String fileId = jfileservice.jfileUpload(req, res);
			// commandMap.put("FILE_ID", fileId);
			if (mode.equals(MODE_WRITE)) {
				popupService.insertPopup(commandMap);
			} else if (mode.equals(MODE_MODIFY)) {
				popupService.updatePopup(commandMap);
				// 삭제 체크한 파일 있을 시 삭제처리
			}
		} else if (mode.equals(MODE_DELETE)) {
			String[] seqs = req.getParameterValues("chkbox");
			commandMap.put("seqs", seqs);
			popupService.deletePopup(commandMap);
		}
		String parameters = getRequestToQueryString(searchParam);

		Map<String, Object> flashMap = new HashMap<String, Object>();
		flashMap.put("msg", setMessage(mode));
		setFlashMap(flashMap, request);
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "";
		if (mode.equals(MODE_WRITE) || mode.equals(MODE_MODIFY)) {
			resultURL = "redirect:/cms/popup/form/" + parameters + "&POPUP_NO=" + commandMap.get("POPUP_NO");
		} else {
			resultURL = "redirect:/cms/popup/" + parameters;
		}
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 팝업 상세내역 
	 * 2. 처리내용 : 상세내역을 출력한다.
	 * </pre>
	 * @Method Name : popupForm
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/popup/form")
	public ModelAndView popupForm() throws Exception {
		/************** 프로그램 로직 **************/
		// 상세보기
		Map<String, Object> popupData = popupService.getPopup(commandMap);
		String mode = popupData == null ? MODE_WRITE : MODE_MODIFY;
		String parameters = getRequestToQueryString(searchParam);
		// 권한 코드
		List<Map<String, Object>> perList = getComCodeList("50");
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		/************** 프로그램 로직 **************/
		
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "cms/popup/popupForm";
		mav.setViewName(resultURL);
		mav.addObject("vo", popupData);
		mav.addObject("mode", mode);
		mav.addObject("perList", perList);
		mav.addObject("parameters", parameters);
		mav.addObject("resultMessage", resultMessage);
		/************** ModelView 로직 **************/
		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : 새창 팝업
	 * 2. 처리내용 : 팝업 내용을 출력한다. 
	 * </pre>
	 * @Method Name : pops
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/web/pop")
	public ModelAndView pops() throws Exception {
		/************** 프로그램 로직 **************/
		// 상세보기
		Map<String, Object> popupData = popupService.getPopup(commandMap);
		String parameters = getRequestToQueryString(searchParam);
		/************** 프로그램 로직 **************/
		
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "";
		resultURL = "common/popup/pop";
		mav.setViewName(resultURL);
		mav.addObject("parameters", parameters);
		mav.addObject("vo", popupData);
		/************** ModelView 로직 **************/
		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : 레이어 팝업
	 * 2. 처리내용 : 팝업 내용을 출력한다.
	 * </pre>
	 * @Method Name : popLayer
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/web/popLayer")
	public ModelAndView popLayer() throws Exception {
		/************** 프로그램 로직 **************/
		// 상세보기
		Map<String, Object> popupData = popupService.getPopup(commandMap);
		String parameters = getRequestToQueryString(searchParam);
		/************** 프로그램 로직 **************/
		
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "";
		resultURL = "common/popup/pop_layer";
		mav.setViewName(resultURL);
		mav.addObject("parameters", parameters);
		mav.addObject("vo", popupData);
		/************** ModelView 로직 **************/
		return mav;
	}
}
