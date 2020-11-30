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
	frm.mode.value = mode;
	frm.action = "/cms/cal/cud";
	frm.submit();
};
</script>


<form name="editForm" id="editForm" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>
	<input type="hidden" name="CAL_ID" value="<c:out value="${result.CAL_ID}"/>"/>
	<input type="hidden" name="mode"/>
	
    <table class="table02">
        <caption>일정 등록</caption>
        <colgroup>
            <col style="width: 15%;" />
            <col style="width: 35%;" />
            <col style="width: 15%;" />
            <col />
        </colgroup>
        <tbody>
        	<tr>
        		<th>일정</th>
        		<td>
        			<input type="text" name="STARTDAY" id="startDay" readonly="readonly"  title="시작일" class="checkNull W100" value='<c:out value="${result.STARTDAY}"/>'/> ~ 
                	<input type="text" name="ENDDAY" id="endDay" readonly="readonly" title="종료일" class="checkNull W100" value='<c:out value="${result.ENDDAY}"/>'/>
        		</td>
        		<th>인원</th>
        		<td>
        			<input type="text" name="USER_NM" title="참가자 명" class="checkNull" value='<c:out value="${result.USER_NM}"/>'/>
        		</td>
        	</tr>
        	<tr>
				<th>목적</th>
        		<td colspan="3">
        			<input type="text" name="PURPOSE" title="목적" class="checkNull" value='<c:out value="${result.PURPOSE}"/>'/>
        		</td>        		
        	</tr>
        </tbody>
    </table>
</form>
<div class="t_right">
    <html:buttonAuth gubun="mod" script="goSave('Edit');return false;" title="수 정"/>
     <html:buttonAuth gubun="del" script="goSave('Delete');return false;" title="삭 제"/>
   <a href="javascript:history.back();" class="btn_2">목 록</a>
</div>

