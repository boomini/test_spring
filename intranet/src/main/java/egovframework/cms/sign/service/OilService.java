package egovframework.cms.sign.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface OilService {

	public int getListCount(Map<String, Object> param) throws Exception;
	
	public List<Map<String, Object>> getList(Map<String, Object> param) throws Exception;
	
	
	public HashMap<String, Object> getMember(Map<String, Object> param)  throws Exception;

	
	public List<Map<String, Object>> getMemberList(Map<String, Object> param) throws Exception;
	
	
	public HashMap<String, Object> getOil(Map<String, Object> param)  throws Exception;
	public List<Map<String, Object>> getSignLineList(Map<String, Object> param) throws Exception;
	public List<Map<String, Object>> getOilList(Map<String, Object> param) throws Exception;

	
	public int insert(Map<String, Object> param,HttpServletRequest request) throws Exception;
	public int insertLine(Map<String, Object> param, HttpServletRequest request) throws Exception;
	public int insertList(Map<String, Object> param , HttpServletRequest request) throws Exception;
	public int update(Map<String, Object> param,HttpServletRequest request) throws Exception;
	public HashMap<String, Object> getTot(Map<String, Object> param)  throws Exception;
	public int deleteLine(Map<String, Object> param) throws Exception;
	public int deleteList(Map<String, Object> param) throws Exception;
	
	public int deleteVac(Map<String, Object> param) throws Exception;
	public int sign(Map<String, Object> param) throws Exception;
	
	
}
