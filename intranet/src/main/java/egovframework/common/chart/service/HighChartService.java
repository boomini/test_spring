package egovframework.common.chart.service;

import java.util.List;
import java.util.Map;

public interface HighChartService {

	/**
	 * 차트 리스트
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getChartList(Map<String, Object> param) throws Exception;
}
