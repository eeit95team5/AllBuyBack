<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${shop.s_id }的商店</title>
</head>
<body>
	<h3>${shop.s_id }的商店</h3>
	<h5>${shop.s_aboutMe }</h5>	
	<table>
		<tr>
			<c:forEach items="${items}" var="item" varStatus="varS">
				<td><a href="<c:url value="/item.html?i_id=${item.i_id }"/>">${item.i_id }</a></td>
				<c:if test="${varS.count % 3 == 0}"></tr><tr></c:if>
			</c:forEach>
		</tr>
	</table>
	<a href="<c:url value='/index.jsp'/>"> <input type="button" value="回首頁" ></a>
</body>
</html>
