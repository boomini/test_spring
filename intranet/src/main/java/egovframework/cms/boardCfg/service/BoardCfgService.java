package egovframework.cms.boardCfg.service;

import java.util.List;
import java.util.Map;

public interface BoardCfgService {
	
	/**
	 * 생성된 게시판 카운팅
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int getBoardCfgCount(Map<String, Object> param) throws Exception;
	
	/**
	 * 생성된 게시판 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> getBoardCfgList(Map<String, Object> param) throws Exception;
	
	/**
	 * 생성된 게시판 상세 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getBoardCfg(Map<String, Object> param) throws Exception;
	
	/**
	 * 게시판 등록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer insertBoardCfg(Map<String, Object> param) throws Exception;
	
	/**
	 * 게시판 수정
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updateBoardCfg(Map<String, Object> param) throws Exception;
	
	/**
	 * 게시판 사용여부
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int deleteBoardCfg(Map<String, Object> param) throws Exception;
	
	/**
	 * 게시판 사용되는 목록 조회 - 메뉴관리 팝업창에서 사용
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> getPopBoardList(Map<String, Object> param) throws Exception;
	
}
