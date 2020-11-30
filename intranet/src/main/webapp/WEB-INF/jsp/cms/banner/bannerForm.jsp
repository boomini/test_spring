<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
	function goSave() {
		var fm = document.form;
		if (!gfnValidate(fm)) {
			return;
		}
		if (fm.BANNER_ORDR.value.length == 0) {
			fm.BANNER_ORDR.value = '0';
		}
		fm.submit();
	}
</script>
<form name="form" action="/cms/banner/cud/" method="post" enctype="multipart/form-data">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" /> 
    <input type="hidden" name="BANNER_NO" id="BANNER_NO" value="<c:out value="${vo.BANNER_NO }" />" /> 
    <input type="hidden" name="FILE_ID" id="FILE_ID" value="<c:out value="${vo.FILE_ID }" />" /> 
    <input type="hidden" name="mode" id="mode" value="${mode}">
    <table class="table02" summary="배너명, 설명, 링크, 새창여부, 순서, 이미지등록을 표시한다.">
        <caption>배너 등록</caption>
        <colgroup>
            <col style="width: 15%;" />
            <col style="width: 35%;" />
            <col style="width: 15%;" />
            <col style="width: 35%;" />
        </colgroup>
        <tbody>
            <tr>
                <th><span class="iCheck">배너명</span></th>
                <td colspan="3"><input type="text" name="BANNER_NM" id="BANNER_NM" value="<c:out value="${vo.BANNER_NM }" />" title="배너명" maxlength="200" class="W300 checkNull" /></td>
            </tr>
            <tr>
                <th><span class="iCheck">설명</span></th>
                <td colspan="3"><input type="text" name="BANNER_DC" id="BANNER_DC" value="<c:out value="${vo.BANNER_DC }" />" title="설명" maxlength="200" class="W650 checkNull" /></td>
            </tr>
            <tr>
                <th>링크</th>
                <td colspan="3"><input type="text" name="LINK_URL" id="LINK_URL" value="<c:if test="${empty vo}">http://</c:if><c:out value="${vo.LINK_URL }" />" title="링크" maxlength="200" class="W650" />&nbsp;</td>
            </tr>
            <tr>
                <th><span class="iCheck">새창여부</span></th>
                <td class="AL PdL5"><input type="radio" name="POPUP_AT" id="POPUP_AT1" title="새창여부Y" value="Y" <c:if test="${vo.POPUP_AT eq 'Y' or empty vo}">checked="checked"</c:if> /> <label for="POPUP_AT1">예</label> <input type="radio" name="POPUP_AT" id="POPUP_AT2" title="새창여부N" value="N" <c:if test="${vo.POPUP_AT eq 'N'}">checked="checked"</c:if> /> <label for="POPUP_AT2">아니오</label></td>
                <th>순서</th>
                <td><input type="text" name="BANNER_ORDR" id="BANNER_ORDR" title="순서" value="${vo.BANNER_ORDR }" maxlength="3" size="3" class="W30 intCheck" /> (입력안하면 0순위)</td>
            </tr>
            <tr>
                <th><span class="iCheck">이미지 등록</span></th>
                <td colspan="3">
                    <input type="file" name="FILE_ID" id="FILE_ID" title="이미지파일" class="W650 <c:if test="${ empty vo.FILE_ID}">checkNull</c:if>"  /> 
                    <c:if test="${not empty vo.FILE_ID}">
                        <br />
                        <img src='/jfile/readDownloadFile.do?fileId=${vo.FILE_ID}&fileSeq=1' class="W90p MgT5" alt="<c:out value="${vo.BANNER_NM }" />" />
                        <br />
                        <input type="checkbox" name="FILE_DELETE_AT" id="FILE_DELETE_AT" value="Y" title="파일삭제여부"> <label for="FILE_DELETE_AT">파일삭제</label>
                    </c:if>
                </td>
            </tr>
        </tbody>
    </table>
</form>
<div class="AR MgT10">
    <c:if test="${empty vo }"><html:buttonAuth gubun="add" script="goSave();return false;"/><!-- 등록 --></c:if> 
    <c:if test="${not empty vo}"><html:buttonAuth gubun="mod" script="goSave();return false;"/><!-- 수정 --></c:if>
    <a href="<c:url value='/cms/banner/${parameters}'/>" class="btn_2">목 록</a>
</div>
