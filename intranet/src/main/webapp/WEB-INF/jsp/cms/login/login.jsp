<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>토양지하수 정보시스템</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/BasicSet.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/common.css" />"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/sub.css" />" />
<%--javascript--%>
<script type="text/javascript" src="<c:url value="/js/jquery-1.11.3.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/login.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/common.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/cmnReady.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-ui-1.11.4.custom/jquery-ui.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/smartPop/jquery.smartPop.js" />"></script>
<script type="text/javascript" src="<c:url value="/com/js/ui.js"/>"></script>
<script>
$(function(){
    $("#passwd").keypress(function(e) {
        if ('13' == e.keyCode) {
            ckLogin();
            return false;
        }
    });
    $("#userId").focus();
    $("#footer").addClass("fix_bottom");
});
//로그인
function ckLogin() {
    if ($("#userId").val() == "") {
        alert("아이디를 입력하세요");
        $("#userId").focus();
        return;
    }
    if ($("#passwd").val() == "") {
        alert("비밀번호를 입력하세요");
        $("#passwd").focus();
        return;
    }
    $("#loginFrm").submit();
}
</script>
</head>
<body>

<form name="loginFrm" id="loginFrm" method="post" action="/web/loginProc/">
<div id="wrap" class="sty02">
    <!--헤더-->
    <%@include file="/WEB-INF/jsp/site/cms/header.jsp" %>
    <!-- 헤더 끝-->
    <div id="login">
    	<div class="loginCont">
        	<dl class="loginForm">
            	<dd><input type="text" placeholder="아이디" id="userId" name="userId" value="coohg93"/></dd>
                <dd><input type="password" placeholder="비밀번호" id="passwd" name="passwd" value="11"/></dd>
                <dd class="MgT20"><a href="" class="btn_login" title="로그인" onclick="ckLogin();return false;">로그인</a></dd>
            </dl>
        </div>
        <div class="loginFooter">
            <div class="idpw_txt">
            	아이디/비밀번호를 잊으셨습니까?<br />
            	<a href="/ipCheck.jsp" target="_blank">담당자에게 이메일 또는 전화 문의하시기바랍니다.</a> 
            </div>
            <span class="AC"><a href="coohg93@hanmail.net" class="qMail" title="담당자에게 메일 보내기">담당자에게 Email문의하기</a></span>
        </div>
        
    </div>
    <!-- Footer 시작 -->
    <%@include file="/WEB-INF/jsp/site/cms/footer.jsp" %>
    <!-- Footer 끝 // --> 
</div>
</form>
</body>
</html>