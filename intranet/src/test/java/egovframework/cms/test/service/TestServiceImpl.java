package egovframework.cms.test.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("TestService")
public class TestServiceImpl extends EgovAbstractServiceImpl implements TestService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "testMapper.";

	@Override
	public List<Map<String, Object>> getList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	@Override
	public Map<String, Object> getResult(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getResult");
		Map<String, Object> result = commonMapper.get(param);
		return result;
	}
	

}
