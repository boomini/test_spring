package egovframework.cms.sign.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface DocService {

	public int getListCount(Map<String, Object> param) throws Exception;
	
	public List<Map<String, Object>> getList(Map<String, Object> param) throws Exception;
}
