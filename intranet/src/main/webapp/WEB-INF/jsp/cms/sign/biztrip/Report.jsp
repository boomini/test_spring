<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>프린트 </title>

<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/BasicSet.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/print.css" />" />

<script type="text/javascript" src="<c:url value="/js/jquery-1.11.3.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-ui-1.11.4.custom/jquery-ui.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/common.js" />"></script>

</head>

<script type="text/javascript">
//팝업 종료
function closePop(){
	window.close();
};
</script>
<style>
p{
	position: absolute;
}
.USER_NM{left: 300px;top: 225px;}
.AUTH{left: 620px;top: 225px;}
.ORG{left: 300px;top: 255px;}
.JOBS{left: 620px;top: 255px;}
.PURPOSE{left: 400px;top: 290px;}
.STARTDAY{left: 350px;top: 320px;}

.VISITS{left: 280px;top: 355px;}
.PNUM{left: 590px;top: 355px;}

.STEP0{left: 580px;top: 112px;}
.STEP1{left: 680px;top: 112px;}
</style>
<a id="target" style="display: none"></a>
<body>
	<div class="W100p H20 printBtn" style="position: absolute;">
		<button class="Tbtn W80 AC" type="button" onclick="fnReportPrint();return false">프린트</button>
	</div>
	 
	<c:forEach items="${signList}" var="list" varStatus="stat">
		<p class="STEP${stat.index}" ><c:out value="${list.SIGN_STEP}"/></p>
	</c:forEach>
 	
	<p class="USER_NM"><c:out value="${sign.USER_NM}"/> </p>
	<p class="AUTH"><c:out value="${sign.AUTH}"/>    </p>
	<p class="ORG"><c:out value="${sign.ORG}"/>     </p>
	<p class="JOBS"><c:out value="${sign.JOBS}"/>    </p>
	<p class="PURPOSE"><c:out value="${sign.PURPOSE}"/> </p>
	<p class="STARTDAY"><c:out value="${sign.STARTDAY}"/> ~ <c:out value="${sign.ENDDAY}"/></p>
	<p class="VISITS"><c:out value="${sign.VISITS}"/>  </p>
	<p class="PNUM"><c:out value="${sign.PNUM}"/>    </p>
	
	
	
	
	           							
	<div class="W100p subpage MgT10">
	   <!-- 프린트 영역 start -->
			<img src="/com/images/biztrip.PNG" alt="출장신청서" style="margin-left: 20px"/>
	   <!-- 프린트 영역 end -->
	</div>
</body>
</html>