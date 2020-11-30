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

@Service("OilService")
public class OilServiceImpl extends EgovAbstractServiceImpl implements OilService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "oilMapper.";
	
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
		insertList(param , request);
		
		return result;
	}
	@Override
	public int insertList(Map<String, Object> param , HttpServletRequest request) throws Exception{

		String[] D_DT = request.getParameterValues("D_DT");
		String[] D_FROM = request.getParameterValues("D_FROM");
		String[] D_TO = request.getParameterValues("D_TO");
		String[] D_MID = request.getParameterValues("D_MID");
		String[] DISTANCE = request.getParameterValues("DISTANCE");
		String[] COST = request.getParameterValues("COST");
		String[] PARK_C = request.getParameterValues("PARK_C");
		
		param.put("mId", namespace + "insertList");
		for (int i = 0; i < D_DT.length; i++) {
				param.put("OIL_D_ID","OILL"+(i+1) );
				param.put("D_DT", StringUtil.noNull(D_DT[i]) );
				param.put("D_FROM", StringUtil.noNull(D_FROM[i]) );
				param.put("D_TO", StringUtil.noNull(D_TO[i]) );
				param.put("D_MID", StringUtil.noNull(D_MID[i]) );
				param.put("DISTANCE", StringUtil.noNull(DISTANCE[i]) );
				param.put("COST", StringUtil.noNull(COST[i]) );
				param.put("PARK_C", StringUtil.noNull(PARK_C[i]) );
				commonMapper.insert(param);
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
	public List<Map<String, Object>> getOilList(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "getOilList");
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
	public HashMap<String, Object> getOil(Map<String, Object> param)  throws Exception{
		param.put("mId", namespace + "getOil");
		HashMap<String, Object> result = (HashMap<String, Object>) commonMapper.get(param);
		return result;
	}
	@Override
	public HashMap<String, Object> getTot(Map<String, Object> param)  throws Exception{
		param.put("mId", namespace + "getTot");
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
		deleteList(param);
		insertList(param , request);
		return result;
	}
	@Override
	public int deleteList(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "deleteList");
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
