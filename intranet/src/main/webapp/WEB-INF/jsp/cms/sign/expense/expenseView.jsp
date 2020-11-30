<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function(){
});
//저장 및 수정
function goEdit(sign) {
	var frm = document.editForm;
	if (!gfnValidate(frm)){
		return;
	}
	frm.mode.value = "Sign";
	frm.SIGN_YN.value = sign;
	frm.action = "/cms/sign/expense/cud";
	frm.submit();
};
function goPrint(){
	gfnPopup('/cms/sign/expense/report?EXPENSE_ID=${sign.EXPENSE_ID}','800','850' , '0','reportViewer');
};
function goEditView(){
	var frm = document.editForm;
	if (!gfnValidate(frm)){
		return;
	}
	frm.action = "/cms/sign/expense/edit";
	frm.submit();
}
</script>

<ul class="dep2_tab">
    <li><a href="#dep2_tab1">지출결의서</a></li>
    <li><a href="#dep2_tab2">지출내역</a></li>
</ul>
<form name="editForm" id="editForm" method="post">

	<input type="hidden" name="SIGN_YN"/>
	<input type="hidden" name="EXPENSE_ID" value="${sign.EXPENSE_ID}"/>

	<div id="dep2_tab1" class="dep2_content">
	    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>
		<input type="hidden" name="mode"/>
	    <table class="table02">
	        <caption>지출결의서</caption>
	        <colgroup>
	            <col style="width: 15%;" />
	            <col style="width: 35%;" />
	            <col style="width: 15%;" />
	            <col />
	        </colgroup>
	        <tbody>
	        	<tr>
	        		<th>결재 라인</th>
        		<td colspan="3">
        			<div id="LINE" class="H150 overScroll-Y">
        				<table class="table_basic table01">
        					<colgroup>
					            <col/>
					        </colgroup>
        					<tbody id="lineBody">
        						<c:forEach items="${signList}" var="list" varStatus="stat">
        						<tr>
        							<td>
        								<c:out value="${list.USER_NM}"/> - <c:out value="${list.SIGN_STEP}"/>
										<input type='hidden' class='lineId' name='lineId' value='${list.LINE_ID}'/>
									</td>
								</tr>
        						</c:forEach>
        					</tbody>
        				</table>
        			
        			</div>
        		</td>
	        	</tr>
	        	<tr>
	        		<th colspan="4" class="AC">비품 등 지출 결의서</th>
	        	</tr>
	        	<tr>
	        		<th>성명</th>
	        		<td> <c:out value="${sign.USER_NM}"/></td>
	        		<th>직급</th>
	        		<td> <c:out value="${sign.AUTH}"/></td>
	        	</tr>
	        	<tr>
	        		<th>부서</th>
	        		<td> <c:out value="${sign.ORG}"/> </td>
	        		<th>일자</th>
	        		<td>
	        			 <c:out value="${sign.EXPENSE_DATE}"/>
	        		</td>
	        	</tr>
	        	<tr>
	        		<th>계좌번호</th>
	        		<td colspan="3">
	        			 <c:out value="${sign.BANK}"/>
	        		</td>
	        	</tr>
	        </tbody>
	    </table>
	</div>
	<div id="dep2_tab2" class="dep2_content">
		<table class="table02">
			<caption>지출 내역</caption>
	        <colgroup>
	            <col style="width: 30%;" />
	            <col style="width: 30%;" />
	            <col />
	        </colgroup>
	        <tbody id="List_body">
				<tr>
					<th>내 역</th>
					<th>금 액</th>
					<th>비 고 </th>
				</tr>
				<c:forEach items="${expenseList}" var="list" varStatus="stat">
					<tr>
						<td><c:out value="${list.COASTNM}"/></td>
						<td><c:out value="${list.COAST}"/>원</td>
						<td><c:out value="${list.NOTE}"/></td>
					</tr>
				</c:forEach>
	        </tbody>
		</table>
	</div>
</form>
<div class="t_right">
    <c:choose>
		<c:when test="${sign.E_MODE eq 'SIGN' }">
			<html:buttonAuth gubun="mod" script="goEdit('Y');return false;" title="승 인"/>
	    	<html:buttonAuth gubun="mod" script="goEdit('R');return false;" title="반 려"/>
		</c:when>
		<c:when test="${sign.E_MODE eq 'SELF' }">
			<html:buttonAuth gubun="mod" script="goEditView();return false;" title="수 정"/>
		</c:when>
	</c:choose>
	
	<a href="" onclick="goPrint();return false;" class="btn_2">출 력</a>
    <%-- <a href="/cms/sign/expense<c:out value='${parameters}'/>" class="btn_2">목 록</a> --%>
    <a href="javascript:history.back();" class="btn_2">목 록</a>
</div>
