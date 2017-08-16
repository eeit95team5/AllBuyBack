<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>MakeWishComeTrueItemSelect</title>
<style>
	.div1{
		padding:20px;
		width:610px;
		background-color: tan;
		border: 1px solid #003C9D;
		border-radius: 20px;
	}
	#hId{
		text-align:center;
	}
</style>
</head>

<body>
	<div class="div1">
	<h1>${account}的賣場商品列表</h1>
	<div>
		<form name="ItemPickUp" id="ItemPickUp" action="ItemPickUpCheck?w_id=${w_id}" method="POST">
				<input id="OKbtn" type="submit" value="確定">
				<a href="CheckPeopleList"><input type="button" value="取消"></a>
		<table>
			<thead>
				<tr>
					<th id="hId" width="80px">PickUp</th>
					<th id="hId" width="1250px">name</th>
					<th id="hId" width="80px">price</th>
					<th id="hId" width="80px">quantity</th>
					<th id="hId" width="80px">popular</th>
					<th id="hId" width="80px">click</th>
					<th id="hId" width="80px">country</th>
				</tr>
			</thead>
			<tbody>
			  <c:forEach var="ilist" items="${ilist}">
				<tr>
					<td id="hId"><input type="radio" name="radio1" value="${ilist.i_id}"></td>
					<td id="hId">${ilist.i_name}</td>
					<td id="hId">${ilist.i_price}</td>
					<td id="hId">${ilist.i_quantity}</td>
					<td id="hId">${ilist.i_popular}</td>
					<td id="hId">${ilist.i_click}</td>
					<td id="hId">${ilist.country_name}</td>
				</tr>	
			  </c:forEach>
			    <tr>
				</tr>
			</tbody>
		</table>
		</form>
	</div>
	</div>
</body>
</html>