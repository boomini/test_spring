<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<script>
//날짜 추가
$(function() {
	gfnInitDatePickerTwo();//달력세팅(검색기간용)
});
function goSave() {
	
	var fm = document.form;
	if (!gfnValidate(fm)) {
		return;
	}
	var d1 = Number($("#startDay").val().replace(/-/g, ''));
	var d2 = Number($("#endDay").val().replace(/-/g, ''));
	if (d2 - d1 < 0) {
		alert("기간이 잘못되었습니다.");
		$("#startDay").focus();
		return;
	}
	var authGrop = gfnMultiCheckedString("auths");
	if(authGrop == ""){
		alert("권한은 하나이상 체크해주세요.");
		return;
	}
	
	$("#AUTH_GROP").val(authGrop);
	fm.method = "post";
	fm.submit();
}
//팝업 미리보기
function goPreView(popTitle, popSeq, popup_x, popup_y, popuPOPUP_AR, popuPOPUP_HG) {
	var url = '/web/pop?POPUP_NO=' + popSeq;
	var name = popTitle;
	var option = 'top=' + popup_y + ',left=' + popup_x + ',width=' + popuPOPUP_AR + ',height=' + popuPOPUP_HG;
	var win = window.open(url, 'popup' + name, option);
	win.window.focus();
}
</script>
<form name="form" action="/cms/popup/cud/" method="post" enctype="multipart/form-data">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" /> 
    <input type="hidden" name="POPUP_NO" id="POPUP_NO" value="<c:out value="${vo.POPUP_NO}" />" /> 
    <input type="hidden" name="mode" id="mode" value="${mode}"/> 
    <input type="hidden" name="searchType" id="searchType" value="${param.searchType }" /> 
    <input type="hidden" name="searchWord" id="searchWord" value="${param.searchWord }" />
    <input type="hidden" name="AUTH_GROP" id="AUTH_GROP" value="" />
    <table class="table02" summary="팝업등록,팝업명,링크,팝업사용,팝업순서,내용">
        <caption>팝업 등록</caption>
        <colgroup>
            <col style="width: 15%;" />
            <col style="width: 35%;" />
            <col style="width: 15%;" />
            <col style="width: 35%;" />
        </colgroup>
        <tr>
            <th><span class="iCheck">팝업명</span></th>
            <td colspan="3" class="AL PdL5 borR0">
            <input type="text" name="POPUP_NM" id="POPUP_NM" value="<c:out value="${vo.POPUP_NM}" />"  title="팝업명" class="checkNull W500" /> 
            <c:if test="${not empty vo }">
                <a href="" onclick="goPreView('${vo.POPUP_NM}', '${vo.POPUP_NO }','${vo.OUTPT_LC_XAXS}','${vo.OUTPT_LC_YAXS}','${vo.POPUP_AR}','${vo.POPUP_HG}');return false;"><img alt="미리보기" src="/com/images/icon.png"></a>
            </c:if>
            </td>
        </tr>
        <tr>
            <th>링크</th>
            <td class="AL PdL5 borR0">
                <input type="text" name="LINK_URL" id="LINK_URL" value="<c:if test="${empty vo }">http://</c:if><c:out value="${vo.LINK_URL}"/>" title="링크"  class="W300" />
            </td>
            <th><span class="iCheck">기간</span></th>
            <td class="AL PdL5 borR0">
                <input type="text" name="startDay" id="startDay" readonly="readonly" value="<c:out value="${vo.BEGIN_DE}" />" title="시작일" class="checkNull W80"/> ~ 
                <input type="text" name="endDay" id="endDay" readonly="readonly" value="<c:out value="${vo.END_DE}" />" title="종료일" class="checkNull W80"/>
            </td>
        </tr>
        <tr>
            <th>팝업사용/ 순서</th>
            <td class="AL PdL5 borR0">
                <select name="USE_AT" class="W90" title="사용유무">
                    <option value="Y" <c:if test="${vo.USE_AT eq 'Y'}"> selected</c:if>>사용</option>
                    <option value="N" <c:if test="${vo.USE_AT eq 'N'}"> selected</c:if>>미사용</option>
                </select>
                &nbsp; 
                <select name="SORT_ORDRer" class="W90" title="팝업순서">
                    <option value="1" <c:if test="${vo.SORT_ORDR eq '1'}"> selected</c:if>>1</option>
                    <option value="2" <c:if test="${vo.SORT_ORDR eq '2'}"> selected</c:if>>2</option>
                    <option value="3" <c:if test="${vo.SORT_ORDR eq '3'}"> selected</c:if>>3</option>
                    <option value="4" <c:if test="${vo.SORT_ORDR eq '4'}"> selected</c:if>>4</option>
                    <option value="5" <c:if test="${vo.SORT_ORDR eq '5'}"> selected</c:if>>5</option>
                    <option value="6" <c:if test="${vo.SORT_ORDR eq '6'}"> selected</c:if>>6</option>
                </select>
            </td>
            <th>오픈위치</th>
            <td class="AL PdL5 borR0">Left : <input type="text" name="OUTPT_LC_XAXS" id="OUTPT_LC_XAXS" size="3" value="<c:out value="${vo.OUTPT_LC_XAXS}" />" class="intCheck W50" title="레프트" /> px, Top : <input type="text" name="OUTPT_LC_YAXS" id="OUTPT_LC_YAXS" size="3" value="<c:out value="${vo.OUTPT_LC_YAXS}" />" class="intCheck W50" title="탑" /> px
            </td>
        </tr>
        <tr>
            <th>팝업종류</th>
            <td class="AL PdL5 borR0"><select name=POPUP_TY class="W90" title="사용유무">
                    <option value="N" <c:if test="${vo.POPUP_TY eq 'N'}"> selected</c:if>>새창팝업</option>
                    <option value="L" <c:if test="${vo.POPUP_TY eq 'L'}"> selected</c:if>>레이어팝업</option>
            </select></td>
            <th>팝업창 크기</th>
            <td class="AL PdL5 borR0">Width : <input type="text" name="POPUP_AR" id="POPUP_AR" title="팝업창 가로길이" value="<c:out value='${vo.POPUP_AR}' default='300'/>" class="intCheck W50" /> px, Height : <input type="text" name="POPUP_HG" id="POPUP_HG" title="팝업창 세로길이" value="<c:out value='${vo.POPUP_HG}' default='400'/>" class="intCheck W50" /> px
            </td>
        </tr>
        <tr>
            <th>권한</th>
            <td class="AL PdL5 borR0" colspan="3">
            <input type="checkbox" name="auths" value="authsAll" id="authsAll" onclick="gfnToggleMultiChk(this.checked, 'auths')"><label for="authsAll">전체</label>
            <c:forEach items="${perList }" var="eo" varStatus="st">
                <input type="checkbox" name="auths" value="<c:out value="${eo.CODE}" />" id="auths${st.count}" <c:if test="${fn:contains(vo.AUTH_GROP,eo.CODE)}">checked="checked"</c:if>>
                <label for="auths${st.count}"><c:out value="${eo.CODE_NM}" /></label>
                <c:if test="${st.count%4 == 0 }"><br/></c:if>
            </c:forEach>
            <input name="auths" id="auths9999" type="checkbox" value="9999" <c:if test="${fn:contains(vo.AUTH_GROP,'9999')}">checked="checked"</c:if>><label for="auths9999">로그인페이지</label>
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3" class="AL W150"><textarea cols="80" id="POPUP_CN" name="POPUP_CN" title="내용" rows="10">${vo.POPUP_CN}</textarea> 
                <script>
    				CKEDITOR.replace(
    								'POPUP_CN',
    								{
    									'filebrowserUploadUrl' : '/editor/upload/'
    								});
    				function fnGetEditorHTML() {
    					return CKEDITOR.currentInstance.getData();
    				}
    			</script>
            </td>
        </tr>
    </table>
    <div class="AR MgT10">
        <c:if test="${empty vo }"><html:buttonAuth gubun="add" script="goSave();return false;"/><!-- 등록 --></c:if> 
        <c:if test="${not empty vo}"><html:buttonAuth gubun="mod" script="goSave();return false;"/><!-- 수정 --></c:if>
        <a href="/cms/popup/${parameters}" class="btn_2">목 록</a>
    </div>
</form>
