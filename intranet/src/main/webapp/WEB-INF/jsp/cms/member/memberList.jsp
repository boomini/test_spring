<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function(){
	$('#USE_AT').change(function() {
	    if ($(this).val() == 'R') {
	      $("#RETURN_PRVONSH").val("").show();
	    } else {
	      $("#RETURN_PRVONSH").val("").hide();
	    }
	});  
});
//회원상태 변경
function goStatChg() {
	var fm = document.frm;
	if ($('input:checkbox[name=chkbox]:checked').length == 0) {
		alert('선택된 회원이 없습니다.');
		return;
	}
	if ($("#USE_AT").val() == "") {
		alert("상태를 선택하세요.");
		$("#USE_AT").focus();
		return;
	} else if ($("#USE_AT").val() == "R") {
		if ($("#RETURN_PRVONSH").val() == "") {
			alert("반려 사유를 입력하세요.");
			$("#RETURN_PRVONSH").focus();
			return;
		}
	}

	fm.action = "/cms/member/cud/";
	fm.mode.value = "applove";
	fm.submit();
}
//조회
function goSearch(excelYn) {
	var fm = document.frm;
	$("#EXCEL_YN").val(excelYn);
	if (excelYn == 'Y') {
		document.frm.target = "_blank";
	} else {
		document.frm.target = "";
	}
	fm.submit();
}

function goExcel2(){
	$("#EXCEL_YN").val("Y");
	excelDownLoad( $("#frm").prop('action'),"frm");
}

function goExcel(){
	excelDownLoad( '/cms/bigDataExcelDown',"frm");
}

//등록폼
function goForm(pUserId){
	var fm = document.frm;
	fm.user_id.value = pUserId
	fm.action ="/cms/member/form/";
	fm.submit();
	
}
//엔터키 조회
function fn_enter() {
	goSearch('');
}
</script>
<!--컨텐츠 영역-->
<form name="frm" id="frm" method="post" action="/cms/member/">
    <input type="hidden" name="pMENU_NO" value="<c:out value='${param.pMENU_NO}'/>"> 
    <input type="hidden" name="user_id" id="user_id" value="">
    <input type="hidden" name="EXCEL_YN" id="EXCEL_YN" value="">
    <input type="hidden" name="mode" value="">
    <%-- 엑셀 다운로드 파라미터 --%>
    <input type="hidden" name="tFileNm" value="memberList">
    <input type="hidden" name="dFielNm" value="회원목록">
    <input type="hidden" name="qNs" value="memberMapper">
    <input type="hidden" name="qId" value="getMemberExcelList">
    <input type="hidden" name="sR" value="3">
    <input type="hidden" name="sC" value="0">
    
    <div class="condition">
        <table summary="회원조회 조건-회원권환,회원상태,회원ID,회원이름" class="table02">
            <caption>회원조회 조건</caption>
            <colgroup>
                <col style="width: 15%"/>
                <col style="width: 35%"/>
                <col style="width: 15%"/>
                <col style="width: 35%"/>
            </colgroup>
            <tbody>
                <tr>
                    <th>회원권한</th>
                    <td><html:selectList name='pAuth' title="회원권한" optionNames='전체' optionValues='' list='perList' listValue='CODE' listName='CODE_NM' selectedValue='${param.pAuth}' /></td>
                    <th>회원상태</th>
                    <td><html:selectList name='pUseAt' title="회원상태" optionNames='전체' optionValues='' list='mGuList' listValue='CODE' listName='CODE_NM' selectedValue='${param.pUseAt}' /></td>
                </tr>
                <tr>
                    <th>회원ID</th>
                    <td><input type="text" name="pUserId" value="<c:out value='${param.pUserId }'/>" title="회원 ID" id="pUserId" class="entrKey" /></td>
                    <th>회원이름</th>
                    <td><input type="text" name="pUserNm" value="<c:out value='${param.pUserNm }'/>" title="회원이름" id="pUserNm" class="entrKey" /></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="AR MgT5">
        <a href="" onclick="goExcel('Y');return false;" class="xls">엑셀 다운로드</a>
        <a href="" onclick="goSearch('');return false;" class="btn_2">조 회</a>
        <c:if test="${not empty param.pAuth or not empty param.pUseAt or not empty param.pUserId or not empty param.pUserNm}">
            <a href="/cms/member/?pMENU_NO=<c:out value='${param.pMENU_NO}'/>" class="btn_4">초기화</a>
        </c:if>
    </div>
    <div class="tit MgT10">검색결과 <span class="toCount fr">(총 <em class="txt_orage"><c:out value="${pager.totalCount }" /></em>건)</span></div>
    <table class="table_basic table01" summary="회원목록-회원ID,이름,이메일주소,권한,상태,등록일">
        <colgroup>
            <col style="width: 10%" />
            <col style="width: 23%" />
            <col style="width: 22%" />
            <col style="width: 21%" />
            <col style="width: 12%" />
            <col style="width: 12%" />
        </colgroup>
        <thead>
            <tr>
                <th><input type="checkbox" onclick="gfnToggleMultiChk(this.checked, 'chkbox')" title="전체선택" /></th>
                <th>회원 ID</th>
                <th>이름</th>
                <th>권한</th>
                <th>상태</th>
                <th>등록일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="rs" items="${list}" varStatus="st">
                <tr>
                    <td><input type="checkbox" name="chkbox" value="<c:out value="${rs.USER_ID }"/>" title="행선택" /></td>
                    <td><a href="" onclick="goForm('<c:out value='${rs.USER_ID}'/>');return false;"><c:out value='${rs.USER_ID }' /></a></td>
                    <td><a href="" onclick="goForm('<c:out value='${rs.USER_ID}'/>');return false;"><c:out value='${rs.USER_NM }' /></a></td>
                    <td><a href="" onclick="goForm('<c:out value='${rs.USER_ID}'/>');return false;"><c:out value='${rs.AUTHOR_CODE_NM }' /></a></td>
                    <td><a href="" onclick="goForm('<c:out value='${rs.USER_ID}'/>');return false;"><c:out value='${rs.USE_AT_NM }' /></a></td>
                    <td><a href="" onclick="goForm('<c:out value='${rs.USER_ID}'/>');return false;"><fmt:formatDate value="${rs.REGIST_DT}" pattern="yyyy-MM-dd" /></a></td>
                </tr>
            </c:forEach>
            <c:if test="${empty list}">
                <tr>
                    <td colspan="6" class="AC borR0">자료가 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    <div class="AR MgT10">
        <span class="fl">
            <html:selectList name='USE_AT' title="회원상태" optionNames='상태선택' optionValues='' list='mGuList' listValue='CODE' listName='CODE_NM'  script="class='W90 selectBoxS'" />
            <input type="text" name="RETURN_PRVONSH" value="${member.RETURN_PRVONSH }" title="반려사유" id="RETURN_PRVONSH" maxlength="500" class="W250 dis_no" placeholder="반려사유를 입력하세요." />
            <html:buttonAuth gubun="proc" script="goStatChg();return false;"/>
        </span> 
        <html:buttonAuth gubun="add" script="goForm();return false;"/><!-- 등록 -->
    </div>
    <%@include file="/WEB-INF/jsp/common/pager.jsp"%>
</form>
<!--//컨텐츠 영역-->
