<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<style>
.table_basic > tbody > tr > td{padding: 2px;}
</style>
<script>
function sortChk() {
	if ($("select[name=SORT_ORDR]") == undefined) {
		alert("조회 내역이 없습니다.");
		return;
	}
	if (confirm("저장 하시겠습니까?")) {
		$("#SORT_REF").val(gfnObjToString($("select[name=SORT_ORDR]")));	
		$("#MENU_NO_REF").val(gfnObjToString($("input[name=MENU_NO]")));	
		$("#frm").submit();
	}
}
function goSearch() {
	$("#searchForm").submit();
}
function goOneDepthAdd(){
	var frm = document.searchForm;
	frm.MENU_LEVEL.value=1;
	frm.action = "/cms/menu/form";
	frm.submit();
}
</script>
<form name="searchForm" id="searchForm" action="/cms/menu/" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" />
    <input type="hidden" name="MENU_LEVEL"/>
    <div class="search_box">
        <%--<html:selectList name='MENU_SE' optionNames="관리자|업무" optionValues="1|2" selectedValue='${param.MENU_SE}' defaultValue="1" title="도메인정보" script=" onchange='document.searchForm.ONE_DEPTH_ID.value=\"\";goSearch();return false;' class='W90'" />--%> 
        <input type="hidden" name="MENU_SE"  id="MENU_SE" value="1"> 
        <html:selectList name='ONE_DEPTH_ID' list='oneAllList' optionNames='전체' optionValues='' listValue='MENU_NO' listName='MENU_NM' selectedValue='${param.ONE_DEPTH_ID}' title="1단계 메뉴" script="class=\"W120\" onchange='goSearch();return false;'" /> 
        <a href="" onclick="goSearch();return false;" class="btn_2">조 회</a>
    </div>
</form>
<div class="tit MgT10">검색결과</div>
<form name="frm" id="frm" action="/cms/menu/cud" method="post">
    <input type="hidden" name="mode" value="sortSave" /> 
    <input type="hidden" name="SORT_REF" id="SORT_REF" value="" /> 
    <input type="hidden" name="MENU_NO_REF" id="MENU_NO_REF" value="" /> 
    <input type="hidden" name="MENU_SE" value="<c:out value='${param.MENU_SE}' default="1"/>" /> 
    <input type="hidden" name="ONE_DEPTH_ID" value="<c:out value='${param.ONE_DEPTH_ID}'/>" /> 
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" />
    <table summary="메뉴 리스트- 메뉴ID, 메뉴명, 타입, 순서, 사용여부 , 추가" class="table_basic table01">
        <caption>메뉴 리스트</caption>
        <colgroup>
            <col width="10%" />
            <col width="*" />
            <col width="10%" />
            <col width="10%" />
            <col width="10%" />
            <col width="20%" />
        </colgroup>
        <thead>
            <tr>
                <th class="first">메뉴코드</th>
                <th>메뉴명</th>
                <th>타입</th>
                <th>순서</th>
                <th>사용여부</th>
                <th>추가</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var='EO' items='${dataList}' varStatus='status'>
                <c:forEach var='EEO' items='${EO.subList}'>
                    <c:if test="${EEO.LEVEL==1}">
                        <c:set var="trColor" value="#A4C6EB" />
                    </c:if>
                    <c:if test="${EEO.LEVEL==2}">
                        <c:set var="trColor" value="#C0D8F1" />
                    </c:if>
                    <c:if test="${EEO.LEVEL==3}">
                        <c:set var="trColor" value="#DDEAF8" />
                    </c:if>
                    <c:if test="${EEO.LEVEL==4}">
                        <c:set var="trColor" value="#F2F7FC" />
                    </c:if>
                    <tr bgcolor="${trColor }">
                        <td class="BgNone">${EEO.MENU_NO}</td>
                        <td class="AL BgNone">
                            <c:forEach begin="1" end="${EEO.LEVEL-1}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach> <c:if test="${EEO.LEVEL==1}">①</c:if> <c:if test="${EEO.LEVEL==2}">②</c:if> <c:if test="${EEO.LEVEL==3}">③</c:if> <c:if test="${EEO.LEVEL==4}">④</c:if> <c:if test="${EEO.LEVEL==5}">⑤</c:if> <c:if test="${EEO.LEVEL==6}">⑥</c:if>
                            <c:choose>
                                <c:when test="${EEO.USE_AT == 'Y'}">
                                    <a href="/cms/menu/form?MENU_SE=<c:out value='${EO.MENU_SE}'/>&amp;pMENU_NO=<c:out value='${param.pMENU_NO}'/>&amp;MENU_NO=<c:out value='${EEO.MENU_NO}'/>&amp;ONE_DEPTH_ID=<c:out value='${param.ONE_DEPTH_ID}'/>">${EEO.MENU_NM}</a>
                                </c:when>
                                <c:otherwise>
                                    <del>
                                        <a href="/cms/menu/form?MENU_SE=<c:out value='${EO.MENU_SE}'/>&amp;pMENU_NO=<c:out value='${param.pMENU_NO}'/>&amp;MENU_NO=<c:out value='${EEO.MENU_NO}'/>&amp;ONE_DEPTH_ID=<c:out value='${param.ONE_DEPTH_ID}'/>">${EEO.MENU_NM}</a>
                                    </del>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="BgNone">${EEO.CNTNTS_TY_NM}</td>
                        <td class="BgNone"><input type="hidden" name="MENU_NO" value="<c:out value='${EEO.MENU_NO}'/>" /> 
                            <select name="SORT_ORDR" class="W50" title="순번">
                                <html:selectInt begin="1" end="20" step="1" selected="EEO.SORT_ORDR" />
                            </select>
                        </td>
                        <td class="BgNone">${EEO.USE_AT=='Y'?'O':'X'}</td>
                        <td class="BgNone">
                            <c:if test="${menuMap.CHANGE_AUTHOR_AT == 'Y'}"><a href="/cms/menu/form?MENU_SE=<c:out value='${EO.MENU_SE}'/>&amp;pMENU_NO=<c:out value='${param.pMENU_NO}'/>&amp;MENU_NO=<c:out value='${EEO.MENU_NO}' />&amp;ONE_DEPTH_ID=<c:out value='${param.ONE_DEPTH_ID}'/>" class="btn_3">수정</a></c:if> 
                            <c:if test="${menuMap.REGISTE_AUTHOR_AT == 'Y'}"><a href="/cms/menu/form?MENU_SE=<c:out value='${EO.MENU_SE}'/>&amp;pMENU_NO=<c:out value='${param.pMENU_NO}'/>&amp;MENU_LEVEL=<c:out value='${EEO.MENU_LEVEL+1}'/>&amp;UPPER_MENU_NO=<c:out value='${EEO.MENU_NO}'/>&amp;ONE_DEPTH_ID=<c:out value='${param.ONE_DEPTH_ID}'/>" class="btn_3">하위메뉴등록</a></c:if>
                        </td>
                    </tr>
                </c:forEach>
            </c:forEach>
            <c:if test="${empty dataList}">
                <tr>
                    <td class="AC borR0" colspan="6">자료가 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    <div class="AR MgT10">
        <html:buttonAuth gubun="proc" script="sortChk();return false;" title="정렬 저장"/>
        <html:buttonAuth gubun="add" script="goOneDepthAdd();return false;" title="1차 메뉴등록"/>
    </div>
</form>
