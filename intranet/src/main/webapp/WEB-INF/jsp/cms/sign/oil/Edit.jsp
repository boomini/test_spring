<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function(){
	gfnSetDatePickerTwo($("#OIL_MONTH"), 'yy-mm');	
	setComboBoxList("S","CAR_OIL" ,{ATTR_1:236} ,false   , '<c:out value="${oil.CAR_OIL}"/>' );
	gfnSetDatePickerTwo( $("input[name=D_DT]") );
	getLine();
});

//저장 및 수정
function goSave(mode , YN) {
	
	var frm = document.editForm;
	if (!gfnValidate(frm)){
		return;
	}
	if( $(".lineId").length == 0){
		alert("결재 라인을 지정해 주세요.");
		return false;
	}
	frm.mode.value = mode;
	frm.SUBMITYN.value = YN;
	
	frm.action = "/cms/sign/oil/cud";
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
function addList(e){
	var str = '<tr><td><input type="text" name="D_DT" readonly="readonly" class="checkNull W100" title="일자"/></td>';
		str+= '<td><input type="text" class="checkNull" name="D_FROM" title="출발지"/></td>';
		str+= '<td><input type="text" class="" name="D_MID" title="경유지"/></td>';
		str+= '<td><input type="text" class="checkNull" name="D_TO" title="도착지"/></td>';
		str+= '<td><input type="text" class="intCheck checkNull" name="DISTANCE" title="주행거리"/></td>';
		str+= '<td><input type="text" class="intCheck" name="COST" title="통행료"/></td>';
		str+= '<td><input type="text" class="intCheck" name="PARK_C" title="주차료"/></td>';
		str+= '<td><a href="" onclick="delList(this);return false;" class="btn_2">삭 제 </a></td></tr>';
		
		$("#List_body").find("tr").last().after(str);
	
		gfnSetDatePickerTwo( $("input[name=D_DT]") );
}
function delList(e){
	$(e).parents("tr").remove();
}
</script>

<ul class="dep2_tab">
    <li><a href="#dep2_tab1">기본정보</a></li>
    <li><a href="#dep2_tab2">유류비내역</a></li>
</ul>
<form name="editForm" id="editForm" method="post">
	<div id="dep2_tab1" class="dep2_content">
	    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>
	    <input type="hidden" name="OIL_ID" value="<c:out value="${oil.OIL_ID}"/>"/>
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
	        			<input type="text" name="OIL_MONTH" id="OIL_MONTH" readonly="readonly"  title="일자" class="checkNull W100"  value="<c:out value="${oil.OIL_MONTH}"/>" />
	        			 유루비 청구서 
	        		</th>
	        	</tr>
	        	<tr>
	        		<th>청구자</th>
	        		<td> 
	        			<c:out value="${oil.USER_NM}"/>
	        		</td>
	        		<th>차량번호</th>
	        		<td> 
	        			<input type="text" name="CAR_NUM" class="checkNull" title="차량번호" value="<c:out value="${oil.CAR_NUM}"/>"/>
	        		</td>
	        	</tr>
	        	<tr>
	        		<th>차종</th>
	        		<td>
	        			<input type="text" name="CAR_NM" class="checkNull" title="차종" value="<c:out value="${oil.CAR_NM}"/>"/>
	        		</td>
	        		<th>연비</th>
	        		<td>
	        			<input type="text" name="CAR_KM" class="intCheck checkNull" title="차종" value="<c:out value="${oil.CAR_KM}"/>"/>
	        		</td>
	        	</tr>
	        	<tr>
	        		<th>배기량</th>
	        		<td> 
	        			<input type="text" name="CAR_ENGINE" class="intCheck checkNull" title="배기량" value="<c:out value="${oil.CAR_ENGINE}"/>"/>
	        		</td>
	        		<th>유종</th>
	        		<td>
	        			<select id="CAR_OIL" name="CAR_OIL" class="checkNull" title="유종" value="<c:out value="${oil.CAR_OIL}"/>"/>
	        		</td>
	        	</tr>
	        	<tr>
	        		<th>리터당 유류비</th>
	        		<td colspan="3">
		        		<input type="text" name="OIL_PRI" class="intCheck checkNull W100" title="리터당 유류비" value="<c:out value="${oil.OIL_PRI}"/>"/>
	        		</td>
	        	</tr>
	        </tbody>
	    </table>
	</div>
	<div id="dep2_tab2" class="dep2_content">
		<table class="table02">
			<caption>유류비 내역</caption>
	        <colgroup>
	            <col style="width: 15%;" />
	            <col style="width: 12%;" />
	            <col style="width: 17%;" />
	            <col style="width: 12%;" />
	            <col style="width: 12%;" />
	            <col style="width: 12%;" />
	            <col style="width: 12%;" />
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
					<th></th>
				</tr>
				<c:forEach items="${oilList}" var="list" varStatus="stat">
					<tr>
						<td><input type="text" readonly="readonly" name="D_DT" class="checkNull W100" title="일자" value="<c:out value="${list.D_DT}"/>"/></td>
						<td><input type="text" class="checkNull" name="D_FROM" title="출발지" value="<c:out value="${list.D_FROM}"/>"/></td>
						<td><input type="text" class="" name="D_MID" title="경유지" value="<c:out value="${list.D_MID}"/>"/></td>
						<td><input type="text" class="checkNull" name="D_TO" title="도착지" value="<c:out value="${list.D_TO}"/>"/></td>
						<td><input type="text" class="intCheck checkNull" name="DISTANCE" title="주행거리" value="<c:out value="${list.DISTANCE}"/>"/></td>
						<td><input type="text" class="intCheck" name="COST" title="통행료" value="<c:out value="${list.COST}"/>"/></td>
						<td><input type="text" class="intCheck" name="PARK_C" title="주차료" value="<c:out value="${list.PARK_C}"/>"/></td>
						<td>
							<a href="" onclick="delList(this);return false;" class="btn_2">삭 제 </a>
						</td>
					</tr>
				</c:forEach>
	        </tbody>
		</table>
		<div class="t_right">
			<a href="" onclick="addList();return false;" class="btn_1">추 가</a>
		</div>
	</div>
</form>
<div class="t_right">
	<html:buttonAuth gubun="add" script="goSave('Edit' , 'Y');return false;" title="승인요청"/>
    <html:buttonAuth gubun="add" script="goSave('Edit' , 'N');return false;" title="저 장"/>
    <a href="/cms/sign/oil<c:out value='${parameters}'/>" class="btn_2">목 록</a>
</div>

