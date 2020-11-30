<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
    <div id="footer" class="fullLayout fix_bottom">
        <div class="footer_inner contLayout">
            <div class="copy_cont fl">
                <p class="engfont copyright">${sessionScope.footerInfo[0].CODE_NM}</p>
                <p>${sessionScope.footerInfo[1].CODE_NM}</p>
                <p>${sessionScope.footerInfo[2].CODE_NM}</p>
            </div>
        </div>
    </div>
