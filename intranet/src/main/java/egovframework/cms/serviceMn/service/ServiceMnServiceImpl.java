package egovframework.cms.serviceMn.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import egovframework.common.mapper.CommonMapper;
import egovframework.common.util.StringUtil;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("ServiceMnService")
public class ServiceMnServiceImpl extends EgovAbstractServiceImpl implements ServiceMnService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "serviceMnMapper.";
	
	/**
	 * <pre>
	 * 내용 :  측정망 입력항목 관리 설정 리스트
	 * </pre>
	 * @Method Name : mesureInputItemMnList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getMesureInputItemMnList( Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getMesureInputItemMnList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	
	/**
	 * <pre>
	 * 내용 :  측정망 등록항목 리스트
	 * </pre>
	 * @Method Name : getMainMesureInputItemMnList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getMainMesureInputItemMnList( Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getMainMesureInputItemMnList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	
	/**
	 * <pre>
	 * 내용 : 측정망 항목 저장
	 * </pre>
	 * @Method Name : saveMainMesureInputItem
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public void saveMainMesureInputItem(HttpServletRequest request, Map<String, Object> param) throws Exception {
		/*주키*/
		String year = StringUtil.noNull(param.get("YEAR"));
		String targetGbn = StringUtil.noNull(param.get("TARGET_GBN"));
		String quarter = StringUtil.noNull(param.get("QUARTER"));
		String useTarget = StringUtil.noNull(param.get("USE_TARGET"));
		
		String[] thresholdss = request.getParameterValues("THRESHOLDS");
		String[] thresholds2s = request.getParameterValues("THRESHOLDS_2");
		String[] thUnits = request.getParameterValues("TH_UNIT");
		String[] unexpectVals = request.getParameterValues("UNEXPECT_VAL");
		String[] unexpectVal2s = request.getParameterValues("UNEXPECT_VAL_2");
		String[] thUnit2s = request.getParameterValues("TH_UNIT2");
		
		String[] thresholdsBs = request.getParameterValues("THRESHOLDS_B");
		String[] thresholdsB2s = request.getParameterValues("THRESHOLDS_B_2");
		String[] thUnitBs = request.getParameterValues("TH_UNIT_B");
		
		String[] icCodes = request.getParameterValues("IC_CODE");
		
		if(!year.equals("") && !targetGbn.equals("") && !quarter.equals("") && !useTarget.equals("")){
			param.put("mId", namespace + "deleteMainMesureInputItem");
			commonMapper.delete(param);
			for (int i = 0; i < icCodes.length; i++) {
				String icCode = StringUtil.noNull(icCodes[i]);
				
				
				String thresholds 		= thresholdss 	== null?"" : StringUtil.noNull(thresholdss[i]);
				String thresholds2 		= thresholds2s 	== null?"" : StringUtil.noNull(thresholds2s[i]);
				String thUnit 			= thUnits 		== null?"" : StringUtil.noNull(thUnits[i]);
				
				String unexpectVal 		= unexpectVals 	== null?"" : StringUtil.noNull(unexpectVals[i]);
				String unexpectVal2 	= unexpectVal2s == null?"" : StringUtil.noNull(unexpectVal2s[i]);
				String thUnit2 			= thUnit2s 		== null?"" : StringUtil.noNull(thUnit2s[i]);
				
				String thresholdsB 	=  thresholdsBs 	== null?"" : StringUtil.noNull(thresholdsBs[i]);
				String thresholdsB2 =  thresholdsB2s 	== null?"" : StringUtil.noNull(thresholdsB2s[i]);
				String thUnitB 		=  thUnitBs 		== null?"" : StringUtil.noNull(thUnitBs[i]);
				
				
				if(!icCode.equals("")){
					Map<String, Object> temp = new HashMap<String, Object>();
					temp.put("YEAR", year);
					temp.put("TARGET_GBN", targetGbn);
					temp.put("QUARTER", quarter);
					temp.put("USE_TARGET", useTarget);
					
					temp.put("IC_CODE", icCode);
					temp.put("THRESHOLDS", thresholds);
					temp.put("THRESHOLDS_2", thresholds2);
					temp.put("TH_UNIT", thUnit);
					temp.put("UNEXPECT_VAL", unexpectVal);
					temp.put("UNEXPECT_VAL_2", unexpectVal2);
					temp.put("TH_UNIT2", thUnit2);
					
					
					temp.put("THRESHOLDS_B", thresholdsB);
					temp.put("THRESHOLDS_B_2", thresholdsB2);
					temp.put("TH_UNIT_B", thUnitB);
					temp.put("IC_ORDR", i);
					
					temp.put("mId", namespace + "insertMainMesureInputItem");
					commonMapper.insert(temp);
				}
			}
		}
	}
	
	/**
	 * <pre>
	 * 내용 :  측정항목 조회 목록
	 * </pre>
	 * @Method Name : getMesureItemList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getMesureItemList( Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getMesureItemList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	
	/**
	 * <pre>
	 * 내용 : 측정항목 조회 총 카운트
	 * </pre>
	 * @Method Name : getMesureItemCount
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public int getMesureItemCount(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getMesureItemCount");
		int resultInt = commonMapper.getCount(param);
		return resultInt;
	}
	
	/**
	 * <pre>
	 * 내용 : 측정항목 등록
	 * </pre>
	 * @Method Name : insertmesureItem
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public Integer insertmesureItem(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertmesureItem");
		Integer resultInt = (Integer) commonMapper.insert(param);
		return resultInt;
	}
	
	/**
	 * <pre>
	 * 내용 : 측정항목간 수정
	 * </pre>
	 * @Method Name : updatemesureItem
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public int updatemesureItem(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updatemesureItem");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * <pre>
	 * 내용 : 측정항목 삭제
	 * </pre>
	 * @Method Name : deleteMesureInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public int deletemesureItem(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "deletemesureItem");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}
	
	/**
	 * <pre>
	 * 내용 : 측정망 입력기간 설정
	 * </pre>
	 * @Method Name : getMesureInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getMesureInputTmMnList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getMesureInputTmMnList");
		List<Map<String, Object>> resultList = commonMapper.getTempTableList(param);
		return resultList;
	}
	
	/**
	 * <pre>
	 * 내용 : 측정망 입력기간 상세조회
	 * </pre>
	 * @Method Name : getMesureInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> getMesureInputTmMn(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getMesureInputTmMn");
		Map<String, Object> reslutMap = commonMapper.get(param);
		return reslutMap;
	}
	
	/**
	 * <pre>
	 * 내용 : 측정망 입력기간 등록
	 * </pre>
	 * @Method Name : insertMesureInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public Integer insertMesureInputTmMn(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertMesureInputTmMn");
		Integer resultInt = (Integer) commonMapper.insert(param);
		return resultInt;
	}
	
	/**
	 * <pre>
	 * 내용 : 측정망 입력기간 수정
	 * </pre>
	 * @Method Name : updateMesureInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public int updateMesureInputTmMn(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updateMesureInputTmMn");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * <pre>
	 * 내용 : 측정망 입력기간 삭제
	 * </pre>
	 * @Method Name : deleteMesureInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public int deleteMesureInputTmMn(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "deleteMesureInputTmMn");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}
	
	/**
	 * <pre>
	 * 내용 :  지하수 측정망 조사지점 리스트
	 * </pre>
	 * @Method Name : getWaterSpotCrList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getWaterSpotCrList( Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getWaterSpotCrList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	
	/**
	 * <pre>
	 * 내용 : 지하수 측정망 조사지점 생성
	 * </pre>
	 * @Method Name : insertWaterSpotCr
	 * @return
	 */
	@Override
	public Integer insertWaterSpotCr(HttpServletRequest request, Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertWaterSpotCr");
		Integer resultInt = (Integer) commonMapper.insert(param);
		porcCropMainIngredient(request, param);
		return resultInt;
	}
	
	/**
	 * <pre>
	 * 내용 :  토양 측정망 조사지점 리스트
	 * </pre>
	 * @Method Name : getSoilSpotCrList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getSoilSpotCrList( Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getSoilSpotCrList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	
	/**
	 * <pre>
	 * 내용 : 토양 측정망 조사지점 생성
	 * </pre>
	 * @Method Name : insertSoilSpotCr
	 * @return
	 */
	@Override
	public Integer insertSoilSpotCr(HttpServletRequest request, Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertSoilSpotCr");
		Integer resultInt = (Integer) commonMapper.insert(param);
		porcCropMainIngredient(request, param);
		return resultInt;
	}
	
	
	/******************************************************************************************************************************************************************************/
	
	
	/**
	 * <pre>
	 * 내용 : 골프장 농약관리 총 카운트
	 * </pre>
	 * @Method Name : golfCropMnCount
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public int golfCropMnCount(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "golfCropMnCount");
		int resultInt = commonMapper.getCount(param);
		return resultInt;
	}

	/**
	 * <pre>
	 * 내용 :  골프장 농약관리 목록
	 * </pre>
	 * @Method Name : golfCropMnList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> golfCropMnList( Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "golfCropMnList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	
	/**
	 * <pre>
	 * 내용 : 골프장 농약관리 상세보기
	 * </pre>
	 * @Method Name : getGolfCropMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> getGolfCropMn(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getGolfCropMn");
		Map<String, Object> resultMap = commonMapper.get(param);
		return resultMap;
	}
	
	/**
	 * <pre>
	 * 내용 : 골프장 농약관리 등록
	 * </pre>
	 * @Method Name : insertGolfCropMn
	 * @return
	 */
	@Override
	public Integer insertGolfCropMn(HttpServletRequest request, Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertGolfCropMn");
		Integer resultInt = (Integer) commonMapper.insert(param);
		porcCropMainIngredient(request, param);
		return resultInt;
	}

	/**
	 * <pre>
	 * 내용 : 골프장 농약관리 수정
	 * </pre>
	 * @Method Name : updateGolfCropMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public int updateGolfCropMn(HttpServletRequest request, Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updateGolfCropMn");
		int resultInt = commonMapper.update(param);
		porcCropMainIngredient(request, param);
		return resultInt;
	}
	
	
	/**
	 * <pre>
	 * 내용 : 주성분 삭제후 재등록 처리
	 * </pre>
	 * @Method Name : porcCropMainIngredient
	 * @param request
	 * @param param
	 * @throws Exception
	 */
	public void porcCropMainIngredient(HttpServletRequest request, Map<String, Object> param) throws Exception{
		String pesticideSeq = StringUtil.noNull(param.get("PESTICIDE_SEQ"));
		String[] ingredientsSeqs = request.getParameterValues("INGREDIENTS_SEQ");
		String[] ingredientsPers = request.getParameterValues("INGREDIENTS_PER");
		String[] contents = request.getParameterValues("CONTENT");
		String[] validCodes = request.getParameterValues("VALID_CODE");
		if(!pesticideSeq.equals("")){
			param.put("mId", namespace + "deleteCropMainIngredient");
			commonMapper.delete(param);
			for (int i = 0; i < ingredientsSeqs.length; i++) {
				String ingredientsSeq = StringUtil.noNull(ingredientsSeqs[i]);
				String ingredientsPer = StringUtil.noNull(ingredientsPers[i]);
				String content = StringUtil.noNull(contents[i]);
				String validCode = StringUtil.noNull(validCodes[i]);
				if(!ingredientsSeq.equals("")){
					Map<String, Object> temp = new HashMap<String, Object>();
					temp.put("PESTICIDE_SEQ", pesticideSeq);
					temp.put("INGREDIENTS_PER", ingredientsPer);
					temp.put("CONTENT", content);
					temp.put("INGREDIENTS_SEQ", ingredientsSeq);
					temp.put("VALID_CODE", validCode);
					temp.put("mId", namespace + "insertCropMainIngredient");
					commonMapper.insert(temp);
				}
			}
		}
	}
	
	/**
	 * <pre>
	 * 내용 : 골프장 농약관리 삭제
	 * </pre>
	 * @Method Name : deleteGolfCropMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public int deleteGolfCropMn(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "deleteGolfCropMn");
		int resultInt = commonMapper.delete(param);
		return resultInt;
	}
	
	/**
	 * <pre>
	 * 내용 : 골프장 농약관리 사용유무 변경
	 * </pre>
	 * @Method Name : updateGolfCropUseYnMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public int updateGolfCropUseYnMn(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updateGolfCropUseYnMn");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}
	

	/**
	 * <pre>
	 * 내용 :  성분조회 목록
	 * </pre>
	 * @Method Name : cropIngredientList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> cropIngredientList( Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "cropIngredientList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	
	/**
	 * <pre>
	 * 내용 : 성분조회 총 카운트
	 * </pre>
	 * @Method Name : cropIngredientCount
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public int cropIngredientCount(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "cropIngredientCount");
		int resultInt = commonMapper.getCount(param);
		return resultInt;
	}
	
	/**
	 * <pre>
	 * 내용 :  주성분 목록
	 * </pre>
	 * @Method Name : cropMainIngredientList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> cropMainIngredientList( Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "cropMainIngredientList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	
	
	/******************************************************************************************************************************************************************************/
	
	/**
	 * <pre>
	 * 내용 : 골프장 입력기한 총 카운트
	 * </pre>
	 * @Method Name : getGolfInputTmMnCount
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public int getGolfInputTmMnCount(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getGolfInputTmMnCount");
		int resultInt = commonMapper.getCount(param);
		return resultInt;
	}

	/**
	 * <pre>
	 * 내용 :  골프장 입력기한 목록
	 * </pre>
	 * @Method Name : getGolfInputTmMnList
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getGolfInputTmMnList( Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getGolfInputTmMnList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
	
	/**
	 * <pre>
	 * 내용 : 골프장 입력기한 상세보기
	 * </pre>
	 * @Method Name : getGolfInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> getGolfInputTmMn(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getGolfInputTmMn");
		Map<String, Object> resultMap = commonMapper.get(param);
		return resultMap;
	}
	
	/**
	 * <pre>
	 * 내용 : 골프장 입력기한 등록
	 * </pre>
	 * @Method Name : insertGolfInputTmMn
	 * @return
	 */
	@Override
	public Integer insertGolfInputTmMn(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertGolfInputTmMn");
		Integer resultInt = (Integer) commonMapper.insert(param);
		return resultInt;
	}

	/**
	 * <pre>
	 * 내용 : 골프장 입력기한 수정
	 * </pre>
	 * @Method Name : updateGolfInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public int updateGolfInputTmMn(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updateGolfInputTmMn");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}
	
	/**
	 * <pre>
	 * 내용 : 골프장 입력기한 삭제
	 * </pre>
	 * @Method Name : deleteGolfInputTmMn
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public int deleteGolfInputTmMn(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "deleteGolfInputTmMn");
		int resultInt = commonMapper.delete(param);
		return resultInt;
	}
	
	/**
	 * <pre>
	 * 내용 :  골프장 입력기한 년도 콤보박스용
	 * </pre>
	 * @Method Name : getGolfInputTmMnCombo
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getGolfInputTmMnCombo( Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getGolfInputTmMnCombo");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}
}
