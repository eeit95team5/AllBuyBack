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
</head>
<body>
<table border="1">
	<thead>
		<tr>
			<td>排序</td><td>i_id</td><td>s_id</td><td>品名</td>
			<td>i_arrivedDate</td><td>價格</td><td>數量</td><td>描述</td>
			<td>ol_quantity</td><td>ol_memo</td>
		</tr>
	</thead>
	<tbody id="table1">
		
			<tr align="center" valign="middle">
			<form action="ShoppingCart.go" method="post">
				<td>${vs.index}</td>
				<td>${itemVO.i_id}</td>
				<td>${itemVO.s_id}</td>
				<td>${itemVO.i_name}</td>
				<td>${itemVO.i_arrivedDate}</td>
				<td>${itemVO.i_price}</td>
				<td>${itemVO.i_quantity}</td>
				<td>${itemVO.i_describe}</td>
				<td>
					<input type="text" name="ol_quantity" />
				</td>
				<td>
					<input type="text" name="ol_memo" />
				</td>
				<td>
					<input type="submit" class="btn" value="加入購物車" onclick="ck(event)" />
					<input type="hidden" name="action" value="addToCart" />
					<input type="hidden" name="i_id" value="${itemVO.i_id}" />
					<input type="hidden" name="s_id" value="${itemVO.s_id}" />
					
				</td>
			</form>
			</tr>
		
	</tbody>
</table>
<c:if test="${! empty Msg}"><p>${Msg}</p></c:if>
<a href="ShoppingCart.go?action=select">ShoppingCart</a>
<form action="ShoppingCart.go" method="post">
	<input type="submit" value="查看購物車" />
	<input type="hidden" name="action" value="select" />
</form>
<c:if test="${! empty errorMsgs}"><p>${errorMsgs}</p></c:if>
</body>
</html>
 <!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
 	
 		var frag = $(document.createDocumentFragment());
 		
 		$.each(,function(inx, itemVO){
			var cell1 = $('<td></td>').text(itemVO.i_name);
		    var cell2 = $('<td></td>').text(itemVO.i_price);
		    var cell3 = $('<td></td>').text(itemVO.i_quantity);
		    var cell4 = $('<td></td>').text(itemVO.i_describe);
		    var cell5 = $('<td></td>').html('<button class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button> <button class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span></button>');
		    var row = $('<tr></tr>').append([cell1,cell2,cell3,cell4,cell5]);
		    frag.append(row);
 		})
		tb.append(frag);
 	
</script>
  -->