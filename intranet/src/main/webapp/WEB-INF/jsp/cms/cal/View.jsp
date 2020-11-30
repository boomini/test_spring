<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function(){
	gfnInitDatePickerTwo();//달력세팅(검색기간용)
	getLine();
});

//수정화면
function goSave(mode) {
	var frm = document.editForm;
	if (!gfnValidate(frm)){
		return;
	}
	frm.mode.value = mode;
	frm.action = "/cms/cal/page/Edit";
	frm.submit();
};
</script>


<form name="editForm" id="editForm" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>

	<input type="hidden" name="mode"/>
	<input type="hidden" name="CAL_ID" value="<c:out value="${result.CAL_ID}"/>"/>
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
        			<c:out value="${result.STARTDAY}"/> ~ <c:out value="${result.ENDDAY}"/> 
        		</td>
        		<th>인원</th>
        		<td>
        			<c:out value="${result.USER_NM}"/>
        		</td>
        	</tr>
        	<tr>
				<th>목적</th>
        		<td colspan="3">
        			<c:out value="${result.PURPOSE}"/>
        		</td>        		
        	</tr>
        </tbody>
    </table>
</form>
<div class="t_right">
    <html:buttonAuth gubun="mod" script="goSave('Edit');return false;" title="수 정"/>
   <a href="javascript:history.back();" class="btn_2">목 록</a>
</div>

