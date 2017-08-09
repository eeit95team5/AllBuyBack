<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>全願望列表</h1>
	<a href="MakeAWishForm.jsp"><input type="button" value="許願"></a><br>
	<br>
	<a href="index.jsp"><input type="button" value="回首頁"></a>
	<br>
	<table>
		<thead>
			<tr>
				<th>願望編號</th>
				<th>許願人</th>
				<th>願望名稱</th>
				<th>願望內容</th>
				<th>許願時間</th>
				<th>願望狀態</th>
				<th>許願人數</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="mVO" items="${VOlist}">
				<tr>
					<td><a href="PeopleWishContent?w_id=${mVO.w_id}">${mVO.w_id}</a></td>
					<td>${mVO.m_account}<td>
					<td>${mVO.w_title}</td>
					<td><a href="PeopleWishContent?w_id=${mVO.w_id}">${mVO.w_content}</a></td>
					<td>${mVO.w_date}</td>
					<td>${mVO.w_status}</td>
					<td>${mVO.w_count}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>