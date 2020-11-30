package egovframework.cms.contents.service;

import java.util.Map;

public interface ContentsService {

	/**
	 * 컨텐츠 관리 상세 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getContents(Map<String, Object> param) throws Exception;

	/**
	 * 컨텐츠 관리 등록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer insertContents(Map<String, Object> param) throws Exception;

	/**
	 * 컨텐츠 관리 수정
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updateContents(Map<String, Object> param) throws Exception;

	/**
	 * 컨텐츠 관리 삭제
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int deleteContents(Map<String, Object> param) throws Exception;
}
