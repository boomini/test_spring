<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>LCY 정보시스템 : 주소 검색</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/BasicSet.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/common.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/sub.css" />" />
<script type="text/javascript" src="<c:url value="/js/jquery-1.11.3.min.js" />"></script>
<script>
function goSearch(){
	$("#frm").submit();
}
function goClear(){
	$("#searchWord").val("");
	$("#frm").submit();
}
function goAction(admCode , admNm){
	opener.setAdmCode(admCode,admNm);
	self.close();
}
</script>
</head>
<body>
    <div id="wrap" class="sty02">
        <div class="popWarp">
            <p class="popTit">
                우편번호 검색<span class="popClose"><a href="" title="닫기" onclick="self.close();">닫기</a></span>
            </p>
            
            <div class="popCont">
                <form action="/cms/codeUtil/admCodePop" method="post" id="frm" name="frm">
                <div class="search_box MgT10">
                <html:selectList name='searchType' optionValues='gu1|gu2' optionNames='행정구역|행정코드' defaultValue="" selectedValue='${param.searchType}' title="조회구분선택" script='class="W100"' />
                    <input title="text" type="text" name="searchWord" id="searchWord" class="W300 entrKey" value="<c:out value='${param.searchWord}'/>"> 
                    <a class="btn_2" href="" onclick="goSearch();return false;">조회</a>
                    <c:if test="${not empty param.searchWord}">
                    <a href="" onclick="goClear();return false;" class="btn_4">초기화</a>
                    </c:if>
                </div>
                <table summary="우편번호검색" class="table_basic">
                    <caption>우편번호검색</caption>
                    <colgroup>
                        <col style="width: 8%"/>
                        <col style="width: 20%"/>
                        <col/>
                        <col style="width: 13%"/>
                    </colgroup>
                    <thead>
                        <tr>
                            <th>순번</th>
                            <th>행정코드</th>
                            <th>행정구역</th>
                            <th>선택</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="EO" varStatus="stat">
                            <tr>
                                <td><c:out value='${pager.totalCount - ((pager.currentPage - 1) * pager.pageSize) - status.index}' /></td>
                                <td><c:out value='${EO.ADM_CD}' /></td>
                                <td class="AL"><c:out value='${EO.ADM_NM}' /></td>
                                <td>
                                    <a href="" onClick="goAction('${EO.ADM_CD}' , '${EO.ADM_NM}' );return false;" class="btn_3">추가</a>
                                    <input type="hidden" name="PESTICIDE_SEQ" value="<c:out value="${EO.PESTICIDE_SEQ}"/>">
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test='${empty list}'>
                            <tr>
                                <td colspan="4" class="AC borR0">검색결과가 없습니다.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
                </form>
                <%@include file="/WEB-INF/jsp/common/pager.jsp"%>
            </div>
        </div>
    </div>
</body>
</html>