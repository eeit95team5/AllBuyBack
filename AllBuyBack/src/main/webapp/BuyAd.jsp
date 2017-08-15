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
<form action="Ad.go" method="post">
<label>廣告類型:</label>
<select name="ad_type">
	<option value="3">精選商品</option>
	<option value="4">頁首文字</option>
</select>
<label>廣告開始日期:</label><input type="text" name="ad_startDate" />
<label>廣告天數:</label><input type="text" name="ad_days" />
<label>廣告價格:</label>
<label>購買廣告:</label><input type="submit" value="我買">
<input type="hidden" name="s_id" value="${LoginOK.m_id}">
<input type="hidden" name="i_id" value="1000001">
<input type="hidden" name="action" value="buyAd" />
</form>
<a href="Ad.go?action=selectBySId&s_id=${LoginOK.m_id}">我的廣告</a><br>
<a href="Ad.go?action=selectAll">管理者廣告頁面</a>
<c:if test="${! empty msg}" >${msg}</c:if>
</body>
</html>