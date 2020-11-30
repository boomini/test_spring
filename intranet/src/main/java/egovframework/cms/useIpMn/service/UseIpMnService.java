package egovframework.cms.useIpMn.service;

import java.util.List;
import java.util.Map;

public interface UseIpMnService {

	/**
	 * 허용IP관리 목록
	 * 
	 * @param Map
	 * @exception Exception  
	 */
	public List<Map<String, Object>> getUseIpMnList(Map<String, Object> param) throws Exception;

	/**
	 * 허용IP관리 상세조회
	 * 
	 * @param Map
	 * @exception Exception 
	 */
	public Map<String, Object> getUseIpMn(Map<String, Object> param) throws Exception;

	/**
	 * 허용IP관리 등록
	 * 
	 * @param Map
	 * @exception Exception 
	 */
	public Integer insertUseIpMn(Map<String, Object> param) throws Exception;

	/**
	 * 허용IP관리 수정
	 * 
	 * @param Map
	 * @exception Exception 
	 */
	public int updateUseIpMn(Map<String, Object> param) throws Exception;

	/**
	 * 허용IP관리 삭제
	 * 
	 * @param Map
	 * @exception Exception 
	 */
	public int deleteUseIpMn(Map<String, Object> param) throws Exception;

}
