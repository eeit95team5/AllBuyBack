<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
          <c:if test="${empty AdminOK}">
    <c:set var="target" value="${pageContext.request.servletPath }" scope="session"/>
    <c:redirect url="/Login.jsp"/>  
   </c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="<c:url value="/MemController"/>" method="get">
<table>
<tr>
<td><input type="submit" value="會員資料"></td>
<td><input type="hidden" name="action" value="MemberListAll"></td>
</tr>
</table>
</form>

<form action="<c:url value="/ItemController"/>" method="get">
<table>
<tr>
<td><input type="submit" value="商品資料"></td>
<td><input type="hidden" name="action" value="ItemListAll"></td>
</tr>
</table>
</form>

<form action="<c:url value="/ItemController"/>" method="get">
<table>
<tr>
<td><input type="submit" value="下架商品資料"></td>
<td><input type="hidden" name="action" value="AccusedItemListAll"></td>
</tr>
</table>
</form>

<form action="<c:url value="/MemController"/>" method="get">
<table>
<tr>
<td><input type="submit" value="黑名單"></td>
<td><input type="hidden" name="action" value="BlackList"></td>
</tr>
</table>
</form>
<form action="<c:url value="/MemController"/>" method="get">
<table>
<tr>
<td><input type="submit" value="賣場名單"></td>
<td><input type="hidden" name="action" value="MallList"></td>
</tr>
</table>
</form>
<form action="<c:url value="/ShopController"/>" method="get">
<table>
<tr>
<td><input type="submit" value="申請賣場"></td>
<td><input type="hidden" name="action" value="MallApply"></td>
</tr>
</table>
</form>
<form action="<c:url value="/RepController"/>" method="get">
<table>
<tr>
<td><input type="submit" value="檢舉商品信件"></td>
<td><input type="hidden" name="action" value="ItemAccuse"></td>
</tr>
</table>
</form>

<a href="index.jsp">回首頁</a>

</body>
</html>