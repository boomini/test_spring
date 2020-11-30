<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function() {
	gfnInitDatePickerTwo();//달력세팅(검색기간용)
});
function goSearch() {
	var d1 = Number($("#startDay").val().replace(/-/g, ''));
	var d2 = Number($("#endDay").val().replace(/-/g, ''));
	if (d2 - d1 < 0) {
		alert("검색기간이 잘못되었습니다.");
		$("#startDay").focus();
		return;
	}
	$("#searchForm").submit();
}

//초기화
function goClear() {
	$("#startDay").val('');
	$("#endDay").val('');
	$("#ACCES_SE").val('');
	$("#searchForm").submit();
}
</script>
<form name="searchForm" id="searchForm" action="/cms/accesLog/" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" />
    <div class="search_box">
        <html:selectList name='ACCES_SE' optionNames="전체|최초접속|로그인접속" optionValues="|1|2" selectedValue='${param.ACCES_SE}' title="접속구분" /> 
        <input type="text" size="10" class="MgL0 W80" name="startDay" id="startDay" value="<c:out value="${commandMap.startDay}" />" title="시작일"  /> 
        	~ 
        <input type="text" size="10" class="MgL0 W80" name="endDay" id="endDay" value="<c:out value="${commandMap.endDay}" />" title="종료일" />
         
        <a href="" onclick="goSearch();return false;" class="btn_2">조 회</a>
        <c:if test="${not empty param.startDay or  not empty param.endDay}">
            <a href="" onclick="goClear();return false;" class="btn_4">초기화</a>
        </c:if>
    </div>
</form>
<div class="tit MgT10">검색결과 <span class="toCount fr">(총 <em class="txt_orage"><c:out value="${pager.totalCount }" /></em>건)</span></div>
<table class="table_basic table01" summary="번호, 메뉴코드, 메뉴명, 아이피, 접속시간">
    <colgroup>
        <col style="width: 10%;" />
        <col style="width: 10%;" />
        <col/>
        <col style="width: 35%;" />
        <col style="width: 20%;" />
    </colgroup>
    <thead>
        <tr>
            <th>번호</th>
            <th>구분</th>
            <th>아이디</th>
            <th>아이피</th>
            <th>접속시간</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${accLogList}" var="EO" varStatus="stat">
            <tr>
                <td><c:out value="${pager.totalCount - ((pager.currentPage - 1) * pager.pageSize) - stat.index}" /></td>
                <td><c:out value="${EO.ACCES_SE_NM}" /></td>
                <td><c:out value="${EO.LOGIN_ID}" /></td>
                <td><c:out value="${EO.ACCES_IP}" /></td>
                <td><c:out value="${EO.ACCES_DT}" /></td>
            </tr>
        </c:forEach>
        <c:if test="${empty accLogList }">
            <tr>
                <td colspan="5">자료가 없습니다.</td>
            </tr>
        </c:if>
    </tbody>
</table>
<%@include file="/WEB-INF/jsp/common/pager.jsp"%>
