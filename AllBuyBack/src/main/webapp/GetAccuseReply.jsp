<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--        <c:if test="${empty AdminOK}"> --%>
<%--     <c:set var="target" value="${pageContext.request.servletPath }" scope="session"/> --%>
<%--     <c:redirect url="/Login.jsp"/>   --%>
<%--    </c:if> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
<link rel="stylesheet" href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="webjars/sweetalert/1.1.3/dist/sweetalert.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script>
</head>
<body>

<table border='1' bordercolor='#CCCCFF' width='800' class="table">
	<tr>
		<th>商品編號</th>
		<th>申訴標題</th>
		<th>申訴內容</th>
		<th>申訴日期</th>
		<th>回覆標題</th>
		<th>回覆內容</th>
		<th>回覆日期</th>

	
	</tr>
	<c:forEach var="ReportVO" items="${list}">
		<tr align='center' valign='middle'>
			<td>${ReportVO.i_id}</td>
			<td>${ReportVO.rep_title}</td>
			<td>${ReportVO.rep_content}</td>
			<td>${ReportVO.rep_date}</td>
			<td>${ReportVO.rep_resultTitle}</td>
			<td>${ReportVO.rep_result}</td>
			<td>${ReportVO.rep_procssDate}</td>

<%-- 			<td><form method="post" action="<c:url value="/RepController"/>"> --%>
<!-- 			    <input type="submit" value="內容"> -->
<%-- 			     <input type="hidden" name="id" value="${LoginOK.m_id}">			 --%>
<%-- 			    <input type="hidden" name="i_id" value="${ReportVO.i_id}">			 --%>
<%-- 			    <input type="hidden" name="reason" value="${ReportVO.rep_content}">			 --%>
<!-- 			    <input type="hidden" name="action" value="accuse_content">			 -->
<!-- 			</form></td> -->
<%-- 			<td><form method="post" action="<c:url value="/MemController"/>"> --%>
<!-- 			    <input type="submit" value="黑名單"> -->
<%-- 			     <input type="hidden" name="id" value="${MemVO.m_id}"> --%>
<!-- 			    <input type="hidden" name="action" value="set_blacklist">			 -->
<!-- 			</form></td> -->
<%-- 			<td><form method="post" action="<c:url value="/MemController"/>"> --%>
<!-- 			    <input type="submit" value="開通"> -->
<%-- 			     <input type="hidden" name="id" value="${MemVO.m_id}"> --%>
<!-- 			    <input type="hidden" name="action" value="set_mall">			 -->
<!-- 			</form></td> -->
			
      </c:forEach>
		</td>
	</table>
	
<!-- 	<table> -->
<!-- 	<tr> -->
<!-- 	<td> -->
<!-- 	<a href="Admin.jsp">回管理頁面</a> -->
<!-- 	</td> -->
<!-- 	</tr> -->
<!-- 	</table> -->

</body>
</html>