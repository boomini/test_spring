<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>LCY 정보시스템 : <c:out value="${vo.POPUP_NM}" /></title>
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/BasicSet.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/common.css" />"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/sub.css" />" />
<script type="text/javascript" src="<c:url value="/js/jquery-1.11.3.min.js" />"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.blockUI.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.fileDownload.js"/>"></script>
<style>
.popContent {
    width: 100%;
    padding: 2px;
    text-align: left;
    height: auto;
    font-size: 14px;
    line-height: 22px;
    color: #000;
}
.popCont .NumDesc { background: #f7f7f7; border: 1px solid #d2d2d2; padding: 5px; overflow-y: scroll;} 
</style>
<script>
    //엑셀 다운로드
    function goExcel(){
        excelDownLoad( '/cms/bigDataExcelDown',"excelDownForm");
    }
</script>
</head>
<body>
<div id="wrap" class="sty02">   
    <div class="popWarp">
        <p class="popTit"><c:out value="${vo.POPUP_NM}"/><span class="popClose"><a href="" title="닫기" onclick="self.close();">닫기</a></span></p>
        <div class="popCont">
            <div class="NumDesc" style="height: ${vo.POPUP_HG-85}px">
                <div>
                    <c:if test="${!empty vo.FILE_ID}">
                        <a href="" onclick="golink('${vo.LINK}');return false;"><img id="popimg" src="/jfile/readDownloadFile.do?fileId=${vo.FILE_ID}&fileSeq=1" alt="<c:out value="${vo.POPUP_NM}" />" /></a>
                    </c:if>
                </div>
                <c:if test="${not empty vo.POPUP_CN}">
                    <div class="popContent">
                        <html:xss>
                            <c:out value="${vo.POPUP_CN}" escapeXml="false" />
                        </html:xss>
                    </div>
                </c:if>
            </div>
        
            <div class="AR MgT5"><input type="checkbox" onclick="gfnCloseWin('pop${vo.POPUP_NO}')" id="pop" style="vertical-align: middle;" /> <label for="pop" class="labelPop">오늘하루 보이지 않기&nbsp;</label></div>
        </div>
    </div>
</div>
</body>
</html>
