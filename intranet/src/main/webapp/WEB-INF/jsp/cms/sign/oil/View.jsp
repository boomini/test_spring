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
	frm.action = "/cms/sign/oil/cud";
	frm.submit();
};
function goEdit(){
	var frm = document.editForm;
	if (!gfnValidate(frm)){
		return;
	}
	frm.action = "/cms/sign/oil/edit";
	frm.submit();
}
function goPrint(){
	gfnPopup('/cms/sign/oil/report?OIL_ID=${oil.OIL_ID}','800','850' , '0','reportViewer');
};
</script>

<ul class="dep2_tab">
    <li><a href="#dep2_tab1">기본정보</a></li>
    <li><a href="#dep2_tab2">유류비내역</a></li>
</ul>
<form name="editForm" id="editForm" method="post">
	<div id="dep2_tab1" class="dep2_content">
	    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>
	    <input type="hidden" name="SUBMITYN"/>
	    <input type="hidden" name="SIGN_YN"/>
	    <input type="hidden" name="OIL_ID" value="<c:out value="${oil.OIL_ID}"/>"/>
		<input type="hidden" name="mode"/>
		
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
	        			<c:out value="${oil.OIL_MONTH}"/> 유루비 청구서 
	        		</th>
	        	</tr>
	        	<tr>
	        		<th>청구자</th>
	        		<td> 
	        			<c:out value="${oil.USER_NM}"/>
	        		</td>
	        		<th>차량번호</th>
	        		<td> 
	        			<c:out value="${oil.CAR_NUM}"/>
	        		</td>
	        	</tr>
	        	<tr>
	        		<th>연비</th>
	        		<td> 
	        			<c:out value="${oil.CAR_KM}"/>
	        		</td>
	        		<th>차종</th>
	        		<td>
	        			<c:out value="${oil.CAR_NM}"/>
	        		</td>
	        	</tr>
	        	<tr>
	        		<th>배기량</th>
	        		<td> 
	        			<c:out value="${oil.CAR_ENGINE}"/>
	        		</td>
	        		<th>유종</th>
	        		<td>
	        			<c:out value="${oil.CAR_OIL_NM}"/>
	        		</td>
	        	</tr>
	           	<tr>
	        		<th>리터당 유류비</th>
	        		<td colspan="3">
		        		<c:out value="${oil.OIL_PRI}"/>
	        		</td>
	        	</tr>
	        </tbody>
	    </table>
	</div>
	<div id="dep2_tab2" class="dep2_content">
		<table class="table02">
			<caption>유류비 내역</caption>
	        <colgroup>
	            <col style="width: 18%;" />
	            <col style="width: 15%;" />
	            <col style="width: 18%;" />
	            <col style="width: 13%;" />
	            <col style="width: 13%;" />
	            <col style="width: 13%;" />
	            <col />
	        </colgroup>
	        <tbody id="List_body">
				<tr>
					<th>일 별</th>
					<th>출발지</th>
					<th>경유지</th>
					<th>도착지</th>
					<th>주행거리</th>
					<th>통행료</th>
					<th>주차료</th>
				</tr>
				<c:forEach items="${oilList}" var="list" varStatus="stat">
					<tr>
						<td><c:out value="${list.D_DT}"/></td>
						<td><c:out value="${list.D_FROM}"/></td>
						<td><c:out value="${list.D_MID}"/></td>
						<td><c:out value="${list.D_TO}"/></td>
						<td><c:out value="${list.DISTANCE}"/></td>
						<td><c:out value="${list.COST}"/></td>
						<td><c:out value="${list.PARK_C}"/></td>
					</tr>
				</c:forEach>
				<tr>
					<th>주행거리</th>
					<th>주행거리보정</th>
					<th>유류비</th>
					<th>통행료</th>
					<th>주차비</th>
					<th colspan="2">총지급액</th>
				</tr>
				<tr>
					<td><c:out value="${tot.DISTANCE}"/></td>
					<td><c:out value="${tot.DISTANCE_CAL}"/></td>
					<td><c:out value="${tot.OIL_TOT}"/></td>
					<td><c:out value="${tot.COST}"/></td>
					<td><c:out value="${tot.PARK_C}"/></td>
					<td colspan="2"><c:out value="${tot.TOT}"/></td>	
				</tr>
	        </tbody>
		</table>
	</div>
</form>
<div class="t_right">
	<c:choose>
 		<c:when test="${oil.E_MODE eq 'SIGN' }">
			<html:buttonAuth gubun="mod" script="goSign('Y');return false;" title="승 인"/>
	    	<html:buttonAuth gubun="mod" script="goSign('R');return false;" title="반 려"/>
		</c:when>
		<c:when test="${oil.E_MODE eq 'SELF' }">
			<html:buttonAuth gubun="mod" script="goEdit();return false;" title="수 정"/>
		</c:when>
	</c:choose>
	<a href="" onclick="goPrint();return false;" class="btn_2">출 력</a>
    <%-- <a href="/cms/sign/oil<c:out value='${parameters}'/>" class="btn_2">목 록</a> --%>
    <a href="javascript:history.back();" class="btn_2">목 록</a>
</div>


