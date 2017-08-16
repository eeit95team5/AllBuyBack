<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <c:if test="${empty AdminOK}">
    <c:set var="target" value="${pageContext.request.servletPath }" scope="session"/>
    <c:redirect url="/Login.jsp"/>  
   </c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>會員編號</th>
		<th>會員帳號</th>
		<th>會員密碼</th>
		<th>會員名字</th>
		<th>會員電話</th>
		<th>會員地址</th>
		<th>身分證字號</th>
		<th>電子郵件</th>
		<th>會員權限</th>
		<th>圖片</th>
		<th>背景圖片</th>
		<th>總評價</th>
		<th>平均分數</th>
		<th>註冊時間</th>
		<th>點數</th>
		<th>金頭腦分數</th>
		<th>修改權限</th>
		<th>黑名單</th>
		<th>回復賣場權限</th>
	
	</tr>
	<c:forEach var="MemVO" items="${list}">
		<tr align='center' valign='middle'>
			<td>${MemVO.m_id}</td>
			<td>${MemVO.m_account}</td>
			<td>${MemVO.m_password}</td>
			<td>${MemVO.m_name}</td>
			<td>${MemVO.m_phone}</td>
			<td>${MemVO.m_address}</td>
			<td>${MemVO.m_identity}</td>
			<td>${MemVO.m_email}</td>
			<td>${MemVO.m_authority}</td>
			<td>${MemVO.m_photo}</td>
			<td>${MemVO.m_background}</td>
			<td>${MemVO.m_scoreCount}</td>
			<td>${MemVO.m_avgScore}</td>
			<td>${MemVO.m_lastUsed}</td>
			<td>${MemVO.m_point}</td>
			<td>${MemVO.m_times_gb}</td>
			<td><form method="post" action="<c:url value="/MemController"/>">
			    <input type="submit" value="修改">
			     <input type="hidden" name="id" value="${MemVO.m_id}">
			    <input type="hidden" name="action" value="authority_check">			
			</form></td>
			<td><form method="get" action="<c:url value="/MemController"/>">
			    <input type="submit" value="黑名單">
			     <input type="hidden" name="id" value="${MemVO.m_id}">
			     <input type="hidden" name="authority" value="${MemVO.m_authority}">
			    <input type="hidden" name="action" value="set_blacklist">			
			</form></td>
			<td><form method="get" action="<c:url value="/MemController"/>">
			    <input type="submit" value="回復賣場權限">
			     <input type="hidden" name="id" value="${MemVO.m_id}">
			    <input type="hidden" name="action" value="regain_mall">			
			</form></td>
			
      </c:forEach>
		</td>
	</table>
	
<!-- 	<table> -->
<!-- 	<tr> -->
<!-- 	<td> -->
<!-- 	<a href="Admin.jsp">回管理頁面</a> -->
<!-- 	</td> -->
<!-- 	</tr> -->
<!-- 	</table> -->

</body>
</html>