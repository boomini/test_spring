<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function(){
	/* setComboBoxList("A","year" ,{pType:1} ,false  , gfnCheckNull(  gfnCurYYYY()-1  ));//조사시기 */
	//초기 검색
	goSearch('${param.page}');
});

/*검색*/
function goSearch(page) {
	$("#page").val(gfnCheckNull(page));
	var url = "/cms/sign/vac/listajax";
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
//엑셀 다운로드
function goExcel(){
	excelDownLoad( '/cms/bigDataExcelDown',"searchForm");
};
function goSave(mode){
	var frm = document.searchForm;
	frm.mode=mode;
	frm.action="/cms/sign/vac/reg";
	frm.submit();
};
function goEdit(Key,mode){
	var frm = document.searchForm;
	frm.mode=mode;
	frm.VACKEY.value = Key;
	frm.action="/cms/sign/vac/view";
	frm.submit();
}
</script>

<form name="searchForm" id="searchForm" method="post">


    <input type="hidden" name="page" id="page">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>
    <input type="hidden" name="mode"/>
    <input type="hidden" name="VACKEY"/>
    
      <%-- 엑셀 다운로드 파라미터 --%>
    <input type="hidden" name="tFileNm" value="underWaterCityHisExcelList">
    <input type="hidden" name="dFielNm" value="일반지역 이력조회">
    <input type="hidden" name="qNs" value="UnderWaterMnMapper">
    <input type="hidden" name="qId" value="getCityHisSpotExcelList">
    <input type="hidden" name="sR" value="3">
    <input type="hidden" name="sC" value="0">
    
    
    <table class="table02">
        <caption>일반지역 지점조회</caption>
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