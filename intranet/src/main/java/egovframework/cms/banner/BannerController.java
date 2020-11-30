package egovframework.cms.banner;

import java.util.Arrays;
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

import egovframework.cms.banner.service.BannerService;
import egovframework.common.controller.DefaultController;
import egovframework.common.jfile.service.JFileService;
import egovframework.common.util.Pager;
import egovframework.common.util.StringUtil;

/**
 * 
 * 설 명 : 배너 관리
 * @author 개발자 Bang-ji-hwan
 * @since 2013. 8. 31.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일        수정자              수정내용
 *  -------       --------    ---------------------------
 *  2013. 8. 31     bjh               최초 생성
 * </pre>
 */
@Controller
public class BannerController extends DefaultController {
	
	@Resource(name="BannerService")
	private BannerService bannerService;
	
	@Autowired
	private JFileService jfileservice;
	
	// 검색 파라미터
	private List<String> searchParam	= Arrays.asList( "pMENU_NO", "page");
	
	
	/**
	 * <pre>
	 * 1. 개요 : 배너 리스트 조회
	 * 2. 처리내용 : 리스트를 출력한다.
	 * </pre>
	 * @Method Name : bannerList
	 * @return
	 * @throws ComException 
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/banner")
	public ModelAndView bannerList() throws Exception {
		ModelAndView mav = new ModelAndView();

		/************** 프로그램 로직 **************/
		int totalCnt = bannerService.getBannerCount(commandMap);
		int pageSize = 10;
		int page = StringUtil.toInt(commandMap.get("page"), 1);
		int startRow = page * pageSize - pageSize + 1;
		Pager pager = new Pager(page, totalCnt, pageSize);
		commandMap.put("startRow", startRow);
		commandMap.put("endRow", startRow + pageSize - 1);
		/*
		 * int sss = 1/0; int sss2 = 0/1;
		 */

		List<Map<String, Object>> bannerList = bannerService.getBannerList(commandMap);
		String parameters = getRequestToQueryString(searchParam);
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/

		String resultURL = "cms/banner/bannerList";
		mav.addObject("list", bannerList);
		mav.addObject("pager", pager);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("parameters", parameters);
		mav.addObject("resultMessage", resultMessage);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/

		return mav;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. 개요 : 배너 CUD 처리
	 * 2. 처리내용 : 등록, 수정, 삭제, 사용여부 등을 처리 한다.
	 * </pre>
	 * @Method Name : bannerCUD
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/banner/cud", method = RequestMethod.POST)
	public ModelAndView bannerCUD(HttpServletRequest req, HttpServletResponse res) throws Exception {
		/************** 프로그램 로직 **************/
		String mode = StringUtil.noNull(commandMap.get("mode"));
		// 파일 등록 관리
		if (mode.equals(MODE_WRITE) || mode.equals(MODE_MODIFY)) {
			String fileId = jfileservice.jfileUpload(req, res, "FILE_ID");//파일처리
			commandMap.put("FILE_ID", fileId);
			if (mode.equals(MODE_WRITE)) {//등록
				bannerService.insertBanner(commandMap);
			} else if (mode.equals(MODE_MODIFY)) {//수정
				if(StringUtil.noNull(commandMap.get("FILE_DELETE_AT")).equals("Y") || (!fileId.equals("") && !fileId.equals(StringUtil.noNull(commandMap.get("FILE_ID"))))){
					String bf_id = StringUtil.noNull(commandMap.get("FILE_ID"));
					jfileservice.executeFileDelete(bf_id);
				}
				bannerService.updateBanner(commandMap);
			}
		} else if (mode.equals(MODE_DELETE)) {//삭제
			String[] seqs = req.getParameterValues("chkbox");
			commandMap.put("seqs", seqs);
			bannerService.deleteBanner(commandMap);
		} else if (mode.equals("updateState")) {//사용상태 변경
			bannerService.updateState(commandMap);
		}
		// footer 배너리스트 갱신위해 사용
		HttpSession session = request.getSession(true);
		session.removeAttribute("footBanner");

		String parameters = getRequestToQueryString(searchParam);

		Map<String, Object> flashMap = new HashMap<String, Object>();
		flashMap.put("msg", setMessage(mode));
		setFlashMap(flashMap, request);

		/************** 프로그램 로직 **************/
		
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "redirect:/cms/banner/" + parameters;
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;

	}
	
	/**
	 * 
	 * <pre>
	 * 1. 개요 : 배너 상세 정보
	 * 2. 처리내용 : 배너 상세 정보를 출력한다.
	 * </pre>
	 * @Method Name : bannerForm
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/banner/form")
	public ModelAndView bannerForm() throws Exception {
		/************** 프로그램 로직 **************/

		Map<String, Object> bannerMap = bannerService.getBanner(commandMap);
		String mode = bannerMap == null ? MODE_WRITE : MODE_MODIFY;

		String parameters = getRequestToQueryString(searchParam);
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "";
		resultURL = "cms/banner/bannerForm";
		mav.addObject("vo", bannerMap);
		mav.addObject("mode", mode);
		mav.addObject("parameters", parameters);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

}
