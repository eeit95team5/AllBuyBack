<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty LoginOK}">
	<c:set var="target" value="${pageContext.request.servletPath}" scope="session"/>
	<c:redirect url="/login.jsp"/>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
	#thhead{
		text-align:center
	}
	
</style>

</head>
<body>
<jsp:include page="includeTop.jsp"></jsp:include>
	<form name="WishContent" id="WishContent1" action="MakeAWish" method="POST" enctype="multipart/form-data">
	<fieldset>
		<table>
		<thead>
		<tr><th id="thhead" height="60" colspan="2">許願單</th></tr>
		</thead>
		<tbody>
			<tr>
			    <td width="120" height="40">許願人:</td>
			    <td width="600" height="40" align="left" >
			    <input id='account1' style="text-align:left" name="account" disabled value="${LoginOK.m_account}" type="text" size="14">
			</tr>
			<tr>
			    <td width="120" height="40">許願標題:</td>
			    <td width="600" height="40" align="left" >
			         <input id='title1' style="text-align:left" name="title" value="${param.title}" type="text" size="14">
			         <div style="color:#FF0000; display: inline">${ErrorMsg.title}</div>
			    </td>
			</tr>
			<tr>
			    <td width="120" height="40">許願內容:</td>
			    <td width="600" height="40" align="left" >
			         <textarea cols="40" rows="5" name="content" id="content1">${param.content}</textarea>
			         <div style="color:#FF0000; display: inline">${ErrorMsg.content}</div>
			    </td>
			</tr>
			<tr>
			    <td width="120" height="40">圖片上傳1:</td>
			    <td width="600" height="40" align="left" >
			         <input type="file" name="file1" id="file1" accept="image/*">
			    </td>
			</tr>
			<tr>
			    <td width="120" height="40">圖片上傳2:</td>
			    <td width="600" height="40" align="left" >
			         <input type="file" name="file2" id="file2" accept="image/*">
			    </td>
			</tr>
			<tr>
			    <td width="120" height="40">圖片上傳3:</td>
			    <td width="600" height="40" align="left" >
			         <input type="file" name="file3" id="file3" accept="image/*">
			    </td>
			</tr>
			<tr>
			    <td width="120" height="40">圖片上傳4:</td>
			    <td width="600" height="40" align="left" >
			         <input type="file" name="file4" id="file4" accept="image/*">
			    </td>
			</tr>
			<tr>
			    <td width="120" height="40">圖片上傳5:</td>
			    <td width="600" height="40" align="left" >
			         <input type="file" name="file5" id="file5" accept="image/*">
			    </td>
			</tr>
			<tr>
			    <td height="50" colspan="2" align="center">
			       <input class="btn btn-primary" type="submit" value="許願" >
			       <a href="CheckYourList"><input class="btn btn-primary" type="button" value="個人願望列表"></a>
			       <a href="HomeIndex.jsp"><input class="btn btn-primary" type="button" value="回首頁"></a>
			    </td>
			</tr>	
		</tbody>
		</table>
	</fieldset>
	</form>
	<br>
<jsp:include page="_Footer.jsp"></jsp:include>
</body>
</html>