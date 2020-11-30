<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function(){
	setComboBoxList("A","pAuth" ,{pType:50} ,false   );//조사시기 */
	setComboBoxList("A","pOrgCode" ,{pType:206} ,false   );//조사시기 */
	
	//초기 검색
	goSearch();
});

/*검색*/
function goSearch(page) {
	$("#page").val(gfnCheckNull(page));
	var url = "/cms/hitecm/listAjax";
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
</script>

<form name="searchForm" id="searchForm" method="post">


    <input type="hidden" name="page" id="page">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>
    <input type="hidden" name="mode"/>
    
    <table class="table02">
        <colgroup>
            <col style="width: 10%;" />
            <col style="width: 23%;" />
            <col style="width: 10%;" />
            <col style="width: 23%;" />
            <col style="width: 10%;" />
            <col/>
        </colgroup>
        <tbody>
            <tr>
                <th>이름</th>
                <td><input type="text" name="pUserNm"  class="entrKey"/></td>
                <th>직급</th>
                <td><select type="text" name="pAuth" id="pAuth" /></td>
                <th>부서</th>
                <td><select type="text" name="pOrgCode" id="pOrgCode" /></td>
            </tr>
        </tbody>
    </table>
</form>
<div class="t_right">
    <a href="" onclick="goSearch();return false;" class="btn_1">조 회</a>
</div>
<div id="ajaxTable"></div>
