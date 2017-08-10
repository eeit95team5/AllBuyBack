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

<%-- <c:set var="MemVO" value="${list }"></c:set> --%>

<form action="<c:url value="/ShopController"/>" method="get">
<table border="0">

	<tr>
		<td>賣場編號:</td>
		<td>${LoginOK.m_id }</td>
			<td><input type="hidden" name="m_id" value="${LoginOK.m_id }"></td>
<%-- 			<td><span>${errorMsgKey.account}</span></td> --%>
<%-- 			<td><span>${errorMsgKey.account1}</span></td> --%>
	</tr>
<!-- 	<tr> -->
<!-- 		<td>關於我:</td> -->
<!-- 		<td><input type="text" name="s_aboutMe" size="45"  -->
<%-- 			value="${param.s_aboutMe }" /></td> --%>
<%-- 			<td><span>${errorMsgKey.password}</span></td> --%>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="MallInsert">
<input type="submit" value="申請"></FORM>

</form>

</body>
