package egovframework.cms.useIpMn.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("UseIpMnService")
public class UseIpMnServiceImpl extends EgovAbstractServiceImpl implements UseIpMnService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "useIpMnMapper.";

	/**
	 * 허용IP관리 목록
	 * @param Map
	 * @exception Exception Exception
	 */
	@Override
	public List<Map<String, Object>> getUseIpMnList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getUseIpMnList");
		List<Map<String, Object>> reslutList = commonMapper.getList(param);
		return reslutList;
	}

	/**
	 * 허용IP관리 상세조회
	 * @param Map
	 * @exception Exception Exception
	 */
	@Override
	public Map<String, Object> getUseIpMn(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getUseIpMn");
		Map<String, Object> reslutMap = commonMapper.get(param);
		return reslutMap;
	}

	/**
	 * 허용IP관리 등록
	 * @param Map
	 * @exception Exception Exception
	 */
	@Override
	public Integer insertUseIpMn(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertUseIpMn");
		Integer resultInt = (Integer) commonMapper.insert(param);
		return resultInt;
	}

	/**
	 * 허용IP관리 수정
	 * @param Map
	 * @exception Exception Exception
	 */
	@Override
	public int updateUseIpMn(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updateUseIpMn");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 허용IP관리 삭제
	 * @param Map
	 * @exception Exception Exception
	 */
	@Override
	public int deleteUseIpMn(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "deleteUseIpMn");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

}
