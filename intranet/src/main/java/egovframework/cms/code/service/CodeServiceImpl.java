package egovframework.cms.code.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("CodeService")
public class CodeServiceImpl extends EgovAbstractServiceImpl implements CodeService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "codeMapper.";

	/**
	 * 코드 목록
	 */
	@Override
	public List<Map<String, Object>> getCodeList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getCodeList");
		List<Map<String, Object>> reslutList = commonMapper.getList(param);
		return reslutList;
	}

	/**
	 * 공통 코드 사용
	 */
	@Override
	public List<Map<String, Object>> getCodeUtil(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getCodeUtil");
		List<Map<String, Object>> reslutList = commonMapper.getList(param);
		return reslutList;
	}

	/**
	 * 코드 상세조회
	 */
	@Override
	public Map<String, Object> getCode(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getCode");
		Map<String, Object> reslutMap = commonMapper.get(param);
		return reslutMap;
	}

	/**
	 * 코드 등록
	 */
	@Override
	public Integer insertCode(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertCode");
		Integer resultInt = (Integer) commonMapper.insert(param);
		return resultInt;
	}

	/**
	 * 코드 수정
	 */
	@Override
	public int updateCode(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updateCode");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 코드 삭제
	 */
	@Override
	public int deleteCode(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "deleteCode");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 코드 경로
	 */
	@Override
	public List<Map<String, Object>> getLocation(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getLocation");
		List<Map<String, Object>> reslutList = commonMapper.getList(param);
		return reslutList;
	}
}
