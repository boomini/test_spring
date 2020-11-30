<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function(){
	gfnInitDatePickerTwo();//달력세팅(검색기간용)
	setComboBoxList("S","VAC_CODE" ,{ATTR_1:'213'},true);
	getLine();
});

//저장 및 수정
function goSave() {
	
	var frm = document.editForm;
	if (!gfnValidate(frm)){
		return;
	}
	if( $(".lineId").length == 0){
		alert("결재 라인을 지정해 주세요.");
		return false;
	}
	
	frm.mode.value = "Reg";
	frm.action = "/cms/sign/vac/cud";
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
	<input type="hidden" name="mode"/>
       
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
        		<th>
        		결재 라인 </br>
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
				<th>부서</th>       
				<td>
				<c:out value="${member.ORG}"/>
				<input type="hidden" name="ORG" value='<c:out value="${member.ORG}"/>'/>
				</td>
				<th>직급</th>
				<td>
				<c:out value="${member.AUTH}"/>
				<input type="hidden" name="AUTH" value='<c:out value="${member.AUTH}"/>'/>
				</td>     
            </tr>
            <tr>
				<th>휴가중 연락처</th>       
				<td>
				<c:out value="${member.PNUM}"/>
				<input type="hidden" name="PNUM" value='<c:out value="${member.PNUM}"/>'/>
				</td>
				<th>성명</th>
				<td>
				<c:out value="${member.USER_NM}"/>
				<input type="hidden" name="USER_NM" value='<c:out value="${member.USER_NM}"/>'/>
				</td>     
            </tr>
            <tr>
            	<th><span class="iCheck"/>휴가구분</th>
				<td colspan="3" >
					<select id="VAC_CODE" name="VAC_CODE" class="checkNull W100" title="휴가구분"/>
				</td>
            </tr>
            <tr>
            	<th><span class="iCheck"/>일시</th>
				<td colspan="3" >
                	<input type="text" name="startDay" id="startDay" readonly="readonly"  title="시작일" class="checkNull W100"/> ~ 
                	<input type="text" name="endDay" id="endDay" readonly="readonly" title="종료일" class="checkNull W100"/>				
				</td>
            </tr>
            <tr>
            	<th><span class="iCheck"/>사유</th>
				<td colspan="3" >
					<input type="text" id="REASON" name="REASON" class="checkNull" title="사유"/> 
				</td>
            </tr>
        </tbody>
    </table>
</form>
<div class="t_right">
    <html:buttonAuth gubun="add" script="goSave();return false;" title="등 록"/>
    <a href="/cms/sign/vac<c:out value='${parameters}'/>" class="btn_2">목 록</a>
</div>
