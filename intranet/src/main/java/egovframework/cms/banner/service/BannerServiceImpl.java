package egovframework.cms.banner.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("BannerService")
public class BannerServiceImpl extends EgovAbstractServiceImpl implements BannerService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "bannerMapper.";

	/**
	 * 배너 목록
	 */
	@Override
	public List<Map<String, Object>> getBannerList(Map<String, Object> param){
		param.put("mId", namespace + "getBannerList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	
	/**
	 * 배너 총 카운트
	 */
	@Override
	public int getBannerCount(Map<String, Object> param){
		param.put("mId", namespace + "getBannerCount");
		int resultInt = commonMapper.getCount(param);
		return resultInt;
	}
	
	/**
	 * 배너 상세 조회
	 */
	@Override
	public Map<String, Object> getBanner(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getBanner");
		Map<String, Object> resultMap = commonMapper.get(param);
		return resultMap;
	}

	/**
	 * 배너 등록
	 */
	@Override
	public Integer insertBanner(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertBanner");
		Integer resultInt = (Integer) commonMapper.insert(param);
		return resultInt;
	}

	/**
	 * 배너 수정
	 */
	@Override
	public int updateBanner(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updateBanner");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 배너 삭제
	 */
	@Override
	public int deleteBanner(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "deleteBanner");
		int resultInt = commonMapper.delete(param);
		return resultInt;
	}

	/**
	 * 배너 사용유무
	 */
	@Override
	public int updateState(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updateState");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * foot배너 리스트
	 */
	@Override
	public List<Map<String, Object>> getFooterBannerList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getFooterBannerList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}

}
