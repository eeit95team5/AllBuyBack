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
	
	<a href="HomeIndex.jsp">新首頁</a><br>
	<a href="_systemLogin.jsp">管理員登入</a><br>
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
	
	<a href="<c:url value='/item.SPRINGcontroller'/>">混合頁面(測試用 盡量別點)</a>
	<a href="<c:url value='/insertitem.SPRINGcontroller'/>">新增商品(測試用 盡量別點)</a>
	<br/>
	<c:if test="${!empty SellerOK }">
	<form action="<c:url value='/shopmanager.html'/>" method="get">
	商店：<input type="text" name="s_id" value="${LoginOK.m_id }"/><button type="submit" >管理賣場</button>	
	</form>
 	</c:if><br> 	
	<c:if test="${empty SellerOK }"></c:if>
	<form action="<c:url value='/shopmanager.html'/>" method="get">
	商店：<input type="text" name="s_id" value="${LoginOK.m_id }"/><button type="submit" >管理賣場</button>${errors.shoplogin }	
	</form>
	<form action="<c:url value='/shop.html'/>" method="get">
	商店：<input type="text" name="s_id" value="1000001"/><button type="submit" >前往賣場</button>	
	</form><br>
	<a href="shop.html?s_id=1000002">2號賣場</a>
	<a href="shop.html?s_id=1000006">6號賣場</a>
	<a href="Ad.go?action=selectBySId&s_id=${LoginOK.m_id}">我的廣告</a><br>
	<a href="BuyAd.jsp">購買廣告</a><br>
	<h3><a href="<c:url value="/checkGB.do"/>">時尚金頭腦</a></h3>
<br>
<h4>${alreadyPlay}</h4>

	<a href="Ad.go?action=selectAll">管理者廣告頁面</a><br>

<c:if test="${ !empty LoginOK}">
<a href="ChatController?action=MessageFromSeller&id=${LoginOK.m_id}">來自賣家的訊息</a>
</c:if>
<c:if test="${ !empty SellerOK}">
<a href="ChatController?action=MessageFromBuyer&id=${SellerOK.m_id}">來自買家的訊息</a>
</c:if>
<c:if test="${ !empty AdminOK}">
<a href="Admin.jsp">管理頁面</a>
</c:if>
<c:if test="${ !empty LoginOK}">
<a href="MallInsert.jsp">申請賣家</a>
</c:if>
<c:if test="${ !empty LoginOK}">
<a href="RepController?action=GetReply&id=${LoginOK.m_id }">檢舉回覆</a>
</c:if>


	<form action="<c:url value='/LoginServlet' />" method="post">
		<input type="hidden" name="status" value="logout">

		<div align="center">
			<input type="submit" value="logout">
		</div>
	</form>
	
	<input type="submit" value="會員專區" 
    onclick="window.location='<c:url value="/update.jsp" />';" /> 
    
    <input type="submit" value="查詢訂單" 
    onclick="window.location='<c:url value="/order.jsp" />';" />
    
    <input type="submit" value="我的收藏" 
    onclick="window.location='<c:url value="/favorite.jsp" />';" />   
</body>
</html>
