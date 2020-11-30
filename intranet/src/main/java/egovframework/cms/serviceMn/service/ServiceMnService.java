package egovframework.cms.serviceMn.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ServiceMnService {
	
	/**
	 * <pre>
	 * 내용 :  측정망 입력항목 관리 설정 리스트
	 * </pre>
	 * @Method Name : mesureInputItemMnList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getMesureInputItemMnList( Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 :  측정망 등록항목 리스트
	 * </pre>
	 * @Method Name : mesureInputItemMnList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getMainMesureInputItemMnList( Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 측정망 항목 저장
	 * </pre>
	 * @Method Name : saveMainMesureInputItem
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void saveMainMesureInputItem(HttpServletRequest request, Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 :  측정항목 조회 목록
	 * </pre>
	 * @Method Name : getMesureItemList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getMesureItemList( Map<String, Object> param) throws Exception ;
	
	/**
	 * <pre>
	 * 내용 : 측정항목 조회 총 카운트
	 * </pre>
	 * @Method Name : getMesureItemCount
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int getMesureItemCount(Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 측정항목 등록
	 * </pre>
	 * @Method Name : insertmesureItem
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer insertmesureItem(Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 측정항목간 수정
	 * </pre>
	 * @Method Name : updatemesureItem
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updatemesureItem(Map<String, Object> param) throws Exception;

	/**
	 * <pre>
	 * 내용 : 측정항목 삭제
	 * </pre>
	 * @Method Name : deleteMesureInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int deletemesureItem(Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 측정망 입력기간 설정
	 * </pre>
	 * @Method Name : getMesureInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getMesureInputTmMnList(Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 측정망 입력기간 상세조회
	 * </pre>
	 * @Method Name : getMesureInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getMesureInputTmMn(Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 측정망 입력기간 등록
	 * </pre>
	 * @Method Name : insertMesureInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer insertMesureInputTmMn(Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 측정망 입력기간 수정
	 * </pre>
	 * @Method Name : updateMesureInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updateMesureInputTmMn(Map<String, Object> param) throws Exception;

	/**
	 * <pre>
	 * 내용 : 측정망 입력기간 삭제
	 * </pre>
	 * @Method Name : deleteMesureInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int deleteMesureInputTmMn(Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 :  지하수 측정망 조사지점 리스트 리스트
	 * </pre>
	 * @Method Name : getWaterSpotCrList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getWaterSpotCrList( Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 지하수 측정망 조사지점 생성
	 * </pre>
	 * @Method Name : insertWaterSpotCr
	 * @return
	 */
	public Integer insertWaterSpotCr(HttpServletRequest request, Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 :  토양 측정망 조사지점 리스트
	 * </pre>
	 * @Method Name : getSoilSpotCrList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getSoilSpotCrList( Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 토양 측정망 조사지점 생성
	 * </pre>
	 * @Method Name : insertSoilSpotCr
	 * @return
	 */
	public Integer insertSoilSpotCr(HttpServletRequest request, Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 골프장 농약관리 총 카운트
	 * </pre>
	 * @Method Name : golfCropMnCount
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int golfCropMnCount(Map<String, Object> param) throws Exception;

	/**
	 * <pre>
	 * 내용 :  골프장 농약관리 목록
	 * </pre>
	 * @Method Name : golfCropMnList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> golfCropMnList( Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 골프장 농약관리 상세보기
	 * </pre>
	 * @Method Name : getGolfCropMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getGolfCropMn(Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 골프장 농약관리 등록
	 * </pre>
	 * @Method Name : insertGolfCropMn
	 * @return
	 */
	public Integer insertGolfCropMn(HttpServletRequest request, Map<String, Object> param) throws Exception;

	/**
	 * <pre>
	 * 내용 : 골프장 농약관리 수정
	 * </pre>
	 * @Method Name : updateGolfCropMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updateGolfCropMn(HttpServletRequest request, Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 골프장 농약관리 삭제
	 * </pre>
	 * @Method Name : deleteGolfCropMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int deleteGolfCropMn(Map<String, Object> param) throws Exception;

	/**
	 * <pre>
	 * 내용 : 골프장 농약관리 사용유무 변경
	 * </pre>
	 * @Method Name : updateGolfCropUseYnMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updateGolfCropUseYnMn(Map<String, Object> param) throws Exception;

	/**
	 * <pre>
	 * 내용 :  성분조회 목록
	 * </pre>
	 * @Method Name : cropIngredientList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> cropIngredientList( Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 :  주성분 목록
	 * </pre>
	 * @Method Name : cropMainIngredientList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> cropMainIngredientList( Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 성분조회 총 카운트
	 * </pre>
	 * @Method Name : cropIngredientCount
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int cropIngredientCount(Map<String, Object> param) throws Exception;
	
	
	/**
	 * <pre>
	 * 내용 : 골프장 입력기한 총 카운트
	 * </pre>
	 * @Method Name : getGolfInputTmMnCount
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int getGolfInputTmMnCount(Map<String, Object> param) throws Exception;

	/**
	 * <pre>
	 * 내용 :  골프장 입력기한 목록
	 * </pre>
	 * @Method Name : getGolfInputTmMnList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getGolfInputTmMnList( Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 골프장 입력기한 상세보기
	 * </pre>
	 * @Method Name : getGolfInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getGolfInputTmMn(Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 골프장 입력기한 등록
	 * </pre>
	 * @Method Name : insertGolfInputTmMn
	 * @return
	 */
	public Integer insertGolfInputTmMn(Map<String, Object> param) throws Exception;

	/**
	 * <pre>
	 * 내용 : 골프장 입력기한 수정
	 * </pre>
	 * @Method Name : updateGolfInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updateGolfInputTmMn(Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 : 골프장 입력기한 삭제
	 * </pre>
	 * @Method Name : deleteGolfInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int deleteGolfInputTmMn(Map<String, Object> param) throws Exception;
	
	/**
	 * <pre>
	 * 내용 :  골프장 입력기한 년도 콤보박스용
	 * </pre>
	 * @Method Name : getGolfInputTmMnCombo
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getGolfInputTmMnCombo( Map<String, Object> param) throws Exception;
}
