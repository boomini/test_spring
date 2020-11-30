<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
function geDelete(){
	var fm = document.form;
	if($('input:checkbox[name=chkbox]:checked').length == 0){
		alert('선택된 자료가 없습니다.');
        return;
    }
	if(!confirm('삭제하시겠습니까?')){
    	return;
	}
	fm.mode.value="delete";
	fm.action='/cms/banner/cud/';
	fm.method="post";
	fm.submit();
}

function updateState(seq, sts){
	var fm = document.form;
	fm.BANNER_NO.value=seq;
	fm.USE_AT.value=sts;
	fm.method="post";
	fm.mode.value="updateState";
	fm.action='/cms/banner/cud/';
	fm.submit();
}
function goForm(){
	location.href="/cms/banner/form/${parameters}"
}
</script>
<form name="form" action="/cms/banner/" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" /> 
    <input type="hidden" name="BANNER_NO" id="BANNER_NO" value="" /> 
    <input type="hidden" name="USE_AT" id="USE_AT" value="" /> 
    <input type="hidden" name="mode" id="mode" value="" />
    <div class="tit MgT10">검색결과 <span class="toCount fr">(총 <em class="txt_orage"><c:out value="${pager.totalCount }" /></em>건)</span></div>
    <table class="table_basic table01" summary="배너테이블 - 배너명,링크,순서,상태를 표시합니다.">
        <caption>배너 목록</caption>
        <colgroup>
            <col style="width: 10%"/>
            <col style="width: 35%;"/>
            <col style="width: 35%;"/>
            <col style="width: 10%;"/>
            <col style="width: 10%;"/>
        </colgroup>
        <thead>
            <tr>
                <th><input type="checkbox" onclick="gfnToggleMultiChk(this.checked, 'chkbox')" title="전체선택" /></th>
                <th>배너명</th>
                <th>링크</th>
                <th>순서</th>
                <th>상태</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="list" varStatus="stat">
                <tr>
                    <td><input type="checkbox" name="chkbox" value="<c:out value="${list.BANNER_NO }"/>" title="행선택" /></td>
                    <td class="AL"><a href="<c:url value='/cms/banner/form/${parameters}&BANNER_NO=${list.BANNER_NO }'/>"> <c:out value="${list.BANNER_NM}" /></a></td>
                    <td class="AL"><c:out value='${hana:leftKor(list.LINK_URL, 40)}' /></td>
                    <td class="AC">
                        <c:out value="${list.BANNER_ORDR }" />
                    </td>
                    <td class="AC borR0">
                        <select title="사용유무" onChange="updateState(<c:out value="${list.BANNER_NO }"/>, this.value)">
                            <option value="Y" <c:if test="${list.USE_AT eq 'Y'}">selected</c:if>>사용중</option>
                            <option value="N" <c:if test="${list.USE_AT eq 'N'}">selected</c:if>>사용안함</option>
                    </select>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty list }">
                <tr>
                    <td colspan="5" class="AC borR0">자료가 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</form>
<div class="AR MgT10">
    <html:buttonAuth gubun="del" script="geDelete();return false;"/>
    <html:buttonAuth gubun="add" script="goForm();return false;"/>
</div>
<%@include file="/WEB-INF/jsp/common/pager.jsp"%>
