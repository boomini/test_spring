package egovframework.common.chart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.common.chart.service.HighChartService;
import egovframework.common.util.StringUtil;
/**
 * 	하이차트 컨트롤러
 *  @author 방지환
 *  @E-MAIL b8545@naver.com
 */
@Controller
public class HighChartController{
	
	static Logger logger = Logger.getLogger(HighChartController.class);

	@Resource(name = "HighChartService")	
	private HighChartService highChartService;
	
	
	/**
	 * 차트 렌더링 Ajax
	 * @param request
	 * @param response
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/mt/chart", method=RequestMethod.POST)
	@SuppressWarnings({ "rawtypes", "unchecked" })
    public ModelAndView chartRendering(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> commandMap) throws Exception{
		
		List categories = new ArrayList();
		List series = new ArrayList();
		List seriesPie = new ArrayList();
		List seriesData = new ArrayList();
		
		String yAxis_id = StringUtil.noNull(commandMap.get("yId"));
		String tooltip_id = StringUtil.noNull(commandMap.get("tId"));
		String stn_id = StringUtil.noNull(commandMap.get("lgu"));
		String stn_ids[] = stn_id.split("_");
		String yAxis_ids[] = yAxis_id.split("_");
		String tooltip_ids[] = tooltip_id.split("_");
		List chartList = new ArrayList();
		boolean checkCategory = true;
		for(int i = 0; i < stn_ids.length ; i++){
			String temp = stn_ids[i];
			commandMap.put("lgu", temp);
			chartList =  highChartService.getChartList(commandMap);
				if(chartList.size() == 0){
					continue;	
				}else{
					if(checkCategory){
						setCategorie(chartList,categories);	
						checkCategory = false;
					}
					
				}
				if(yAxis_id.equals("") && tooltip_id.equals("")){
					series.add(setSeries(chartList));		
				}else if(!yAxis_id.equals("") && tooltip_id.equals("")){
					series.add(setSeries(chartList, yAxis_ids[i]));
					
				}else if(yAxis_id.equals("") && !tooltip_id.equals("")){
					series.add(setSeries(chartList, tooltip_ids[i],1));
					
				}else if(!yAxis_id.equals("") && !tooltip_id.equals("")){
					series.add(setSeries(chartList, yAxis_ids[i],tooltip_ids[i]));
				}
				
			
			//if(chartList.size() ==1){
				seriesData.add(setSeriesPie(chartList));
			//}
		}
		
		HashMap resultMap = new HashMap();
		resultMap.put("data", seriesData);
		seriesPie.add(resultMap);
		
        ModelAndView mav = new ModelAndView();
        mav.addObject("categories", categories);
        mav.addObject("series", series);
        mav.addObject("seriesPie", seriesPie);
		mav.setViewName("jsonView2");
		return mav;
		
    }
	
	/**
	 * 카테고리 세팅 - X축
	 * @param chartList
	 * @param categories
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void setCategorie(List chartList, List categories){
		for(int i=0 ;  i < chartList.size() ; i ++){
			HashMap rs = (HashMap)chartList.get(i);
			categories.add(rs.get("CATEGORY"));
		}
	}
	
	/**
	 * data 세팅
	 * @param chartList
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map setSeries(List chartList){
		HashMap resultMap = new HashMap();
		List dataList = new ArrayList();
		for(int i=0 ;  i < chartList.size() ; i ++){
			HashMap rs = (HashMap)chartList.get(i);
			String name = StringUtil.noNull(rs.get("NAME"));
			Double data = StringUtil.toDouble((rs.get("DATA")));
			if(i==0){
				resultMap.put("name", name);
			}
			if(rs.get("DATA") != null && rs.get("DATA") != "null"){
				dataList.add(data);
			}else{
				dataList.add("");
			}
			//dataList.add(data);
		}
		resultMap.put("data", dataList);
		return resultMap;
	}
	
	/**
	 * data 세팅-이중축 -y
	 * @param chartList
	 * @param yAxis
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map setSeries(List chartList, String yAxis){
		HashMap resultMap = new HashMap();
		List dataList = new ArrayList();
		for(int i=0 ;  i < chartList.size() ; i ++){
			HashMap rs = (HashMap)chartList.get(i);
			String name = StringUtil.noNull(rs.get("NAME"));
			Double data = StringUtil.toDouble((rs.get("DATA")));
			if(i==0){
				resultMap.put("name", name);
				resultMap.put("yAxis", StringUtil.toInt(yAxis));
			}
			if(rs.get("DATA") != null && rs.get("DATA") != "null"){
				dataList.add(data);
			}else{
				dataList.add("");
			}
			//dataList.add(data);
		}
		resultMap.put("data", dataList);
		return resultMap;
	}
	/**
	 * data 세팅-이중축 -y
	 * @param chartList
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map setSeries(List chartList, String tooltipFix, int gu){
		HashMap resultMap = new HashMap();
		List dataList = new ArrayList();
		for(int i=0 ;  i < chartList.size() ; i ++){
			HashMap rs = (HashMap)chartList.get(i);
			String name = StringUtil.noNull(rs.get("NAME"));
			Double data = StringUtil.toDouble((rs.get("DATA")));
			if(i==0){
				HashMap toolip = new HashMap();
				toolip.put("valueSuffix", tooltipFix);
				resultMap.put("tooltip", toolip);
				
			}
			if(rs.get("DATA") != null && rs.get("DATA") != "null"){
				dataList.add(data);
			}else{
				dataList.add("");
			}
			//dataList.add(data);
		}
		resultMap.put("data", dataList);
		return resultMap;
	}
	/**
	 * data 세팅-이중축 - y+tooltip
	 * @param chartList
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map setSeries(List chartList, String yAxis, String tooltipFix){
		HashMap resultMap = new HashMap();
		List dataList = new ArrayList();
		for(int i=0 ;  i < chartList.size() ; i ++){
			HashMap rs = (HashMap)chartList.get(i);
			String name = StringUtil.noNull(rs.get("NAME"));
			Double data = StringUtil.toDouble((rs.get("DATA")));
			if(i==0){
				resultMap.put("name", name);
				resultMap.put("yAxis", StringUtil.toInt(yAxis));
				
				HashMap toolip = new HashMap();
				toolip.put("valueSuffix", tooltipFix);
				resultMap.put("tooltip", toolip);
				
			}
			if(rs.get("DATA") != null && rs.get("DATA") != "null"){
				dataList.add(data);
			}else{
				dataList.add("");
			}
			//dataList.add(data);
		}
		resultMap.put("data", dataList);
		return resultMap;
	}
	
	/**
	 * pie data 세팅
	 * @param chartList
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map setSeriesPie(List chartList){
		HashMap resultMap = new HashMap();
		for(int i=0 ;  i < chartList.size() ; i++){
			HashMap rs = (HashMap)chartList.get(i);
			String name = StringUtil.noNull(rs.get("NAME"));
			Double data = StringUtil.toDouble((rs.get("DATA")));
			resultMap.put("name", name);
			resultMap.put("y", data);
			break;
		}
		return resultMap;
	}
	
	
	
}
