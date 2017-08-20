<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
<link rel="stylesheet" href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="webjars/sweetalert/1.1.3/dist/sweetalert.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script>
<style>
	#mainTable{
		width:1024px;
		margin:auto;
	}
	#endDiv{
		width:1024px;
		margin:auto;
		font-size:20px;
		text-align:center;
	}
	span{
		color:red;
	}
	.memo, .i_name, .i_arrivedDate{
		width:200px;
		white-space:normal;
		overflow:auto;
	}
	#submit{
		font-size:26px;
	}
	textarea{
		border:none;
	}
</style>
<script>
	$(function(){
		$('.createOrder'+'.sw_id').change(function(){
			var thisid = $(this).val();
// 			console.log(thisid);
			var tolprice = Number($(this).parents('form').find('input:eq(0)').val());
			var thisprice = Number($('.sw_price'+thisid).val());
			var newprice = tolprice+thisprice;
// 			console.log(newprice);
			$(this).parents('form').find('input:eq(1)').val(newprice);
			$(this).parents('tr').find('.thetolprice').text(newprice)
// 			console.log($(this).parents('form').find('input:eq(1)').val());
// 			console.log($(this).parents('tr').find('.thetolprice').text());
			
				var all = 0;
				$('.thetolprice').each(function(e){
					all = all + Number($(this).text());
				})
				$('#allPrice').text(all);
		
		});
		$('#pay_id').change(function(){
			$('.pay_id').val($('#pay_id').val());
		});
		$('#o_address').change(function(){
			$('.o_address').val($('#o_address').val());
		});
		$('#o_recipient').change(function(){
			$('.o_recipient').val($('#o_recipient').val());
		});
		$('.createOrderNumber').each(function(data){
			var s_id = $(this).val();
			$.post('ShopShipway.go',{"action":"getWays","s_id":s_id},function(datas){
				var frag = $(document.createDocumentFragment());
				var point = $('.createOrder'+'.'+s_id+'.sw_id');
// 				console.log(datas);
// 				console.log('start finding');
 				//
				$.each(JSON.parse(datas),function(shipway, value){
					console.log("in");
					console.log(value.sw_id);
					var sw_id = value.sw_id;
					var sw_name = '';
					var sw_price = 0;
					$.post('Shipway.go',{'action':'getWay','sw_id':sw_id},function(dat){
// 						console.log(dat);
						$.each(JSON.parse(dat),function(ship, way){
						sw_id = way.sw_id;
						sw_name = way.sw_name;
						sw_price = way.sw_price;
// 				console.log(sw_id);
// 				console.log(sw_name);
// 				console.log(sw_price);
					var option = $('<option></option>').text(sw_name).val(sw_id);
					var input = $('<input></input>').val(sw_price).attr('type','hidden')
								.attr('class',"sw_price"+sw_id);
					option.append(input)
					frag.append(option);
						});
				point.append(frag);
					});
				});
				
			});
		
		});
		$('#submit').click(function(event){
			var theSelect = $('#swSelect').val();
			var rule1 = 100000;
			
			var thePay = $('#pay_id').val();
			var rule2 = 0;

			var theRecipient = $('#o_recipient').val();
			var rule3 = null;

			var theAddress = $('#o_address').val();
			var rule4 = null;
			if(theSelect<rule1 || thePay==rule2 || theRecipient==rule3 || theAddress==rule4){
				$('#theMsg').text("*為必填欄位");
				event.preventDefault();
			}else{
				$('#submit').attr('disabled:true');
				var count = 0;
				var run = 0;
				$('.createOrderNumber').each(function(data){
					count+=1;
					var s_id = $(this).val();
					var action = $('.createOrder'+'.'+s_id+'.action').val();
					var sw_id = $('.createOrder'+'.'+s_id+'.sw_id').val();
					var pay_id = $('.createOrder'+'.'+s_id+'.pay_id').val();
					var o_tolPrice = $('.createOrder'+'.'+s_id+'.o_tolPrice').val();
					var o_lastPrice = $('.createOrder'+'.'+s_id+'.o_lastPrice').val();
					var o_recipient = $('.createOrder'+'.'+s_id+'.o_recipient').val();
					var o_address = $('.createOrder'+'.'+s_id+'.o_address').val();
//	 				var o_memo = $('.createOrder'+'.'+s_id+'.o_memo').val();
					$.post('Order.do',
					{'action':action,'s_id':s_id,'sw_id':sw_id,'pay_id':pay_id,'o_tolPrice':o_tolPrice,'o_lastPrice':o_lastPrice,'o_recipient':o_recipient,'o_address':o_address}
					, run+=1
					);
					
				});
				if(count==run){
					swal({
						title: "成功建立訂單",
			       		text: "系統會自動以賣場分為不同訂單",
			       		imageUrl: "images/good.png",
			       		imageSize:"150x150",
			       		confirmButtonText: "前往我的購物訂單"
					},function(isConfirm){
						if(isConfirm){
							window.location = "Order.do?action=cGetAll";
						}
					});
				}
			}
		});
		
		
	});

</script>
</head>

<body>
<!-- 加入頁首 -->
<jsp:include page="includeTop.jsp"></jsp:include>
<h1 style="text-align: center">成立訂單</h1>
<div id="mainTable">
<table class="table">
<tr class="info"><td colspan="6">收件資料</td></tr>
<tr>
	<td><span>*</span>收件人</td>
	<td><input id="o_recipient" type="text" name="o_recipient" value="什麼人" /></td>
	<td><span>*</span>收件地址</td>
	<td><input id="o_address" type="text" name="o_address" value="台灣台北" /></td>
	<td><span>*</span>付款方式</td>
	<td><span>*</span>
		<select id="pay_id" name="pay_id">						
			<option value="0">請選擇付款方式</option>
			<option value="郵局匯款">郵局匯款</option>
			<option value="約定帳戶轉帳">約定帳戶轉帳</option>
			<option value="信用卡一次付清">信用卡一次付清</option>
			<option value="超商付款">超商付款</option>
		</select>	
	</td>
</tr>
</table>
<table class="table">
	<c:set var="count" value="0" />
	<c:set var="allPrice" value="0" />
	<c:forEach var="orderlist" items="${orderlist}" varStatus="vs">
	<c:set var="this_s_id" value="${orderlist.s_id}"/>
		<!-- 設定s_id分項-->
	<c:if test="${vs.first || (this_s_id != s_id_group)}">	
		<!-- 計算同商店之總價 -->
		<c:if test="${!vs.first}">
			<tr>
				<td colspan="2"></td>
				<td>總計</td>
				<td class="thetolprice">${o_tolPrice}</td>
				<td>
				<form action="Order.do" method="post">
					<input type="hidden" name="o_tolPrice" class="createOrder ${s_id_group} o_tolPrice" value="${o_tolPrice}" />
					<input type="hidden" name="o_lastPrice" class="createOrder ${s_id_group} o_lastPrice" value="${o_lastPrice}" />
					<span>*</span>
					<select name="sw_id" class="createOrder ${s_id_group} sw_id" >
							<option value="99999">請選擇運送方式<input type="hidden" class="sw_price99999" value="0" /></option>
					</select>					
					<input type="hidden" name="pay_id" class="createOrder ${s_id_group} pay_id" value="匯款" />
					<input type="hidden" name="o_recipient" class="createOrder ${s_id_group} o_recipient" value="什麼人" />
					<input type="hidden" name="o_address" class="createOrder ${s_id_group} o_address" value="台灣台北" />
					<input type="hidden" name="action" class="createOrder ${s_id_group} action" value="confirm" />
					<input type="hidden" class="createOrderNumber" value="${s_id_group}" />			
					<input type="hidden" name="s_id" class="createOrder ${s_id_group} s_id" value="${s_id_group}" />
					<input type="hidden" class="submitButton" />
				</form>		
				</td>
			</tr>
			<c:set var="count" value="${count+1}"/>
		</c:if>
		<c:set var="s_id_group" value="${orderlist.s_id}"/>
		<tr class="success">
			<td>賣場</td>
			<td colspan="5"><a href="shop.html?s_id=${s_id_group}">${shopName[s_id_group]}</a></td>
		</tr>
		<tr>
			<td>商品名稱</td>
			<td>單價</td>
			<td>數量</td>
			<td>小計</td>
			<td>可出貨時間</td>
			<td class="memo">備註</td>
		</tr>
		<c:set var="o_tolPrice" value="0" />
		
	</c:if>

	<tr>
		<td class="i_name">${orderlist.i_name}</td>
		<td>${orderlist.i_price}</td>
		<td>${orderlist.ol_quantity}</td>
		<td>${orderlist.i_price*orderlist.ol_quantity}</td>
			<c:set var="o_tolPrice" value="${o_tolPrice + orderlist.i_price*orderlist.ol_quantity}" />
			<c:set var="allPrice" value="${allPrice + o_tolPrice}" />
		<td class="i_arrivedDate">${orderlist.i_arrivedDate}</td>
		<td class="memo" rowspan="1"><textarea name="o_memo" cols="30" rows="1" style="resize:none;" readonly>${orderlist.ol_memo}</textarea></td>
	</tr>
	<c:if test="${vs.last}">
		<tr>
			<td colspan="2"></td><td>總計</td><td class="thetolprice">${o_tolPrice}</td>
			<td>
			<form action="Order.do" method="post">		
				<input type="hidden" name="o_tolPrice" class="createOrder ${s_id_group} o_tolPrice" value="${o_tolPrice}" />
				<input type="hidden" name="o_lastPrice" class="createOrder ${s_id_group} o_lastPrice" value="${o_lastPrice}" />
				<span>*</span>
				<select id="swSelect" name="sw_id" class="createOrder ${s_id_group} sw_id" >
					<option value="99999">請選擇運送方式<input type="hidden" class="sw_price99999" value="0" /></option>
				</select>
				<input type="hidden" name="pay_id" class="createOrder ${s_id_group} pay_id" value="匯款" />
				<input type="hidden" name="o_recipient" class="createOrder ${s_id_group} o_recipient" value="什麼人" />
				<input type="hidden" name="o_address" class="createOrder ${s_id_group} o_address" value="台灣台北" />
				<input type="hidden" name="action" class="createOrder ${s_id_group} action" value="confirm" />
				<input type="hidden" class="createOrderNumber" value="${s_id_group}" />			
				<input type="hidden" name="s_id" class="createOrder ${s_id_group} s_id" value="${s_id_group}" />
			</form>
			</td>
		</tr>
	</c:if>
</c:forEach>
<tr>
	<td></td>
	<td></td>
	<td style="font-size:24px;">全部金額</td>
	<td><b id="allPrice" style="font-size:24px;">${allPrice}</b></td>
	<td colspan="2" align="right">
		<button type="button" id="submit" class="btn btn-primary">成立訂單</button>
		<span id="theMsg"></span>
	</td>
</tr>
</table>
</div>
<div id="endDiv">
<p id="result"></p>
<a id="alink" href="HomeIndex.jsp">回首頁</a>
</div>
<!-- 加入頁尾 -->
<jsp:include page="_Footer.jsp"></jsp:include>

</body>
</html>