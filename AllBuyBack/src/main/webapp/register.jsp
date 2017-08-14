<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊</title>
</head>
<body>
<form action="<c:url value="/RegisterServlet" />" method="post">
	
	<div >
		<label style="">帳號:</label>
		<input height="50px" width="50px" type="text" name="account" value="${temp.m_account }"><span>${wrong.account }</span>
		
	<br>
		<label>密碼:</label>
		<input  type="text" name="password" value="${temp.m_password }"><span>${wrong.password }</span>
	<br>	
		<label>姓名:</label>
		<input  type="text" name="name" value="${temp.m_name }"><span>${wrong.name }</span>
	<br>	
		<label>電話:</label>
		<input  type="text" name="phone" value="${temp.m_phone }"><span>${wrong.phone }</span>
	<br>	
		<label>住址:</label>
		<input  type="text" name="address" value="${temp.m_address }"><span>${wrong.address }</span>
	<br>	
		<label>身分證:</label>
		<input  type="text" name="identity" value="${temp.m_identity }"><span>${wrong.identity }</span>
	<br>	
		<label>EMAIL:</label>
		<input  type="text" name="email" value="${temp.m_email }"><span>${wrong.email }</span>
						
	<br>	
		<input  type="submit" value="送出">
	</div>
</form>
</body>
</html>