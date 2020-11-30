<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<div class="tit MgT10">검색결과 <span class="toCount fr">(총 <em class="txt_orage"><c:out value="${totalCnt}" /></em>건)</span></div>
<table class="table_basic table01">
    <caption>출장신청서</caption>
    <colgroup>
        <col style="width: 5%;" />
        <col style="width: 25%;" />
        <col style="width: 25%;" />
        <col style="width: 25%;" />
        <col />
    </colgroup>
    <thead>
        <tr>
            <th>번호</th>
            <th>이름</th>
            <th>일자</th>
            <th>출장지</th>
            <th>상태</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="list" varStatus="stat">
        <tr onclick="goView('<c:out value="${list.BIZ_ID}"/>' , 'View');return false;" style="cursor: pointer;">
            <td><c:out value="${list.RS}"/></td>
            <td><c:out value="${list.USER_NM}"/></td>
            <td><c:out value="${list.TRIPDAY}"/></td>
            <td><c:out value="${list.VISITS}"/></td>
            <td><c:out value="${list.STEP}"/></td>
        </tr>
    </c:forEach>
    <c:if test="${empty list }">
        <tr>
            <td colspan="5" >자료가 없습니다.</td>
        </tr>
    </c:if>         
    </tbody>
</table>
<%@include file="/WEB-INF/jsp/common/pager.jsp"%>
