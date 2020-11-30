<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="hana" uri="/WEB-INF/tld/hana.tld"%>

<div class="pagebtn"> 
<c:if test="${pager.prevPage > 0}">
    <hana:url var="pagerUrl" value="" htmlEscape="true">
        <hana:param name="page">1</hana:param>
    </hana:url>
    <a href="" class="start">&lt;&lt</a>
    <hana:url var="pagerUrl" value="" htmlEscape="true">
        <hana:param name="page">${pager.prevPage}</hana:param>
    </hana:url>
    <a href="">&lt;</a>
</c:if>
<c:forEach begin="${pager.startPage}" end="${pager.endPage}" var="page">
    <c:choose>
        <c:when test="${page == pager.currentPage}">
            <a class="select">${page}</a>
        </c:when>
        <c:otherwise>
            <hana:url var="pagerUrl" value="" htmlEscape="true">
            <hana:param name="page">${page}</hana:param>
            </hana:url>
            <a href="" >${page}</a>
        </c:otherwise>
    </c:choose>
</c:forEach>
<c:if test="${pager.nextPage > 0}">
    <hana:url var="pagerUrl" value="" htmlEscape="true">
        <hana:param name="page">${pager.nextPage}</hana:param>
    </hana:url>
    <a href="">&gt;</a>
    <hana:url var="pagerUrl" value="" htmlEscape="true">
        <hana:param name="page">${pager.totalPage}</hana:param>
    </hana:url>
    <a href="">&gt;&gt;</a>
</c:if>
</div>


