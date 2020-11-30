package egovframework.cms.calendar.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.sun.star.lang.NullPointerException;

import egovframework.common.mapper.CommonMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("CalendarService")
public class CalendarServiceImpl extends EgovAbstractServiceImpl implements CalendarService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "calendarMapper.";

	@Override
	public List<Map<String, Object>> getList(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "getList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	};
	@Override
	public Map<String, Object> get(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "get");
		Map<String, Object> result = commonMapper.get(param);
		return result;
	};
	@Override
	public int insert(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "insert");
		int result = (Integer) commonMapper.insert(param);
		return result;
	};
	@Override
	public int update(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "update");
		int result = (Integer) commonMapper.update(param);
		return result;
	};
	@Override
	public int delete(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "delete");
		int result = (Integer) commonMapper.delete(param);
		return result;
	};
	

}
