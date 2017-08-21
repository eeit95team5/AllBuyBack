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
</head>
<body>
<div>
	<c:if test="${! empty adList}">
		<table class="table">
			<tr class="info">
				<th>廣告編號</th>
				<th>商品名稱</th>
				<th>開始日期</th>
				<th>結束日期</th>
				<th>廣告類型</th>
				<th>廣告價格</th>
				<th>下架</th>
				<th>修改</th>
			</tr>
		<c:forEach var="adList" items="${adList}" varStatus="vs">
		<tr>
			<td>${adList.ad_id}</td>
			<td>${nameList[vs.index]}</td>
			<td>${timeList[vs.index][0]}</td>
			<td>${timeList[vs.index][1]}</td>
			<td>
			<c:if test="${adList.ad_type=='0'}">下架中</c:if>
			<c:if test="${adList.ad_type=='1'}">精選商品</c:if>
			<c:if test="${adList.ad_type=='2'}">本週頭條</c:if>
			<c:if test="${adList.ad_type=='3'}">精選商品申請中</c:if>
			<c:if test="${adList.ad_type=='4'}">本週頭條申請中</c:if>
			</td>
			<td>${adList.ad_price}</td>
			<td>
				<form action="Ad.go" method="post">
				<input type="submit" value="強制下架">
				<input type="hidden" name="action" value="updateAd">
				<input type="hidden" name="ad_id" value="${adList.ad_id}">				
				<input type="hidden" name="ad_type" value="0">
				</form>
			</td>
			<td>
				<form action="Ad.go" method="post">
				<input type="submit" value="修改狀態">
				<input type="hidden" name="action" value="updateAd">
				<input type="hidden" name="ad_id" value="${adList.ad_id}">
				<input type="radio" name="ad_type" class="ad_type" value="1" required>精選商品
				<input type="radio" name="ad_type" class="ad_type" value="2">本週頭條
				</form>
			</td>
		
		</tr>
		</c:forEach>
		</table>
	</c:if>
</div>
</body>
</html>