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

<table width='800' class="table">
	<tr align='center' valign='middle'>
		<th>賣場編號</th>
		<th>會員帳號</th>
		<th>會員名字</th>
		
		
	</tr>
	<c:forEach var="MemVO" items="${list}">
		<tr align='center' valign='middle'>
			<td>${MemVO.m_id}</td>
			<td>${MemVO.m_account}</td>
			<td>${MemVO.m_name}</td>			
			<td><form method="get" action="<c:url value="/MemController"/>">
			    <input type="submit" value="停權">
			     <input type="hidden" name="id" value="${MemVO.m_id}">
			    <input type="hidden" name="action" value="authority_cancel">
			
			</form>
			
      </c:forEach>
		</td>
	</table>
	
<!-- 	<a href="Admin.jsp">回管理頁面</a> -->

</body>
</html>