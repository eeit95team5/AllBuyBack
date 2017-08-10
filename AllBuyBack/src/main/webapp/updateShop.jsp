<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改商店資訊</title>
</head>
<body>
<form action="<c:url value='/shop.SPRINGcontroller'/>" method="get">
	<table>		
		<tr><td>商店編號：</td><td>${shopbean.s_id}<input type="hidden" name="s_id" id="s_id" value="${shopbean.s_id}" /></td></tr>
		<tr><td>關於商店：</td><td><input type="text" name="s_aboutMe" id="s_aboutMe" value="${shopbean.s_aboutMe}"/></td></tr>
		<tr><td>商店總分：</td><td>${shopbean.s_score}<input type="hidden" name="s_score" id="s_score" value="${shopbean.s_score}" /></td></tr>
		<tr><td>商店評價：</td><td>${shopbean.s_avgScore}<input type="hidden" name="s_avgScore" id="s_avgScore" value="${shopbean.s_avgScore}" /></td></tr>
		<tr><td>商店人氣：</td><td>${shopbean.s_popular}<input type="hidden" name="s_popular" id="s_popular" value="${shopbean.s_popular}" /></td></tr>
		<tr><td>商店點閱：</td><td>${shopbean.s_click}<input type="hidden" name="s_click" id="s_click" value="${shopbean.s_click}" /></td></tr>
		<tr><td>商店點數：</td><td>${shopbean.s_point}<input type="hidden" name="s_point" id="s_point" value="${shopbean.s_point}" /></td></tr>
		<tr><td><button type="submit" name="prodaction" value="Update">送出修改</button></td></tr>
	</table>
</form>
<form action="<c:url value='/shopmanager.html'/>" method="get">
			<button type="submit" name="s_id" value="${shopbean.s_id }">回到商店</button>
</form>
</body>
</html>