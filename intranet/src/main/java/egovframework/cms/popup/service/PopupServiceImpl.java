package egovframework.cms.popup.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("popupService")
public class PopupServiceImpl extends EgovAbstractServiceImpl implements PopupService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "popupMapper.";

	/**
	 * 팝업 목록
	 */
	@Override
	public List<Map<String, Object>> getPopupList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getPopupList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}

	/**
	 * 팝업 등록
	 */
	@Override
	public Integer insertPopup(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertPopup");
		Integer resultInt = (Integer) commonMapper.insert(param);
		return resultInt;
	}

	/**
	 * 팝업 상세보기
	 */
	@Override
	public Map<String, Object> getPopup(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getPopup");
		Map<String, Object> resultMap = commonMapper.get(param);
		return resultMap;
	}

	/**
	 * 팝업 카운트
	 */
	@Override
	public int getPopupCount(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getPopupCount");
		int resultInt = commonMapper.getCount(param);
		return resultInt;
	}

	/**
	 * 팝업 수정
	 */
	@Override
	public int updatePopup(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updatePopup");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 팝업 삭제
	 */
	@Override
	public int deletePopup(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "deletePopup");
		int resultInt = commonMapper.delete(param);
		return resultInt;
	}

	/**
	 * 메인 팝업 목록
	 */
	@Override
	public List<Map<String, Object>> mainPopupList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "mainPopupList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}

}
