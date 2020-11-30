package egovframework.cms.code.service;

import java.util.List;
import java.util.Map;

public interface CodeService {

	/**
	 * 코드 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getCodeList(Map<String, Object> param) throws Exception;

	/**
	 * 공통 코드 사용
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getCodeUtil(Map<String, Object> param) throws Exception;

	/**
	 * 코드 상세조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getCode(Map<String, Object> param) throws Exception;

	/**
	 * 코드 등록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer insertCode(Map<String, Object> param) throws Exception;

	/**
	 * 코드 수정
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updateCode(Map<String, Object> param) throws Exception;

	/**
	 * 코드 삭제
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int deleteCode(Map<String, Object> param) throws Exception;

	/**
	 * 코드 경로
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getLocation(Map<String, Object> param) throws Exception;
}
