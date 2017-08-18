<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AllBuyBack-購買廣告</title>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
<link rel="stylesheet" href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="webjars/sweetalert/1.1.3/dist/sweetalert.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script>
<style>
	#main{
		width:600px;
		margin:auto;
		text-align: center;
	}
	table{
		text-align:left;
	}
</style>
<script>
	$(function(){
		if(${msg=="完成"}){
			swal({
				title: "${msg}",				
			},function(isConfirm){
				if(isConfirm)
// 				setTimeout("window.close()",2000);
				window.close();
			});
		}
		$('#theDays').change(ChangePrice);
		$('#theType').change(ChangePrice);
		$('#startDay').change(ChangePrice);
// 		$('#tobuy').click(function(e){
// 			window.close();
			
// 		});
	});
	
	function ChangePrice(){
		var theDays = Number($("#theDays").val());
		var theType = Number($('#theType').val());
		var dayPrice = 0;
		if(theType==3){
			dayPrice = 200;
		}else{
			dayPrice = 1000;
		}
		$('#thePrice').text(theDays*dayPrice);
		
	}
</script>
</head>
<body>
<div id="main">
<c:if test="${empty pay}">
<h2 align="center">購買廣告</h2>
<form action="Ad.go" method="post">
	<table class="table" style="table-layout:fixed">
		<tr>
			<td><label>商品名稱:</label>${i_name}</td>
			<td><label>廣告類型:</label>
				<select name="ad_type" id="theType">
				<option value="3">精選商品</option>
				<option value="4">本週頭條</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<label>廣告開始日期:</label><input type="date" name="ad_startDate" id="startDay"/>
			</td>
			<td>
				<label>廣告天數:</label>
				<select name="ad_days" id="theDays">
					<option value="1">1天</option>
					<option value="2">2天</option>
					<option value="3">3天</option>
					<option value="7">7天</option>
					<option value="14">14天</option>
					<option value="30">30天</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<label>廣告價格:</label><b id="thePrice"></b>
			</td>
			<td>
				<input type="submit" value="購買" class="btn btn-primary" id="tobuy">
				<input type="hidden" name="s_id" value="${LoginOK.m_id}">
				<input type="hidden" name="i_id" value="${i_id}">
				<input type="hidden" name="action" value="buyAd" />
				<c:if test="${! empty msg}" ><br>${msg}</c:if>
			</td>
		</tr>
	</table>
</form>
</c:if>
<c:if test="${! empty pay}">
<h2 align="center">待付款廣告</h2>
	<table class="table" style="table-layout:fixed">
	<c:forEach var="ad" items="${pay}" varStatus="vs">
		<tr>
			<th>廣告編號</th>
			<th>商品名稱</th>
			<th>開始日期</th>
			<th>結束日期</th>
			<th>廣告類型</th>
			<th>廣告價格</th>
		</tr>
		<tr>
			<td>${ad.ad_id}</td>
			<td>${itemList[vs.index]}</td>
			<td>${timeList[vs.index][0]}</td>
			<td>${timeList[vs.index][1]}</td>
			<td>
				<c:if test="${ad.ad_type==3}">精選商品</c:if>
				<c:if test="${ad.ad_type==4}">本週頭條</c:if>
			</td>
			<td>
				<form action="Ad.go" method="post">
					${ad.ad_price}<button type="submit">已付款</button>
					<input type="hidden" name="action" value="updateAd">
					<input type="hidden" name="i_id" value="${ad.i_id}">
					<input type="hidden" name="ad_id" value="${ad.ad_id}">
					<c:if test="${ad.ad_type==3}"><input type="hidden" name="ad_type" value="1"></c:if>
					<c:if test="${ad.ad_type==4}"><input type="hidden" name="ad_type" value="2"></c:if>									
				</form>
			</td>
		</tr>
	</c:forEach>
	</table>
</c:if>
<div>
	<p style="font-size:8px;text-align:left;">1.廣告以日計費，以開始日之凌晨0點0分起算，至結束日之凌晨0點0分結束。<br>2.指定開始日為購買當日者，購買日以一日計算。</p>
</div>
<br>
<button type="button" onclick="window.close()" id="bot">關閉視窗</button>

</div>
</body>
</html>