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
	var url = "/cms/sign/biztrip/listajax";
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

function goAdd(){
	var frm = document.searchForm;
	frm.mode="Reg";
	frm.action="/cms/sign/biztrip/reg";
	frm.submit();
};
function goView(Key,mode){
	var frm = document.searchForm;
	frm.mode=mode;
	frm.BIZ_ID.value = Key;
	frm.action="/cms/sign/biztrip/view";
	frm.submit();
}
</script>

<form name="searchForm" id="searchForm" method="post">

    <input type="hidden" name="page" id="page">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>
    <input type="hidden" name="mode"/>
    <input type="hidden" name="BIZ_ID"/>
    
    <table class="table02">
        <caption>유류비 검색조건</caption>
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
    <html:buttonAuth gubun="add" script="goAdd();return false;"/> 
</div>