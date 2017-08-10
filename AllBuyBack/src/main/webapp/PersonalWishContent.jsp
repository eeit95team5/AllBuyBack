<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		         <input id='title1' style="text-align:left" name="title" value="${wVO.w_title}" type="text" size="14">
		         <div style="color:#FF0000; display: inline">${ErrorMsg.title}</div>
		    </td>
		</tr>
		<tr bgcolor='tan' >
		    <td width="120" height="40">許願內容:</td>
		    <td width="600" height="40" align="left" >
		         <textarea cols="40" rows="5" name="content" id="content1">${wVO.w_content}</textarea>
		         <div style="color:#FF0000; display: inline">${ErrorMsg.content}</div>
		    </td>
		</tr>
		<c:if test="${empty p1}">
		<tr bgcolor='tan' >
		    <td width="120" height="40">圖片上傳1:</td>
		    <td width="600" height="40" align="left" >
		         <input type="file" name="file1" id="file1" multiple accept="image/*">
		    </td>
		</tr>
		</c:if>
		<c:if test="${empty p2}">
		<tr bgcolor='tan' >
		    <td width="120" height="40">圖片上傳2:</td>
		    <td width="600" height="40" align="left" >
		         <input type="file" name="file2" id="file2" multiple accept="image/*">
		    </td>
		</tr>
		</c:if>
		<c:if test="${empty p3}">
		<tr bgcolor='tan' >
		    <td width="120" height="40">圖片上傳3:</td>
		    <td width="600" height="40" align="left" >
		         <input type="file" name="file3" id="file3" multiple accept="image/*">
		    </td>
		</tr>
		</c:if>
		<c:if test="${empty p4}">
		<tr bgcolor='tan' >
		    <td width="120" height="40">圖片上傳4:</td>
		    <td width="600" height="40" align="left" >
		         <input type="file" name="file4" id="file4" multiple accept="image/*">
		    </td>
		</tr>
		</c:if>
		<c:if test="${empty p5}">
		<tr bgcolor='tan' >
		    <td width="120" height="40">圖片上傳5:</td>
		    <td width="600" height="40" align="left" >
		         <input type="file" name="file5" id="file5" multiple accept="image/*">
		    </td>
		</tr>
		</c:if>
		<tr bgcolor='tan' >
		    <td width="120" height="40">前次上傳圖片:</td>
		    <td width="600" height="40" align="left" >
			    	<c:if test="${not empty p1}">
						<img height='100' width='100' src='${pageContext.servletContext.contextPath}/ReadPicture?w_Id=${wVO.w_id}&pic_id=${p1}'>
						<input type="checkbox" name="checkbox1" id="checkbox1" value="1">刪除
					</c:if>
					<c:if test="${not empty p2}">
						<img height='100' width='100' src='${pageContext.servletContext.contextPath}/ReadPicture?w_Id=${wVO.w_id}&pic_id=${p2}'>
						<input type="checkbox" name="checkbox2" id="checkbox2" value="2">刪除
					</c:if>
					<c:if test="${not empty p3}">
						<img height='100' width='100' src='${pageContext.servletContext.contextPath}/ReadPicture?w_Id=${wVO.w_id}&pic_id=${p3}'>
						<input type="checkbox" name="checkbox3" id="checkbox3" value="3">刪除
					</c:if>
					<c:if test="${not empty p4}">
						<img height='100' width='100' src='${pageContext.servletContext.contextPath}/ReadPicture?w_Id=${wVO.w_id}&pic_id=${p4}'>
						<input type="checkbox" name="checkbox4" id="checkbox4" value="4">刪除
					</c:if>
					<c:if test="${not empty p5}">
						<img height='100' width='100' src='${pageContext.servletContext.contextPath}/ReadPicture?w_Id=${wVO.w_id}&pic_id=${p5}'>
						<input type="checkbox" name="checkbox5" id="checkbox5" value="5">刪除
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
		       <input type="submit" value="修改許願內容" >
		       <a href="CheckYourList"><input type="button" value="回個人願望列表"></a>
		       <a href="DeleteThisWish?w_Id=${wVO.w_id}"><input type="button" value="刪除此願望"></a>
		       <br>
		       <font color='red' size='-1'>${ErrorMsg.deleteError}</font>
		    </td>
		</tr>	
	</tbody>
	</table>
	</form>

</body>
</html>