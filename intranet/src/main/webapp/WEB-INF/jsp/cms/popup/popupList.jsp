<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
function goAction(cmd) {
	var fm = document.form;
	fm.action = cmd;
	if (cmd == '/cms/popup/cud/') {
		if ($('input:checkbox[name=chkbox]:checked').length == 0) {
			alert('선택된 자료가 없습니다.');
			return;
		}
		if (!confirm("삭제하시겠습니까?")) {
			return;
		}
	}
	fm.method = "post";
	fm.mode.value = "delete";
	fm.submit();
}
function goSearch(cmd) {
	var fm = document.form;
	fm.action = cmd;
	fm.method = "get";
	fm.submit();
}
function goClear() {
	var fm = document.form;
	fm.searchType.value = '0';
	fm.searchWord.value = '';
	fm.action = "/cms/popup/";
	fm.method = "get";
	fm.submit();
}
function goView(popTitle, popSeq, popup_x, popup_y, popuPOPUP_AR,
		popuPOPUP_HG) {
	var url = '/web/pop?POPUP_NO=' + popSeq;
	var name = popTitle;
	var option = 'top=' + popup_y + ',left=' + popup_x + ',width='
			+ popuPOPUP_AR + ',height=' + popuPOPUP_HG;
	var win = window.open(url, 'popup' + name, option);
	win.window.focus();
}
function goForm(){
	location.href='/cms/popup/form/${parameters}';
}
</script>
<form name="form" action="/cms/popup/" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" /> <input type="hidden" name="seq" id="seq" value="" /> <input type="hidden" name="mode" id="mode" value="" /> <input type="hidden" name="POPUP_NO" id="POPUP_NO" value="" />
    <div class="search_box">
        <html:selectList script="" name='searchType' optionValues='0|1|2' optionNames='전체|팝업명|링크' title="검색옵션" selectedValue='${param.searchType}' /> 
        <input type="text" class="W200" name="searchWord" id="searchWord" value="<c:out value="${param.searchWord}" />" title="검색키워드" />
        <a href="" onclick="goSearch('/cms/popup/');return false;" class="btn_2">조 회</a> 
        <c:if test="${not empty param.searchWord }">
            <a href="" onclick="goClear();return false;" class="btn_4">초기화</a>
        </c:if>
    </div>
    <div class="tit MgT10">검색결과 <span class="toCount fr">(총 <em class="txt_orage"><c:out value="${pager.totalCount }" /></em>건)</span></div>
    <table class="table_basic table01" summary="팝업명,링크,기간">
        <caption>팝업 목록</caption>
        <colgroup>
            <col style="width: 10%;" />
            <col />
            <!-- <col style="width: 25%;" /> -->
            <col style="width: 20%;" />
            <col style="width: 10%;" />
            <col style="width: 10%;" />
            <col style="width: 10%;" />
        </colgroup>
        <thead>
            <tr>
                <th><input type="checkbox" onclick="gfnToggleMultiChk(this.checked, 'chkbox')" title="전체선택"></th>
                <th>팝업명</th>
                <!-- <th>링크</th> -->
                <th>기간</th>
                <th>순서</th>
                <th>상태</th>
                <th>보기</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="list" varStatus="stat">
                <tr>
                    <td><input type="checkbox" name="chkbox" value="<c:out value="${list.POPUP_NO }"/>" title="행선택" /></td>
                    <td class="AL"><a href="/cms/popup/form/${parameters}&POPUP_NO=<c:out value='${list.POPUP_NO }'/>"> <c:out value="${list.POPUP_NM}" /></a></td>
                    <%-- <td class="AL"><a href="/cms/popup/form/${parameters}&POPUP_NO=<c:out value='${list.POPUP_NO }'/>"><c:out value="${list.LINK_URL}" /></a></td> --%>
                    <td><c:out value="${list.BEGIN_DE}" /> ~ <c:out value="${list.END_DE}" /></td>
                    <td><c:out value="${list.SORT_ORDR}" /></td>
                    <td><c:if test="${list.STATE eq 'Y'}">
                            <font color="red">운영</font>
                        </c:if> <c:if test="${list.STATE eq 'N'}">중지</c:if></td>
                    <td><a href="" onclick="goView('${list.POPUP_NM}', '${list.POPUP_NO }','${list.OUTPT_LC_XAXS}','${list.OUTPT_LC_YAXS}','${list.POPUP_AR}','${list.POPUP_HG}');return false;"><img alt="미리보기" src="/com/images/icon.png"></a></td>
                </tr>
            </c:forEach>
            <c:if test="${empty list }">
                <tr>
                    <td colspan="6">자료가 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</form>
<div class="AR MgT10">
    <html:buttonAuth gubun="del" script="goAction('/cms/popup/cud/');return false;"/><!-- 삭제 -->
    <html:buttonAuth gubun="add" script="goForm();return false;"/><!-- 등록 --> 
</div>
<%@include file="/WEB-INF/jsp/common/pager.jsp"%>
