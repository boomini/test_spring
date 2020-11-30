package egovframework.cms.mail;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.emory.mathcs.backport.java.util.Collections;
import egovframework.cms.sign.service.BiztripService;
import egovframework.cms.sign.service.ExpenseService;
import egovframework.common.controller.DefaultController;
import egovframework.common.jfile.service.JFileService;
import egovframework.common.util.Pager;
import egovframework.common.util.StringUtil;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

@Controller
public class mailController extends DefaultController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 검색 파라미터
	private List<String> searchParam	= Arrays.asList( "pMENU_NO", "page");

	// mailSending 코드
	@RequestMapping(value = "/web/mail/send")
	public ModelAndView mailSending() throws Exception{
/*
		String form = commandMap.get("form").toString();
		String to = commandMap.get("to").toString();
		String title = commandMap.get("title").toString();
		String content = commandMap.get("content").toString();
*/	
			
		String form = "xxxxx@xxxxx.co.kr";
		String to = "xxxxxx@naver.com";
		String title = "title";
		String content = "content";
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message,true, "UTF-8");
		messageHelper.setFrom(new InternetAddress(form)); // 보내는사람 생략하거나 하면 정상작동을 안함
		messageHelper.setTo(to); // 받는사람 이메일
		messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		messageHelper.setText(content); // 메일 내용
		mailSender.send(message);
	
		String resultURL = "/cms/main/main";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(resultURL);
		return mav;

	}
}
