package egovframework.common.chart.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("HighChartService")
public class HighChartServiceImpl extends EgovAbstractServiceImpl implements HighChartService {
	
	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;
	
	/**
	 * 차트 리스트 
	 */
	@Override
	public List<Map<String, Object>> getChartList(Map<String, Object> param) throws Exception {
		//mId 필수파라미터
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
}
