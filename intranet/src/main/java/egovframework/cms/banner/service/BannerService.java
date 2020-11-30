package egovframework.cms.banner.service;

import java.util.List;
import java.util.Map;

public interface BannerService {

	/**
	 * 배너 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getBannerList(Map<String, Object> param);
	
	/**
	 * 배너 총 카운트
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int getBannerCount(Map<String, Object> param);
	
	/**
	 * 배너 상세 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getBanner(Map<String, Object> param) throws Exception;
	
	/**
	 * 배너 등록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer insertBanner(Map<String, Object> param) throws Exception;

	/**
	 * 배너 수정
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updateBanner(Map<String, Object> param) throws Exception;

	/**
	 * 배너 삭제
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int deleteBanner(Map<String, Object> param) throws Exception;

	/**
	 * 배너 사용유무
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updateState(Map<String, Object> param) throws Exception;

	/**
	 * foot배너 리스트
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getFooterBannerList(Map<String, Object> param) throws Exception;
}
