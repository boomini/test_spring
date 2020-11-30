package egovframework.cms.sign.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.common.util.StringUtil;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("BiztripService")
public class BiztripServiceImpl extends EgovAbstractServiceImpl implements BiztripService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "biztripMapper.";
	
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
		
		return result;
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
	public List<Map<String, Object>> getMemberList(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "getMemberList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	@Override
	public HashMap<String, Object> getData(Map<String, Object> param)  throws Exception{
		param.put("mId", namespace + "getData");
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
