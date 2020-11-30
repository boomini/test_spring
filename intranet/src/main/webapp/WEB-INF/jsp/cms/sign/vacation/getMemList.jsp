<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/jsp/common/tagCommon.jsp"%>

<table class="table_basic table01">
    <caption>회원 정보</caption>
    <colgroup>
          <col style="width: 35%;"/>
          <col/>
    </colgroup>
    <thead>
       <tr>
        	<th>선택</th>
            <th>이름</th>
            </tr>
    </thead>
    <tbody>
   <c:forEach var="E" items="${resultList}" varStatus="status">
     <tr>
      	<td>
      		<html:buttonAuth gubun="etc" script="setLine('${E.USER_ID}' , '${E.USERNM}');return false;" title="추 가"/>
      	</td>
        <td>
            <c:out value="${E.USERNM}"/>
        </td>
      </tr>
     </c:forEach>
    <c:if test="${empty resultList }">
        <tr>
            <td colspan="2" >자료가 없습니다.</td>
        </tr>
    </c:if>         
    </tbody>
</table>

