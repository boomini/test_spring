<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>LCY 정보시스템 : 게시판 목록</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/BasicSet.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/common.css" />"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/sub.css" />" />
<script type="text/javascript" src="<c:url value="/js/jquery-1.11.3.min.js" />"></script>
<script type="text/javascript" src="/js/jquery.tablefix_1.0.0.js"></script>
<script>
$(function() {
  $('#tablefix3').tablefix({width: 580, height: 300, fixRows: 1});
  
});
</script>
</head>
<body>
<div id="wrap" class="sty02">	
    <div class="popWarp">
    	<p class="popTit">팝업타이틀<span class="popClose"><a href="" title="닫기" onclick="self.close();">닫기</a></span></p>
        <div class="popCont">
        <table summary="게시판명, 게시판 종류, 게시판 설명" class="table_basic table01 W580" id="tablefix3">
                <caption>게시판 리스트</caption>
                <colgroup>
                    <col width="30%" />
                    <col width="20%" />
                    <col />
                </colgroup>
                <thead>
                    <tr>
                        <th>게시판 명</th>
                        <th>게시판 종류</th>
                        <th>게시판 설명</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${dataList}" var="EO" varStatus="stat">
                        <tr>
                            <td><a href="#" onclick="opener.setBoard('<c:out value='${EO.BBS_NO}'/>','<c:out value='${EO.BBS_NM}'/>');self.close();"><c:out value='${EO.BBS_NM}' /></a></td>
                            <td><a href="#" onclick="opener.setBoard('<c:out value='${EO.BBS_NO}'/>','<c:out value='${EO.BBS_NM}'/>');self.close();"><c:out value='${EO.BBS_TY_NM}' /></a></td>
                            <td><a href="#" onclick="opener.setBoard('<c:out value='${EO.BBS_NO}'/>','<c:out value='${EO.BBS_NM}'/>');self.close();"><c:out value='${EO.BBS_DC}' /></a></td>
                        </tr>
                    </c:forEach>
                    <c:if test='${empty dataList}'>
                        <tr>
                            <td colspan="3" class="AC borR0">검색결과가 없습니다.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>