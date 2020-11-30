package egovframework.cms.menu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("MenuService")
public class MenuServiceImpl extends EgovAbstractServiceImpl implements MenuService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "menuMapper.";

	/**
	 * OneDepth 메뉴 조회
	 */
	@Override
	public List<Map<String, Object>> getOneDptList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getOneDptList");
		List<Map<String, Object>> reslutList = commonMapper.getList(param);
		return reslutList;
	}

	/**
	 * 선택된 OneDepth 메뉴 조회
	 */
	@Override
	public List<Map<String, Object>> getSelDptList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getSelDptList");
		List<Map<String, Object>> reslutList = commonMapper.getList(param);
		return reslutList;
	}

	/**
	 * 메뉴 트리 구조 조회
	 */
	@Override
	public List<Map<String, Object>> getTreeList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getTreeList");
		List<Map<String, Object>> reslutList = commonMapper.getList(param);
		return reslutList;
	}

	/**
	 * Depth별 메뉴 조회
	 */
	@Override
	public List<Map<String, Object>> getList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getList");
		List<Map<String, Object>> reslutList = commonMapper.getList(param);
		return reslutList;
	}

	/**
	 * 메뉴 위치 정보
	 */
	@Override
	public List<Map<String, Object>> getThisLocationList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getThisLocationList");
		List<Map<String, Object>> reslutList = commonMapper.getList(param);
		return reslutList;
	}

	/**
	 * 메뉴 상세 정보
	 */
	@Override
	public Map<String, Object> getMenu(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getMenu");
		Map<String, Object> reslutMap = commonMapper.get(param);
		return reslutMap;
	}

	/**
	 * 메뉴 등록
	 */
	@Override
	public Integer insertMenu(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertMenu");
		int resultInt = (Integer) commonMapper.insert(param);
		return resultInt;
	}

	/**
	 * 메뉴 수정
	 */
	@Override
	public int updateMenu(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updateMenu");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 메뉴 삭제
	 */
	@Override
	public int deleteMenu(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "deleteMenu");
		int resultInt = commonMapper.delete(param);
		return resultInt;
	}

	/**
	 * 메뉴 정렬 수정
	 */
	@Override
	public int updateOrder(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updateOrder");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * top 메뉴 조회
	 */
	@Override
	public List<Map<String, Object>> getTopMenuList(Map<String, Object> param) throws Exception {
		List<Map<String, Object>> oneDptList = getOneDptList(param);

		for (int i = 0; i < oneDptList.size(); i++) {
			HashMap<String, Object> oneDpt = (HashMap<String, Object>) oneDptList.get(i);
			Map<String, Object> oneDepMap = new HashMap<String, Object>();
			oneDepMap.put("MENU_NO", oneDpt.get("MENU_NO"));
			oneDepMap.put("USE_AT", "Y");
			oneDepMap.put("authGrp", param.get("authGrp"));
			oneDepMap.put("MENU_SE", param.get("MENU_SE"));
			oneDepMap.put("MENU_AUTH_YN", param.get("MENU_AUTH_YN"));
			List<Map<String, Object>> menuTreeList = getTreeList(oneDepMap);
			oneDpt.put("menuTreeList", menuTreeList);
		}
		return oneDptList;
	}

	/**
	 * 메뉴테이블에 컨텐츠 아이디 등록
	 */
	@Override
	public int updateContentId(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updateContentId");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 하위 메뉴 조회
	 */
	@Override
	public Map<String, Object> getChildMenu(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getChildMenu");
		Map<String, Object> reslutMap = commonMapper.get(param);
		return reslutMap;
	}

	/**
	 * 메뉴 권한 삭제
	 */
	@Override
	public int deleteMenuAuth(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "deleteMenuAuth");
		int resultInt = (Integer) commonMapper.delete(param);
		return resultInt;
	}

	/**
	 * 메뉴 권한 등록
	 */
	@Override
	public void insertMenuAuth(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertMenuAuth");
		commonMapper.insert(param);
	}

	/**
	 * 메뉴 권한 목록
	 */
	@Override
	public List<Map<String, Object>> getMenuAuthList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getMenuAuthList");
		List<Map<String, Object>> reslutList = commonMapper.getList(param);
		return reslutList;
	}
	
	/**
	 * 메인 메뉴 체크 
	 */
	@Override
	public List<Map<String, Object>> getMainMenuCheck(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getMainMenuCheck");
		List<Map<String, Object>> reslutList = commonMapper.getList(param);
		return reslutList;
	}

}
