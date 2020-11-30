package egovframework.common.controller.service;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.common.util.StringUtil;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("bigDataExcelService")
public class BigDataExcelServiceImpl extends EgovAbstractServiceImpl implements BigDataExcelService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "bigDataExcelMapper.";

	/**
	 * 대용량 엑셀 다운로드 공통
	 */
	@Override
	public SXSSFWorkbook getBigDataExcelDown(HttpServletRequest request, Map<String, Object> param) throws Exception {
		
		if(StringUtil.noNull(param.get("qNs")).equals("")){
			param.put("mId", namespace + StringUtil.noNull(param.get("qId")));	
		}else{
			param.put("mId", StringUtil.noNull(param.get("qNs")) + "." + StringUtil.noNull(param.get("qId")));
		}

		SXSSFWorkbook resultList = commonMapper.getBigDataExcelProc(request, param);
		return resultList;
	}
	
	/**
	 * 통합 조회 엑셀 다운로드 공통
	 */
	@Override
	public SXSSFWorkbook getTotSearchDataExcelDown(HttpServletRequest request, Map<String, Object> param) throws Exception {
		
		if(StringUtil.noNull(param.get("qNs")).equals("")){
			param.put("mId", namespace + StringUtil.noNull(param.get("qId")));	
		}else{
			param.put("mId", StringUtil.noNull(param.get("qNs")) + "." + StringUtil.noNull(param.get("qId")));
		}

		SXSSFWorkbook resultList = commonMapper.getBigDataExcelProc(request, param);
		return resultList;
	}

	

	/**
	 * 대용량 엑셀 다운로드 공통(Multy Sheet)
	 */
	@Override
	public SXSSFWorkbook getBigDataExcelDown(String templateUrl, Map<String, Object> ... paramMap) throws Exception {
		for (int i = 0; i < paramMap.length; i++) {
			if(StringUtil.noNull(paramMap[i].get("qNs")).equals("")){
				paramMap[i].put("mId", namespace + StringUtil.noNull(paramMap[i].get("qId")));	
			}else{
				paramMap[i].put("mId", StringUtil.noNull(paramMap[i].get("qNs")) + "." + StringUtil.noNull(paramMap[i].get("qId")));
			}
		}
		SXSSFWorkbook resultList = commonMapper.getBigDataExcelProc(templateUrl, paramMap);
		return resultList;
	}
}
