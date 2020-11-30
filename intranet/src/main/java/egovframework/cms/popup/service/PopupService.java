package egovframework.cms.popup.service;

import java.util.List;
import java.util.Map;

public interface PopupService {

	/**
	 * 팝업 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getPopupList(Map<String, Object> param) throws Exception;

	/**
	 * 팝업 등록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer insertPopup(Map<String, Object> param) throws Exception;

	/**
	 * 팝업 상세보기
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getPopup(Map<String, Object> param) throws Exception;

	/**
	 * 팝업 카운트
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int getPopupCount(Map<String, Object> param) throws Exception;

	/**
	 * 팝업 수정
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updatePopup(Map<String, Object> param) throws Exception;

	/**
	 * 팝업 삭제
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int deletePopup(Map<String, Object> param) throws Exception;

	/**
	 * 메인 팝업 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> mainPopupList(Map<String, Object> param) throws Exception;

}
