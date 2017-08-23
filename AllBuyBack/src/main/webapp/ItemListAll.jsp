<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--        <c:if test="${empty AdminOK}"> --%>
<%--     <c:set var="target" value="${pageContext.request.servletPath }" scope="session"/> --%>
<%--     <c:redirect url="/Login.jsp"/>   --%>
<%--    </c:if> --%>
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

	<table width='800' class="table">
		<tr align='center' valign='middle'>
			<th>商品編號</th>
			<th>賣場編號</th>
			<th>商品名稱</th>
			<th>商品描述</th>
<!-- 			<th>圖片1</th> -->
<!-- 			<th>圖片2</th> -->
<!-- 			<th>圖片3</th> -->
<!-- 			<th>圖片4</th> -->
<!-- 			<th>圖片5</th> -->
			<th>商品價格</th>
			<th>商品數量</th>
			<th>國家編號</th>
			<th>商品到貨日</th>
			<th>商品上架日</th>
			<th>商品販售數量</th>
			<th>商品狀態</th>
			<th>商品分類1</th>
			<th>商品分類2</th>
			<th>商品分類3</th>
			<th>受歡迎程度</th>
			<th>商品點閱數</th>
			<th>賣場分類1</th>
			<th>賣場分類2</th>

		</tr>
		<c:forEach var="ItemVO" items="${list}">
			<tr align='center' valign='middle'>
				<td><a href="#" onclick="window.open('item.html?i_id=${ItemVO.i_id}','處理檢舉','height=350,width=650,scrollbars=1,resizable=0,location=0')">${ItemVO.i_id}</a></td>
				<td>${ItemVO.s_id}</td>
				<td>${ItemVO.i_name}</td>
				<td>${ItemVO.i_describe}</td>
<%-- 				<td>${ItemVO.i_picture1}</td> --%>
<%-- 				<td>${ItemVO.i_picture2}</td> --%>
<%-- 				<td>${ItemVO.i_picture3}</td> --%>
<%-- 				<td>${ItemVO.i_picture4}</td> --%>
<%-- 				<td>${ItemVO.i_picture5}</td> --%>
				<td>${ItemVO.i_price}</td>
				<td>${ItemVO.i_quantity}</td>
				<td>${ItemVO.country_id}</td>
				<td>${ItemVO.i_arrivedDate}</td>
				<td>${ItemVO.i_onSellDate}</td>
				<td>${ItemVO.i_soldQuantity}</td>
				<td>${ItemVO.i_status}</td>
				<td>${ItemVO.i_class1}</td>
				<td>${ItemVO.i_class2}</td>
				<td>${ItemVO.i_class3}</td>
				<td>${ItemVO.i_popular}</td>
				<td>${ItemVO.i_click}</td>
				<td>${ItemVO.s_class1}</td>
				<td>${ItemVO.s_class2}</td>
				<%-- 			<td>${LoginOK.m_account}</td> --%>
				<%-- 				<c:if test="${!empty AdminOK }"> --%>
				<!-- 					<td><form method="post" -->
				<%-- 							action="<c:url value="/ItemController"/>"> --%>
				<!-- 							<input type="submit" value="修改"> <input type="hidden" -->
				<%-- 								name="id" value="${ItemVO.i_id}"> <input type="hidden" --%>
				<!-- 								name="action" value="authority_check"> -->

				<!-- 						</form> -->
				<%-- 				</c:if> --%>

				<c:if test="${!empty AdminOK}">
					<td><form method="get"
							action="<c:url value="/ItemController"/>">
							<input type="submit" value="下架"> <input type="hidden"
								name="id" value="${ItemVO.i_id}"> <input type="hidden"
								name="action" value="authority_cancel">

						</form>
				</c:if>

<%-- 				<c:if test="${!empty LoginOK}"> --%>
<!-- 					<td><form method="post" -->
<%-- 							action="<c:url value="/ItemController"/>"> --%>
<!-- 							<input type="submit" value="檢舉"> <input type="hidden" -->
<%-- 								name="m_id" value="${LoginOK.m_id}"> <input --%>
<%-- 								type="hidden" name="i_id" value="${ItemVO.i_id}"> <input --%>
<!-- 								type="hidden" name="action" value="product_accuse"> -->

<!-- 						</form> -->
<%-- 				</c:if> --%>

<%-- 				<c:if test="${!empty LoginOK }"> --%>
<!-- 					<td><form method="post" -->
<%-- 							action="<c:url value="/ChatController"/>"> --%>
<!-- 							<input type="submit" value="議價"> <input type="hidden" -->
<%-- 								name="m_id" value="${LoginOK.m_id}">  --%>
<!-- 								<input type="hidden" -->
<%-- 								name="m_account" value="${LoginOK.m_account}"> --%>
<!-- 								<input -->
<%-- 								type="hidden" name="s_id" value="${ItemVO.s_id}"> <input --%>
<!-- 								type="hidden" name="action" value="price_bargain"> -->

<!-- 						</form> -->
<%-- 				</c:if> --%>
		</c:forEach>

	</table>
	
<%-- 	<c:if test="${!empty AdminOK}"><a href="Admin.jsp">回管理頁面</a></c:if> --%>
	
<!-- 	<a href="index.jsp">回首頁</a> -->


</body>
</html>