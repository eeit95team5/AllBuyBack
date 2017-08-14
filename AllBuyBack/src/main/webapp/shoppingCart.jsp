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
			width: 1024px;
			margin:auto;
		}
		
		.btn{
			font-size:18px;	
		}
		#Settlement{
			margin:auto;
			width: 1024px;
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
				lastPrice();
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
				lastPrice();
			}
		});

		$('.cannelSubmit').click(function (e){
       	 var form = $(this).parents('.aform');
       	 console.log(form);
       	 e.preventDefault();
       	 swal({
       		  title: "真的要取消此訂單?",
       		  text: "沒買到好像會後悔，還是繼續買吧!",
       		  type: "warning",
       		  showCancelButton: true,
       		  confirmButtonColor: "#DD6B55",
       		  confirmButtonText: "取消",
       		  cancelButtonText: "保留",
       		  closeOnConfirm: false
       		},
       		function(isConfirm){
       			if(isConfirm){
       				form.submit();
       			}
       		});
        });
		
		function lastPrice(){
			var lastTotlPrice = 0;
			$('.theTolPrice').each(function(){
				lastTotlPrice = lastTotlPrice + Number($(this).text());
			});
			$('#lastPrice').text(lastTotlPrice);
		}
		
		$('#lastsubmit').click(function(e){
			var check1 = Number($('#lastPrice').text());
			var check2 = $('#theLastPrice').val();
			var thisForm = $(this).parents('form');
			if(check1!=check2){
				e.preventDefault();
				
				swal({
		       		  title: "資料好像更改過?!",
		       		  text: "更改過數量沒按下修改按鈕",
		       		  type: "warning",
		       		  showCancelButton: true,
		       		  confirmButtonText: "回去再改改",
		       		  cancelButtonText: "還是不改了，直接送出!",
		       		  closeOnConfirm: true
		       		},
		       		function(isConfirm){
		       			if(isConfirm){
		       				
		       			}else{
// 		       				lastChange(thisForm);
		       				thisForm.submit();
		       			}
		       		  
		       		});
			}
		});
		
// 		function lastChange(thisForm){
// 			$('.changeButton').each(function(data){
// 				alert($(this).val());
// 					var theForm = $(this).parents('.changeClass');
// 					var pppp = theForm.find('td:eq(1)').text()
// 					theForm.submit();
// 					alert(pppp);
// 				});
// 			thisForm.submit();
// 		}
	});
</script>
</head>
<body>
<h1 style='text-align:center'>我的購物車</h1>
<div class="table-responsive" id="mainTable">
	<c:if test="${!empty cartlist}">
	<table class="table">
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
		</thead>
		<tbody>
			<c:forEach var="list" items="${cartlist}" varStatus="vs">
			<tr align="center" valign="middle" >
			<form action="ShoppingCart.go" method="post" class="changeClass">
				<td><a href="shop.html?s_id=${list.s_id}" id="${list.s_id}" class="shopName">${s_name[list.s_id]}</a></td>
				<td>${list.i_name}</td>
				<td class="thePrice">${list.i_price}</td>
				<td>
					<button type="button" class="glyphicon glyphicon-chevron-down decrease"></button>
					<input type="text" class="theQuantity" name="ol_quantity" size="2" value="${list.ol_quantity}" />
					<button type="button" class="glyphicon glyphicon-chevron-up increase"></button>
				</td>
				<td class="theTolPrice">${list.i_price*list.ol_quantity}</td>
				<td>${list.i_arrivedDate}</td>
				<td><textarea name="ol_memo" style="resize:none;">${list.ol_memo}</textarea></td>
				<td>
					<input type="submit" value="修改" class="btn btn-info changeButton"/>
				    <input type="hidden" name="action" value="update"/>
				    <input type="hidden" name="i_id" value="${list.i_id}" />
				</td>
			</form>
				<td>
				<form action="ShoppingCart.go" method="post" class="aform">
					<input type="submit" value="取消" class="btn btn-danger cannelSubmit"/>
					<input type="hidden" name="action" value="delete" />
					<input type="hidden" name="i_id" value="${list.i_id}" />
				</form>
				</td>
			</tr>
			
			</c:forEach>
		</tbody>
	</table>
		<hr>
		<div id="Settlement">
		<label>總計$</label><b id="lastPrice">${ShoppingCart.subtotal}</b>
				<input type="hidden" id="theLastPrice" value="${ShoppingCart.subtotal}" >
			<form action="Order.do" method="post">
				<input type="hidden" name="o_tolPrice" value="${ShoppingCart.subtotal}"/>
				<input type="submit" value="結算" class="btn btn-primary" id="lastsubmit"/>
				<input type="hidden" name="action" value="createOrder" />
			</form>
		</div>
		<div align="center"><a href="shop.html?s_id=1000002">我要繼續買</a><br></div>
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
</div>

</body>
</html>