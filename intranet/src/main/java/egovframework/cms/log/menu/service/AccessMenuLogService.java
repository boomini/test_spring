package egovframework.cms.log.menu.service;

import java.util.List;
import java.util.Map;

public interface AccessMenuLogService {
	
	/**
	 * Access 로그 등록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer insertAccessMenuLog(Map<String, Object> param) throws Exception;
	/**
	 * Access 로그 전체 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getAccessMenuLogList(Map<String, Object> param) throws Exception;
	/**
	 * Access 로그 카운팅
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int getAccessMenuLogCount(Map<String, Object> param) throws Exception;
}
