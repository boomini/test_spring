package egovframework.cms.sign.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.common.util.StringUtil;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("DocService")
public class DocServiceImpl extends EgovAbstractServiceImpl implements DocService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "docMapper.";
	
	@Override
	public int getListCount(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "getListCount");
		int result = commonMapper.getCount(param);
		return result;
	}
	@Override
	public List<Map<String, Object>> getList(Map<String, Object> param) throws Exception{
		param.put("mId", namespace + "getList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
}
