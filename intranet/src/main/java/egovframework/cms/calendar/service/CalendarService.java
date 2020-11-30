package egovframework.cms.calendar.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface CalendarService {

	public List<Map<String, Object>> getList(Map<String, Object> param) throws Exception;
	public int insert(Map<String, Object> param) throws Exception;
	public int update(Map<String, Object> param) throws Exception;
	public int delete(Map<String, Object> param) throws Exception;
	public Map<String, Object> get(Map<String, Object> param) throws Exception;
}
