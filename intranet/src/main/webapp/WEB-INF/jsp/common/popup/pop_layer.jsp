<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<div class="M_info">
    <h2>${vo.POPUP_NM}</h2>
    <div class="Close" onclick="self.close();" title="닫기"></div>
    <div class="NumDesc">
        <div>
            <c:if test="${!empty vo.FILE_ID}">
                <a href="" onclick="golink('${vo.LINK}');return false;"><img id="popimg" src="/jfile/readDownloadFile.do?fileId=${vo.FILE_ID}&fileSeq=1" alt="<c:out value="${vo.POPUP_NM}" />" /></a>
            </c:if>
        </div>
        <c:if test="${not empty vo.POPUP_CN}">
            <div class="popContent">
                <html:xss>
                    <c:out value="${vo.POPUP_CN}" escapeXml="false" />
                </html:xss>
            </div>
        </c:if>
    </div>
</div>
<div class="popFoot" id="foot">
    <input type="checkbox" onclick="gfnCloseWin()" id="pop" style="vertical-align: middle;" /> <label for="pop" class="labelPop">오늘하루 보이지 않기&nbsp;</label>
</div>
