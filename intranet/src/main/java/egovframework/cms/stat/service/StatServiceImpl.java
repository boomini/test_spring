package egovframework.cms.stat.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("StatService")
public class StatServiceImpl extends EgovAbstractServiceImpl implements StatService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "statMapper.";

	/**
	 * 접속 통계
	 */
	@Override
	public List<Map<String, Object>> getAccessStatList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getAccessStatList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}

	/**
	 * 메뉴 접속 통계
	 */
	@Override
	public List<Map<String, Object>> getAccessMenuStatList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getAccessMenuStatList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}

}
