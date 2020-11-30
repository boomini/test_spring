<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function(){
	gfnSetDatePickerTwo($("#EXPENSE_DATE"), 'yy-mm');

	getLine();
});

//저장 및 수정
function goSave(SUBMITYN) {
	
	var frm = document.editForm;
	if (!gfnValidate(frm)){
		return;
	}
	if( $(".lineId").length == 0){
		alert("결재 라인을 지정해 주세요.");
		return false;
	}
	frm.mode.value = "Reg";
	frm.SUBMITYN.value=SUBMITYN;
	frm.action = "/cms/sign/expense/cud";
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
	var str = '<tr>';
		str+= '	<td><input type="text" class="checkNull" title="내역" name="COASTNM"/></td>';
		str+= '	<td><input type="text" class="checkNull" title="금액" name="COAST"/></td>';
		str+= '	<td><input type="text" class="" name="NOTE"/></td>';
		str+= '	<td>';
		str+= '	<a href="return false;" onclick="delList(this);return false;" class="btn_2">삭 제</a>';
		str+= '	</td></tr>';
	$("#List_body").find("tr").last().after(str);
}
function delList(e){
	$(e).parents("tr").remove();
}
</script>

<ul class="dep2_tab">
    <li><a href="#dep2_tab1">지출결의서</a></li>
    <li><a href="#dep2_tab2">지출내역</a></li>
</ul>
<form name="editForm" id="editForm" method="post">
	<div id="dep2_tab1" class="dep2_content">
	    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>
		<input type="hidden" name="mode"/>
		<input type="hidden" name="SUBMITYN"/>
		
	    <table class="table02">
	        <caption>지출결의서 등록</caption>
	        <colgroup>
	            <col style="width: 15%;" />
	            <col style="width: 35%;" />
	            <col style="width: 15%;" />
	            <col />
	        </colgroup>
	        <tbody>
	        	<tr>
	        		<th>
	        		결재 라인</br>
	        		(팀장-부서장-대표이사)
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
	        			비품 등 지출 결의서
	        		</th>
	        	</tr>
	        	<tr>
	        		<th>성명</th>
	        		<td> <c:out value="${member.USER_NM}"/>
	        		<input type="hidden" name="USER_NM" value="<c:out value="${member.USER_NM}"/>"/>
	        		</td>
	        		<th>직급</th>
	        		<td> <c:out value="${member.AUTH}"/>
	        		<input type="hidden" name="AUTH" value="<c:out value="${member.AUTH}"/>"/>
	        		</td>
	        	</tr>
	        	<tr>
	        		<th>부서</th>
	        		<td> <c:out value="${member.ORG}"/> 
	        		<input type="hidden" name="ORG" value="<c:out value="${member.ORG}"/>"/>
	        		</td>
	        		<th>일자</th>
	        		<td>
	        			<input type="text" name="EXPENSE_DATE" id="EXPENSE_DATE" readonly="readonly"  title="일자" class="checkNull W100"/>
	        		</td>
	        	</tr>
	        	<tr>
	        		<th>계좌번호</th>
	        		<td colspan="3">
	        			<input type="text" name="BANK" class="checkNull W300" title="계좌번호" placeholder="은행 - 계좌번호"/>
	        		</td>
	        	</tr>
	           
	        </tbody>
	    </table>
	</div>
	<div id="dep2_tab2" class="dep2_content">
		<table class="table02">
			<caption>지출 내역</caption>
	        <colgroup>
	            <col style="width: 15%;" />
	            <col style="width: 35%;" />
	            <col style="width: 15%;" />
	            <col />
	        </colgroup>
	        <tbody id="List_body">
				<tr>
					<th>내 역</th>
					<th>금 액</th>
					<th>비 고 </th>
					<th></th>
				</tr>
				<tr>
					<td><input type="text" class="checkNull" title="내역" name="COASTNM" maxlength="30"/></td>
					<td><input type="text" class="checkNull" title="금액" name="COAST" maxlength="10"/></td>
					<td><input type="text" class="" name="NOTE"/></td>
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
	<html:buttonAuth gubun="add" script="goSave('Y');return false;" title="승인요청"/>
    <html:buttonAuth gubun="add" script="goSave('N');return false;" title="임시저장"/>
    <a href="/cms/sign/expense<c:out value='${parameters}'/>" class="btn_2">목 록</a>
</div>
