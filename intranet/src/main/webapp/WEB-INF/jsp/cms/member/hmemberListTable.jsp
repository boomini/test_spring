<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<div class="tit MgT10">검색결과 <span class="toCount fr">(총 <em class="txt_orage"><c:out value="${totalCnt}" /></em>건)</span></div>
<table class="table_basic table01">
    <caption>회원 목록</caption>
    <colgroup>
        <col style="width: 5%;" />
        <col style="width: 15%;" />
        <col style="width: 20%;" />
        <col style="width: 20%;" />
        <col style="width: 20%;" />
        <col />
    </colgroup>
    <thead>
        <tr>
            <th>번호</th>
            <th>이름</th>
            <th>직급</th>
            <th>부서</th>
            <th>연락처</th>
            <th>이메일</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="list" varStatus="stat">
        <tr>
            <td><c:out value="${list.RNUM}"/></td>
            <td><c:out value="${list.USER_NM}"/></td>
            <td><c:out value="${list.AUTHOR_CODE_NM}"/></td>
            <td><c:out value="${list.ORG_NM}"/></td>
            <td><c:out value="${list.TELNO}"/></td>
            <td><c:out value="${list.EMAIL}"/></td>
            
        </tr>
    </c:forEach>
    <c:if test="${empty list }">
        <tr>
            <td colspan="6" >자료가 없습니다.</td>
        </tr>
    </c:if>         
    </tbody>
</table>
<%@include file="/WEB-INF/jsp/common/pager.jsp"%>
