<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PersonalWishContent</title>
</head>
<body>
	<form name="UpdateWishContent" id="UpdateWishContent1" action="UpdateWish?w_Id=${wVO.w_id}" method="POST" enctype="multipart/form-data">
	<table border="1">
	<thead>
	<tr bgcolor='tan'><th height="60" colspan="2" align="center">許願單</th></tr>
	</thead>
	<tbody>
		<tr bgcolor='tan' >
		    <td width="120" height="40">許願編號:</td>
		    <td width="600" height="40" align="left" >
		    <input id='w_Id1' style="text-align:left" name="w_Id" disabled value="${wVO.w_id}" type="text" size="14">
		</tr>
		<tr bgcolor='tan' >
		    <td width="120" height="40">許願人:</td>
		    <td width="600" height="40" align="left" >
		    <input id='account1' style="text-align:left" name="account" disabled value="${wVO.m_account}" type="text" size="14">
		</tr>
		<tr bgcolor='tan' >
		    <td width="120" height="40">許願時間:</td>
		    <td width="600" height="40" align="left" >
		    <input id='date1' style="text-align:left" name="date" disabled value="${wVO.w_date}" type="text" size="14">
		</tr>
		<tr bgcolor='tan' >
		    <td width="120" height="40">許願狀態:</td>
		    <td width="600" height="40" align="left" >
		    <input id='date1' style="text-align:left" name="date" disabled value="${wVO.w_status}" type="text" size="14">
		</tr>
		<tr bgcolor='tan' >
		    <td width="120" height="40">許願人數:</td>
		    <td width="600" height="40" align="left" >
		    <input id='date1' style="text-align:left" name="date" disabled value="${wVO.w_count}" type="text" size="14">
		</tr>
		<tr bgcolor='tan' >
		    <td width="120" height="40">許願標題:</td>
		    <td width="600" height="40" align="left" >
		         <input id='title1' style="text-align:left" name="title" disabled value="${wVO.w_title}" type="text" size="14">
		    </td>
		</tr>
		<tr bgcolor='tan' >
		    <td width="120" height="40">許願內容:</td>
		    <td width="600" height="40" align="left" >
		         <textarea cols="40" rows="5" name="content" id="content1" disabled >${wVO.w_content}</textarea>
		    </td>
		</tr>
		<tr bgcolor='tan' >
		    <td width="120" height="40">圖片:</td>
		    <td width="600" height="40" align="left" >
			    	<c:if test="${not empty p1}">
						<img height='100' width='100' src='${pageContext.servletContext.contextPath}/ReadPicture?w_Id=${wVO.w_id}&pic_id=${p1}'>
					</c:if>
					<c:if test="${not empty p2}">
						<img height='100' width='100' src='${pageContext.servletContext.contextPath}/ReadPicture?w_Id=${wVO.w_id}&pic_id=${p2}'>
					</c:if>
					<c:if test="${not empty p3}">
						<img height='100' width='100' src='${pageContext.servletContext.contextPath}/ReadPicture?w_Id=${wVO.w_id}&pic_id=${p3}'>
					</c:if>
					<c:if test="${not empty p4}">
						<img height='100' width='100' src='${pageContext.servletContext.contextPath}/ReadPicture?w_Id=${wVO.w_id}&pic_id=${p4}'>
					</c:if>
					<c:if test="${not empty p5}">
						<img height='100' width='100' src='${pageContext.servletContext.contextPath}/ReadPicture?w_Id=${wVO.w_id}&pic_id=${p5}'>
					</c:if>
		    </td>
		</tr>
		<tr bgcolor='tan' >
		    <td width="120" height="40">參與願望名單:</td>
		    <td width="600" height="40" align="left" >
		    	<c:forEach var="list" items="${wlList}">
		    		${list.m_account}<br>
		        </c:forEach>
		    </td>
		</tr>
		<tr bgcolor='tan' >
		    <td width="120" height="40">實現願望賣家:</td>
		    <td width="600" height="40" align="left" >
		    	<c:forEach var="as" items="${asVO}">
		    		${as.m_account}<br>
		    	</c:forEach>
		    </td>
		</tr>
		<tr bgcolor='tan' >
		    <td height="50" colspan="2" align="center">
		       <a href="AddOne?w_Id=${wVO.w_id}"><input type="button" value="+1" ></a>
		       <a href="CheckPeopleList"><input type="button" value="返回列表"></a>
		       <a href="index.jsp"><input type="button" value="回首頁"></a>
		       <a href="MakeWishComeTrue?w_Id=${wVO.w_id}"><input type="button" value="接受願望"></a>
		       <br>
		       <font color='red' size='-1'>${errorMsg.login}</font>
		       <font color='red' size='-1'>${errorMsg.duplicateAccount}</font>
		       <font color='red' size='-1'>${errorMsg.doubleAccount}</font>
		       <font color='red' size='-1'>${errorMsg.AccountNoRight}</font>
		    </td>
		</tr>	
	</tbody>
	</table>
	</form>

</body>
</html>