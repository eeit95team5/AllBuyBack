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
	<style>
		#mainTable{
			font-size:18px;
		}
		
		.btn{
			font-size:18px;	
		}
		#Settlement{
			margin:auto;
			width: 900px;
			text-align:right;
			font-size:26px;
		}
		#lastsubmit{
			font-size:26px;
		}
		#msgBoby{
			font-size:26px;
		}
	</style>
<script>
// 		$(function(){
// 			$('.shopName').each(function(data){
// 				var s_id = $(this).attr('id');
// 				$.post('')
// 			});
// 		})
	$(function(){
		
		$('.decrease').click(function(){
			var point = $(this).parents('td').find('.theQuantity');
			var theQuantity = Number(point.val());
			theQuantity = theQuantity - 1 ;
			if(theQuantity>0){
				point.val(theQuantity);				
				var thePrice = $(this).parents('tr').find('.thePrice');
				var theTolPrice = $(this).parents('tr').find('.theTolPrice');
				var priceValue = Number(thePrice.text());
				theTolPrice.text(priceValue*theQuantity);
			
			}
			
		});
		$('.increase').click(function(){
			var point = $(this).parents('td').find('.theQuantity');
			var theQuantity = Number(point.val());
			theQuantity = theQuantity + 1 ;
			if(theQuantity<99){
				point.val(theQuantity);
				var thePrice = $(this).parents('tr').find('.thePrice');
				var theTolPrice = $(this).parents('tr').find('.theTolPrice');
				var priceValue = Number(thePrice.text());
				theTolPrice.text(priceValue*theQuantity);
			}
		});

		$('.cannelSubmit').click(function (e){
       	 var form = $(this).parents('#aform');
       	 console.log(form);
       	 e.preventDefault();
       	 swal({
       		  title: "真的要取消此訂單?",
       		  text: "沒買到好像會後悔，還是繼續買吧!",
       		  type: "warning",
       		  showCancelButton: true,
       		  confirmButtonColor: "#DD6B55",
       		  confirmButtonText: "取消!",
       		  closeOnConfirm: false
       		},
       		function(isConfirm){
       			if(isConfirm){
       				form.submit();
       			}
       		  
       		});
        });
		
	});
</script>
</head>
<body>
<h1 style='text-align:center'>我的購物車</h1>
<div class="table-responsive">
	<c:if test="${!empty cartlist}">
	<table id="mainTable" class="table">
		<thead align="center">
			<tr class="info">
				<td>賣場</td>
				<td>商品名稱</td>
				<td>單價</td>
				<td>購買數量</td>
				<td>小計</td>
				<td>可出貨時間</td>
				<td>備註</td>
				<td colspan="2">操作</td>
			</tr>
		
			<c:forEach var="list" items="${cartlist}" varStatus="vs">
			<tr align="center" valign="middle">
			<form action="ShoppingCart.go" method="post">
				<td><a href="shop.html?s_id=${list.s_id}" id="${list.s_id}" class="shopName">連結賣場</a></td>
				<td>${list.i_name}</td>
				<td class="thePrice">${list.i_price}</td>
				<td><button type="button" class="glyphicon glyphicon-chevron-down decrease"></button>
					<input type="text" class="theQuantity" name="ol_quantity" size="2" value="${list.ol_quantity}" />
					<button type="button" class="glyphicon glyphicon-chevron-up increase"></button>
				</td>
				<td class="theTolPrice">${list.i_price*list.ol_quantity}</td>
				<td>${list.i_arrivedDate}</td>
				<td><textarea name="ol_memo" >${list.ol_memo}</textarea></td>
				<td><input type="submit" value="修改" class="btn btn-info"/>
				    <input type="hidden" name="action" value="update"/>
				    <input type="hidden" name="i_id" value=${list.i_id} /></td>
			</form>
				<td>
				<form>
					<input type="submit" value="取消" class="btn btn-danger cannelSubmit"/>
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
			</tr>
		</tbody>
	</table>
		<div id="Settlement">
		<label colspan="4" align="right">總計</label><p id="lastPrice">$ ${ShoppingCart.subtotal}</p>
			<form action="Order.do" method="post">
				<input type="hidden" name="o_tolPrice" value=${ShoppingCart.subtotal}/>
				<input type="submit" value="結算" class="btn btn-primary" id="lastsubmit"/>
				<input type="hidden" name="action" value="createOrder" />
			</form>
		</div>
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
	<a href="shop.html?s_id=1000002">我要繼續買</a><br>
</div>

</body>
</html>