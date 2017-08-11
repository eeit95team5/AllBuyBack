<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.css">
<link rel="stylesheet" href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="webjars/sweetalert/1.1.3/dist/sweetalert.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script>

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
			<form id="cartForm" action="ShoppingCart.go" method="post">
				<td>${vs.index}</td>
				<td>${itemVO.i_id}</td>
				<td>${itemVO.s_id}</td>
				<td>${itemVO.i_name}</td>
				<td>${itemVO.i_arrivedDate}</td>
				<td>${itemVO.i_price}</td>
				<td>${itemVO.i_quantity}</td>
				<td>${itemVO.i_describe}</td>
				<td>
					<input id="ol_quantity" type="text" name="ol_quantity" />
				</td>
				<td>
					<input id="ol_memo" type="text" name="ol_memo" />
				</td>
				<td>
					<button type="button" id="addCart" class="btn" >加入購物車</button>
<!-- 					<input type="submit" id="addCart" class="btn" value="加入購物車" /> -->
					<input type="hidden" id="addToCart" name="action" value="addToCart" />
					<input type="hidden" id="i_id" name="i_id" value="${itemVO.i_id}" />
					<input type="hidden" id="s_id" name="s_id" value="${itemVO.s_id}" />
				</td>
			</form>
			</tr>
			<tr>
				<c:if test="${!empty LoginOK}">
					<td><form method="post"
							action="<c:url value="/ItemController"/>">
							<input type="submit" value="檢舉"> <input type="hidden"
								name="m_id" value="${LoginOK.m_id}"> <input
								type="hidden" name="i_id" value="${itemVO.i_id}"> <input
								type="hidden" name="action" value="product_accuse">

						</form>
				</c:if>
			</tr>
			<tr>
							<c:if test="${!empty LoginOK }">
					<td><form method="post"
							action="<c:url value="/ChatController"/>">
							<input type="submit" value="議價"> <input type="hidden"
								name="m_id" value="${LoginOK.m_id}"> 
								<input type="hidden"
								name="m_account" value="${LoginOK.m_account}">
								<input
								type="hidden" name="s_id" value="${itemVO.s_id}"> <input
								type="hidden" name="action" value="price_bargain">

						</form>
				</c:if>
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
<script>
$('#addCart').click(function (){
// 	 var form = $(this).parents('#cartForm');
// 	 console.log(form);
	 var action = $('#addToCart').val();
	 var i_id = $('#i_id').val();
	 var s_id = $('#s_id').val();
	 var ol_quantity = $('#ol_quantity').val();
	 var ol_memo = $('#ol_memo').val();
	 $.post("ShoppingCart.go",{'action':action,'i_id':i_id,'s_id':s_id,'ol_quantity':ol_quantity,'ol_memo':ol_memo},
			 function(data){
		 console.log(data);
		 var json = JSON.parse(data);
		 var str = json.a;
		 var theType = "success";
		 var theText = "再多看看別的商品吧!"
		 if(str=="加入購物車失敗，不能新增數量0以下" || str=="加入購物車失敗，剩餘數量不足"){
			 theType = "error";
			 theText = "請確定數量再加入購物車"
		 }
			 swal({
				  title: str,
				  text: theText,
				  type: theType
				});
		 
	 })
	 
});
	
</script>
</body>
</html>
