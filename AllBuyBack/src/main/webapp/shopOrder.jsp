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
	#outerDiv{
		width:1280px;
		text-align:center;
		font-size:14px;
		margin: auto;
	}
	#footerDiv{
		width:1280px;
		text-align:center;
		font-size:20px;
		margin: auto;
	}
</style>
</head>
</head>
<body>
<!-- 加入頁首 -->
<jsp:include page="includeTop.jsp"></jsp:include>
<h1 align="center">我的銷售訂單</h1>
<c:if test="${! empty list}">
<div class="table-responsive" id="outerDiv">
<table class="table table-striped">
	<thead>
		<tr class="info">
			<td>訂單編號</td>
			<td>會員名稱</td>
			<td>下單時間</td>
			<td>付款時間</td>
			<td>出貨時間</td>
			<td>總價</td>
			<td>折扣點數</td>
			<td>成交價</td>
			<td>操作</td>
			<td>交易階段</td>
			<td>備註</td>
		</tr>
	</thead>
	<tbody id="table1">
		<c:forEach var="orderVO" items="${list}" varStatus="vs">
			<tr align="center" valign="middle">
				<td>${orderVO.o_id}</td>
				<td>${nameList[vs.index]}</td>
				<td>${orderVO.o_date}</td>
				<td>${orderVO.o_remitDate}</td>
				<td>${orderVO.o_sendDate}</td>
				<td>${orderVO.o_tolPrice}</td>
				<td>${orderVO.o_point}</td>
				<td>${orderVO.o_lastPrice}</td>
				<td>
				<form action="Order.do" method="post">
					<input type="submit" value="詳情" class="btn btn-success" />
					<input type="hidden" name="action" value="getOne" />					
					<input type="hidden" name="o_id" value="${orderVO.o_id}" />					
				</form>
				</td>
				<td>${orderStatus[vs.index]}</td>
				<td><textarea name="o_memo" cols="20" rows="1" style="resize:none;" readonly>${orderVO.o_memo}</textarea></td>
			</tr>
			<tr align="center" valign="middle">
<%-- 				<td><button class="orderlist" value="${orderVO.o_id}" onclick="orderlist(value)">看明細</button></td> --%>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
</c:if>
<div id="footerDiv">
<c:if test="${empty list}">
	<p>目前您的賣場沒有任何訂單唷!快購買廣告增加曝光率吧!</p>
</c:if>

<c:if test="${! empty errorMsgs}"><p>${errorMsgs}</p></c:if>
<c:if test="${! empty delete}"><p>${delete}</p></c:if>
<a href="Order.do?action=sGetAll">返回我的賣場訂單</a><br>
<a id="alink" href="index.jsp">回首頁</a>
</div>
<!-- 加入頁尾 -->
<jsp:include page="_Footer.jsp"></jsp:include>
</body>
</html>