<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function(){
	gfnSetDatePickerTwo($("#OIL_MONTH"), 'yy-mm');
	setComboBoxList("S","CAR_OIL" ,{ATTR_1:236} ,false   );
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
	var str = '<tr><td><input type="text" readonly="readonly" name="D_DT" class="checkNull W100" title="일자"/></td>';
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
	    <input type="hidden" name="SUBMITYN"/>
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
	        		<th>결재 라인</br>
	        		(부서장-대표이사)
	        		</th>
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
	        					</tbody>
	        				</table>
	        			
	        			</div>
	        		</td>
	        	</tr>
	        	<tr>
	        		<th colspan="4" class="AC">
	        			<input type="text" name="OIL_MONTH" id="OIL_MONTH" readonly="readonly"  title="일자" class="checkNull W100"/>
	        			 유루비 청구서 
	        		</th>
	        	</tr>
	        	<tr>
	        		<th>청구자</th>
	        		<td> 
	        			<c:out value="${member.USER_NM}"/>
	        			<input type="hidden" name="USER_NM" value="<c:out value="${member.USER_NM}"/>"/>
	        		</td>
	        		<th>차량번호</th>
	        		<td> 
	        			<input type="text" name="CAR_NUM" class="checkNull" title="차량번호" />
	        		</td>
	        	</tr>
	        	<tr>
	        		<th>차종</th>
	        		<td>
	        			<input type="text" name="CAR_NM" class="checkNull" title="차종"/>
	        		</td>
	        		<th>연비</th>
	        		<td>
	        			<input type="text" name="CAR_KM" class="checkNull intCheck" title="연비"/>
	        		</td>
	        	</tr>
	        	<tr>
	        		<th>배기량</th>
	        		<td> 
	        			<input type="text" name="CAR_ENGINE" class="checkNull intCheck" title="배기량"/>
	        		</td>
	        		<th>유종</th>
	        		<td>
	        			<select id="CAR_OIL" name="CAR_OIL" class="checkNull" title="유종">
	        		</td>
	        	</tr>
	        	<tr>
	        		<th>리터당 유류비</th>
	        		<td colspan="3">
		        		<input type="text" name="OIL_PRI" class="intCheck checkNull W100" title="리터당 유류비"/>
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
				<tr>
					<td><input type="text" readonly="readonly" name="D_DT" class="checkNull W100" title="일자"/></td>
					<td><input type="text" class="checkNull" name="D_FROM" title="출발지"/></td>
					<td><input type="text" class="" name="D_MID" title="경유지"/></td>
					<td><input type="text" class="checkNull" name="D_TO" title="도착지"/></td>
					<td><input type="text" class="intCheck checkNull" name="DISTANCE" title="주행거리"/></td>
					<td><input type="text" class="intCheck" name="COST" title="통행료"/></td>
					<td><input type="text" class="intCheck" name="PARK_C" title="주차료"/></td>
					<td>
						<a href="" onclick="delList(this);return false;" class="btn_2">삭 제 </a>
					</td>
				</tr>
	        </tbody>
		</table>
		<div class="t_right">
			<a href="" onclick="addList();return false;" class="btn_1">추 가</a>
		</div>
	</div>
</form>
<div class="t_right">
	<html:buttonAuth gubun="add" script="goSave('Reg' , 'Y');return false;" title="승인요청"/>
    <html:buttonAuth gubun="add" script="goSave('Reg' , 'N');return false;" title="임시저장"/>
    <a href="/cms/sign/oil<c:out value='${parameters}'/>" class="btn_2">목 록</a>
</div>

