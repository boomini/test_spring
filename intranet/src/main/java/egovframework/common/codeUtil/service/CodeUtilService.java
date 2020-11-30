package egovframework.common.codeUtil.service;

import java.util.List;
import java.util.Map;

public interface CodeUtilService {
	
	
	/**
	 * <pre>
	 * 1. 개요 : 년도 콤보박스용 리스트를 출력
	 * 2. 처리내용 : 년도 콤보박스용 리스트를 출력
	 * </pre>
	 * @Method Name : getComboYear
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> getComboYear(Map<String, Object> param);
	
	/**
	 * <pre>
	 * 1. 개요 : 월 콤보박스용 리스트를 출력
	 * 2. 처리내용 : 월 콤보박스용 리스트를 출력
	 * </pre>
	 * @Method Name : getComboMonth
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> getComboMonth(Map<String, Object> param);

	/**
	 * 
	 * <pre>
	 * 1. 개요 : 프레임워크 공통 코드 조회
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : getComCodeList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getComCodeList(Map<String, Object> param) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. 개요 : 프레임워크 공통 코드 조회
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : getComCodeList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getComCodeList2(Map<String, Object> param) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. 개요 : 지하수 공통 코드
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : getTcCmmnCode
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getTcCmmnCode(Map<String, Object> param) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. 개요 : 지하수 업무분류 코드
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : getTcJobclCode
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getTcJobclCode(Map<String, Object> param) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. 개요 : 기관코드
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : getGigwanCode
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getGigwanCode(Map<String, Object> param) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. 개요 : 행정구역 코드
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : getSiDoCode
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getSiDoCode(Map<String, Object> param) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. 개요 : 일련번호 가져오기
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : getTcNumber
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getTcNumber(Map<String, Object> param) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. 개요 : 운영목적
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : getPurposeCode
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getPurposeCode(Map<String, Object> param) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. 개요 : 지목 코드
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : getJimokCode
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getJimokCode(Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 :  법정동 주소 조회 목록
	 * </pre>
	 * @Method Name : getAdmcodeList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getAdmcodeList( Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 법정동 주소 총 카운트
	 * </pre>
	 * @Method Name : getAdmcodeListCount
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int getAdmcodeListCount(Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 :  먹는물 코드 조회 리스트
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : getDwGigwanCodeList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getDwCodeList( Map<String, Object> param) throws Exception ;
	/**
	 * <pre>
	 * 1. 개요 :  입력기간 셋팅
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : getSettingIcpeiodCode
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getSettingIcpeiodCodeList( Map<String, Object> param) throws Exception ;

}
