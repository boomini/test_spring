package egovframework.cms.log.menu.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("AccessMenuLogService")
public class AccessMenuLogServiceImpl extends EgovAbstractServiceImpl implements AccessMenuLogService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "accessMenuLogMapper.";

	/**
	 * Access 로그 등록
	 */
	@Override
	public Integer insertAccessMenuLog(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertAccessMenuLog");
		Integer resultInt = (Integer) commonMapper.insert(param);
		return resultInt;
	}

	/**
	 * Access 로그 전체 목록
	 */
	@Override
	public List<Map<String, Object>> getAccessMenuLogList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getAccessMenuLogList");
		List<Map<String, Object>> reslutList = commonMapper.getList(param);
		return reslutList;
	}

	/**
	 * Access 로그 카운팅
	 */
	@Override
	public int getAccessMenuLogCount(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getAccessMenuLogCount");
		int reslutCnt = commonMapper.getCount(param);
		return reslutCnt;
	}
}
