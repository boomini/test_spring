package egovframework.cms.board.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	/**
	 * 게시판 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getBoardList(Map<String, Object> param) throws Exception;

	/**
	 * 게시판 카운팅
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int getBoardCount(Map<String, Object> param) throws Exception;

	/**
	 * 게시판 등록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer inertBoard(Map<String, Object> param) throws Exception;

	/**
	 * 게시판 상세보기
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getBoard(Map<String, Object> param) throws Exception;

	/**
	 * 게시판 수정
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updateBoard(Map<String, Object> param) throws Exception;

	/**
	 * 게시판 민원 답변 저장
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updateBoardReply(Map<String, Object> param) throws Exception;

	/**
	 * 게시판 삭제
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int deleteBoard(Map<String, Object> param) throws Exception;

	/**
	 * 댓글 글순서
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int getMaxOrd(Map<String, Object> param) throws Exception;

	/**
	 * 게시물 이전글
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getPreView(Map<String, Object> param) throws Exception;

	/**
	 * 게시물 이전글
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getNextView(Map<String, Object> param) throws Exception;

	/**
	 * 조회수 증가
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updateHit(Map<String, Object> param) throws Exception;

	/**
	 * 메인 게시판 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getMainBoardList(Map<String, Object> param) throws Exception;
	public List<Map<String, Object>> getReplyList(Map<String, Object> param) throws Exception;
}
