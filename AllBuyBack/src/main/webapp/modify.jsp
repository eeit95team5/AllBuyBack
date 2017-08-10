<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更改權限頁面</title>
</head>
<body>


<form action="<c:url value="/MemController"/>" method="post" name="modify">

<table>

<tr>
<td>會員編號</td>
<td>${MemVO.m_id}</td>
</tr>
<tr>
<td>會員帳號</td>
<td>${MemVO.m_account}</td>
<td><input type="hidden" name="account" value="${MemVO.m_account}"></td>
</tr>
<tr>
<td>會員密碼</td>
<td><input type="text" name="password" value="${MemVO.m_password }"></td>
<%-- <td><span>${errorMsgKey.NumberFormatException}</span></td> --%>
</tr>
<tr>
<td>會員權限</td>
<td><input type="text" name="authority" value="${MemVO.m_authority }"></td>
<td><span>${errorMsgKey.NumberFormatException}</span></td>
</tr>
</table>

<br>
<input type="hidden" name="action" value="modify">
  <input type="hidden" name="id" value="${MemVO.m_id}">
<input type="submit" value="確定修改">

</form>

</body>
</html>