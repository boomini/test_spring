<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>xxx</title>
<%--CSS--%>
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/BasicSet.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/common.css" />"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/sub.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/js/jquery-ui-1.11.4.custom/jquery-ui.css" />"/>
<%--javascript--%>
<script type="text/javascript" src="<c:url value="/js/jquery-1.11.3.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/login.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/common.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/cmnReady.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-ui-1.11.4.custom/jquery-ui.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/smartPop/jquery.smartPop.js" />"></script>
<script type="text/javascript" src="<c:url value="/com/js/ui.js"/>"></script>


<link href='/js/fullcal/core/main.css' rel='stylesheet' />
<link href='/js/fullcal/daygrid/main.css' rel='stylesheet' />
<script src='/js/fullcal/core/main.js'></script>
<script src='/js/fullcal/interaction/main.js'></script>
<script src='/js/fullcal/daygrid/main.js'></script>



<script>
$(function(){
	//팝업 관련    
	<c:forEach items="${popup}" var="popup">
	var url = '/web/pop?POPUP_NO=<c:out value="${popup.POPUP_NO}"/>';
	var name = '<c:out value="${popup.POPUP_NO}"/>';
	var option = 'top=<c:out value="${popup.OUTPT_LC_YAXS}"/>,left=<c:out value="${popup.OUTPT_LC_XAXS}"/>,width=<c:out value="${popup.POPUP_AR}"/>,height=<c:out value="${popup.POPUP_HG}"/>';
	if (gfnGetCookie('pop${popup.POPUP_NO}') == '') {
	  <c:if test="${popup.POPUP_TY == 'N' }">
	  var win = window.open(url, 'popup' + name, option);
	  if (win)
	    win.window.focus();
	  </c:if>
	}else{
	  $("#pop<c:out value="${popup.POPUP_NO}"/>").hide();//LayerPop경우
	}
	</c:forEach>
	
	goSearch();
})


function goSearch() {
		  var url = "/web/cal/Ajax";
		  var params = {};
		  var sucessFunc = function(data) {
			  var events = []
			  for(var i=0 ; i < data.length ; i++){
				  events.push(
					{
					  title : data[i].TITLE,
					  start : data[i].STARTDAY,
					  end : data[i].ENDDAY,
					  color: data[i].COLOR,
				  	}
				  );
			  }
			  setCal(events);
		  };
		  ajaxCall(url, params, sucessFunc);
		};
	
	function setCal(event){
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      plugins: [ 'dayGrid' ],
	      defaultDate: gfnToday(),
	      editable: false,
	      eventLimit: true, // allow "more" link when too many events
	      events: event
	    });
	    calendar.render();
	};
	
</script>
<style>
  #calbody {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  #calendar {
    max-width: 1700px;
    margin: 0 auto;
  }
</style>
</head>
<body>
	<div id="wrap" class="sty02">
    	<!-- 헤더 시작 -->
        <%@include file="/WEB-INF/jsp/site/cms/header.jsp" %>
        <!-- 헤더 끝 // -->
        <!-- 컨텐츠 전체 시작 -->
        <div id="content_wrap" class="fullLayout">
        	<div id="subMain" class="contLayout">
        	<!-- 
 				<div>
                    <ul class="iconMenu">
                    <c:set var="sub_list" value="${fn:length(mainMenuCk) / 2}" />
                    <fmt:parseNumber var="sub_size" value="${sub_list}" integerOnly="true"  />
                    
                        <c:forEach items="${mainMenuCk}"  var="eo" varStatus="st">
                            <c:if test="${st.count <= sub_size }">
                            <li <c:if test="${st.count ==4 or  fn:length(mainMenuCk) == st.count}">class="last"</c:if>>
                            <a href="/web/link/?pMENU_NO=<c:out value="${eo.MENU_NO}"/>">
                            <c:out value="${eo.MENU_NM}" escapeXml="false"/>
                            </a>
                            </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
                <div>
                    <ul class="iconMenu under">
                        <c:forEach items="${mainMenuCk}"  var="eo" varStatus="st">
                            <c:if test="${st.count > sub_size }">
                            <li <c:if test="${st.count ==8 or  fn:length(mainMenuCk) == st.count}">class="last"</c:if>>
                            <a href="/web/link/?pMENU_NO=<c:out value="${eo.MENU_NO}"/>">
                            <c:out value="${eo.MENU_NM}" escapeXml="false"/>
                            </a></li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            	 -->
            	<div id="calbody"><div id='calendar'></div></div>
        	</div>
        </div>
        <!-- 컨텐츠 전체 끝 // -->
        
    <!-- Footer 시작 -->
    <%@include file="/WEB-INF/jsp/site/cms/footer.jsp" %>
    <!-- Footer 끝 // --> 
    </div>
    <%--레이어 팝업 --%>
    <c:forEach items="${popup}" var="vo" varStatus="st">
        <c:if test="${vo.POPUP_TY == 'L' }">
            <div id="pop<c:out value="${vo.POPUP_NO}"/>" class="sty02" style="top: <c:out value="${vo.OUTPT_LC_YAXS}" default="0"/>px;left: <c:out value="${vo.OUTPT_LC_XAXS}" default="0"/>px;width: <c:out value="${vo.POPUP_AR}" default="0"/>px;height: <c:out value="${vo.POPUP_HG+5}" default="0"/>px;position:absolute;background-color:white;border:1px solid #d4d4d4;">
                <div class="popWarp">
                    <p class="popTit"><c:out value="${vo.POPUP_NM}"/><span class="popClose"><a href="" title="닫기" onclick='$("#pop${vo.POPUP_NO}").hide();return false;' onkeypress='$("#pop${vo.POPUP_NO}").hide();return false;'>닫기</a></span></p>
                    <div class="popCont">
                        <div class="NumDesc" style="height: ${vo.POPUP_HG-85}px">
                            <c:if test="${not empty vo.POPUP_CN}">
                                <div class="popContent">
                                    <html:xss>
                                        <c:out value="${vo.POPUP_CN}" escapeXml="false" />
                                    </html:xss>
                                </div>
                            </c:if>
                        </div>
                        <div class="AR MgT5"><input type="checkbox" onclick="gfnCloseLayer('pop${vo.POPUP_NO}');return false;" id="pop" style="vertical-align: middle;" /> <label for="pop" class="labelPop">오늘하루 보이지 않기&nbsp;</label></div>
                    </div>
                </div>
            </div>
        </c:if>
    </c:forEach>
</body>
</html>