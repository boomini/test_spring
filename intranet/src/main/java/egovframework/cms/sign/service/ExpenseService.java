package egovframework.cms.sign.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ExpenseService {

	public int getListCount(Map<String, Object> param) throws Exception;
	
	public List<Map<String, Object>> getList(Map<String, Object> param) throws Exception;
	
	
	public HashMap<String, Object> getMember(Map<String, Object> param)  throws Exception;

	
	public List<Map<String, Object>> getMemberList(Map<String, Object> param) throws Exception;
	
	
	public HashMap<String, Object> getSignCheck(Map<String, Object> param)  throws Exception;
	public List<Map<String, Object>> getSignLineList(Map<String, Object> param) throws Exception;
	public List<Map<String, Object>> getExpenseList(Map<String, Object> param) throws Exception;
	
	public int insert(Map<String, Object> param,HttpServletRequest request) throws Exception;
	public int insertLine(Map<String, Object> param, HttpServletRequest request) throws Exception;
	public int insertExpenseList(Map<String, Object> param , HttpServletRequest request) throws Exception;
	public int update(Map<String, Object> param,HttpServletRequest request) throws Exception;
	public int deleteLine(Map<String, Object> param) throws Exception;
	public int deleteExpenseList(Map<String, Object> param) throws Exception;
	
	public int deleteVac(Map<String, Object> param) throws Exception;
	public int sign(Map<String, Object> param) throws Exception;
	
	
}
