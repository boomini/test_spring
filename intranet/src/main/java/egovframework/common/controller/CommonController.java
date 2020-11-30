package egovframework.common.controller;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.util.WebUtils;

import egovframework.cms.code.service.CodeService;
import egovframework.cms.member.MemberVo;
import egovframework.common.helper.EgovHttpRequestHelper;
import egovframework.common.util.EgovMessageSource;
import egovframework.common.util.EgovWebUtil;
import egovframework.common.util.StringUtil;
import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;

/**
 * 설 명 :  공통 컨트롤러
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
public class CommonController implements ControllerConstants {

	static Logger logger = Logger.getLogger(CommonController.class);

	@Resource(name = "CodeService")
	protected CodeService codeService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	protected EgovMessageSource egovMessageSource;

	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected Map<String, Object> commandMap;
	
	/**
	 * <pre>
	 * 1. 개요 : 에러 처리 데이터모델 생성
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : getErrorModel
	 * @param errorType - 메시지유형[참조: 메시지처리 구분코드]
	 * @param errorMessage - 메시지메세지[메시지유형이 Script 처리일 경우는 Script값]
	 * @param redirectUrl - 페이지이동주소
	 * @return ModelAndView
	 * @throws Exception
	 */
	protected final ModelAndView getErrorModel(String errorType, String errorMessage, String redirectUrl){

		ModelAndView model = new ModelAndView(ERROR_HANDLER_PATH);
		model.addObject("ERROR_TYPE", errorType);
		if (ERROR_SCRIPT_ONLY.equals(errorType)) {
			model.addObject("SCRIPT", errorMessage);
		} else {
			model.addObject("ERROR_MESSAGE", errorMessage);
			model.addObject("REDIRECT_URL", redirectUrl);
		}
		return model;
	}

	/**
	 * <pre>
	 * 1. 개요 : 메시지처리 데이터모델 생성
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : getErrorModel
	 * @param errorType - 메시지유형[참조: 메시지처리 구분코드]
	 * @return ModelAndView
	 * @throws Exception
	 */
	protected final ModelAndView getErrorModel(String errorType) throws Exception {
		return getErrorModel(errorType, "", "");
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 메시지처리 데이터모델 생성
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : getErrorModel
	 * @param errorType - 메시지유형[참조: 메시지처리 구분코드]
	 * @param errorMessage - 메시지메세지[메시지유형이 Script 처리일 경우는 Script값]
	 * @return ModelAndView
	 * @throws Exception
	 */
	protected final ModelAndView getErrorModel(String errorType, String errorMessage){
		return getErrorModel(errorType, errorMessage, "");
	}

	public String getRequestToQueryString(List<String> input) {
		return toQueryString(getRequestToHashMap(input));
	}

	/**
	 * <pre>
	 * 1. 개요 :  get방식의 쿼리스트링으로 변경
	 * 2. 처리내용 : 맵의 빈문자열/널이 아닌 모든 값을 ?A=1234&B=5678 형식의 쿼리스트링으로 변경<br/> ,어레이 넘기지 말것 그런거 지원 안함.<br/>
	 * </pre>
	 * @Method Name : toQueryString
	 * @param input - 파싱할 맵t
	 * @return 파싱된 문자열(GET으로 보낼 QueryString)
	 */
	public String toQueryString(HashMap<String, Object> input) {
		String result = "";

		Set<String> set = input.keySet();
		Iterator<String> iter = set.iterator();

		while (iter.hasNext()) {
			String key = iter.next();
			// 배열인 경우 만들지 말자
			boolean listCk = input.get(key) instanceof String[];

			String value = StringUtil.noNull(input.get(key));

			if (!StringUtil.isBlank(value) && !listCk) {
				if (result.length() > 0)
					result += "&";

				try {
					String query = key + "=" + URLEncoder.encode(value, "UTF-8");
					result += query;
				} catch (UnsupportedEncodingException ex) {
					logger.error("UnsupportedEncodingException : ", ex);
				}
			}
		}
		// if( result.length() > 0 )
		result = "?" + result;

		return result;
	}

	/**
	 * <pre>
	 * 1. 개요 : hashMap 값 담기
	 * 2. 처리내용 : 모든 파라미터를 해시맵으로 리턴
	 * </pre>
	 * @Method Name : getRequestToHashMap
	 * @param columns
	 * @return
	 */
	public HashMap<String, Object> getRequestToHashMap(List<String> columns) {

		// 실제 존재?하는 컬럼만 파라미터로 넘기기 위해..
		boolean hasColumns = false;
		if (columns != null && columns.size() > 0)
			hasColumns = true;

		Enumeration<String> enums = request.getParameterNames();

		HashMap<String, Object> model = new HashMap<String, Object>();

		while (enums.hasMoreElements()) {
			String name = enums.nextElement();

			boolean addToModel = false;
			// 컬럼이 정의된 경우 선택적으로(정의되어 있는 파라미터) model 에 추가
			if (hasColumns) {
				// 효과적으로 체크할 방법 결정하고, 우선 루프
				for (int i = 0; i < columns.size(); i++) {
					if (name.equals(columns.get(i))) {
						addToModel = true;
						break;
					}
				}
			} else {
				addToModel = true;
			}

			// 파라미터를 모델에 추가
			if (addToModel) {
				String[] values = request.getParameterValues(name);

				if (values.length == 1) {
					model.put(name, request.getParameter(name));
				} else {
					model.put(name, values);
				}
			}
		}

		return model;
	}

	/**
	 * <pre>
	 * 1. 개요 : Command Parameter 모두를 출력한다.
	 * 2. 처리내용 : Command Parameter 모두를 출력한다.
	 * </pre>
	 * @Method Name : printCommandMap
	 */
	public void printCommandMap() {

		Iterator iterator = commandMap.entrySet().iterator();
		while (iterator.hasNext()) {
			Entry entry = (Entry) iterator.next();
			logger.info("paramName : [" + entry.getKey() + "], paramValue : [" + entry.getValue() + "]");
		}

		return;
	}

	/**
	 * parameter 들을 Model에 값 입력 처리
	 * @param paramNames
	 */
	public void setQueryValues(List<String> columns) {
		String s = null;
		for (int i = 0; i < columns.size(); i++) {
			s = request.getParameter(columns.get(i));
			if (s != null && !"".equals(s.trim())) {
				request.setAttribute(columns.get(i), s);
			}
		}
	}

	/**
	 * 인증된 사용자객체를 VO형식으로 가져온다.
	 * @return Object - 사용자 ValueObject
	 */
	public Object getAuthenticatedUser() {
		return (MemberVo) RequestContextHolder.getRequestAttributes().getAttribute(SESSION_KEY_USER, RequestAttributes.SCOPE_SESSION);

	}

	/**
	 * 인증된 사용자 여부를 체크한다.
	 * @return Boolean - 인증된 사용자 여부(TRUE / FALSE)
	 */
	public Boolean isAuthUserChecked() {

		if (StringUtil.isBlank((MemberVo) RequestContextHolder.getRequestAttributes().getAttribute(SESSION_KEY_USER, RequestAttributes.SCOPE_SESSION))) {
			return Boolean.FALSE;
		}
		return Boolean.TRUE;
	}

	/**
	 * <pre>
	 * 개요 : 인증된 사용자 시도코드
	 * </pre>
	 * @Method Name : getSidoCode
	 * @return
	 */
	public String getSidoCode() {
		MemberVo av = (MemberVo) getAuthenticatedUser();
		return StringUtil.noNull(av.getSido_code());
	}
	/**
	 * <pre>
	 * 개요 : 인증된 사용자 청 코드
	 * </pre>
	 * @Method Name : getSidoCode
	 * @return
	 */
	public String getRiverCode() {
		MemberVo av = (MemberVo) getAuthenticatedUser();
		return StringUtil.noNull(av.getRiver_code());
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 관리자 여부 체크
	 * 2. 처리내용 : 관리자 여부 체크
	 * </pre> 
	 * @Method Name : isAdminCheck
	 * @return
	 */
	public Boolean isAdminCheck() {

		MemberVo mv = (MemberVo) RequestContextHolder.getRequestAttributes().getAttribute(SESSION_KEY_USER, RequestAttributes.SCOPE_SESSION);
		if (mv != null) {
			return mv.getIsAdmin();
		}
		return Boolean.FALSE;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 인증된 사용자 정보 Map에 세팅
	 * 2. 처리내용 : 인증된 사용자 정보 Map에 세팅
	 * </pre>
	 * @Method Name : getAuthUserInfo
	 * @return
	 */
	public Map<String, Object> getAuthUserInfo() {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		MemberVo av = (MemberVo) getAuthenticatedUser();
		if (av != null) {
			returnMap.put("gUserId", av.getUser_id());//아이디
			returnMap.put("gUserIp", EgovHttpRequestHelper.getRequestIp());//아이피
		}
		return returnMap;
	}
	
	
	/**
	 * <pre>
	 * 1. 개요 : 엑셀 저장
	 * 2. 처리내용 : 데이터를 엑셀로 변환한다.
	 * 3. 사용방법: writeExcel(템플릿파일명, beanParam, 다운로드될파일명,request,response); 템플릿파일명 -
	 * 다운로드될 양식으로 /webapp/excel/업무/ 폴더에 업로드. beanParam - 템플릿에 적용될 데이타가 담긴 bean.
	 * 다운로드될파일명 - 다운로드창에 나오는 파일명 request - 템플릿의 절대 패쓰를 얻기 위해 사용 response - 파일을
	 * 보내주기 위해 사용 
	 * </pre>
	 * @Method Name : writeExcel
	 * @param templateURL
	 * @param beanParams
	 * @param downloadFileName
	 * @throws Exception
	 */
	public void writeExcel(String templateURL, Map beanParams, String downloadFileName) throws Exception {

		XLSTransformer transformer = new XLSTransformer();
		InputStream is = null;
		try {
			is = new BufferedInputStream(new FileInputStream(WebUtils.getRealPath(request.getSession().getServletContext(), templateURL)));
			Workbook workbook;
			try {
				response.setHeader("Set-Cookie", "fileDownload=true; path=/");
				workbook = transformer.transformXLS(is, beanParams);
				EgovWebUtil.setDisposition(downloadFileName, request, response);
				response.setHeader("Content-Transfer-Encoding", "binary");
				response.setContentType("application/x-msexcel");
				workbook.write(response.getOutputStream());
			} catch (FileNotFoundException e) {
				logger.error("FileNotFoundException : ", e);
			} catch (ParsePropertyException e) {
				logger.error("ParsePropertyException : ", e);
			} catch (InvalidFormatException e) {
				logger.error("InvalidFormatException : ", e);
			}
			if (is != null)
				is.close();
		} catch (IOException e) {
			logger.error("IOException : ", e);
		} finally {
			if (is != null)
				is.close();
		}
	}

	/**
	 * <pre>
	 * 1. 개요 : 공통 코드 가져오기
	 * 2. 처리내용 : 공통 코드 가져오기
	 * </pre>
	 * @Method Name : getComCodeList
	 * @param ucn
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getComCodeList(String ucn) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("upperCodeNo", ucn);
		List<Map<String, Object>> resultList = codeService.getCodeUtil(param);
		return resultList;
	}

	/**
	 * <pre>
	 * 1. 개요 : flshMap 값 리턴
	 * 2. 처리내용 : 저장, 수정, 삭제시 redirect:/ 를 이용해서 페이지를 이동시 함께 보내져야 할 parameter 들을 hidden 속성으로 보내면 , 해당 페이지에서 아래 함수를 호출하면
	 * 숨겨진 파라미터의 값을 꺼내올수 있습니다.
	 * redirect 를 보내기전에 해당 값들을 hidden 속성으로 보낼경우에는 일반적인 방법과 동일하게 cMap 에 추가 한뒤에 아래와 같이 flashMap 에 cMap 의 값을 복사하면 됩니다
	 * setFlashMap(cMap, request)
	 * 위와 같이 한 후에 redirect:/보내질주소경로 를 하면 아래 함수를 통해서 hidden 속성의 값을 가져올 수 있습니다.
	 * </pre>
	 * @Method Name : getFlashMap
	 * @param cMap
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	protected Map<String, Object> getFlashMap(Map<String, Object> cMap, HttpServletRequest request){
		Map<String, Object> flashMap = (Map<String, Object>) RequestContextUtils.getInputFlashMap(request);
		if (flashMap != null) {
			cMap.putAll(flashMap);
		}
		return cMap;
	}

	/**
	 * <pre>
	 * 1. 개요 : flashMap 값 세팅
	 * 2. 처리내용 : redirect 를 사용시 hidden 속성으로 파라미터를 전송하려고 할 경우 아래 함수를 호출
	 * </pre>
	 * @Method Name : setFlashMap
	 * @param cMap
	 * @param request
	 * @throws Exception
	 */
	protected void setFlashMap(Map<String, Object> cMap, HttpServletRequest request) throws Exception {
		FlashMap flashMap = RequestContextUtils.getOutputFlashMap(request);
		flashMap.putAll(cMap);
	}

	/**
	 * <pre>
	 * 1. 개요 : CUD시 메서지 리턴
	 * 2. 처리내용 : CUD시 메서지 리턴
	 * </pre>
	 * @Method Name : setMessage
	 * @param mode - 처리 모드
	 * @return String
	 * @throws Exception
	 */
	protected String setMessage(String mode) throws Exception {
		String msg = "";
		if (mode.equals(MODE_WRITE)) {
			msg = egovMessageSource.getMessage("success.common.insert");
		} else if (mode.equals(MODE_MODIFY)) {
			msg = egovMessageSource.getMessage("success.common.update");
		} else if (mode.equals(MODE_DELETE)) {
			msg = egovMessageSource.getMessage("success.common.delete");
		} else if (mode.equals(MODE_APPLOVE)) {
			msg = egovMessageSource.getMessage("success.common.applove");
		} else {
			msg = egovMessageSource.getMessage("success.common.proc");
		}
		return msg;
	}
	

	
}
