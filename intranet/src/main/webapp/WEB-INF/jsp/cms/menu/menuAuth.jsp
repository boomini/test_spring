<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function(){
	$("input[name=useAuthAll]").click(function(){
		if($(this).prop("checked")){
			$("input[name=useAuth]").prop("checked", true);
		}else{
			$("input[name=useAuth]").prop("checked", false);
		}
	});
	$("input[name=insAuthAll]").click(function(){
		if($(this).prop("checked")){
			$("input[name=insAuth]").prop("checked", true);
		}else{
			$("input[name=insAuth]").prop("checked", false);
		}
	});
	$("input[name=updAuthAll]").click(function(){
		if($(this).prop("checked")){
			$("input[name=updAuth]").prop("checked", true);
		}else{
			$("input[name=updAuth]").prop("checked", false);
		}
	});
	$("input[name=delAuthAll]").click(function(){
		if($(this).prop("checked")){
			$("input[name=delAuth]").prop("checked", true);
		}else{
			$("input[name=delAuth]").prop("checked", false);
		}
	});
	
})

function goSave() {
	var useAuths = gfnCheckBoxCheckedToString("useAuth", "|");
	var insAuths = gfnCheckBoxCheckedToString("insAuth", "|");
	var updAuths = gfnCheckBoxCheckedToString("updAuth", "|");
	var delAuths = gfnCheckBoxCheckedToString("delAuth", "|");
	var GROUP_ID = document.searchForm.GROUP_ID.value;
	var MENU_SE = document.searchForm.MENU_SE.value;
	/* if (MENU_NO_REF == "") {
		alert("체크 된 항목이 없습니다.");
		return;
	} */
	document.authForm.GROUP_ID.value = GROUP_ID;
	document.authForm.MENU_SE.value = MENU_SE;
	document.authForm.useAuths.value = useAuths;
	document.authForm.insAuths.value = insAuths;
	document.authForm.updAuths.value = updAuths;
	document.authForm.delAuths.value = delAuths;
	document.authForm.submit();
	
}

function checkUpDown(cur) {
	var checks = document.getElementsByName(cur.name);

	var checked = cur.checked;
	var lencheck = checks.length;

	for (var c = 0; c < lencheck; c++) {
		if (checked) {
			//alert(checks[c].id);
			//* 내 아래
			if (checks[c].id.indexOf('>>' + cur.value + '>>') != -1) {
				checks[c].checked = true;
			}
			//* 내 위
			if (cur.id.indexOf('>>' + checks[c].value + '>>') != -1) {
				checks[c].checked = true;
				;
			}
		} else {
			//* 내 아래
			if (checks[c].id.indexOf('>>' + cur.value + '>>') != -1) {
				checks[c].checked = false;
			}
		}
	}
}
function goSearch() {
	$("#searchForm").submit();
}
</script>
<form name="authForm" method="post" action="/cms/menu/authSave/">
    <input type="hidden" name="useAuths" /> 
    <input type="hidden" name="insAuths" /> 
    <input type="hidden" name="updAuths" /> 
    <input type="hidden" name="delAuths" /> 
    <input type="hidden" name="GROUP_ID" value="${param.GROUP_ID}" /> 
    <input type="hidden" name="MENU_SE" value="" /> 
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" />
</form>
<form name="searchForm" id="searchForm" action="/cms/menuAuth/" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" />
    <div class="search_box">
        <%-- <html:selectList name='MENU_SE' optionNames="관리자|업무" optionValues="1|2" selectedValue='${param.MENU_SE}' defaultValue="1" title="도메인정보" script=" onchange='goSearch();return false;' class='W90'" />--%>
        <input type="hidden" name="MENU_SE"  id="MENU_SE" value="1">
        <html:selectList name='GROUP_ID' title="그룹정보" optionNames="공통메뉴권한" optionValues="0200" list='perList' listValue='CODE' listName='CODE_NM' selectedValue='${param.GROUP_ID}' script="onchange='goSearch();return false;' class='W200'" /> 
        <a href="" onclick="goSearch();return false;" class="btn_2">조 회</a>
    </div>
</form>
<div class="tit MgT10">검색결과</div>
<table summary="메뉴명,권한등록" class="table_basic table01 MgT5">
    <colgroup>
        <col />
        <col style="width: 13%;" />
        <col style="width: 13%;" />
        <col style="width: 13%;" />
        <col style="width: 13%;" />
    </colgroup>
    <thead>
        <tr>
            <th>메뉴명</th>
            <th><label class="FW900">사용권한<input type="checkbox" name="useAuthAll" class="MgL5"></label></th>
            <th><label class="FW900">등록권한<input type="checkbox" name="insAuthAll" class="MgL5"></label></th>
            <th><label class="FW900">수정권한<input type="checkbox" name="updAuthAll" class="MgL5"></label></th>
            <th><label class="FW900">삭제권한<input type="checkbox" name="delAuthAll" class="MgL5"></label></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${dataList}" var="EO">
            <c:forEach var='EEO' items='${EO.subList}'>
                <tr>
                    <td class="AL">
                    <c:forEach begin="1" end="${EEO.LEVEL-1}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
                        <c:if test="${EEO.LEVEL !='1'}">
                            <img src="/com/images/re_arrow.png" alt="단계구분이미지" style="vertical-align: middle;">&nbsp;
                        </c:if> 
                            <c:set var="idVar" value="" /> 
                        <c:if test="${EEO.LEVEL=='1'}">
                            <c:set var="idVar1" value=">>${EEO.MENU_NO}>>" />
                            <c:set var="idVar" value="${idVar1 }" />
                        </c:if> 
                        <c:if test="${EEO.LEVEL=='2'}">
                            <c:set var="idVar2" value="${idVar1}${EEO.MENU_NO}>>" />
                            <c:set var="idVar" value="${idVar2 }" />
                        </c:if> 
                        <c:if test="${EEO.LEVEL=='3'}">
                            <c:set var="idVar3" value="${idVar2}${EEO.MENU_NO}>>" />
                            <c:set var="idVar" value="${idVar3 }" />
                        </c:if> 
                        <c:if test="${EEO.LEVEL=='4'}">
                            <c:set var="idVar4" value="${idVar3}${EEO.MENU_NO}>>" />
                            <c:set var="idVar" value="${idVar4 }" />
                        </c:if> 
                        <label for="${idVar }" style="cursor: pointer;<c:if test="${EEO.LEVEL=='1' or EEO.CNTNTS_TY == 'D'}"> font-weight:bold; </c:if>"> ${EEO.MENU_NM} </label>
                    </td>
                    <c:set var="ckVal" value="" />
                    <c:set var="ckVal2" value="" />
                    <c:set var="ckVal3" value="" />
                    <c:set var="ckVal4" value="" />
                    <c:forEach items="${menuAuthList}" var="ML">
                        <c:if test="${EEO.MENU_NO == ML.MENU_NO and ML.USE_AUTHOR_AT == 'Y'}">
                            <c:set var="ckVal" value="checked" />
                        </c:if>
                    </c:forEach>
                    <c:forEach items="${menuAuthList}" var="ML">
                        <c:if test="${EEO.MENU_NO == ML.MENU_NO and ML.REGISTE_AUTHOR_AT == 'Y'}">
                            <c:set var="ckVal2" value="checked" />
                        </c:if>
                    </c:forEach>
                    <c:forEach items="${menuAuthList}" var="ML">
                        <c:if test="${EEO.MENU_NO == ML.MENU_NO and ML.CHANGE_AUTHOR_AT == 'Y'}">
                            <c:set var="ckVal3" value="checked" />
                        </c:if>
                    </c:forEach>
                    <c:forEach items="${menuAuthList}" var="ML">
                        <c:if test="${EEO.MENU_NO == ML.MENU_NO and ML.DELETE_AUTHOR_AT == 'Y'}">
                            <c:set var="ckVal4" value="checked" />
                        </c:if>
                    </c:forEach>
                    <td class="AC"><input type="checkbox" name="useAuth" id="${idVar}" ${ckVal}  value="${EEO.MENU_NO}" style="border: 0" onclick="javascript:checkUpDown(this);" /></td>
                    <td class="AC"><input type="checkbox" name="insAuth" id="${idVar}" ${ckVal2} value="${EEO.MENU_NO}" style="border: 0" onclick="javascript:checkUpDown(this);" /></td>
                    <td class="AC"><input type="checkbox" name="updAuth" id="${idVar}" ${ckVal3} value="${EEO.MENU_NO}" style="border: 0" onclick="javascript:checkUpDown(this);" /></td>
                    <td class="AC"><input type="checkbox" name="delAuth" id="${idVar}" ${ckVal4} value="${EEO.MENU_NO}" style="border: 0" onclick="javascript:checkUpDown(this);" /></td>
                </tr>
            </c:forEach>
        </c:forEach>
        <c:if test='${empty dataList}'>
            <tr>
                <td colspan="2" class="AC borR0">검색결과가 없습니다.</td>
            </tr>
        </c:if>
    </tbody>
</table>
<div class="AR MgT10">
    <html:buttonAuth gubun="save" script="goSave();return false;"/>
</div>