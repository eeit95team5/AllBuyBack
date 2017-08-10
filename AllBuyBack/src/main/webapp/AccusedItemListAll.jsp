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
</head>
<body>

	<table border='1' bordercolor='#CCCCFF' width='800'>
		<tr>
			<th>商品編號</th>
			<th>賣場編號</th>
			<th>商品名稱</th>
			<th>商品描述</th>
			<th>圖片1</th>
			<th>圖片2</th>
			<th>圖片3</th>
			<th>圖片4</th>
			<th>圖片5</th>
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
				<td>${ItemVO.i_id}</td>
				<td>${ItemVO.s_id}</td>
				<td>${ItemVO.i_name}</td>
				<td>${ItemVO.i_describe}</td>
				<td>${ItemVO.i_picture1}</td>
				<td>${ItemVO.i_picture2}</td>
				<td>${ItemVO.i_picture3}</td>
				<td>${ItemVO.i_picture4}</td>
				<td>${ItemVO.i_picture5}</td>
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
				
	<c:if test="${!empty AdminOK }">
					<td><form method="get"
							action="<c:url value="/ItemController"/>">
							<input type="submit" value="上架"> <input type="hidden"
								name="id" value="${ItemVO.i_id}"> <input type="hidden"
								name="action" value="authority_regain">

						</form>
				</c:if>

		</c:forEach>

	</table>
	
	<a href="Admin.jsp">回管理頁面</a>

</body>
</html>