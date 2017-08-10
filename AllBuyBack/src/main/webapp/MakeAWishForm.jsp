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
<title>Insert title here</title>

</head>
<body>
	<form name="WishContent" id="WishContent1" action="MakeAWish" method="POST" enctype="multipart/form-data">
	<table border="1">
	<thead>
	<tr bgcolor='tan'><th height="60" colspan="2" align="center">許願單</th></tr>
	</thead>
	<tbody>
		<tr bgcolor='tan' >
		    <td width="120" height="40">許願人:</td>
		    <td width="600" height="40" align="left" >
		    <input id='account1' style="text-align:left" name="account" disabled value="${LoginOK.m_account}" type="text" size="14">
		</tr>
		<tr bgcolor='tan' >
		    <td width="120" height="40">許願標題:</td>
		    <td width="600" height="40" align="left" >
		         <input id='title1' style="text-align:left" name="title" value="${param.title}" type="text" size="14">
		         <div style="color:#FF0000; display: inline">${ErrorMsg.title}</div>
		    </td>
		</tr>
		<tr bgcolor='tan' >
		    <td width="120" height="40">許願內容:</td>
		    <td width="600" height="40" align="left" >
		         <textarea cols="40" rows="5" name="content" id="content1">${param.content}</textarea>
		         <div style="color:#FF0000; display: inline">${ErrorMsg.content}</div>
		    </td>
		</tr>
		<tr bgcolor='tan' >
		    <td width="120" height="40">圖片上傳1:</td>
		    <td width="600" height="40" align="left" >
		         <input type="file" name="file1" id="file1" multiple accept="image/*">
		    </td>
		</tr>
		<tr bgcolor='tan' >
		    <td width="120" height="40">圖片上傳2:</td>
		    <td width="600" height="40" align="left" >
		         <input type="file" name="file2" id="file2" multiple accept="image/*">
		    </td>
		</tr>
		<tr bgcolor='tan' >
		    <td width="120" height="40">圖片上傳3:</td>
		    <td width="600" height="40" align="left" >
		         <input type="file" name="file3" id="file3" multiple accept="image/*">
		    </td>
		</tr>
		<tr bgcolor='tan' >
		    <td width="120" height="40">圖片上傳4:</td>
		    <td width="600" height="40" align="left" >
		         <input type="file" name="file4" id="file4" multiple accept="image/*">
		    </td>
		</tr>
		<tr bgcolor='tan' >
		    <td width="120" height="40">圖片上傳5:</td>
		    <td width="600" height="40" align="left" >
		         <input type="file" name="file5" id="file5" multiple accept="image/*">
		    </td>
		</tr>
		<tr bgcolor='tan' >
		    <td height="50" colspan="2" align="center">
		       <input type="submit" value="許願" >
		       <a href="CheckYourList"><input type="button" value="回個人願望列表"></a>
		       <a href="Index.jsp"><input type="button" value="回首頁"></a>
		    </td>
		</tr>	
	</tbody>
	</table>
	</form>
	
</body>
</html>