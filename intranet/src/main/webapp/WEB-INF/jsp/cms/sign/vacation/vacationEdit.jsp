<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function(){
	gfnInitDatePickerTwo();//달력세팅(검색기간용)
	setComboBoxList("S","VAC_CODE" ,{ATTR_1:'213'},true ,'<c:out value="${sign.VAC_CODE}"/>');
	getLine();
});

//수정
function goEdit(mode) {
	var frm = document.editForm;
	
	if( mode == "Delete"){
		var result = confirm('삭제 하시겠습니까?');
		if(!result) {
			return false; 
		};
	};
	if( mode == "Edit"){
		if (!gfnValidate(frm)){
			return;
		};
		if( $(".lineId").length == 0){
			alert("결재 라인을 지정해 주세요.");
			return false;
		};
	};
	
	frm.mode.value=mode;
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
};
</script>

<form name="editForm" id="editForm" method="post">
    
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>
	<input type="hidden" name="mode"/>
    <input type="hidden" name="VACKEY" value="${sign.VACKEY}"/>   
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
        		<td>
        			<div id="ajaxTable" class="H250 overScroll-Y"></div>
        		</td>
        		<td colspan="2">
        			<div id="LINE" class="H250 overScroll-Y">
        				<table class="table_basic table01">
        					<colgroup>
					            <col/>
					        </colgroup>
        					<tbody id="lineBody">
        					<c:forEach items="${signList}" var="list" varStatus="stat">
        						<tr>
        							<td>
        								<c:out value="${list.USER_NM}"/>
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
				<th>부서</th>       
				<td>
				<c:out value="${sign.ORG}"/>
				<input type="hidden" name="ORG" value='<c:out value="${sign.ORG}"/>'/>
				</td>
				<th>직급</th>
				<td>
				<c:out value="${sign.AUTH}"/>
				<input type="hidden" name="AUTH" value='<c:out value="${sign.AUTH}"/>'/>
				</td>     
            </tr>
            <tr>
				<th>휴가중 연락처</th>       
				<td>
				<c:out value="${sign.PNUM}"/>
				<input type="hidden" name="PNUM" value='<c:out value="${sign.PNUM}"/>'/>
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
					<select id="VAC_CODE" name="VAC_CODE" class="checkNull W100"/>
				</td>
            </tr>
            <tr>
            	<th><span class="iCheck"/>일시</th>
				<td colspan="3" >
                	<input type="text" name="startDay" id="startDay" readonly="readonly"  title="시작일" class="checkNull W100" value='<c:out value="${sign.STARTDAY}"/>'/> ~ 
                	<input type="text" name="endDay" id="endDay" readonly="readonly" title="종료일" class="checkNull W100" value='<c:out value="${sign.ENDDAY}"/>'/>				
				</td>
            </tr>
            <tr>
            	<th><span class="iCheck"/>사유</th>
				<td colspan="3" >
					<input type="text" id="REASON" name="REASON" class="checkNull" value='<c:out value="${sign.REASON}"/>'/> 
				</td>
            </tr>
        </tbody>
    </table>
</form>
<div class="t_right">
    <html:buttonAuth gubun="add" script="goEdit('Edit');return false;" title="수 정"/>
    <html:buttonAuth gubun="del" script="goEdit('Delete');return false;" title="삭 제 "/>
    <a href="/cms/sign/vac<c:out value='${parameters}'/>" class="btn_2">목 록</a>
</div>
