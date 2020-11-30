package egovframework.common.mapper;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Repository;

import egovframework.common.helper.EgovBasicLogger;
import egovframework.common.util.StringUtil;
import egovframework.common.view.BigDataExcelUtil;
import egovframework.common.view.ExcelConstants;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * 공용 Mapper 클래스
 * 
 * @author bang
 *
 */
@Repository("CommonMapper")
public class CommonMapper extends EgovAbstractMapper {

	/**
	 * 대용량 엑셀 변환 - out of memory 발생 방지
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public SXSSFWorkbook getBigDataExcelProc(HttpServletRequest request, Map<String, Object> param) throws Exception {
		
		if(StringUtil.noNull(param.get("multy")).equals("Y")){
			insertMultyTempTable(request,param);
		}else if(StringUtil.noNull(param.get("totSearch")).equals("Y")){
			insertTotSearchTempTable(request,param);
		}else{
			insertTempTable(param);	
		}
		
		String templateURL = StringUtil.noNull(param.get(ExcelConstants.TEMPLATE_URL));
		int rownum = StringUtil.toInt(param.get(ExcelConstants.ROWNUM), 0);
		int celnum = StringUtil.toInt(param.get(ExcelConstants.CELNUM), 0);

		XSSFWorkbook xb = new XSSFWorkbook(new FileInputStream(new File(templateURL)));// 엑셀 2007이상인경우 읽기,쓰기 가능
		Map<String, XSSFCellStyle> styles = BigDataExcelUtil.createStyles(xb);// 스타일들 저장

		SXSSFWorkbook wb = new SXSSFWorkbook(xb);// 대용량 엑셀파일용 쓰기만 가능
		SXSSFSheet sheet = (SXSSFSheet) wb.getSheetAt(0);
		BigDataExcelResultHandler resultHandler = new BigDataExcelResultHandler(sheet, styles, rownum, celnum);
		getSqlSession().select(mapperId(param), param, resultHandler);

		return wb;

	}

	/**
	 * 대용량 엑셀 변환 - out of memory 발생 방지
	 * sheet에 멀티로 제공할 경우
	 *  
	 * @param templateUrl : 템플릿파일 풀경로
	 * @param paramMap : 각 excel sheet 별 정보
	 * 				KEY{
	 * 					rownum : 시작행
	 * 					celnum : 시작셀
	 * 					mId : Query Mapper Id
	 * 				}
	 * @return
	 * @throws Exception
	 */
	public SXSSFWorkbook getBigDataExcelProc(String templateUrl, Map<String, Object> ... paramMap) throws Exception {
		int rownum = 0;
		int celnum = 0;
		XSSFWorkbook xb = new XSSFWorkbook(new FileInputStream(new File(templateUrl)));// 엑셀 2007이상인경우 읽기,쓰기 가능
		Map<String, XSSFCellStyle> styles = BigDataExcelUtil.createStyles(xb);// 스타일들 저장
		SXSSFWorkbook wb = new SXSSFWorkbook(xb);// 대용량 엑셀파일용 쓰기만 가능
		SXSSFSheet sheet = null;
		BigDataExcelResultHandler resultHandler = null;
		for (int i = 0; i < paramMap.length; i++) {
			rownum = StringUtil.toInt(paramMap[i].get(ExcelConstants.ROWNUM), 0);
			celnum = StringUtil.toInt(paramMap[i].get(ExcelConstants.CELNUM), 0);
			sheet = (SXSSFSheet) wb.getSheetAt(i);
			
			resultHandler = new BigDataExcelResultHandler(sheet, styles, rownum, celnum);
			getSqlSession().select(mapperId(paramMap[i]), paramMap[i], resultHandler);
		}
		return wb;
	}

	/**
	 * 리스트 조회
	 * 
	 * @param Map
	 * @exception Exception
	 *                Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getList(Map<String, Object> param) {
		// 엑셀 다운로드시 사용
		if (StringUtil.noNull(param.get("EXCEL_YN")).equals("Y")) {
			param.put("endRow", 99999999);
		}
		return selectList(mapperId(param), param);
	}

	/**
	 * 카운트
	 * 
	 * @param Map
	 * @exception Exception
	 *                Exception
	 * 
	 */
	public int getCount(Map<String, Object> param) {
		return selectOne(mapperId(param), param);
	}

	/**
	 * 상세 조회
	 * 
	 * @param Map
	 * @exception Exception
	 *                Exception
	 */
	public Map<String, Object> get(Map<String, Object> param) throws Exception {
		return selectOne(mapperId(param), param);
	}

	/**
	 * 상세 조회
	 * 
	 * @param Map
	 * @exception Exception
	 *                Exception
	 */
	public Object getObject(Map<String, Object> param) throws Exception {
		return selectOne(mapperId(param), param);
	}

	/**
	 * 등록
	 * 
	 * @param Map
	 * @exception Exception
	 *                Exception
	 */
	public Object insert(Map<String, Object> param) throws Exception {
		return insert(mapperId(param), param);
	}

	/**
	 * 수정
	 * 
	 * @param Map
	 * @exception Exception
	 *                Exception
	 */
	public int update(Map<String, Object> param) throws Exception {
		return update(mapperId(param), param);
	}

	/**
	 * 삭제
	 * 
	 * @param Map
	 * @exception Exception
	 *                Exception
	 */
	public int delete(Map<String, Object> param) throws Exception {
		return delete(mapperId(param), param);
	}

	/**
	 * mapperId 등록
	 * 
	 * @param param
	 * @return
	 */
	public String mapperId(Map<String, Object> param) {
		String mId = StringUtil.noNull(param.get("mId"));
		EgovBasicLogger.info("QueryID : " + mId);
		return mId;
	}

	/**
	 * COM_VRIABL_TMPR : 파라미터용 테이블 인서트
	 * multi param insert
	 * @param param
	 * @return
	 */
	public void insertMultyTempTable(HttpServletRequest request , Map<String, Object> param) {
		int multiParam_I = request.getParameterValues("MULTI_1").length;
		
		for(int param_I=0 ; param_I<multiParam_I ; param_I++){
			Map<String, Object> temp = new HashMap<String, Object>();
				temp.put("ATTR_1",  StringUtil.noNull( request.getParameterValues("MULTI_1")[param_I] ));
				for(int attr_I = 2 ; attr_I <= 20 ; attr_I++){
					temp.put("ATTR_"+attr_I,  StringUtil.noNull( param.get("MULTI_"+attr_I)) );
				}
				System.out.println(temp);
			insertTempTable(temp);
		}
	}
	/**
	 * COM_VRIABL_TMPR : 파라미터용 테이블 인서트
	 * 통합조회용 
	 * @param param
	 * @return
	 */
	public void insertTotSearchTempTable(HttpServletRequest request , Map<String, Object> param) {
		Map<String, Object> pa = new HashMap<String, Object>();
		pa.put("ATTR_1", StringUtil.noNull(request.getParameter("ATTR_1")));
		insertTempTable(pa);
		pa.clear();
		pa.put("ATTR_2", StringUtil.noNull(request.getParameter("ATTR_2"),"AA"));
		insertTempTable(pa);
		
		
		for (int i = 3; i < 16; i++) {
			String paNm = "ATTR_"+i;
			String params[]  = request.getParameterValues(paNm);
			if(params != null && params.length > 0){
				for (int j = 0; j < params.length; j++) {
					Map<String, Object> temp = new HashMap<String, Object>();
					temp.put(paNm, params[j]);
					insertTempTable(temp);
				}
			}
		}
	}
	
	/**
	 * COM_VRIABL_TMPR : 파라미터용 테이블 인서트
	 * 
	 * @param param
	 * @return
	 */
	public Object insertTempTable(Map<String, Object> param) {
		return insert("frame.com.insertTempTable", param);
	}

	/**
	 * COM_VRIABL_TMPR 사용 - 리스트 조회
	 * 
	 * @param Map
	 * @exception Exception
	 *                Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getTempTableList(Map<String, Object> param) {
		insertTempTable(param);
		return selectList(mapperId(param), param);
	}

	/**
	 * COM_VRIABL_TMPR 사용 - 카운트
	 * 
	 * @param Map
	 * @exception Exception
	 *                Exception
	 * 
	 */
	public int getTempTableCount(Map<String, Object> param) {
		insertTempTable(param);
		return selectOne(mapperId(param), param);
	}

	/**
	 * COM_VRIABL_TMPR 사용 - 상세 조회
	 * 
	 * @param Map
	 * @exception Exception
	 *                Exception
	 */
	public Map<String, Object> getTempTable(Map<String, Object> param) throws Exception {
		insertTempTable(param);
		return selectOne(mapperId(param), param);
	}

}
