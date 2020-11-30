<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
결과 : ${param.rtnMsg}
<br/>
<form name="fffm" method="post" action="/cms/depoly/fileDepoly">
<input type="password" name="check">
<input type="submit" name="배포하기"  value="배포하기">
</form>

</body>
</html>