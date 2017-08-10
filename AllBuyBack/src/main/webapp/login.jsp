<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="LoginServlet" method="post">
	<table width='330'>
		<thead>
			<tr>
				<th colspan='2'><h1>Login</h1></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align="right">帳號：</td>
				<td align="left"><input type="text" name="userId" size="10" autofocus value="${param.userId}"></td>
				<td width='150'><small><Font color='red' size="-1">${errorMsg.userId}</Font></small></td>
			</tr>
			<tr>
				<td align="right">密碼：</td>
				<td align="left"><input type="text" name="password" size="10" value="${param.password}"></td>
				<td width='150'><small><Font color='red' size="-1">${errorMsg.password}</Font></small></td>
			</tr>
			<tr>
				<td align="CENTER" colspan='3'><Font color='red' size="-1">${errorMsg.LoginError}&nbsp;</Font></td>
			</tr>
			<tr>
				<td height="50" colspan="2" align="center"><input type="submit" value="登入">	</td>
			</tr>
		</tbody>
	</table>
</form>
<p><c:if test="${! empty msg}">${msg}</c:if></p>
</body>
</html>