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

<form action="<c:url value="/ItemController"/>" method="post" name="modifyItem">

<table>

<tr>
<td>商品編號</td>
<td>${ItemVO.i_id}</td>
</tr>
<tr>
<td>賣場編號</td>
<td>${ItemVO.s_id}</td>
<td><input type="hidden" name="sell" value="${ItemVO.s_id}"></td>
</tr>
<tr>
<td>商品狀態</td>
<td><input type="text" name="status" value="${ItemVO.i_status}"></td>
<%-- <td><span>${errorMsgKey.NumberFormatException}</span></td> --%>
</tr>
</table>

<br>
<input type="hidden" name="action" value="modifyItem">
  <input type="hidden" name="id" value="${ItemVO.i_id}">
<input type="submit" value="確定修改">

</form>

</body>
</html>