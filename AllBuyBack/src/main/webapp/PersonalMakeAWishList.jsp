<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	#hId{
		text-align:center;
	}
</style>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="includeTop.jsp"></jsp:include>
	<fieldset>
	<h1>${account}的許願池</h1>
	<a href="MakeAWishForm.jsp"><input class="btn" type="button" value="許願"></a>
	<a href="CheckPeopleList"><input class="btn" type="button" value="看看大家願望"></a>
	<br>
	<br>
		<table>
			<thead>
				<tr>
					<th id="hId" width="80px">願望編號</th>
					<th id="hId" width="80px">願望名稱</th>
					<th id="hId" width="80px">願望內容</th>
					<th id="hId" width="80px">許願時間</th>
					<th id="hId" width="80px">願望狀態</th>
					<th id="hId" width="80px">許願人數</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="mVO" items="${VOlist}">
					<tr>
						<td id="hId"><a href="PersonalWishContent?w_id=${mVO.w_id}">${mVO.w_id}</a></td>
						<td id="hId">${mVO.w_title}</td>
						<td id="hId"><a href="PersonalWishContent?w_id=${mVO.w_id}">${mVO.w_content}</a></td>
						<td id="hId">${mVO.w_date}</td>
						<td id="hId">${mVO.w_status}</td>
						<td id="hId">${mVO.w_count}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
	<br><br>
<jsp:include page="_Footer.jsp"></jsp:include>
</body>
</html>