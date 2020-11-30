package egovframework.cms.stat.service;

import java.util.List;
import java.util.Map;

public interface StatService {
	
	/**
	 * 접속 통계
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getAccessStatList(Map<String, Object> param) throws Exception;
	
	/**
	 * 메뉴 접속 통계
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getAccessMenuStatList(Map<String, Object> param) throws Exception;
	
	
	
	
}
