<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <c:if test="${empty AdminOK}">
    <c:set var="target" value="${pageContext.request.servletPath }" scope="session"/>
    <c:redirect url="/Login.jsp"/>  
   </c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>申訴編號</th>
		<th>會員編號</th>
		<th>商品編號</th>
		<th>申訴標題</th>
<!-- 		<th>申訴內容</th> -->
<!-- 		<th>申訴日期</th> -->
<!-- 		<th>回覆狀態</th> -->
		<th>回覆標題</th>
<!-- 		<th>回覆結果</th> -->
<!-- 		<th>回覆日期</th> -->

	
	</tr>
	<c:forEach var="ReportVO" items="${list}">
		<tr align='center' valign='middle'>
			<td>${ReportVO.rep_id}</td>
			<td>${ReportVO.m_id}</td>
			<td>${ReportVO.i_id}</td>
			<td><a href="RepController?rep_id=${ReportVO.rep_id}&m_id=${ReportVO.m_id}
			&i_id=${ReportVO.i_id}&rep_date=${ReportVO.rep_date}&reason=${ReportVO.rep_content}&reply_title=${ReportVO.rep_title}
			&action=accuse_content">${ReportVO.rep_title}</a></td>
<%-- 			<td>${ReportVO.rep_content}</td> --%>
<%-- 			<td>${ReportVO.rep_date}</td> --%>
<%-- 			<td>${ReportVO.rep_procss}</td> --%>
			<td><a href="RepController?rep_resultTitle=${ReportVO.rep_resultTitle}&rep_procssDate=${ReportVO.rep_procssDate}&rep_result=${ReportVO.rep_result}&action=accuse_reply_content" >${ReportVO.rep_resultTitle}</a></td>
<%-- 			<td>${ReportVO.rep_result}</td> --%>
<%-- 			<td>${ReportVO.rep_procssDate}</td> --%>

<%-- 			<td><form method="get" action="<c:url value="/RepController"/>"> --%>
<!-- 			    <input type="submit" value="內容"> -->
<%-- 			     <input type="hidden" name="id" value="${MemVO.m_id}"> --%>
<%-- 			    <input type="hidden" name="rep_id" value="${ReportVO.rep_id}">			 --%>
<%-- 			    <input type="hidden" name="m_id" value="${ReportVO.m_id}">			 --%>
<%-- 			    <input type="hidden" name="i_id" value="${ReportVO.i_id}">			 --%>
<%-- 			    <input type="hidden" name="reason" value="${ReportVO.rep_content}">	 --%>
<%-- 			    <input type="hidden" name="reply_title" value="${ReportVO.rep_title}">					 --%>
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
<%-- 				<c:if test="${!empty AdminOK }"> --%>
<!-- 					<td><form method="post" -->
<%-- 							action="<c:url value="/ItemController"/>"> --%>
<!-- 							<input type="submit" value="下架"> <input type="hidden" -->
<%-- 								name="id" value="${ReportVO.i_id}"> <input type="hidden" --%>
<!-- 								name="action" value="authority_cancel"> -->

<!-- 						</form> -->
<%-- 				</c:if> --%>
			
      </c:forEach>
		</td>
	</table>
	
<!-- 	<table> -->
<!-- 	<tr> -->
<!-- 	<td> -->
	<a href="Admin.jsp">回管理頁面</a>
<!-- 	</td> -->
<!-- 	</tr> -->
<!-- 	</table> -->

</body>
</html>