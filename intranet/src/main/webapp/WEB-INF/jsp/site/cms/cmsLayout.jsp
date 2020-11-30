<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>test</title>
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

<script type="text/javascript" src="<c:url value="/js/shortcut/jquery.shortcut-0.1.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/shortcut/shortcut.js"/>"></script>

<script type="text/javascript" src="<c:url value="/js/jquery.blockUI.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.fileDownload.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.tablefix_1.0.0.js"/>"></script>

<%-- 하이차트 --%>
<script src="<c:url value="/js/highcharts/highcharts.js" />"></script>
<script src="<c:url value="/js/highcharts/highcharts-more.js" />"></script>
<script src="<c:url value="/js/highcharts/modules/exporting.js" />"></script>
<script src="<c:url value="/js/highcharts/modules/no-data-to-display.js" />"></script>

<link href="<c:url value="/jfile/resources/swfupload/css/custom.css" />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value="/jfile/resources/jwork/jwork.fileUpload.js" />"></script>
<script type="text/javascript" src="<c:url value="/jfile/resources/jwork/jwork.fileDownload.js" />"></script>
<script type="text/javascript" src="<c:url value="/jfile/resources/swfupload/swfupload/swfupload.js" />"></script>
<script type="text/javascript" src="<c:url value="/jfile/resources/swfupload/js/swfupload.queue.js" />"></script>
<%--//멀티 파일 업로드  --%>
<script src="/ckeditor/ckeditor.js"></script>
<script>
$(function() {
    var msg = $("#resultMessage").val();
    if (msg != null && msg != "") {
        alert(msg);
        $("#resultMessage").val("");
    }
}); 
</script>
</head>
<body>
<form name="comform">
<input type="hidden" name="resultMessage" id="resultMessage" value="<c:out value="${resultMessage}"/>"/>
</form>
<div id="wrap" class="sty02">
    <!--헤더-->
    <%@include file="/WEB-INF/jsp/site/cms/header.jsp" %>
    <!-- 헤더 끝--> 
    <!-- 서브 전체 시작 -->
    <div id="content_wrap" class="fullLayout">
        <div class="content contLayout" id="contentArea"> 
            <!-- Left 메뉴 시작 -->
            <div id="leftmenu">
                <div class="left_top">
                	<span class="left_title"><c:out value="${cmsLeftMenuList[0].MENU_NM}"/></span><%--<span class="left_eng engfont">datainput</span>--%>
				</div>
                <div class="left_nav">
                    <ul>
                    <c:if test="${not empty cmsLeftMenuList }">
                        <c:forEach var='EO' items='${cmsLeftMenuList}' varStatus='status'>
                        <c:if test='${EO.LEVEL==2}'>
                            <c:set var="classOn" value=""/>
                            <c:if test='${menuLocationList[1].MENU_NO==EO.MENU_NO}'>
                            <c:set var="classOn" value=" on"/>
                            </c:if>
                            <li>
                                <c:choose>
                                    <c:when test="${EO.CNTNTS_TY == 'D'}"><a href=""  title="<c:out value="${EO.MENU_NM}"/>" class="depth2 <c:out value="${classOn}"/>"><c:out value="${EO.MENU_NM}"/></a></c:when>
                                    <c:when test="${EO.CNTNTS_TY == 'L'}"><a href="<c:out value='${EO.LINK_URL}'/><c:if test="${!fn:contains( EO.LINK_URL, '?' ) }">?</c:if><c:if test="${fn:contains( EO.LINK_URL, '?' ) }">&amp;</c:if>pMENU_NO=<c:out value="${EO.MENU_NO}"/>" <c:if test='${EO.POPUP_AT=="Y" }'> target="_blank" </c:if> title="새창열림:<c:out value="${EO.MENU_NM}"/>" class="depth2 <c:out value="${classOn}"/>"><c:out value="${EO.MENU_NM}"/></a></c:when>
                                    <c:otherwise><a href="/web/link/?pMENU_NO=<c:out value='${EO.MENU_NO}'/>"  title="<c:out value="${EO.MENU_NM}"/>" class="depth2 <c:out value="${classOn}"/>"><c:out value="${EO.MENU_NM}"/></a></c:otherwise>
                                </c:choose>
                                <c:if test="${EO.CNT > 0}">
                                <ul class="depth3">
                                    <c:forEach var='EEO' items='${cmsLeftMenuList}' varStatus='status2'>
                                    <c:if test='${EEO.UPPER_MENU_NO==EO.MENU_NO}'>
                                    <c:set var="classOn" value=""/>
                                    <c:if test='${menuLocationList[2].MENU_NO==EEO.MENU_NO}'>
                                    <c:set var="classOn" value=" class='on'"/>
                                    </c:if>
                                        <c:if test='${EEO.CNTNTS_TY != "L"}'><li ${classOn}><a href="/web/link/?pMENU_NO=<c:out value='${EEO.MENU_NO}'/>"  title="<c:out value="${EEO.MENU_NM}"/>"><c:out value="${EEO.MENU_NM}"/></a></li></c:if>
                                        <c:if test='${EEO.CNTNTS_TY == "L"}'><li ${classOn}><a href="<c:out value='${EEO.LINK_URL}'/><c:if test="${!fn:contains( EEO.LINK_URL, '?' ) }">?</c:if><c:if test="${fn:contains( EEO.LINK_URL, '?' ) }">&amp;</c:if>pMENU_NO=<c:out value="${EEO.MENU_NO}"/>" <c:if test='${EEO.POPUP_AT=="2" }'> target="_blank" </c:if> title="<c:out value="${EEO.MENU_NM}"/>"><c:out value="${EEO.MENU_NM}"/></a></li></c:if>
                                    </c:if>
                                    </c:forEach>
                                </ul>
                                </c:if>
                            </li>
                         </c:if>   
                        </c:forEach>
                    </c:if>
                    </ul>     
                </div>
            </div>
            <!--left 메뉴 끝--> 
            
            <!-- 서브 컨텐츠 시작 -->
            <div class="subcont2"> 
                <!-- Title, Location 시작 -->
                <div class="cont_top">
                    <p class="subtit"><c:out value="${menuMap.MENU_NM}"/></p>
                    <ul class="cont_nav">
                    <li class="engfont" onclick="location.href='/';return false;"><a href="/" title="홈으로">HOME</a></li>
                    <c:forEach items="${menuLocationList}" var="EO" varStatus="st">
                    <li><a href="/web/link/?pMENU_NO=<c:out value='${EO.MENU_NO}'/>"><c:out value='${EO.MENU_NM}'/></a></li>
                    </c:forEach>
                    </ul>
                </div>
                <!-- Title, Location 끝 //--> 
                <!-- 본문 시작 -->
                <div id="cont"> 
                    <!-- 탭 시작 -->
                    <c:if test="${not empty menuLocationList[3]}">
                    <ul class="tabs">
                        <c:forEach var='tabEO' items='${cmsLeftMenuList}' varStatus='vs'>
                            <c:set var="classOn2" value=""/>
                            <c:if test='${tabEO.UPPER_MENU_NO== menuLocationList[2].MENU_NO}'>
                            <c:if test='${menuLocationList[3].MENU_NO==tabEO.MENU_NO}'>
                                <c:set var="classOn2" value=" class='active'"/>
                            </c:if>
                                <li${classOn2}><a href="/web/link/?pMENU_NO=<c:out value='${tabEO.MENU_NO}'/>"  title="<c:out value="${tabEO.MENU_NM}"/>"><c:out value="${tabEO.MENU_NM}"/></a></li>
                            </c:if>
                        </c:forEach>
                    </ul>
                    </c:if>
                    <tiles:insertAttribute name="body" />
                </div>
                <!-- 본문 끝 --> 
            </div>
            <!-- 서브 컨텐츠 끝 //--> 
        </div>
    </div>
    <!-- 서브 전체 끝 //--> 
    <!-- Footer 시작 -->
    <%@include file="/WEB-INF/jsp/site/cms/footer.jsp" %>
    <!-- Footer 끝 // --> 
</div>
<script>
$(function(){
    //메뉴 로그저장
    gfnInsertMenuLog('${menuMap.MENU_NO}');
});
</script>
</body>
</html>
