<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登入</title>
</head>
<body>
<form action="<c:url value="/LoginServlet" />" method="post">
	<input type="hidden" name="status" value="login">
	
	<div align="center">
		<label style="font-size: 30px">帳號:</lacbel>
		<input height="50px" width="50px" type="text" name="account">
	<br>
		<label>密碼:</label>
		<input  type="text" name="password">
		<input  type="submit" value="送出">
	</div>
</form>
</body>
</html>