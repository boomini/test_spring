package egovframework.cms.log.error;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.common.controller.DefaultController;
import egovframework.common.jfile.JProperties;
import egovframework.common.util.EgovWebUtil;
import egovframework.common.util.StringUtil;

/**
 * 설 명 : 접속 로그 관리
 * 
 * @author 개발팀 Bang-ji-hwan
 * @since 2013. 8. 31
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일        수정자              수정내용
 *  -------       --------    ---------------------------
 *  2013. 8. 31     bjh                최초 생성
 *      </pre>
 */
@Controller
public class ErrorLogController extends DefaultController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	private List<String> searchParam = Arrays.asList("pMENU_NO");
	
	private String logFilePath  = JProperties.getString("logFile.path");;

	/**
	 * <pre>
	 * 1. 개요 : 접속 로그 리스트
	 * 2. 처리내용 : 리스트를 출력한다.
	 * </pre>
	 * 
	 * @Method Name : accesLogList
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cms/errorLog")
	public ModelAndView accesLogList() throws Exception {
		/************** ModelView 로직 **************/
		ModelAndView mav = new ModelAndView();
		String resultURL = "cms/log/errorLogList";
		mav.addObject("logList", getLogFileList());
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/

		return mav;
	}

	
	
	/**
	 * <pre>
	 * 1. 개요 : 접속 로그를 저장한다.
	 * 2. 처리내용 : 접속 로그를 저장한다.
	 * </pre>
	 * @Method Name : logFileDown
	 * @throws IOException
	 */
	@RequestMapping(value = "/cms/errorLog/logFileDown", method = RequestMethod.POST)
	public void logFileDown() throws IOException {
		
		String fileNm = StringUtil.noNull(commandMap.get("fileNm"));

		
		String mimetype = "application/x-msdownload";
		response.setContentType(mimetype);
		EgovWebUtil.setDisposition(fileNm, request, response);

		BufferedInputStream in = null;
		BufferedOutputStream out = null;
		String fileFullPath = logFilePath + "/" + fileNm;

		try {
			in = new BufferedInputStream(new FileInputStream(fileFullPath));
			out = new BufferedOutputStream(response.getOutputStream());

			FileCopyUtils.copy(in, out);
			out.flush();
			if (in != null)
				in.close();
			if (out != null)
				out.close();

		} catch (IOException ex) {
			log.info("IO Exception", ex);
		} finally {
			if (in != null)
				in.close();
			if (out != null)
				out.close();
		}
	}
	
	
	
	/**
	 * <pre>
	 * 1. 개요 : 접속 로그를 삭제한다
	 * 2. 처리내용 : 접속 로그를 삭제한다
	 * </pre>
	 * @Method Name : logFileDel
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/cms/errorLog/logFileDel", method = RequestMethod.POST)
	public ModelAndView logFileDel() throws IOException {
		String fileNm = StringUtil.noNull(commandMap.get("fileNm"));
		String fileFullPath = logFilePath + "/" + fileNm;
		File file = new File( fileFullPath); 
		file.delete();
		
		String parameters = getRequestToQueryString(searchParam);
		ModelAndView mav = new ModelAndView();
		String 	resultURL = "redirect:/cms/errorLog/" + parameters;
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}

	
	
	/**
	 * <pre>
	 * 1. 개요 : 해당 경로에서 로그파일을 읽어 온다
	 * 2. 처리내용 : 해당 경로에서 로그파일을 읽어 온다
	 * </pre>
	 * @Method Name : getLogFileList
	 * @return
	 */
	public List<Map<String, Object>> getLogFileList() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		// 리스트를 가져와서
		File f[] = (new File(logFilePath)).listFiles();
		Arrays.sort(f);//정렬
		//Arrays.sort(f,Collections.reverseOrder());

		// 길이를 구하고
		int len = f.length;
		// 자료 확인
		for (int i = len - 1; i > -1; i--) {
			Map<String, Object> map = new HashMap<String, Object>();
			//System.out.println(f[i].getName());
			if (f[i].isFile()) {
				map.put("fileNm", f[i].getName());
				DecimalFormat df = new DecimalFormat("0.#") ;
				map.put("fileSize", df.format(f[i].length()/1024).toString());
				list.add(map);
			}
		}
		return list;

	}

}
