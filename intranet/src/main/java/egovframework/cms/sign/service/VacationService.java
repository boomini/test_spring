package egovframework.cms.sign.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface VacationService {

	
	public List<Map<String, Object>> getVacList(Map<String, Object> param) throws Exception;
	
	public int getVacCount(Map<String, Object> param) throws Exception;
	
	public HashMap<String, Object> getMember(Map<String, Object> param)  throws Exception;

	public int insertVac(Map<String, Object> param,HttpServletRequest request) throws Exception;
	
	public List<Map<String, Object>> getMemberList(Map<String, Object> param) throws Exception;
	
	public int insertVacLine(Map<String, Object> param) throws Exception;
	
	public HashMap<String, Object> getSignCheck(Map<String, Object> param)  throws Exception;
	public List<Map<String, Object>> getSignLineList(Map<String, Object> param) throws Exception;
	public int updateVac(Map<String, Object> param,HttpServletRequest request) throws Exception;
	public int deleteLine(Map<String, Object> param) throws Exception;
	public int deleteVac(Map<String, Object> param) throws Exception;
	public int signVac(Map<String, Object> param) throws Exception;
	
	
}
