package egovframework.common.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.common.util.EgovExcelUtil;
import egovframework.common.util.StringUtil;

/**
 * 엑셀양식의 데이타를 리스트에 담아, 요청 화면에 제공한다.
 */
@Controller
public class ExcelUploadViewController extends DefaultController {

	private Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * <pre>
	 * 엑셀업로드
	 * 
	 * [필수요청 파라미터]
	 * 		input file tag : 엑셀파일
	 * 		requestPage : 요청화면 : 예) /cms/examInfoMn/examInfoMnExcelView
	 * </pre>
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/cms/excelUploadView")
	public ModelAndView excelUploadView(HttpServletRequest request, HttpServletResponse response) {

		final MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		String requestPage = request.getParameter("requestPage");
		String paramInfo = request.getParameter("paramInfo");

		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Boolean celCheck = true;
		Boolean celNullCheck = true;
		Boolean extensionCheck = true;
		InputStream fis = null;
		
		try {
			Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
			MultipartFile file;
			int startRowIdx = StringUtil.toInt(request.getParameter("excelRow"),1);
			int endCelIdx = StringUtil.toInt(request.getParameter("excelCel"),0);
			while (itr.hasNext()) {
				Entry<String, MultipartFile> entry = itr.next();
				file = entry.getValue();
				String fileName1 = file.getOriginalFilename();
				String fileExt = fileName1.substring(fileName1.lastIndexOf(".") + 1, fileName1.length());
				fileExt = fileExt.toLowerCase();
				if(!fileExt.equals("xlsx")){
					extensionCheck = false;
					break;
				}
				fis = file.getInputStream();
				XSSFWorkbook workbook = new XSSFWorkbook(fis);

				//int sheetCn = workbook.getNumberOfSheets(); // 시트 수
				int sheetCn = 1;
				for (int sheetnum = 0; sheetnum < sheetCn; sheetnum++) { // 시트 수만큼 반복
					if(!celCheck) break;

					XSSFSheet sheet = workbook.getSheetAt(sheetnum); // 읽어올 시트 선택
					int rows = sheet.getPhysicalNumberOfRows(); // 행의 수

					//System.out.println("rows = " + rows);
					XSSFRow row = null;
					for (int rowindex = startRowIdx; rowindex < rows; rowindex++) { // 행의 수만큼 반복
						if(!celCheck || !celNullCheck) {
							break;
						}
						row = sheet.getRow(rowindex); // rowindex 에 해당하는 행을 읽는다

						Map<String, Object> celData = new LinkedHashMap<String, Object>();
						if (row != null) {
							int cells = row.getPhysicalNumberOfCells(); // 열의 수
							//System.out.println("cells_cnt : " + cells);
							if(endCelIdx != 0){
								if(cells > endCelIdx){
									celCheck = false;
									break;
								}
								cells = endCelIdx;
							}
							for (int columnindex = 0; columnindex < cells; columnindex++) { // 열의 수만큼 반복
								XSSFCell cell_filter = row.getCell(columnindex); // 셀값을 읽는다
								String value = "";

								if(columnindex == 0 && StringUtil.noNull(cell_filter).equals("")) celNullCheck = false;

								// 셀이 빈값일경우를 위한 널체크
								if (cell_filter == null) {
									celData.put("cel_"+(columnindex+1), "");
								} else {
									// 타입별로 내용 읽기
									value = EgovExcelUtil.getValue(cell_filter);
									celData.put("cel_"+(columnindex+1), value);
								}
							}
						}
						if(celNullCheck) resultList.add(celData); // celData(행)을 resultList(열)에 추가
					}
				}
				fis.close(); // 파일 읽기 종료
			}
		} catch(IOException e){
			log.info("IO Exception", e);
		} finally{
			if(fis != null)
				try {
					fis.close();
				} catch (IOException e) {
					log.info("IO Exception", e);
				}
		}
		String retMsg = null;
		if(!extensionCheck){
			retMsg = "xlsx확장자만 올릴수 있습니다.";
		}else if(!celCheck){
			retMsg = "엑셀양식이 잘못되었습니다. 제공한 엑셀양식에 작성해주세요.";
		}
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		mav.addObject("excelList", resultList);
		mav.addObject("celCk", celCheck);
		mav.addObject("extCheck", extensionCheck);
		mav.addObject("retMsg", retMsg);
		mav.addObject("paramInfo", paramInfo);
		mav.addObject("userSidoCode", getSidoCode());//사용자시도코드
		mav.addObject("userGiganCode", getRiverCode());//사용자기관코드
		mav.setViewName(requestPage);
		/************** ModelView 로직 **************/
		return mav;
	}
}
