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
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.css">
<link rel="stylesheet" href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="webjars/sweetalert/1.1.3/dist/sweetalert.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script>

<script type="text/javascript">

// $('.accuse').click(function(){
// 	var i_id = $('#i_id').val();
// 	var m_id = $('#m_id').val();
// 	var rep_id = $('#rep_id').val();
// 	var rep_date = $('#rep_date').val();
// 	var reason = $('#reason').val();
// 	var reply_title = $('#reply_title').val();
	
// 		window.open('RepController?rep_id='+rep_id+'&m_id='+m_id+
// 				'&i_id='+i_id+'&rep_date='+rep_date+'&reason='+reason+'&reply_title='
// 				+rep_title+'&action=accuse_content','購買AllBuyBack廣告',
// 		'height=350,width=650,scrollbars=1,resizable=0,location=0');
		
// });

// $('.reply').click(function(){
// 	var rep_resultTitle = $('#rep_resultTitle').val();
// 	var rep_procssDate = $('#rep_procssDate').val();
// 	var rep_result = $('#rep_result').val();
		
// 		window.open('RepController?rep_resultTitle='+rep_resultTitle+'&rep_procssDate='+rep_procssDate+
// 				'&rep_result='+rep_result+'&action=accuse_reply_content','購買AllBuyBack廣告',
// 		'height=350,width=650,scrollbars=1,resizable=0,location=0');
		
// });

// RepController?rep_resultTitle=${ReportVO.rep_resultTitle}&rep_procssDate=${ReportVO.rep_procssDate}&rep_result=${ReportVO.rep_result}&action=accuse_reply_content

</script>
</head>
<body>

<table width='800' class="table">
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
			<td><a href="#" onclick="window.open('RepController?rep_id=${ReportVO.rep_id}&m_id=${ReportVO.m_id}&i_id=${ReportVO.i_id}&rep_date=${ReportVO.rep_date}&reason=${ReportVO.rep_content}&reply_title=${ReportVO.rep_title}&action=accuse_content','處理檢舉','height=350,width=650,scrollbars=1,resizable=0,location=0')">${ReportVO.rep_title}</a></td> 
<%-- 			<td>${ReportVO.rep_content}</td> --%>
<%-- 			<td>${ReportVO.rep_date}</td> --%>
<%-- 			<td>${ReportVO.rep_procss}</td> --%>
			<td><a href="#" onclick="window.open('RepController?rep_resultTitle=${ReportVO.rep_resultTitle}&rep_procssDate=${ReportVO.rep_procssDate}&rep_result=${ReportVO.rep_result}&action=accuse_reply_content','處理檢舉','height=350,width=650,scrollbars=1,resizable=0,location=0')" >${ReportVO.rep_resultTitle}</a></td>
<%-- 			<td>${ReportVO.rep_result}</td> --%>
<%-- 			<td>${ReportVO.rep_procssDate}</td> --%>

			<td>
			    <input type="hidden" name="id" id="id" value="${MemVO.m_id}">
			    <input type="hidden" name="rep_id" id="rep_id" value="${ReportVO.rep_id}">			
			    <input type="hidden" name="m_id" id="m_id" value="${ReportVO.m_id}">			
			    <input type="hidden" name="i_id" id="i_id" value="${ReportVO.i_id}">			
			    <input type="hidden" name="reason" id="reason" value="${ReportVO.rep_content}">	
			    <input type="hidden" name="rep_title" id="rep_title" value="${ReportVO.rep_title}">	
			    <input type="hidden" name="rep_date" id="rep_date" value="${ReportVO.rep_date}">
			    <input type="hidden" name="rep_resultTitle" id="rep_resultTitle" value="${ReportVO.rep_resultTitle}">
			    <input type="hidden" name="rep_procssDate" id="rep_procssDate" value="${ReportVO.rep_procssDate}">
			    <input type="hidden" name="rep_result" id="rep_result" value="${ReportVO.rep_result}">				
			    		
			</td>
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
<!-- 	<a href="Admin.jsp">回管理頁面</a> -->
<!-- 	</td> -->
<!-- 	</tr> -->
<!-- 	</table> -->

</body>
</html>