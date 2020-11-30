package egovframework.cms.boardCfg.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("BoardCfgService")
public class BoardCfgServiceImpl extends EgovAbstractServiceImpl implements BoardCfgService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "boardCfgMapper.";

	/**
	 * 생성된 게시판 카운팅
	 */
	@Override
	public int getBoardCfgCount(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getBoardCfgCount");
		int reslutCnt = commonMapper.getCount(param);
		return reslutCnt;
	}

	/**
	 * 생성된 게시판 목록
	 */
	@Override
	public List<Map<String, Object>> getBoardCfgList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getBoardCfgList");
		List<Map<String, Object>> reslutList = commonMapper.getList(param);
		return reslutList;
	}

	/**
	 * 생성된 게시판 상세 조회
	 */
	@Override
	public Map<String, Object> getBoardCfg(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getBoardCfg");
		Map<String, Object> resultMap = commonMapper.get(param);
		return resultMap;
	}

	/**
	 * 게시판 등록
	 */
	@Override
	public Integer insertBoardCfg(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertBoardCfg");
		Integer resultInt = (Integer) commonMapper.insert(param);
		return resultInt;
	}

	/**
	 * 게시판 수정
	 */
	@Override
	public int updateBoardCfg(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updateBoardCfg");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 게시판 사용여부
	 */
	@Override
	public int deleteBoardCfg(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "deleteBoardCfg");
		int resultInt = commonMapper.delete(param);
		return resultInt;
	}

	/**
	 * 게시판 사용되는 목록 조회 - 메뉴관리 팝업창에서 사용
	 */
	@Override
	public List<Map<String, Object>> getPopBoardList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getPopBoardList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}

}
