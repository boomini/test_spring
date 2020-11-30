<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
/* System.out.println(request.getAttribute("exception.message")); */
%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<title>LCY 정보시스템 : ERROR</title>
<link rel="stylesheet" type="text/css" href="/com/css/BasicSet.css" />
<link rel="stylesheet" type="text/css" href="/com/css/common.css" />
</head>
<body>
    <div class="errerBox">
        <p class="MgT30"><img src="/com/images/warning.gif" /></p>
        <p class="MgT30"><img src="/com/images/txt_01.gif" /></p>
        <p class="MgT30"><img src="/com/images/txt_02.gif" /></p>
        <div class="telInfo MgT30">
            <span class="MgT30"><c:out value="${sessionScope.errorfoot[0].CODE_NM }"/></span>
        </div>
    </div>
</body>
</html>
<%-- ${exception.message} --%>
</body>
</html>