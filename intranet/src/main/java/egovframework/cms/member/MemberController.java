package egovframework.cms.member;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cms.member.service.MemberService;
import egovframework.common.controller.DefaultController;
import egovframework.common.util.EgovDateUtil;
import egovframework.common.util.EgovFileScrty;
import egovframework.common.util.Pager;
import egovframework.common.util.StringUtil;

/**
 * 설 명 : 회원관리
 * 
 * @author 개발팀 Bang-ji-hwan
 * @since 2018. 7. 31.
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일        수정자              수정내용
 *  -------       --------    ---------------------------
 *  2018. 7. 31.     bjh                최초 생성
 *      </pre>
 */
@Controller
public class MemberController extends DefaultController {

	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "MemberService")
	private MemberService memberService;

	// 검색 파라미터
	private List<String> searchParam = Arrays.asList("pMENU_NO", "page", "pUserId", "pUserNm", "pAuth", "pUseAt");

	/**
	 * <pre>
	 * 1. 개요 : 회원 목록을 조회한다.
	 * 2. 처리내용 :
	 * </pre>
	 * 
	 * @Method Name : getMemberList
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/member")
	public ModelAndView getMemberList() throws Exception {

		/**************** 프로그램 로직 ****************/
		// 페이징 처리
		int totalCnt = memberService.getMemberCount(commandMap);
		int pageSize = 10;
		int page = StringUtil.toInt(commandMap.get("page"), 1);
		int startMemberRow = page * pageSize - pageSize + 1;
		Pager pager = new Pager(page, totalCnt, pageSize);
		commandMap.put("startRow", startMemberRow);
		commandMap.put("endRow", startMemberRow + pageSize - 1);
		List<Map<String, Object>> list = memberService.getMemberList(commandMap);
		// 파라미터 정보
		String parameters = getRequestToQueryString(searchParam);
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));

		// 권한 코드
		List<Map<String, Object>> perList = getComCodeList("50");
		// 회원구분
		List<Map<String, Object>> mGuList = getComCodeList("53");

		// 엑셀다운로드
		if (StringUtil.noNull(commandMap.get("EXCEL_YN")).equals("Y")) {
			Map<String, Object> excel = new HashMap<String, Object>();
			excel.put("list", list);
			writeExcel("/excel/list/getMemberList.xlsx", excel, "회원 목록_" + EgovDateUtil.getCurrentDate("yyyyMMdd") + ".xlsx");
			return null;
		}
		/**************** 프로그램 로직 ****************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "cms/member/memberList";
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("list", list);
		mav.addObject("parameters", parameters);
		mav.addObject("pager", pager);
		mav.addObject("perList", perList);
		mav.addObject("mGuList", mGuList);
		mav.addObject("resultMessage", resultMessage);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/

		return mav;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 회원정보 관리 등록 및 수정 폼 조회
	 * 2. 처리내용 : 회원정보 관리 등록 및 수정 폼 조회
	 * </pre>
	 * @Method Name : memberForm
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/member/form")
	public ModelAndView memberForm() throws Exception {
		/**************** 프로그램 로직 ****************/

		// 회원구분
		List<Map<String, Object>> mGuList = getComCodeList("53");
		
		// 핸드폰번호 앞자리
		List<Map<String, Object>> phoneCode = getComCodeList("6");
		// 전화번호 앞자리
		List<Map<String, Object>> telCode = getComCodeList("5");
		// 이메일 형식
		List<Map<String, Object>> mailCode = getComCodeList("7");
		String pDay = EgovDateUtil.formatDate(EgovDateUtil.getToday(), "-");
		String yyyy = pDay.substring(0, 4);

		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));

		Map<String, Object> member = memberService.getMember(commandMap);

		String mode = StringUtil.isBlank(member) ? MODE_WRITE : MODE_MODIFY; // 쓰기/수정
		// 파라미터 정보
		String parameters = getRequestToQueryString(searchParam);
		/**************** 프로그램 로직 ****************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "";

		if (mode.equals(MODE_WRITE)) {
			resultURL = "cms/member/memberWriteForm";
		} else {
			resultURL = "cms/member/memberModifyForm";
		}
		mav.addObject("member", member);
		mav.addObject("parameters", parameters);
		mav.addObject("mode", mode);
		mav.addObject("mGuList", mGuList);
		mav.addObject("telCode", telCode);
		mav.addObject("phoneCode", phoneCode);
		mav.addObject("mailCode", mailCode);
		mav.addObject("yyyy", yyyy);
		mav.addObject("resultMessage", resultMessage);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

	/**
	 * <pre>
	 * 1. 개요 : 회원정보 관리 CUD 처리
	 * 2. 처리내용 : 회원정보 관리 CUD 처리
	 * </pre>
	 * @Method Name : memberCUD
	 * @return
	 * @throws Exception
	 * @throws NoSuchAlgorithmException
	 */
	@RequestMapping(value = "/cms/member/cud", method = RequestMethod.POST)
	public ModelAndView memberCUD() throws Exception, NoSuchAlgorithmException {
		/**************** 프로그램 로직 ****************/
		// 파라미터 정보
		String parameters = getRequestToQueryString(searchParam);
		String resultURL = "redirect:/cms/member/" + parameters;
		String mode = StringUtil.noNull(commandMap.get("mode"));

		String userId = StringUtil.noNull(commandMap.get("USER_ID"));
		String passwd = StringUtil.noNull(commandMap.get("PASSWORD"));
		String encPasswd = EgovFileScrty.encryptPassword(passwd, userId);
		if (!passwd.equals(""))
			commandMap.put("PASSWORD", encPasswd);
		if (mode.equals(MODE_WRITE)) {
			memberService.insertMember(commandMap);
		} else if (mode.equals(MODE_MODIFY)) {
			memberService.updateMember(commandMap);
			resultURL = "redirect:/cms/member/form" + parameters + "&user_id=" + commandMap.get("USER_ID");
		} else if (mode.equals(MODE_DELETE)) {

		} else if (mode.equals(MODE_APPLOVE)) {
			String[] users = request.getParameterValues("chkbox");
			for (int i = 0; i < users.length; i++) {
				if (users[i] != null) {
					commandMap.put("USER_ID", users[i]);
					memberService.userStatChg(commandMap);
				}
			}
		}

		Map<String, Object> flashMap = new HashMap<String, Object>();
		flashMap.put("msg", setMessage(mode));
		setFlashMap(flashMap, request);

		/**************** 프로그램 로직 ****************/

		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

	
	
	/**
	 * <pre>
	 * 1. 개요 : 비밀번호 변경 처리
	 * 2. 처리내용 : 비밀번호 변경 처리
	 * </pre>
	 * @Method Name : passwdChg
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/member/passwdChg")
	@ResponseBody
	public Map<String, Object> passwdChg() throws Exception {

		Map<String, Object> member = memberService.getMember(commandMap);
		
		// ID
		String userId = StringUtil.noNull(commandMap.get("user_id"));
		
		// 예전비밀번호
		String encOldPasswd = EgovFileScrty.encryptPassword(StringUtil.noNull(commandMap.get("oldPwd")), userId);
		
		// 신규 비밀번호
		String encNewPasswd = EgovFileScrty.encryptPassword(StringUtil.noNull(commandMap.get("pwd")), userId);
		
		int resultCode = 0; // Success
		String resultMsg = "";
		if (!StringUtil.noNull(member.get("PASSWORD")).equals(encOldPasswd)) {
			resultCode = 2; //Pwd Fail
			resultMsg = "기존 비밀번호가 맞지 않습니다.";
		} else if (StringUtil.noNull(member.get("PASSWORD")).equals(encNewPasswd)) {
			resultCode = 3; //Same Pwd 
			resultMsg = "현재 비밀번호와 일치 합니다.";
		} else {

			try {
				commandMap.put("pwd", encNewPasswd);
				memberService.passwdChg(commandMap);
				if (resultMsg.equals("")) {
					resultMsg = "변경에 성공하였습니다.";
				}
			} catch (SQLException e) {
				resultCode = 1; // Fail
				if (resultMsg.equals("")) {
					resultMsg = "변경에 실패하였습니다.";
				}
			}
		}

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("resultMsg", resultMsg);
		result.put("resultCode", resultCode);

		return result;
	}

	/**
	 * <pre>
	 * 1. 개요 : 비밀번호 초기화 
	 * 2. 처리내용 :  sgis12!!!
	 * </pre>
	 * @Method Name : passwdInit
	 * @return
	 * @throws Exception
	 * @throws NoSuchAlgorithmException
	 */
	@RequestMapping(value = "/cms/member/passwdInit")
	@ResponseBody
	public Map<String, Object> passwdInit() throws Exception, NoSuchAlgorithmException {

		int resultCode = 0; // Success
		String resultMsg = "";
		try {
			String userId = StringUtil.noNull(commandMap.get("user_id"));
			String passwd = "11";
			String encPasswd = EgovFileScrty.encryptPassword(passwd, userId);
			commandMap.put("encPasswd", encPasswd);
			memberService.passwdInit(commandMap);
			if (resultMsg.equals("")) {
				resultMsg = "비밀번호가 초기화 되었습니다.";
			}
		} catch (SQLException e) {
			resultCode = 1; // Fail
			if (resultMsg.equals("")) {
				resultMsg = "비밀번호 초기화 실패하였습니다.";
			}
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("resultMsg", resultMsg);
		result.put("resultCode", resultCode);

		return result;
	}

	/**
	 * <pre>
	 * 1. 개요 : 아이디 중복체크
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : idDupCk
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/member/idDupCk")
	@ResponseBody
	public Map<String, Object> idDupCk() throws Exception {

		int resultInt = 0; // Success
		resultInt = memberService.getIdDupCk(commandMap);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("resultInt", resultInt);
		return result;
	}

	
	/**
	 * <pre>
	 * 1. 개요 :  비밀번호 변경 팝업 화면 이동
	 * 2. 처리내용 :비밀번호 변경 팝업 화면 이동
	 * </pre>
	 * @Method Name : pwdChgPopup
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/member/pwdChgPopup")
	public ModelAndView pwdChgPopup() throws Exception {

		/************** 프로그램 로직 **************/
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String resultURL = "/cms/member/pwdChgPopup";
		
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}
	
	// 사원 리스트
	@RequestMapping(value = "/cms/hitecm")
	public ModelAndView vacationList() throws Exception {
		/************** 프로그램 로직 **************/
		/************** 프로그램 로직 **************/
		/************** ModelView 로직 **************/
		// return Model 정보 생성
		ModelAndView mav = new ModelAndView();
		String parameters = getRequestToQueryString(searchParam);
		String resultURL = "cms/member/hmember";
		mav.setViewName(resultURL);
		mav.addObject("parameters",parameters);
		/************** ModelView 로직 **************/
		return mav;
	}
	@RequestMapping(value = "/cms/hitecm/listAjax")
	public ModelAndView vacationListAjax() throws Exception {
		ModelAndView mav = new ModelAndView();

		/************** 프로그램 로직 **************/
		int totalCnt = memberService.getMemberCount(commandMap);
		int pageSize = 10;
		int page = StringUtil.toInt(commandMap.get("page"), 1);
		int startRow = page * pageSize - pageSize + 1;
		Pager pager = new Pager(page, totalCnt, pageSize);
		commandMap.put("startRow", startRow);
		commandMap.put("endRow", startRow + pageSize - 1);
		
		List<Map<String, Object>> bannerList = memberService.getMemberList(commandMap);
		String parameters = getRequestToQueryString(searchParam);
		/* flahMap 사용 */
		Map<String, Object> flashMap = new HashMap<String, Object>();
		getFlashMap(flashMap, request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		/************** 프로그램 로직 **************/

		/************** ModelView 로직 **************/
		String resultURL = "/cms/member/hmemberListTable";
		mav.addObject("list", bannerList);
		mav.addObject("pager", pager);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("parameters", parameters);
		mav.addObject("resultMessage", resultMessage);
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/

		return mav;
	}
	
}
