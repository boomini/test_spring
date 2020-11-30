package egovframework.cms.contents.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("ContentsService")
public class ContentsServiceImpl extends EgovAbstractServiceImpl implements ContentsService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "contentsMapper.";

	/**
	 * 컨텐츠 관리 상세 조회
	 */
	@Override
	public Map<String, Object> getContents(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getContents");
		Map<String, Object> reslutMap = commonMapper.get(param);
		return reslutMap;
	}

	/**
	 * 컨텐츠 관리 등록
	 */
	@Override
	public Integer insertContents(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertContents");
		int reslutInt = (Integer) commonMapper.insert(param);
		return reslutInt;
	}

	/**
	 * 컨텐츠 관리 수정
	 */
	@Override
	public int updateContents(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updateContents");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 컨텐츠 관리 삭제
	 */
	@Override
	public int deleteContents(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "deleteContents");
		int resultInt = commonMapper.delete(param);
		return resultInt;
	}
}
