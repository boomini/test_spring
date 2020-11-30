package egovframework.cms.contents;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cms.contents.service.ContentsService;
import egovframework.cms.menu.service.MenuService;
import egovframework.common.controller.DefaultController;
import egovframework.common.util.StringUtil;

/**
 * 설 명 : 컨텐츠 관리
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
public class ContentsController extends DefaultController {

	@Resource(name = "ContentsService")
	private ContentsService contentsService;

	@Resource(name = "MenuService")
	private MenuService menuService;
	
	/**
	 * <pre>
	 * 1. 개요 : 컨텐츠 등록/수정폼
	 * 2. 처리내용 : 컨텐츠 상세내역을 출력한다.
	 * </pre>
	 * @Method Name : contentsForm
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/contents/form")
	public ModelAndView contentsForm() throws Exception {
		/**************** 프로그램 로직 ****************/
		// 관리자만 접근 가능하도록
		if (!isAdminCheck()) {
			return getErrorModel(ERROR_ALERT_AND_BACK, egovMessageSource.getMessage("admin.access.fail"));
		}
		Map<String, Object> contentsView = contentsService.getContents(commandMap); // 컨텐츠 상세 정보
		String mode = StringUtil.isBlank(contentsView) ? MODE_WRITE : MODE_MODIFY; // 쓰기/수정 모드 선택
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		
		//JfileUpload 필요 정보
		Map<String, Object> jQueyFileInfo = new HashMap<String, Object>();
		jQueyFileInfo.put("FILE_UP_SIZE", 50);
		jQueyFileInfo.put("FILE_UP_CNT", 5);
		jQueyFileInfo.put("FILE_ID", contentsView==null?"":contentsView.get("FILE_ID"));
		/**************** 프로그램 로직 ****************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "";
		resultURL = "/cms/contents/contentForm";
		mav.addObject("contentsView", contentsView);
		mav.addObject("mode", mode);
		mav.addObject("resultMessage", resultMessage);
		mav.addObject("jQueyFileInfo", jQueyFileInfo);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : 컨텐츠 CUD 처리
	 * 2. 처리내용 : 등록, 수정을 처리한다.
	 * </pre>
	 * @Method Name : contentsCUD
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/contents/cud", method = RequestMethod.POST)
	public ModelAndView contentsCUD() throws Exception {
		/**************** 프로그램 로직 ****************/
		// 관리자만 접근 가능하도록
		if (!isAdminCheck()) {
			return getErrorModel(ERROR_ALERT_AND_BACK, egovMessageSource.getMessage("admin.access.fail"));
		}
		// 관리자 정보
		String parameters = getRequestToQueryString(Arrays.asList("cntnts_no", "MENU_NO", "pMENU_NO"));
		String mode = StringUtil.noNull(commandMap.get("mode"));
		// 파일 등록 관리
		String cntnts_no = "";
		if (mode.equals(MODE_WRITE)) {
			contentsService.insertContents(commandMap);
			cntnts_no = StringUtil.noNull(commandMap.get("CNTNTS_NO"));
			menuService.updateContentId(commandMap);
		} else if (mode.equals(MODE_MODIFY)) {
			contentsService.updateContents(commandMap);
		}

		Map<String, Object> flashMap = new HashMap<String, Object>();
		flashMap.put("msg", setMessage(mode));
		setFlashMap(flashMap, request);
		/**************** 프로그램 로직 ****************/

		/************** ModelView 로직 **************/
		String resultURL = "";
		if (mode.equals(MODE_WRITE)) {
			resultURL = "redirect:/cms/contents/form/" + parameters + "&cntnts_no=" + cntnts_no + "&reload=Y";
		} else {
			resultURL = "redirect:/cms/contents/form/" + parameters + "&reload=Y";
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : 컨텐츠 보기
	 * 2. 처리내용 : 컨텐츠 내용을 출력한다.
	 * </pre>
	 * @Method Name : contentView
	 * @param webPath
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/{webPath}/contents/contentView")
	public ModelAndView contentView(@PathVariable String webPath) throws Exception {
		/************** 프로그램 로직 **************/
		commandMap.put("MENU_NO", commandMap.get("pMENU_NO"));
		Map<String, Object> dataMap = contentsService.getContents(commandMap);
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		String resultURL = "cms/contents/contentsView";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(resultURL);
		mav.addObject("dataMap", dataMap);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/

		return mav;
	}

}
