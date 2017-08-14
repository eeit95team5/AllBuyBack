<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
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
	
	<a href="Admin.jsp">回管理頁面</a>

</body>
</html>