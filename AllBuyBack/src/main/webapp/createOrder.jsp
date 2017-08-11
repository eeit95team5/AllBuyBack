<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.css">
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src=" http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
</head>
<body>
<table border="1">
<!-- <tr> -->
<!-- 	<td>運送方式</td> -->
<!-- 	<td> -->
<!-- 		<input id="sw_id" type="text" name="sw_id" value="1000001" /> -->
<!-- 	</td> -->
<!-- </tr> -->
<tr>
	<td><span color="red">*</span>付款方式</td>
	<td>
		<input id="pay_id" type="text" name="pay_id" value="匯款" />
	</td>
</tr>
<tr>
	<td>總價</td><td>${ShoppingCart.subtotal}</td>
	<td><span color="red">*</span>收件人</td>
	<td>
		<input id="o_recipient" type="text" name="o_recipient" value="什麼人" />
	</td>
	<td><span color="red">*</span>收件地址</td>
	<td>
		<input id="o_address" type="text" name="o_address" value="台灣台北" />
	</td>
</tr>
<!-- <tr> -->
<!-- 	<td>備註</td> -->
<!-- 	<td> -->
<!-- 		<input id="o_memo" type="text" name="o_memo" value="寫寫寫"/> -->
<!-- 	</td> -->
<!-- </tr> -->
<tr>
	
	<c:set var="count" value="0" />
	<c:forEach var="orderlist" items="${orderlist}" varStatus="vs">
	<c:set var="this_s_id" value="${orderlist.s_id}"/>
		<!-- 設定s_id分項-->
	<c:if test="${vs.first || (this_s_id != s_id_group)}">	
	
		<!-- 計算同商店之總價 -->
		<c:if test="${!vs.first}">
			<tr>
				<td colspan="5">XX</td><td>總價</td><td class="thetolprice">${o_tolPrice}</td>
			<td>
<form action="Order.do" method="post">
					<input type="hidden" name="o_tolPrice" class="createOrder ${s_id_group} o_tolPrice" value="${o_tolPrice}" />
					<input type="hidden" name="o_lastPrice" class="createOrder ${s_id_group} o_lastPrice" value="${o_lastPrice}" />
<!-- 					input hidden 改 select -->
					<select name="sw_id" class="createOrder ${s_id_group} sw_id" >
							<option value="99999"><span color="red">*</span>請選擇運送方式
								<input type="hidden" class="sw_price99999" value="0" />
							</option>
					</select>					
					<input type="hidden" name="pay_id" class="createOrder ${s_id_group} pay_id" value="匯款" />
					<input type="hidden" name="o_recipient" class="createOrder ${s_id_group} o_recipient" value="什麼人" />
					<input type="hidden" name="o_address" class="createOrder ${s_id_group} o_address" value="台灣台北" />
<%-- 					<input type="hidden" name="o_memo" class="createOrder ${s_id_group} o_memo" value="寫寫寫" /> --%>
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
		<tr bgcolor="#FF0000">
		<td>s_id
		</td>
		<td colspan="6"><c:out value="${s_id_group}"></c:out></td></tr>
		<tr>
		<td>i_id</td><td>i_name</td><td>i_price</td>
		<td>ol_quantity</td><td>total_price</td><td>i_arrivedDate</td><td>ol_memo</td>
		</tr>
		<c:set var="o_tolPrice" value="0" />
	</c:if>

	<tr>
<%-- 		<td>${orderlist.s_id}</td> --%>
		<td>${orderlist.i_id}</td>
		<td>${orderlist.i_name}</td>
		<td>${orderlist.i_price}</td>
		<td>${orderlist.ol_quantity}</td>
		<td>${orderlist.i_price*orderlist.ol_quantity}</td>
				<c:set var="o_tolPrice" value="${o_tolPrice + orderlist.i_price*orderlist.ol_quantity}" />
		<td>${orderlist.i_arrivedDate}</td>
		<td>${orderlist.ol_memo}</td>
	</tr>
	<tr>
	<c:if test="${vs.last}">
		<tr>
			<td colspan="5">XX</td><td>總價</td><td class="thetolprice">${o_tolPrice}</td>
			<td>
<form action="Order.do" method="post">		
					<input type="hidden" name="o_tolPrice" class="createOrder ${s_id_group} o_tolPrice" value="${o_tolPrice}" />
					<input type="hidden" name="o_lastPrice" class="createOrder ${s_id_group} o_lastPrice" value="${o_lastPrice}" />
					<select id="swSelect" name="sw_id" class="createOrder ${s_id_group} sw_id" >
							<option value="99999">請選擇運送方式
								<input type="hidden" class="sw_price99999" value="0" />
							</option>
					</select>
					<input type="hidden" name="pay_id" class="createOrder ${s_id_group} pay_id" value="宅配" />
					<input type="hidden" name="o_recipient" class="createOrder ${s_id_group} o_recipient" value="什麼人" />
					<input type="hidden" name="o_address" class="createOrder ${s_id_group} o_address" value="台灣台北" />
<%-- 					<input type="hidden" name="o_memo" class="createOrder ${s_id_group} o_memo" value="寫寫寫" /> --%>
					<input type="hidden" name="action" class="createOrder ${s_id_group} action" value="confirm" />
					<input type="hidden" class="createOrderNumber" value="${s_id_group}" />			
					<input type="hidden" name="s_id" class="createOrder ${s_id_group} s_id" value="${s_id_group}" />
</form>
			</td>
		</tr>
	</c:if>
	</tr>
</c:forEach>

	<td>
		<button type="button" id="submit" >成立訂單</button>
		<span id="theMsg" color="red"></span>
<!-- 		<input type="hidden" name="action" value="confirm" /> -->
<!-- 		<input type="hidden" name="sw_id" class="sw_id" value="$" /> -->
<!-- 		<input type="hidden" name="pay_id" class="pay_id" value="$" /> -->
<!-- 		<input type="hidden" name="o_address" class="o_address" value="" /> -->
	</td>
</tr>
</table>
<p id="result"></p>
<a href="Order.do?action=cGetAll">返回我的購買訂單</a><br>
<a id="alink" href="index.jsp">回首頁</a>
<form action="index.jsp" method="post">
	<input type="submit" value="回首頁" />
</form>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script>
	$(function(){
		$('.createOrder'+'.sw_id').change(function(){
			var thisid = $(this).val();
			console.log(thisid);
			var tolprice = Number($(this).parents('form').find('input:eq(0)').val());
			var thisprice = Number($('.sw_price'+thisid).val());
			var newprice = tolprice+thisprice;
			console.log(newprice);
			$(this).parents('form').find('input:eq(1)').val(newprice);
			$(this).parents('tr').find('.thetolprice').text(newprice)
			console.log($(this).parents('form').find('input:eq(1)').val());
			console.log($(this).parents('tr').find('.thetolprice').text());
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
				console.log(datas);
				console.log('start finding');
 				//
				$.each(JSON.parse(datas),function(shipway, value){
					console.log("in");
					console.log(value.sw_id);
					var sw_id = value.sw_id;
					var sw_name = '';
					var sw_price = 0;
					$.post('Shipway.go',{'action':'getWay','sw_id':sw_id},function(dat){
						console.log(dat);
						$.each(JSON.parse(dat),function(ship, way){
						sw_id = way.sw_id;
						sw_name = way.sw_name;
						sw_price = way.sw_price;
				console.log(sw_id);
				console.log(sw_name);
				console.log(sw_price);
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
				var o_memo = $('.createOrder'+'.'+s_id+'.o_memo').val();
				$.post('Order.do',
				{'action':action,'s_id':s_id,'sw_id':sw_id,'pay_id':pay_id,'o_tolPrice':o_tolPrice,'o_lastPrice':o_lastPrice,'o_recipient':o_recipient,'o_address':o_address}
				, run+=1
				);
				
			});
			if(count==run){
				window.location = "orderSuccess.jsp";
			}
		}
	});
	
</script>
</body>
</html>