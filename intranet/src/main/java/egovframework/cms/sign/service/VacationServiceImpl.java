package egovframework.cms.sign.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("VacationService")
public class VacationServiceImpl extends EgovAbstractServiceImpl implements VacationService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "vacMapper.";

	@Override
	public List<Map<String, Object>> getVacList(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "getVacList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	@Override
	public int getVacCount(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "getVacCount");
		int result = commonMapper.getCount(param);
		return result;
	}
	@Override
	public HashMap<String, Object> getMember(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "getMember");
		HashMap<String, Object> result = (HashMap<String, Object>) commonMapper.get(param);
		return result;
	}
	@Override
	public int insertVac(Map<String, Object> param , HttpServletRequest request) throws Exception{
		param.put("mId", namespace + "insertVac");
		int result = (Integer) commonMapper.insert(param);
		
		String[] lineId = request.getParameterValues("lineId");
		for (int i = 0; i < lineId.length; i++) {
			if (lineId[i] != null) {
				
				param.put("SIGN_ORDER", (i+1));
				param.put("LINE_ID", lineId[i]);
				insertVacLine(param);
			}
		}
		return result;
	}
	@Override
	public int insertVacLine(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "insertVacLine");
		int result = (Integer) commonMapper.insert(param);
		return result;
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
	public int updateVac(Map<String, Object> param , HttpServletRequest request) throws Exception{
		param.put("mId", namespace + "updateVac");
		int result = (Integer) commonMapper.update(param);
		
		deleteLine(param);
		
		String[] lineId = request.getParameterValues("lineId");
		param.put("VAC_SEQ", param.get("VACKEY") );
		for (int i = 0; i < lineId.length; i++) {
			if (lineId[i] != null) {
				
				param.put("SIGN_ORDER", (i+1));
				param.put("LINE_ID", lineId[i]);
				insertVacLine(param);
			}
		}
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
	public int signVac(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "signVac");
		int result = (Integer) commonMapper.update(param);
		
		return result;
	}
	
	
	

}
