package egovframework.cms.test;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cms.banner.service.BannerService;
import egovframework.cms.member.service.MemberService;
import egovframework.cms.test.service.TestService;
import egovframework.common.controller.DefaultController;
import egovframework.common.jfile.service.JFileService;
import egovframework.common.util.Pager;
import egovframework.common.util.StringUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"classpath:/egovframework/spring/context-TEST.xml"
	})
public class TestController{
	
	HashMap<String, Object> commandMap =  new HashMap<String, Object>();
	
	
	@Resource(name="TestService")
	private TestService Service;

	@Test
	public void executeTest() throws Exception {
		List<Map<String,Object>> list = null;
		Map<String,Object> result = null;
		
		try {
			list =  Service.getList(commandMap);
			result =Service.getResult(commandMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(list);
		System.out.println(result);
	}
	
	
	

}
