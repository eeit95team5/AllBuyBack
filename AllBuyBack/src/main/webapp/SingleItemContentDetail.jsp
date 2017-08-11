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
	<a href="PeopleWishContent?w_id=${w_id}"><input type="button" value="返回許願單"></a>
	<h1>商品內容</h1>
	<div>
		<table>
			<thead>
				<tr>
					<th>name</th>
					<th>price</th>
					<th>quantity</th>
					<th>popular</th>
					<th>click</th>
					<th>country</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${iVO.i_name}</td>
					<td>${iVO.i_price}</td>
					<td>${iVO.i_quantity}</td>
					<td>${iVO.i_popular}</td>
					<td>${iVO.i_click}</td>
					<td>${iVO.country_name}</td>
				</tr>	
			</tbody>
		</table>
	</div>
</body>
</html>