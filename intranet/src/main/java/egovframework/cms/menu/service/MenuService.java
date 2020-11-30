package egovframework.cms.menu.service;

import java.util.List;
import java.util.Map;

public interface MenuService {
	
	/**
	 * OneDepth 메뉴 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getOneDptList(Map<String, Object> param) throws Exception;
	/**
	 * 선택된 OneDepth 메뉴 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getSelDptList(Map<String, Object> param) throws Exception;
	/**
	 * 메뉴 트리 구조 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getTreeList(Map<String, Object> param) throws Exception;
	/**
	 * Depth별 메뉴 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getList(Map<String, Object> param) throws Exception;
	/**
	 * 메뉴 위치 정보
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getThisLocationList(Map<String, Object> param) throws Exception;
	/**
	 * 메뉴 상세 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getMenu(Map<String, Object> param) throws Exception;
	/**
	 * 메뉴 등록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer insertMenu(Map<String, Object> param) throws Exception;
	/**
	 * 메뉴 수정
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updateMenu(Map<String, Object> param) throws Exception;
	/**
	 * 메뉴 삭제
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int deleteMenu(Map<String, Object> param) throws Exception;
	/**
	 * 메뉴 정렬 수정
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updateOrder(Map<String, Object> param) throws Exception;
	/**
	 * top 메뉴 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getTopMenuList(Map<String, Object> param) throws Exception;
	/**
	 * 메뉴테이블에 컨텐츠 아이디 등록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updateContentId(Map<String, Object> param) throws Exception;
	/**
	 * 하위 메뉴 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getChildMenu(Map<String, Object> param) throws Exception;
	/**
	 * 메뉴 권한 삭제
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int deleteMenuAuth(Map<String, Object> param) throws Exception;
	/**
	 * 메뉴 권한 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertMenuAuth(Map<String, Object> param) throws Exception;
	/**
	 * 메뉴 권한 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getMenuAuthList(Map<String, Object> param) throws Exception;
	/**
	 * 메인 메뉴 체크 
	 */
	public List<Map<String, Object>> getMainMenuCheck(Map<String, Object> param) throws Exception;
	
}
