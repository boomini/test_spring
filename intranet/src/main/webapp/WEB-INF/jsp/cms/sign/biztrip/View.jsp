<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function(){
});
function goSign(sign) {
	
	var frm = document.editForm;
	if (!gfnValidate(frm)){
		return;
	}
	frm.mode.value = "Sign";
	frm.SIGN_YN.value = sign;
	frm.action = "/cms/sign/biztrip/cud";
	frm.submit();
};
function goEdit(){
	var frm = document.editForm;
	if (!gfnValidate(frm)){
		return;
	}
	frm.action = "/cms/sign/biztrip/edit";
	frm.submit();
}
function goPrint(){
	gfnPopup('/cms/sign/biztrip/report?BIZ_ID=${result.BIZ_ID}','800','850' , '0','reportViewer');
};
</script>

<form name="editForm" id="editForm" method="post">
	    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>
	    <input type="hidden" name="SIGN_YN"/>
		<input type="hidden" name="mode"/>
	    <input type="hidden" name="BIZ_ID" value="<c:out value="${result.BIZ_ID}"/>"/>

	    <table class="table02">
	        <caption>유류비</caption>
	        <colgroup>
	            <col style="width: 15%;" />
	            <col style="width: 35%;" />
	            <col style="width: 15%;" />
	            <col />
	        </colgroup>
	        <tbody>
	        	<tr>
	        		<th>결재 라인</th>
	        		<td colspan="4">
	        			<div id="LINE" class="H250 overScroll-Y">
	        				<table class="table_basic table01">
	        					<colgroup>
	        						<col class="W60p"/>
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
        		<th colspan="4" class="AC">
        			 출장신청서 
        		</th>
        	</tr>
        	<tr>
        		<th>성명</th>
        		<td><c:out value="${result.USER_NM}"/></td>
        		<th>직위</th>
        		<td><c:out value="${result.AUTH}"/></td>
        	</tr>
        	<tr>
        		<th>부서</th>
        		<td><c:out value="${result.ORG}"/></td>
        		<th>담당업무</th>
        		<td><c:out value="${result.JOBS}"/></td>
        	</tr>
        	<tr>
        		<th>출장목적</th>
        		<td><c:out value="${result.PURPOSE}"/></td>
        		<th>출장기간</th>
        		<td><c:out value="${result.STARTDAY}"/> ~ <c:out value="${result.ENDDAY}"/></td>
        	</tr>
        	<tr>
        		<th>출장지</th>
        		<td><c:out value="${result.VISITS}"/></td>
        		<th>출장중연락처</th>
        		<td><c:out value="${result.PNUM}"/></td>
        	</tr>
	        </tbody>
	    </table>
</form>
<div class="t_right">
	<c:choose>
 		<c:when test="${result.E_MODE eq 'SIGN' }">
			<html:buttonAuth gubun="mod" script="goSign('Y');return false;" title="승 인"/>
	    	<html:buttonAuth gubun="mod" script="goSign('R');return false;" title="반 려"/>
		</c:when>
		<c:when test="${result.E_MODE eq 'SELF' }">
			<html:buttonAuth gubun="mod" script="goEdit();return false;" title="수 정"/>
		</c:when>
	</c:choose>
	<a href="" onclick="goPrint();return false;" class="btn_2">출 력</a>
    <%-- <a href="/cms/sign/biztrip<c:out value='${parameters}'/>" class="btn_2">목 록</a> --%>
    <a href="javascript:history.back();" class="btn_2">목 록</a>
</div>


