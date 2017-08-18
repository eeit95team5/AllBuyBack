<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  %>
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
	#outerDiv {
		width:1024px;
		text-align:center;
		font-size:14px;
		margin: auto;
		table-layout:fixed ;
		overflow:hidden;
        white-space:nowrap;
        text-overflow:ellipsis;
        WORD-WRAP:break-word;
	}
	#footerDiv{
		width:1024px;
		text-align:center;
		font-size:20px;
		margin: auto;
	}
</style>
</head>
<body>
<!-- 加入頁首 -->
<jsp:include page="includeTop.jsp"></jsp:include>
<h1 align="center">我的購物訂單</h1>
<c:if test="${! empty list}">
<div class="table-responsive" id="outerDiv">
<table class="table table-striped">
	<thead>
		<tr class="info">
			<td class="id">訂單編號</td>
			<td class="shop">賣場</td>
			<td class="date">下單時間</td>
			<td class="point">折扣點數</td>
			<td class="price">成交價</td>
			<td class="ship">運送方式</td>
			<td class="pay">付款方式</td>
			<td class="do">操作</td>
			<td class="status">交易階段</td>
			<td class="memo" style="text-align:left;">備註</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="orderVO" items="${list}" varStatus="vs">
			<tr align="center" valign="middle">
				<td>${orderVO.o_id}</td>
				<td><a href="shop.html?s_id=${orderVO.s_id}">${nameList[vs.index]}</a></td>
				<td>${orderVO.o_date}</td>
				<td>${orderVO.o_point}</td>
				<td>${orderVO.o_lastPrice}</td>
				<td>${shipway[vs.index]}</td>
				<td>${orderVO.pay_id}</td>
				<td>
				<form action="Order.do" method="get">
					<input type="submit" value="詳情" class="btn btn-success"/>
					<input type="hidden" name="action" value="getOne" />					
					<input type="hidden" name="o_id" value="${orderVO.o_id}" />					
				</form>
				</td>
				<td>${orderStatus[vs.index]}</td>
				<td><textarea name="o_memo" cols="20" rows="1" style="resize:none;" readonly>${orderVO.o_memo}</textarea></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
</c:if>
<div id="footerDiv">
	<c:if test="${empty list}">
		<p>目前您沒有任何訂單唷!快去購物吧!</p><a href="Item.go?action=getItems"></a>
	</c:if>
	<c:if test="${! empty errorMsgs}"><p>${errorMsgs}</p></c:if>
	<c:if test="${! empty delete}">
		<p>${delete}</p>
	</c:if>
	<a href="Order.do?action=cGetAll">返回我的購買訂單</a><br>
	<a id="alink" href="index.jsp">回首頁</a>
</div>
<!-- 加入頁尾 -->
<jsp:include page="_Footer.jsp"></jsp:include>
</body>
</html>