<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<div class="tit MgT10">검색결과 <span class="toCount fr">(총 <em class="txt_orage"><c:out value="${totalCnt}" /></em>건)</span></div>
<table class="table_basic table01">
    <caption>문서 목록</caption>
    <colgroup>
        <col style="width: 10%;" />
        <col style="width: 30%;" />
        <col style="width: 30%;" />
        <col />
    </colgroup>
    <thead>
        <tr>
            <th>번호</th>
            <th>이름</th>
            <th>구분</th>
            <th>제목</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="list" varStatus="stat">
        <tr onclick="goView('<c:out value="${list.DOC_ID}"/>' , '<c:out value="${list.URL}"/>');return false;" style="cursor: pointer;">
            <td><c:out value="${list.RNUM}"/></td>
            <td><c:out value="${list.USER_NM}"/></td>
            <td><c:out value="${list.TITLE}"/></td>
            <td><c:out value="${list.SUB_TITLE}"/></td>
        </tr>
    </c:forEach>
    <c:if test="${empty list }">
        <tr>
            <td colspan="4" >자료가 없습니다.</td>
        </tr>
    </c:if>         
    </tbody>
</table>
<%@include file="/WEB-INF/jsp/common/pager.jsp"%>
