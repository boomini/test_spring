<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function(){
	//초기 검색
	goSearch('${param.page}');
});

/*검색*/
function goSearch(page) {
	$("#page").val(gfnCheckNull(page));
	var url = "/cms/sign/expense/listajax";
	var params = $("#searchForm").serialize();
	var sucessFunc = function(data) {
		$("#ajaxTable").html(""); 
		$("#ajaxTable").html(data);
		$('.pagebtn > a').on('click' ,function(e){
			var page = $(this).attr("id").replace("page","");
			$("#page").val(page);
			goSearch(page);
			e.preventDefault();
		});
	};
	ajaxCallHtml(url, params, sucessFunc);
};

function goSave(mode){
	var frm = document.searchForm;
	frm.mode=mode;
	frm.action="/cms/sign/expense/reg";
	frm.submit();
};
function goEdit(Key,mode){
	var frm = document.searchForm;
	frm.mode=mode;
	frm.EXPENSE_ID.value = Key;
	frm.action="/cms/sign/expense/view";
	frm.submit();
}
</script>

<form name="searchForm" id="searchForm" method="post">


    <input type="hidden" name="page" id="page">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>
    <input type="hidden" name="mode"/>
    <input type="hidden" name="EXPENSE_ID"/>
    

    
    
    <table class="table02">
        <caption>지출 내역 검색조건</caption>
        <colgroup>
            <col style="width: 15%;" />
            <col style="width: 35%;" />
            <col style="width: 15%;" />
            <col style="width: 35%;" />
        </colgroup>
        <tbody>
            <tr>
                <th>text</th>
                <td><input type="text" name="ATTR_11"  class="entrKey"/></td>
                <th>text</th>
                <td><input type="text" name="ATTR_12" class="entrKey"/></td>
            </tr>
        </tbody>
    </table>
</form>
<div class="t_right">
    <a href="" onclick="goSearch();return false;" class="btn_1">조 회</a>
</div>
<div id="ajaxTable"></div>
<div class="t_right">
    <html:buttonAuth gubun="add" script="goSave('REG');return false;"/> 
</div>