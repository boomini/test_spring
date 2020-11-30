package egovframework.common.codeUtil.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.common.util.StringUtil;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("CodeUtilService")
public class CodeUtilServiceImpl extends EgovAbstractServiceImpl implements CodeUtilService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "codeUtilMapper.";
	
	/**
	 * <pre>
	 * 내용 : 년도 콤보박스용 리스트를 출력
	 * </pre>
	 * @Method Name : getComboYear
	 * @param param : pStartYear(시작년도) - default(2010)
	 * @param param : pEndYear(마지막년도) - default(현재년도)
	 * @param param : pAdd(현재년도에서 증가분)  
	 * @return
	 */
	@Override
	public List<Map<String, Object>> getComboYear(Map<String, Object> param){
		int pStartYear 	= StringUtil.toInt(param.get("pStartYear"), 2010);//시작년도
		int pEndYear 	= StringUtil.toInt(param.get("pEndYear"), StringUtil.toInt(egovframework.common.util.EgovDateUtil.getToday().substring(0, 4)));//마지막년도
		if(StringUtil.toInt(param.get("pAdd")) != 0) pEndYear = pEndYear + StringUtil.toInt(param.get("pAdd"));
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for(int i = pEndYear ; i >pStartYear-1 ; i--){
			Map<String, Object> temp = new HashMap<String, Object>();
			temp.put("CODE", i);
			temp.put("CODE_NM", i);
			list.add(temp);
		}
		return list;
	}
	
	/**
	 * <pre>
	 * 내용 :  월 콤보박스용 리스트를 출력
	 * </pre>
	 * @Method Name : getComboMonth
	 * @param param
	 * @return
	 */
	@Override
	public List<Map<String, Object>> getComboMonth(Map<String, Object> param){
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for(int i = 1 ; i <13 ; i++){
			Map<String, Object> temp = new HashMap<String, Object>();
			temp.put("CODE", StringUtil.leftPad(i,2));
			temp.put("CODE_NM", StringUtil.leftPad(i,2));
			list.add(temp);
		}
		return list;
	}

	
	/**
	 * <pre>
	 * 내용 : 프레임워크 공통 코드 조회
	 * </pre>
	 * @Method Name : getComCodeList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getComCodeList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getComCodeList");
		List<Map<String, Object>> reslutList = commonMapper.getTempTableList(param);
		return reslutList;
	}
	
	/**
	 * <pre>
	 * 내용 : 토양 공통 코드 조회
	 * </pre>
	 * @Method Name : getComCodeList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getComCodeList2(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getComCodeList2");
		List<Map<String, Object>> reslutList = commonMapper.getTempTableList(param);
		return reslutList;
	}
	
	/**
	 * <pre>
	 * 내용 : 지하수 공통 코드
	 * </pre>
	 * @Method Name : getTcCmmnCode
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getTcCmmnCode(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getTcCmmnCode");
		List<Map<String, Object>> reslutList = commonMapper.getTempTableList(param);
		return reslutList;
	}
	
	/**
	 * <pre>
	 * 내용 : 업무 분류 코드
	 * </pre>
	 * @Method Name : getTcJobclCode
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getTcJobclCode(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getTcJobclCode");
		List<Map<String, Object>> reslutList = commonMapper.getTempTableList(param);
		return reslutList;
	}
	
	/**
	 * <pre>
	 * 내용 : 기관코드
	 * </pre>
	 * @Method Name : getGigwanCode
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getGigwanCode(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getGigwanCode");
		List<Map<String, Object>> reslutList = commonMapper.getTempTableList(param);
		return reslutList;
	}
	
	/**
	 * <pre>
	 * 내용 : 행정구역 코드
	 * </pre>
	 * @Method Name : getSiDoCode
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getSiDoCode(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getSiDoCode");
		List<Map<String, Object>> reslutList = commonMapper.getTempTableList(param);
		return reslutList;
	}
	
	/**
	 * <pre>
	 * 내용 : 일련번호 가져오기
	 * </pre>
	 * @Method Name : getTcNumber
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getTcNumber(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getTcNumber");
		List<Map<String, Object>> reslutList = commonMapper.getTempTableList(param);
		return reslutList;
	}
	
	/**
	 * <pre>
	 * 내용 : 운영 목적
	 * </pre>
	 * @Method Name : getPurposeCode
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getPurposeCode(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getPurposeCode");
		List<Map<String, Object>> reslutList = commonMapper.getTempTableList(param);
		return reslutList;
	}
	
	/**
	 * <pre>
	 * 내용 : 지목 코드
	 * </pre>
	 * @Method Name : getJimokCode
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getJimokCode(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getJimokCode");
		List<Map<String, Object>> reslutList = commonMapper.getTempTableList(param);
		return reslutList;
	}
	
	
	
	
	
	/**
	 * <pre>
	 * 내용 :  법정동 주소 조회 목록
	 * </pre>
	 * @Method Name : getAdmcodeList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getAdmcodeList( Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getAdmcodeList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	
	/**
	 * <pre>
	 * 내용 : 법정동 주소 총 카운트
	 * </pre>
	 * @Method Name : getAdmcodeListCount
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public int getAdmcodeListCount(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getAdmcodeListCount");
		int resultInt = commonMapper.getCount(param);
		return resultInt;
	}
	/**
	 * <pre>
	 * 1. 개요 :  먹는물 코드 조회 리스트
	 * 2. 처리내용 :
	 * </pre>
	 * @Method Name : getDwGigwanCodeList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getDwCodeList( Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getDwCodeList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	
	/**
	 * <pre>
	 * 내용 : 입력기간 설정
	 * </pre>
	 * @Method Name : getSettingIcpeiodCodeList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getSettingIcpeiodCodeList( Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getSettingIcpeiodCodeList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	
	
}
