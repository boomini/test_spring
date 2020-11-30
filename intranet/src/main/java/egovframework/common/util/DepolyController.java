package egovframework.common.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.common.controller.DefaultController;
import egovframework.common.jfile.JProperties;


@Controller
public class DepolyController extends DefaultController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private EgovFileUploadUtil egovFileUploadUtil;
	
	 @RequestMapping(value="/cms/depoly/step1" , method=RequestMethod.GET)
	 public ModelAndView step1()  throws Exception {
		 
		 /************** ModelView 로직 **************/
		 ModelAndView mav = new ModelAndView();
		 String resultURL = "/cms/depoly/step1"; 
		 mav.setViewName( resultURL );
		 /************** ModelView 로직 **************/
		 return mav;
	 }
	 
	 @RequestMapping(value="/cms/depoly/step2" , method=RequestMethod.GET)
	 public ModelAndView step2()  throws Exception {
		 
		 /************** ModelView 로직 **************/
		 ModelAndView mav = new ModelAndView();
		 String resultURL = "/cms/depoly/step2"; 
		 mav.setViewName( resultURL );
		 /************** ModelView 로직 **************/
		 return mav;
	 }
	 
	 @RequestMapping(value="/cms/depoly/step3" , method=RequestMethod.GET)
	 public ModelAndView step3()  throws Exception {
		 
		 /************** ModelView 로직 **************/
		 ModelAndView mav = new ModelAndView();
		 String resultURL = "/cms/depoly/step3"; 
		 mav.setViewName( resultURL );
		 /************** ModelView 로직 **************/
		 return mav;
	 }
	
	@RequestMapping(value="/cms/depoly/fileUp", method=RequestMethod.POST)  
	public ModelAndView fileUp(HttpServletRequest request) throws Exception {
		String rtnMsg = "success";
		if(StringUtil.noNull(commandMap.get("check")).equals("qwer4321")){
			String addPath = "depoly/";
			egovFileUploadUtil.uploadFiles(request,addPath);
		}else{
			rtnMsg = "fail3";
		}
		
		ModelAndView mav = new ModelAndView();
		String resultURL = "redirect:/cms/depoly/step2/?rtnMsg="+rtnMsg;
		mav.setViewName( resultURL );
		return mav;
	}
	
	@RequestMapping(value="/cms/depoly/fileDepoly", method=RequestMethod.POST)  
	public ModelAndView fileDepoly(HttpServletRequest request) {
		String rtnMsg = "success";
		if(StringUtil.noNull(commandMap.get("check")).equals("qwer4321")){
			
			String uploadPath = JProperties.getString("fileUpload.rootPath")+"depoly"+File.separator;
			String targetPath = JProperties.getString("source.path")+File.separator;;
			log.error(" 파일찾는 경로 : " + uploadPath+"consign.zip");
	            try {
					ZipUtils.unZipFile(uploadPath+"consign.zip", targetPath, false);
				} catch (IOException e) {
					rtnMsg = "fail1 : "+e.toString();
				} catch (Exception e) {
					rtnMsg = "fail2 : "+e.toString()+" uploadPath : "+uploadPath+" targetPath : " + targetPath;
				}
		}else{
			rtnMsg = "fail3";
		}
		ModelAndView mav = new ModelAndView();
		String resultURL = "redirect:/cms/depoly/step3/?rtnMsg="+rtnMsg;
		mav.setViewName( resultURL );
		return mav;
	}

}
