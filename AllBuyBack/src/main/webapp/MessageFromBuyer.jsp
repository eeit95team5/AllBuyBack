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
</head>
<body>


<table border='1' bordercolor='#CCCCFF' width='800'>
<!-- <table> -->
	<tr>
	    <th>賣場編號</th>
		<th>會員編號</th>
		<th>發文帳號</th>
<!-- 		<th>回覆內容</th> -->
		<th>回覆日期</th>
<!-- 		<th>申訴標題</th> -->
<!-- 		<th>申訴內容</th> -->
<!-- 		<th>申訴日期</th> -->
<!-- 		<th>回覆狀態</th> -->
<!-- 		<th>回覆標題</th> -->
<!-- 		<th>回覆結果</th> -->
<!-- 		<th>回覆日期</th> -->

	
	</tr>
	<c:forEach var="ChatVO" items="${list2}">	
		<tr align='center' valign='middle'>
		    <td>${SellerOK.m_id}</td>
			<td>${ChatVO.m_id}</td>
			<td>${ChatVO.m_account}</td>
<%-- 			<td>${ChatVO.chat_content}</td> --%>
			<td>${ChatVO.chat_date}</td>
<%-- 			<td>${ReportVO.rep_title}</td> --%>
<%-- 			<td>${ReportVO.rep_content}</td> --%>
<%-- 			<td>${ReportVO.rep_date}</td> --%>
<%-- 			<td>${ReportVO.rep_procss}</td> --%>
<%-- 			<td>${ReportVO.rep_resultTitle}</td> --%>
<%-- 			<td>${ReportVO.rep_result}</td> --%>
<%-- 			<td>${ReportVO.rep_procssDate}</td> --%>

			<td><form method="get" action="<c:url value="/ChatController"/>">
			    <input type="submit" value="訊息內容">
<%-- 			     <input type="hidden" name="id" value="${MemVO.m_id}"> --%>
			    <input type="hidden" name="m_id" value="${ChatVO.m_id}">
			    <input type="hidden" name="s_id" value="${ChatVO.s_id}">				
			    <input type="hidden" name="chat_content" value="${ChatVO.chat_content}">			
			    <input type="hidden" name="chat_date" value="${ChatVO.chat_date}">
<%-- 			    <input type="hidden" name="m_account" value="${SellerOK.m_account}">			    			 --%>
<%-- 			    <input type="hidden" name="reason" value="${ReportVO.rep_content}">	 --%>
<%-- 			    <input type="hidden" name="reason" value="${ReportVO.rep_title}">					 --%>
			    <input type="hidden" name="action" value="show_both_message_buyer">			
			</form></td>
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
	

	
<a href="index.jsp">回首頁</a>

</body>
</html>