<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="login.jsp">登入</a><br>
	<a href="logout.jsp">登出</a><br>
	<br>
	<c:if test="${! empty errorMsgs}"><p>${errorMsgs}</p></c:if>
	<a href="ItemSearch.jsp">商品搜尋</a><br>
	<a href="ShopSearch.jsp">賣場搜尋</a><br>
	<br>
	許願池：<br>
	<a href="MakeAWishForm.jsp">許願</a><br>
	<a href="CheckYourList">看看本人願望</a><br>
	<a href="CheckPeopleList">看看大家願望</a><br>
	
	購物車：<br>
	<a href="ShoppingCart.go?action=select">查看購物車</a>
		<form action="Order.do">
		<input type="submit" value="查看我的購買訂單" />
		<input type="hidden" name="action" value="cGetAll" />
	</form>
	<form action="Order.do">
		<input type="submit" value="查看我的賣場訂單" />
		<input type="hidden" name="action" value="sGetAll" />
	</form>
</body>
</html>
