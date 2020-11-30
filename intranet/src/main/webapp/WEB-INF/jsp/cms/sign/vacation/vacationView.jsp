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
	frm.action = "/cms/sign/vac/cud";
	frm.submit();
};
function goEditView(){
	var frm = document.editForm;
	if (!gfnValidate(frm)){
		return;
	}
	frm.action = "/cms/sign/vac/edit";
	frm.submit();
}
function goPrint(){
	gfnPopup('/cms/sign/vac/report?VACKEY=${sign.VACKEY}','800','850' , '0','reportViewer');
};


</script>

<form name="editForm" id="editForm" method="post">
    
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>
	<input type="hidden" name="mode"/>
    <input type="hidden" name="VACKEY" value="${sign.VACKEY}"/>
    <input type="hidden" name="SIGN_YN"/>
    
    <table class="table02">
        <caption>휴가신청서 등록</caption>
        <colgroup>
            <col style="width: 15%;" />
            <col style="width: 35%;" />
            <col style="width: 15%;" />
            <col style="width: 35%;" />
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
				<th>부서</th>       
				<td>
				<c:out value="${sign.ORG}"/>
				</td>
				<th>직급</th>
				<td>
				<c:out value="${sign.AUTH}"/>
				</td>     
            </tr>
            <tr>
				<th>휴가중 연락처</th>       
				<td>
				<c:out value="${sign.PNUM}"/>
				</td>
				<th>성명</th>
				<td>
				<c:out value="${sign.USER_NM}"/>
				<input type="hidden" name="USER_NM" value='<c:out value="${sign.USER_NM}"/>'/>
				</td>     
            </tr>
            <tr>
            	<th><span class="iCheck"/>휴가구분</th>
				<td colspan="3" >
					<c:out value="${sign.VACNM}"/>
				</td>
            </tr>
            <tr>
            	<th><span class="iCheck"/>일시</th>
				<td colspan="3" >
				<c:out value="${sign.VACDAY}"/>
				</td>
            </tr>
            <tr>
            	<th><span class="iCheck"/>사유</th>
				<td colspan="3" >
					<c:out value="${sign.REASON}"/>
				</td>
            </tr>
        </tbody>
    </table>
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
    <%-- <a href="/cms/sign/vac<c:out value='${parameters}'/>" class="btn_2">목 록</a> --%>
    <a href="javascript:history.back();" class="btn_2">목 록</a>
</div>
