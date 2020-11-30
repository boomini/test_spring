package egovframework.cms.log.menu;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cms.log.menu.service.AccessMenuLogService;
import egovframework.cms.member.MemberVo;
import egovframework.common.controller.DefaultController;
import egovframework.common.helper.EgovHttpRequestHelper;
import egovframework.common.util.EgovWebUtil;
import egovframework.common.util.Pager;
import egovframework.common.util.StringUtil;

/**
 * 설 명 :  메뉴 접속 로그 관리
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
public class AccessMenuLogController extends DefaultController {

	@Resource(name = "AccessMenuLogService")
	private AccessMenuLogService accessMenuLogService;

	// 검색 파라미터
	private List<String> searchParam = Arrays.asList("pMENU_NO", "startDay", "endDay", "page", "MENU_SE");

	/**
	 * <pre>
	 * 1. 개요 : 접속 로그 리스트
	 * 2. 처리내용 : 리스트를 출력한다.
	 * </pre>
	 * @Method Name : accessMenuLogList
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/accessMenuLog")
	public ModelAndView accessMenuLogList() throws Exception {
		/**************** 프로그램 로직 ****************/

		String startDay = StringUtil.noNull(commandMap.get("startDay")).equals("") ? StringUtil.getCurDateStr("yyyy-MM-dd") : commandMap.get("startDay").toString();
		String endDay = StringUtil.noNull(commandMap.get("endDay")).equals("") ? StringUtil.getCurDateStr("yyyy-MM-dd") : commandMap.get("endDay").toString();
		commandMap.put("startDay", startDay);
		commandMap.put("endDay", endDay);

		// 페이징 처리
		int totalCnt = accessMenuLogService.getAccessMenuLogCount(commandMap);
		int pageSize = 10;
		int page = StringUtil.toInt(commandMap.get("page"), 1);
		int startDomainRow = page * pageSize - pageSize + 1;
		Pager pager = new Pager(page, totalCnt, pageSize);
		commandMap.put("startRow", startDomainRow);
		commandMap.put("endRow", startDomainRow + pageSize - 1);

		List<Map<String, Object>> accLogList = accessMenuLogService.getAccessMenuLogList(commandMap);

		// 파라미터 정보
		String parameters = getRequestToQueryString(searchParam);

		/**************** 프로그램 로직 ****************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "cms/log/accessMenuLogList";
		mav.addObject("accLogList", accLogList);
		mav.addObject("parameters", parameters);
		mav.addObject("commandMap", commandMap);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("pager", pager);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/

		return mav;
	}
	
	
	
	/**
	 * <pre>
	 * 1. 개요 : 메뉴별 접속 로그르 저장한다.
	 * 2. 처리내용 : 메뉴별 접속 로그르 저장한다.
	 * </pre>
	 * @Method Name : insertMenuLogAjax
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/insertMenuLogAjax")
	@ResponseBody
	public Map<String, Object> insertMenuLogAjax(@RequestParam Map<String, Object> param) throws Exception{
		String resultMsg = "";
		int resultCode = 0;
		try {
			MemberVo memberVo = (MemberVo)getAuthenticatedUser();
			String ACCES_IP = EgovHttpRequestHelper.getRequestIp();
			param.put("MENU_NO", StringUtil.noNull(param.get("menuNo")));
			param.put("ACCES_URL", StringUtil.noNull(param.get("url")));
			param.put("ACCES_IP", ACCES_IP);
			if (memberVo != null) param.put("LOGIN_ID", memberVo.getUser_id());
			accessMenuLogService.insertAccessMenuLog(param);
		} catch (SQLException e) {
			resultCode = 1;
			resultMsg = "시스템 오류가 발생하였습니다.";
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("resultMsg", resultMsg);
		result.put("resultCode", resultCode);

		return result;
	}

}
