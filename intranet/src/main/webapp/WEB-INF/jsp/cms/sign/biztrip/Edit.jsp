<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function(){
	gfnInitDatePickerTwo();//달력세팅(검색기간용)
	getLine();
});

//저장 및 수정
function goSave(mode) {
	
	var frm = document.editForm;
	if (!gfnValidate(frm)){
		return;
	}
	if( $(".lineId").length == 0){
		alert("결재 라인을 지정해 주세요.");
		return false;
	}
	frm.mode.value = mode;
	
	frm.action = "/cms/sign/biztrip/cud";
	frm.submit();
};
function getLine() {
	var url = "/cms/comPop/memList";
	var params = $("#editForm").serialize();
	var sucessFunc = function(data) {
		$("#ajaxTable").html(""); 
		$("#ajaxTable").html(data);
	};
	ajaxCallHtml(url, params, sucessFunc);
};
function setLine(lineId , lineNm){
	for(var i=0; i<$(".lineId").length; i++){
		if( $(".lineId:eq("+i+")").val() == lineId){
			alert("이미 선택되었습니다.");
			return false;
		}
	}
	str = "<tr><td>"+lineNm;
	str+= "<input type='hidden' class='lineId' name='lineId' value='"+lineId+"'/>";
	str+= "</td>";
	str+= "<td><a href='' class='btn_1' title='삭 제' onclick='deleteLine(this);return false;' >삭 제</a></td>";
	str+= "</tr>";
	$("#lineBody").append(str);
};
function deleteLine(e){
	$(e).closest("tr").remove();	
}
</script>

<form name="editForm" id="editForm" method="post">
	    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>
	    <input type="hidden" name="BIZ_ID" value="<c:out value="${result.BIZ_ID}"/>"/>
	    <input type="hidden" name="SUBMITYN"/>
		<input type="hidden" name="mode"/>
	    <table class="table02">
	        <caption>유류비</caption>
	        <colgroup>
	            <col style="width: 15%;" />
	            <col style="width: 35%;" />
	            <col style="width: 15%;" />
	            <col style="width: 35%;" />
	        </colgroup>
	        <tbody>
	        	<tr>
	        		<th>결재 라인</th>
	        		<td colspan>
	        			<div id="ajaxTable" class="H250 overScroll-Y"></div>
	        		</td>
	        		<td colspan="2">
	        			<div id="LINE" class="H250 overScroll-Y">
	        				<table class="table_basic table01">
	        					<colgroup>
	        						<col class="W60p"/>
						            <col/>
						        </colgroup>
	        					<tbody id="lineBody">
		        					<c:forEach items="${signLine}" var="list" varStatus="stat">
	        						<tr>
	        							<td>
	        								<c:out value="${list.USER_NM}"/> - <c:out value="${list.SIGN_STEP}"/>
											<input type='hidden' class='lineId' name='lineId' value='${list.LINE_ID}'/>
										</td>
										<td>
											<a href='' class='btn_1' title='삭 제' onclick='deleteLine(this);return false;'>삭 제</a>
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
        		<td>
        			<c:out value="${result.USER_NM}"/>
        		</td>
        		<th>직위</th>
        		<td>	
        			<c:out value="${result.AUTH}"/>
        		</td>
        	</tr>
        	<tr>
        		<th>부서</th>
        		<td>
        			<c:out value="${result.ORG}"/>
        		</td>
        		<th>담당업무</th>
        		<td>
        			<input type="text" name="JOBS" maxlength="20" value='<c:out value="${result.JOBS}"/>' title="담당업무" class="checkNull"/>
        		</td>
        	</tr>
        	<tr>
        		<th>출장목적</th>
        		<td>
        		<input type="text" name="PURPOSE" value='<c:out value="${result.PURPOSE}"/>' maxlength="30" title="출장목록" class="checkNull"/>
        		</td>
        		<th>출장기간</th>
        		<td>
        			<input type="text" name="STARTDAY" id="startDay" readonly="readonly"  title="시작일" class="checkNull W100" value="<c:out value="${result.STARTDAY}"/>"/> ~ 
                	<input type="text" name="ENDDAY" id="endDay" readonly="readonly" title="종료일" class="checkNull W100" value="<c:out value="${result.ENDDAY}"/>"/>
        		</td>
        	</tr>
        	<tr>
        		<th>출장지</th>
        		<td>
        			<input type="text" name="VISITS" maxlength="20" title="출장지" class="checkNull" value="<c:out value="${result.VISITS}"/>"/>
        		</td>
        		<th>출장중연락처</th>
        		<td>
        			<c:out value="${result.PNUM}"/>
        		</td>
        	</tr>
	        	
	        	
	        </tbody>
	    </table>
</form>
<div class="t_right">
    <html:buttonAuth gubun="add" script="goSave('Edit');return false;" title="저 장"/>
    <a href="/cms/sign/oil<c:out value='${parameters}'/>" class="btn_2">목 록</a>
</div>

