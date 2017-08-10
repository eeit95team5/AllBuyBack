<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.css">
	<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
	<style type="text/css">
		#mainBody {
			width: 900px;
			margin:10px auto;
		}
	</style>
</head>
<body>
<h1 style='text-align:center'>我的購物車</h1>
<div id="mainBody">
	<c:if test="${!empty cartlist}">
	<table border="1">
		<thead align="center">
			<tr>
				<td>賣場s_id</td>
				<td>商品名稱i_name</td>
				<td>單價i_price</td>
				<td>購買數量ol_quantity</td>
				<td>小計tolPrice</td>
				<td>可出貨時間i_arrivedDate</td>
				<td>備註ol_memo</td>
				<td colspan="2">操作</td>
			</tr>
		
			<c:forEach var="list" items="${cartlist}" varStatus="vs">
			<tr align="center" valign="middle">
			<form action="ShoppingCart.go" method="post">
				<td>${list.s_id}</td>
				<td>${list.i_name}</td>
				<td>${list.i_price}</td>
				<td><input type="text" name="ol_quantity" value="${list.ol_quantity}" /></td>
				<td>${list.i_price*list.ol_quantity}</td>
				<td>${list.i_arrivedDate}</td>
				<td><textarea name="ol_memo" >${list.ol_memo}</textarea></td>
				<td><input type="submit" value="修改"/>
				    <input type="hidden" name="action" value="update"/>
				    <input type="hidden" name="i_id" value=${list.i_id} /></td>
			</form>
				<td>
				<form>
					<input type="submit" value="取消" />
					<input type="hidden" name="action" value="delete" />
					<input type="hidden" name="i_id" value=${list.i_id} />
				</form>
				</td>
			</tr>
			</c:forEach>
		</thead>
		<tbody>
			<tr></tr>
			<tr align="center" valign="middle" height="50px">
			<form action="Order.do" method="post">
				<td colspan="4" align="right">總計</td>
				<td colspan="1">
					<input type="hidden" name="o_tolPrice" value=${ShoppingCart.subtotal}/>${ShoppingCart.subtotal}
				</td>
				<td colspan="4">
					<input type="submit" value="結算" />
					<input type="hidden" name="action" value="createOrder" />
				</td>
			</form>
			</tr>
		</tbody>
	</table>
	</c:if>
</div>
<div id="msgBoby" align="center">
	<c:if test="${empty cartlist}">
		<p>購物車還是空的喔!快開始購物吧!</p>
		<a href="index.jsp">開始購物</a><br>
	</c:if>
	<c:if test="${!empty Msg}">
		<p>${Msg}</p>
	</c:if>
	<c:if test="${!empty errorMsgs}">
		<p>${errorMsgs}</p>
	</c:if>
	<p>${errorMsg}</p>
	<a href="index.jsp">我要繼續買</a><br>
</div>
</body>
</html>