<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.clipsoft.clipreport.oof.OOFFile"%>
<%@page import="com.clipsoft.clipreport.oof.OOFDocument"%>
<%@page import="java.io.File"%>
<%@page import="com.clipsoft.clipreport.server.service.ReportUtil"%>
<%

request.setCharacterEncoding("utf-8");
String crfName = request.getParameter("crfName");
String crfDb = request.getParameter("crfDb");
String paramString = request.getParameter("paramString");
String year = request.getParameter("year");
System.out.println("crfName =======>" + crfName);
System.out.println("crfDb =========>" + crfDb);
System.out.println("paramString ===>" + paramString);
System.out.println("year======= ===>" + year);
//String Url = "localhost:8080/ClipReport/aa.jsp?ID=R50&jd=f40";
//System.out.println(Url);

OOFDocument oof = OOFDocument.newOOF();
OOFFile crfFile = oof.addFile("crf.root", "%root%/crf/"+crfName+".crf");


//crfFile.addConnectionData("*",crfDb );
crfFile.addConnectionData("*","oracle1");

Enumeration<String> params = request.getParameterNames();


while(params.hasMoreElements()) {
	String paramName = (String) params.nextElement();
// 	crfFile.addField(paramName, request.getParameter(paramName));
	crfFile.addField(paramName,year);
}
//System.err.println("paramString===="  + paramString);
/* 
String crfParamArr[] = paramString.split("┼");
if ( crfParamArr.length != 0) {
	for (String param : crfParamArr){
		String temp[] = param.split("┌");
		
		System.err.println("param====>"  + param);
		
		String name ="";
		String value ="";
		
		if (temp.length == 0){
			name = "";
			value = "";
		}
		else if (temp.length== 1 ){
			name =  temp[0];
			value = "";
		}
		else if (temp.length== 2 ){
			name = temp[0];
			value = temp[1];
		}
		crfFile.addField(name, value);	
	};
}
 */

%><%@include file="./Property.jsp"%><%
//세션을 활용하여 리포트키들을 관리하지 않는 옵션
//request.getSession().setAttribute("ClipReport-SessionList-Allow", false);
String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath);
//리포트의 특정 사용자 ID를 부여합니다.
//clipreport4.properties 의 useuserid 옵션이 true 일 때만 적용됩니다. 
//clipreport4.properties 의 useuserid 옵션이 true 이고 기본 예제[String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath);] 사용 했을 때 세션ID가 userID로 사용 됩니다.
//String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath, "userID");

//리포트key의 사용자문자열을 추가합니다.(문자숫자만 가능합니다.)
//String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath, "", "usetKey");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Report</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="./css/clipreport.css">
<link rel="stylesheet" type="text/css" href="./css/UserConfig.css">
<link rel="stylesheet" type="text/css" href="./css/font.css">
<script type='text/javascript' src='./js/jquery-1.11.1.js'></script>
<script type='text/javascript' src='./js/clipreport.js'></script>
<script type='text/javascript' src='./js/UserConfig.js'></script>
<script type='text/javascript'>

var urlPath = document.location.protocol + "//" + document.location.host;
	
function html2xml(divPath){	
    var reportkey = "<%=resultKey%>";
	var report = createImportJSPReport(urlPath + "/ClipReport4/Clip.jsp", reportkey, document.getElementById(divPath));
    //실행
    report.view();
}
</script>
</head>
<body onload="html2xml('targetDiv1')">
<div id='targetDiv1' style='position:absolute;top:5px;left:5px;right:5px;bottom:5px;'></div>
</body>
</html>
