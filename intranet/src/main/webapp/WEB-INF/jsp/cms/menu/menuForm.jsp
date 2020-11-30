<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function(){
	$("#link").hide();
	if ($(':radio[name="CNTNTS_TY"]:checked').val() == "L") {
		$("#link").show();
	}
});
function deleteChk() {
	var sf = document.editForm;
	if (confirm('삭제하시겠습니까?')) {
		sf.mode.value = "delete";
	}
	sf.submit();
}
function setContentType(val) {
	$("#link").hide();
	if (val == "B") {
		gfnPopup('/cms/menu/boardPop/?MENU_SE=<c:out value='${param.MENU_SE}'/>','600', '430', 1,'menuPop');
	} else if (val == "L") {
		$("#link").show();
	} else {
		$("#memo").html("");
	}
}
function setBoard(id, nm) {
	$("#BBS_NO").val(id);
	$("#memo").html("<b>" + nm + "</b> 게시판이 선택되었습니다.");
}
function setPgm(id, nm) {
	$("#PGM_ID").val(id);
	$("#memo").html("<b>" + nm + "</b> 프로그램이 선택되었습니다.");
}
function goSave() {
	var frm = document.editForm;
	if (!gfnValidate(frm))
		return;
	frm.submit();
}
</script>
<div class="con_st02">
    <div class="tit"><c:out value='${empty param.MENU_LEVEL?menuView.MENU_LEVEL:param.MENU_LEVEL}' />단계 메뉴 ${mode == 'write'?'저장':'수정'}</div>
    <div class="MgT5 MgL10"> - 메인 화면 변경이 필수이며 상위 메뉴 가이드 전체에 영향을 미칠 수 있으므로 전체 사이트 확인 후 업데이트 하셔야 합니다.</div>
</div>
<form name="editForm" action="/cms/menu/cud" method="post">
    <input type="hidden" name="mode" value="<c:out value='${mode}'/>" /> 
    <input type="hidden" name="MENU_NO" value="<c:out value='${param.MENU_NO}'/>" /> 
    <input type="hidden" name="MENU_LEVEL" value="<c:out value='${param.MENU_LEVEL}'/>" /> 
    <input type="hidden" name="BBS_NO" id="BBS_NO" value="<c:out value='${menuView.BBS_NO}'/>" /> 
    <input type="hidden" name="UPPER_MENU_NO" value="<c:out value='${param.UPPER_MENU_NO}'/>" />
    <!-- 검색용 -->
    <input type="hidden" name="MENU_SE" value="<c:out value='${param.MENU_SE}'/>" /> 
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" /> 
    <input type="hidden" name="ONE_DEPTH_ID" value="<c:out value='${param.ONE_DEPTH_ID}'/>" />
    <table class="table02" summary="메뉴등록-,메뉴국문명,메뉴영문명,메뉴설명,메뉴사용여부,컨텐츠형식">
        <colgroup>
            <col width="30%" />
            <col width="70%" />
        </colgroup>
        <tbody>
            <tr>
                <th><span class="iCheck">메뉴 국문명</span></th>
                <td>
                    <input type="text" name="MENU_NM" class="W300 checkNull" value="<c:out value="${menuView.MENU_NM}"/>" title="메뉴 국문명" maxlength="200" /> 
                    <c:if test="${param.MENU_LEVEL == 1  or menuView.MENU_LEVEL ==1}">
                        <input type="checkbox" value="Y" name="TOPMENU_USE_AT" id="TOPMENU_USE_AT" <c:if test="${menuView.TOPMENU_USE_AT == 'Y'}">checked="checked"</c:if> class="MgR2">
                        <label for="TOPMENU_USE_AT">탑메뉴 사용</label>
                    </c:if>
                </td>
            </tr>
            <tr>
                <th>메뉴 영문명</th>
                <td><input type="text" name="ENG_MENU_NM" class="W300" value="<c:out value="${menuView.ENG_MENU_NM}"/>" title="메뉴 영문명" maxlength="200" /></td>
            </tr>
            <tr>
                <th>메뉴 설명</th>
                <td><input type="text" name="MENU_DC"  value="<c:out value="${menuView.MENU_DC}"/>" class="W700" title="메뉴설명" maxlength="400" /></td>
            </tr>
            <tr>
                <th>메뉴사용여부</th>
                <td><html:selectList name='USE_AT' optionValues='Y|N' optionNames='사용|미사용' selectedValue='${menuView.USE_AT}' title="메뉴사용여부" script="class='W80'"/></td>
            </tr>
            <tr>
                <th>컨텐츠형식</th>
                <td>
                    <html:radio name='CNTNTS_TY' list="conTypeList" listValue="CODE" listName="CODE_NM" checkedValue='${menuView.CNTNTS_TY}' defaultValue='D' space='&nbsp;' script="onclick='setContentType(this.value)'" />
                    <div id="memo">
                        <c:if test='${!empty menuView.M_NM}'>
                            <b><c:out value='${menuView.M_NM}' /></b>가 선택 되었습니다 
                        </c:if>
                    </div>
                    <div id="link" class="MgT5">
                        링크URL :<input type="text" size="50" name="LINK_URL" value="<c:out value='${menuView.LINK_URL}'/>" title="링크URL" /> 
                        <html:radio name='POPUP_AT' value='N|Y' text='현재창|새창' checkedValue='${menuView.POPUP_AT}' defaultValue='N' space='&nbsp;' id="NWN|NWY" />
                        
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <div class="AR MgT10">
        <c:if test="${empty menuView}">
            <html:buttonAuth gubun="add" script="goSave();return false;"/><!-- 등록 -->
        </c:if>
        <c:if test="${not empty menuView}">
            <html:buttonAuth gubun="mod" script="goSave();return false;"/><!-- 수정 -->
            <html:buttonAuth gubun="del" script="deleteChk();return false;"/><!-- 삭제 -->
        </c:if>
            <a href="/cms/menu${parameters}" class="btn_2">목 록</a>
    </div>
    
</form>