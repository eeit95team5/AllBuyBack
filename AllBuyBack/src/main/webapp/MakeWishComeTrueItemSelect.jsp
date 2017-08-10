<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MakeWishComeTrueItemSelect</title>
</head>
<body>
	<h1>${account}的賣場商品列表</h1>
	<div>
		<form name="ItemPickUp" id="ItemPickUp" action="ItemPickUpCheck?w_id=${w_id}" method="POST">
				<input type="submit" value="確定">
		<table>
			<thead>
				<tr>
					<th>PickUp</th>
					<th>I_Id</th>
					<th>name</th>
					<th>price</th>
					<th>quantity</th>
					<th>popular</th>
					<th>click</th>
					<th>country</th>
				</tr>
			</thead>
			<tbody>
			  <c:forEach var="ilist" items="${ilist}">
				<tr>
					<td><input type="radio" name="radio1" value="${ilist.i_id}"></td>
					<td>${ilist.i_id}</td>
					<td>${ilist.i_name}</td>
					<td>${ilist.i_price}</td>
					<td>${ilist.i_quantity}</td>
					<td>${ilist.i_popular}</td>
					<td>${ilist.i_click}</td>
					<td>${ilist.country_name}</td>
				</tr>	
			  </c:forEach>
			    <tr>
				</tr>
			</tbody>
		</table>
		</form>
	</div>
</body>
</html>