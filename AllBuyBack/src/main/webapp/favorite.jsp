<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的收藏</title>
</head>
<body>
	<h2>查詢我的賣場</h2>
	<form action="<c:url value="/FavoriteServlet" />" method="post">
		<input type="hidden" name="status" value="query"> 
		<input type="hidden" name="account" value="${LoginOK.m_account }">
		<input type="submit" value="送出" onclick="firstLoad">
		
		<div>
			<label>賣場名稱:</label> 
			${favorite.m_name }
			<br>
			<label>賣場編號:</label> 
			${favorite.m_id }
		</div>
	</form>
	<hr>
	<h2>查詢我的商品</h2>
	<form action="<c:url value="/FavoriteServlet" />" method="post">
		<input type="hidden" name="status" value="query"> 
		<input type="hidden" name="account" value="${LoginOK.m_account }">
		<input type="submit" value="送出" onclick="firstLoad">
	</form>
</body>
</html>