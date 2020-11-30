package egovframework.common.codeUtil;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cms.code.service.CodeService;
import egovframework.common.codeUtil.service.CodeUtilService;
import egovframework.common.util.Pager;
import egovframework.common.util.StringUtil;



/**
 * 설 명 : 공통으로 사용될 코드를 관리한다.
 * @author 개발팀 Bang-ji-hwan
 * @since 2018. 7. 23.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일        수정자              수정내용
 *  -------       --------    ---------------------------
 *  2018. 7. 23.     bjh                최초 생성
 * </pre>
 */
@Controller
public class CodeUtilController{

	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "CodeUtilService")
	private CodeUtilService codeUtilService;

	@Resource(name = "CodeService")
	private CodeService codeService;

	
	/**
	 * <pre>
	 * 1. 개요 :
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : workPlaceListAjax
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/web/codeUtil/codeListAjax")
	public Map<String, Object> workPlaceListAjax(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> commandMap) throws Exception {
		List<Map<String, Object>> list = null;;
		try {
			list = codeUtilService.getComCodeList(commandMap);
		} catch (SQLException e) {
			log.info(e.toString());
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		return result;
	}

	
	/**
	 * <pre>
	 * 1. 개요 :  도로명주소 검색
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : admCodePop
	 * @param request
	 * @param response
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/codeUtil/admDoroCodePop")
	public ModelAndView admDoroCodePop(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> commandMap) throws Exception {
		
		/************** 프로그램 로직 **************/
		int totalCnt = codeUtilService.getAdmcodeListCount(commandMap);
		int pageSize = 10;
		int page = StringUtil.toInt(commandMap.get("page"), 1);
		int startRow = page * pageSize - pageSize + 1;
		Pager pager = new Pager(page, totalCnt, pageSize);
		commandMap.put("startRow", startRow);
		commandMap.put("endRow", startRow + pageSize - 1);
		List<Map<String, Object>> list = codeUtilService.getAdmcodeList(commandMap);
		/************** 프로그램 로직 **************/
		
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "/common/popup/jusoPopup";
		mav.addObject("list", list);
		mav.addObject("pager", pager);
		mav.addObject("totalCnt", totalCnt);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
}
