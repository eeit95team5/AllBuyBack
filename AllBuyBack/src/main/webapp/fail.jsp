<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>失敗</title>
</head>
<body>
	<form action="<c:url value='/LoginServlet' />" method="post">
		<input type="hidden" name="status" value="logfail">

		<div align="center">
			<h2>登入失敗!!帳密可能有誤或已被停權,請洽<a href="#">管理員</a></h2>
			<input type="submit" value="重登">
		</div>
	</form>
</body>
</html>