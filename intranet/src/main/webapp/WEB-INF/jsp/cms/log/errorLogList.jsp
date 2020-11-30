<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
	function fnLogFileDown(fileNm) {
		$("#fileNm").val(fileNm);
		$("#logFileForm").attr("action","/cms/errorLog/logFileDown");
		$("#logFileForm").submit();
	}
	function fnLogFileDel(fileNm) {
		if(!confirm("파일을 삭제 하시겠습니까?")) return;
		$("#fileNm").val(fileNm);
		$("#logFileForm").attr("action","/cms/errorLog/logFileDel");
		$("#logFileForm").submit();
	}
</script>
<form name="logFileForm" id="logFileForm" method="post" action="">
<input name="fileNm" id="fileNm" type="hidden">
<input name="pMENU_NO" id="pMENU_NO" type="hidden" value="${param.pMENU_NO}">
</form>
<div class="tit MgT10">검색결과 <span class="toCount fr">(총 <em class="txt_orage"><c:out value="${fn:length(logList)}" /></em>건)</span></div>
<table class="table_basic table01" summary="번호, 구분, 아이디, 아이피, 접속시간">
    <colgroup>
        <col style="width: 15%" />
        <col />
        <col style="width: 15%" />
        <col style="width: 15%" />
    </colgroup>
    <thead>
        <tr>
            <th>번호</th>
            <th>파일명</th>
            <th>사이즈</th>
            <th>삭제 처리</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${logList}" var="EO" varStatus="stat">
            <tr>
                <td><c:out value="${stat.count}" /></td>
                <td><a href=""  onClick="fnLogFileDown('<c:out value="${EO.fileNm}"/>');return false;"><c:out value="${EO.fileNm}"/></a></td>
                <td><c:out value="${EO.fileSize}"/> kb</td>
                <td><c:if test="${menuMap.DELETE_AUTHOR_AT == 'Y'}"><a href=""  onClick="fnLogFileDel('<c:out value="${EO.fileNm}"/>');return false;" class="btn_3">삭제</a></c:if></td>
            </tr>
        </c:forEach>
        <c:if test="${empty logList }">
            <tr>
                <td colspan="3">자료가 없습니다.</td>
            </tr>
        </c:if>
    </tbody>
</table>