package egovframework.cms.sign.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("ExpenseService")
public class ExpenseServiceImpl extends EgovAbstractServiceImpl implements ExpenseService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "expMapper.";

	@Override
	public int getListCount(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "getListCount");
		int result = commonMapper.getCount(param);
		return result;
	}
	@Override
	public List<Map<String, Object>> getList(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "getList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	@Override
	public HashMap<String, Object> getMember(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "getMember");
		HashMap<String, Object> result = (HashMap<String, Object>) commonMapper.get(param);
		return result;
	}
	@Override
	public int insert(Map<String, Object> param , HttpServletRequest request) throws Exception{
		param.put("mId", namespace + "insert");
		int result = (Integer) commonMapper.insert(param);

		insertLine(param , request);
		insertExpenseList(param , request);
		
		return result;
	}
	
	@Override
	public int insertExpenseList(Map<String, Object> param , HttpServletRequest request) throws Exception{

		String[] COAST = request.getParameterValues("COAST");
		String[] COASTNM = request.getParameterValues("COASTNM");
		param.put("mId", namespace + "insertExpenseList");
		for (int i = 0; i < COASTNM.length; i++) {
			if (COASTNM[i] != null) {
				param.put("EXPENSE_LIST_ID","EXPL"+(i+1) );
				param.put("COASTNM", COASTNM[i]);
				param.put("COAST", COAST[i]);
				commonMapper.insert(param);
			}
		}
		return 0 ;
	}
	@Override
	public int insertLine(Map<String, Object> param, HttpServletRequest request) throws Exception{
		String[] lineId = request.getParameterValues("lineId");
		param.put("mId", namespace + "insertLine");
		for (int i = 0; i < lineId.length; i++) {
			if (lineId[i] != null) {
				
				param.put("SIGN_ORDER", (i+1));
				param.put("LINE_ID", lineId[i]);
				commonMapper.insert(param);
			}
		}
		return 0;
	}
	@Override
	public List<Map<String, Object>> getExpenseList(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "getExpenseList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	@Override
	public List<Map<String, Object>> getMemberList(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "getMemberList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	@Override
	public HashMap<String, Object> getSignCheck(Map<String, Object> param)  throws Exception{
		param.put("mId", namespace + "getSignCheck");
		HashMap<String, Object> result = (HashMap<String, Object>) commonMapper.get(param);
		return result;
	}
	@Override
	public List<Map<String, Object>> getSignLineList(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "getSignLineList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	@Override
	public int update(Map<String, Object> param , HttpServletRequest request) throws Exception{
		param.put("mId", namespace + "update");
		int result = (Integer) commonMapper.update(param);
		
		deleteLine(param);
		insertLine(param , request);
		deleteExpenseList(param);
		insertExpenseList(param , request);
		return result;
	}
	@Override
	public int deleteExpenseList(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "deleteExpenseList");
		int result = (Integer) commonMapper.delete(param);
		return result;
	}
	@Override
	public int deleteLine(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "deleteLine");
		int result = (Integer) commonMapper.delete(param);
		return result;
	}
	@Override
	public int deleteVac(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "deleteVac");
		int result = (Integer) commonMapper.delete(param);
		deleteLine(param);
		return result;
	}
	@Override
	public int sign(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "sign");
		int result = (Integer) commonMapper.update(param);
		
		return result;
	}
	
	
	

}
