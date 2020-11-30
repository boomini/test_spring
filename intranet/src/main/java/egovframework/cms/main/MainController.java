package egovframework.cms.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cms.banner.service.BannerService;
import egovframework.cms.board.service.BoardService;
import egovframework.cms.calendar.service.CalendarService;
import egovframework.cms.member.service.MemberService;
import egovframework.cms.menu.service.MenuService;
import egovframework.cms.popup.service.PopupService;
import egovframework.common.controller.DefaultController;
import egovframework.common.util.StringUtil;


/**
 * 메인화면 컨트롤러 클래스를 정의한다.
 * @author ICT융합사업부 개발팀 방지환
 * @since 2015.01.26
 * @version 1.0
 * @see <pre>
 * 
 *  == 개정이력(Modification Information) ==
 *  수정일           수정자          수정내용
 *  ---------    --------    ---------------------------
 *  2015.01.26   방지환          최초 생성
 *  2019.02.13   이충렬          url , 로직 수정
 * </pre>
 */
@Controller
public class MainController extends DefaultController {

  private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name = "MemberService")
	private MemberService memberService;

	@Resource(name = "BoardService")
	private BoardService boardService;

	@Resource(name = "popupService")
	private PopupService popupService;

	@Resource(name = "BannerService")
	private BannerService bannerService;
	
	@Resource(name = "MenuService")
	private MenuService menuService;

	@Resource(name = "CalendarService")
	private CalendarService calendarService;
	
	/**
	 * 메인화면
	 * @return ModelAndView
	 * @param commandMap : 모든 파라미터 정보, method = GET
	 * @exception Exception
	 */
	@RequestMapping(value ={"/web","/web/main"})
	public ModelAndView getChargerGroupList() throws Exception {
		/**************** 프로그램 로직 ****************/
		HttpSession session = request.getSession(true);
		if (session.getAttribute("footerInfo") == null) {
			List<Map<String, Object>> list = getComCodeList("197");
			session.setAttribute("footerInfo", list);
			List<Map<String, Object>> errorfoot = getComCodeList("203");
			session.setAttribute("errorfoot", errorfoot);
		}
		
		commandMap.put("GROUP_ID", "9999");
		List<Map<String,Object>> calList = calendarService.getList(commandMap);
		
		/* 팝업 */
		List<Map<String, Object>> popup = popupService.mainPopupList(commandMap);
		
		List<Map<String, Object>> mainMenuCk = menuService.getMainMenuCheck(commandMap);
		/*flahMap 사용*/
		Map<String,Object> flashMap = new HashMap<String,Object>();
		getFlashMap(flashMap,request);
		String resultMessage = StringUtil.noNull(flashMap.get("msg"));
		/**************** 프로그램 로직 ****************/
		
		/************** ModelView 로직 **************/
		String resultURL = "/cms/main/main";
		ModelAndView mav = new ModelAndView();
		mav.addObject("popup",popup);
		mav.addObject("mainMenuCk",mainMenuCk);
		mav.addObject("resultMessage",resultMessage);
		mav.addObject("calList",calList);
		
		mav.setViewName(resultURL);
		/************** ModelView 로직 **************/
		return mav;
	}	

}
