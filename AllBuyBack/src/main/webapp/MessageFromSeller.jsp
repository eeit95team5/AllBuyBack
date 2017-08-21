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

<script type="text/javascript">
$(function() {
	
	 $('#submit2').click(function(){
			var m_id = $('#m_id').val();
			var s_id = $('#s_id').val();
			
//	 		console.log(i_id);
				window.open('ChatController?action=show_both_message_seller&m_id='+m_id+'&s_id='+s_id,'購買AllBuyBack廣告',
						'height=650,width=650,scrollbars=0,resizable=0,location=0');
		});
	 
	 $("#chatform").get("<c:url value="/ChatController"/>",{},function(list){
		 window.open(list)
	 })
	 
});


</script>
</head>
<body style="background:rgb(204, 255, 255)">

<table border='1' bordercolor='#CCCCFF' width='800' class="table">
	<tr>
	    <th>會員編號</th>
	    <th>賣場編號</th>		
<!-- 		<th>發文帳號</th> -->
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
		    <td>${ChatVO.m_id}</td>
		    <td>${ChatVO.s_id}</td>		
<%-- 			<td>${ChatVO.m_account}</td> --%>
<%-- 			<td>${ChatVO.chat_content}</td> --%>
			<td>${ChatVO.chat_date}</td>
<%-- 			<td>${ReportVO.rep_title}</td> --%>
<%-- 			<td>${ReportVO.rep_content}</td> --%>
<%-- 			<td>${ReportVO.rep_date}</td> --%>
<%-- 			<td>${ReportVO.rep_procss}</td> --%>
<%-- 			<td>${ReportVO.rep_resultTitle}</td> --%>
<%-- 			<td>${ReportVO.rep_result}</td> --%>
<%-- 			<td>${ReportVO.rep_procssDate}</td> --%>

			<td><form id="chatform" method="get" action="<c:url value="/ChatController"/>">
<!-- 			    <input type="submit"  value="訊息內容"> -->
			    <input type="button" id="submit2" value="訊息內容">
<%-- 			     <input type="hidden" name="id" value="${MemVO.m_id}"> --%>
			    <input type="hidden" id="m_id" name="m_id" value="${ChatVO.m_id}">
			    <input type="hidden" id="s_id" name="s_id" value="${ChatVO.s_id}">				
			    <input type="hidden" name="chat_content" value="${ChatVO.chat_content}">			
			    <input type="hidden" name="chat_date" value="${ChatVO.chat_date}">
			    <input type="hidden" name="m_id" value="${LoginOK.m_id}">			    			
<%-- 			    <input type="hidden" name="reason" value="${ReportVO.rep_content}">	 --%>
<%-- 			    <input type="hidden" name="reason" value="${ReportVO.rep_title}">					 --%>
			    <input type="hidden" name="action" value="show_both_message_seller">			
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
	
<a href="HomeIndex.jsp">回首頁</a>
	
<!-- 	<table> -->
<!-- 	<tr> -->
<!-- 	<td> -->
<!-- 	<a href="Admin.jsp">回管理頁面</a> -->
<!-- 	</td> -->
<!-- 	</tr> -->
<!-- 	</table> -->

</body>
</html>