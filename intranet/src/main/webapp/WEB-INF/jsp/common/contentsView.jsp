<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
	function goForm() {
		var url = "/cms/contents/form/?MENU_NO=${param.pMENU_NO}&pMENU_NO=${param.pMENU_NO}&cntnts_no=${menuMap.CNTNTS_NO}";
		gfnPopup(url, 750, 730, 1, 'contentSubPop');
	}
</script>
<c:out value='${dataMap.CNTNTS_CN}' escapeXml="false" />
<c:if test="${memberVO.isAdmin == 'true'}">
    <div class="btn AR MgT10">
        <a href="" onclick="goForm();return false;" class="btn_1">${empty menuMap.CNTNTS_NO?'등 록':'수 정'}</a>
    </div>
</c:if>
