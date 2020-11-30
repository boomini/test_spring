package egovframework.cms.test.service;

import java.util.List;
import java.util.Map;

public interface TestService {

	public List<Map<String, Object>> getList(Map<String, Object> param) throws Exception ;
	public Map<String, Object> getResult(Map<String, Object> param) throws Exception ;
	
}
