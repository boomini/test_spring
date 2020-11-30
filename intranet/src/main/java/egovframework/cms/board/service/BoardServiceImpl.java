package egovframework.cms.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "boardMapper.";

	/**
	 * 게시판 목록
	 */
	@Override
	public List<Map<String, Object>> getBoardList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getBoardList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}

	/**
	 * 게시판 카운팅
	 */
	@Override
	public int getBoardCount(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getBoardCount");
		int resultInt = commonMapper.getCount(param);
		return resultInt;
	}

	/**
	 * 게시판 등록
	 */
	@Override
	public Integer inertBoard(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertBoard");
		Integer resultInt = (Integer) commonMapper.insert(param);
		return resultInt;
	}

	/**
	 * 게시판 상세보기
	 */
	@Override
	public Map<String, Object> getBoard(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getBoard");
		Map<String, Object> resultMap = commonMapper.get(param);
		return resultMap;
	}

	/**
	 * 게시판 수정
	 */
	@Override
	public int updateBoard(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updateBoard");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 게시판 민원 답변 저장
	 */
	@Override
	public int updateBoardReply(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updateBoardReply");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 게시판 삭제
	 */
	@Override
	public int deleteBoard(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "deleteBoard");
		int resultInt = commonMapper.delete(param);
		return resultInt;
	}

	/**
	 * 댓글 글순서
	 */
	@Override
	public int getMaxOrd(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getMaxOrd");
		int resultInt = commonMapper.getCount(param);
		return resultInt;
	}

	/**
	 * 게시물 이전글
	 */
	@Override
	public Map<String, Object> getPreView(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getPreView");
		Map<String, Object> resultMap = commonMapper.get(param);
		return resultMap;
	}

	/**
	 * 게시물 이전글
	 */
	@Override
	public Map<String, Object> getNextView(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getNextView");
		Map<String, Object> resultMap = commonMapper.get(param);
		return resultMap;
	}

	/**
	 * 조회수 증가
	 */
	@Override
	public int updateHit(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updateHit");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 메인 게시판 목록
	 */
	@Override
	public List<Map<String, Object>> getMainBoardList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getMainBoardList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	@Override
	public List<Map<String, Object>> getReplyList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getReplyList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
}
