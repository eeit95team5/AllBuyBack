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

<%-- <c:set var="MemVO" value="${list }"></c:set> --%>

<form action="<c:url value="/ShopController"/>" method="get">
<table class="table">

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
