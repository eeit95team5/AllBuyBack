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
<style>
.container{
	margin-top: 100px;
}
</style>
</head>
<body style="background:rgb(204, 255, 255)">
<div class="container">
	<div class="row">
<div class="col-md-offset-2" style="width: 800px; height: 500px; overflow: auto ;margin-bottom: 100px;">
<!-- <table border='1' bordercolor='#CCCCFF' width='800'> -->
<table class="table">
<!-- 	<tr> -->
<!-- 	    <th>賣場編號</th> -->
<!-- 		<th>會員編號</th> -->
<!-- 		<th>帳號</th> -->
<!-- 		<th>回覆內容</th> -->
<!-- 		<th>回覆日期</th> -->
<!-- 		<th>申訴標題</th> -->
<!-- 		<th>申訴內容</th> -->
<!-- 		<th>申訴日期</th> -->
<!-- 		<th>回覆狀態</th> -->
<!-- 		<th>回覆標題</th> -->
<!-- 		<th>回覆結果</th> -->
<!-- 		<th>回覆日期</th> -->

	
<!-- 	</tr> -->
	<c:forEach var="ChatVO" items="${list}">	
		<tr align='center' valign='middle'>
<%-- 		    <td>${SellerOK.m_id}</td> --%>
<%-- 			<td>${ChatVO.m_id}</td> --%>
			<td>${ChatVO.m_account}</td>
			<td>${ChatVO.chat_content}</td>
			<td>${ChatVO.chat_date}</td>
<%-- 			<td>${ReportVO.rep_title}</td> --%>
<%-- 			<td>${ReportVO.rep_content}</td> --%>
<%-- 			<td>${ReportVO.rep_date}</td> --%>
<%-- 			<td>${ReportVO.rep_procss}</td> --%>
<%-- 			<td>${ReportVO.rep_resultTitle}</td> --%>
<%-- 			<td>${ReportVO.rep_result}</td> --%>
<%-- 			<td>${ReportVO.rep_procssDate}</td> --%>

<%-- 			<td><form method="post" action="<c:url value="/ChatController"/>"> --%>
<!-- 			    <input type="submit" value="回覆訊息"> -->
<%-- 			     <input type="hidden" name="id" value="${MemVO.m_id}"> --%>
<%-- 			    <input type="hidden" name="m_id" value="${ChatVO.m_id}"> --%>
<%-- 			    <input type="hidden" name="s_id" value="${ChatVO.s_id}">				 --%>
<%-- 			    <input type="hidden" name="chat_content" value="${ChatVO.chat_content}">			 --%>
<%-- 			    <input type="hidden" name="chat_date" value="${ChatVO.chat_date}"> --%>
<%-- 			    <input type="hidden" name="m_account" value="${SellerOK.m_account}">			    			 --%>
<%-- 			    <input type="hidden" name="reason" value="${ReportVO.rep_content}">	 --%>
<%-- 			    <input type="hidden" name="reason" value="${ReportVO.rep_title}">					 --%>
<!-- 			    <input type="hidden" name="action" value="seller_reply">			 -->
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
	</div>
	</div>
	<div class="row">
	<div class="col-md-offset-2">
<%-- 	<form method="post" action="<c:url value="/ChatController"/>"> --%>
<!-- 			    <input type="submit" value="回覆訊息"> -->
<%-- 			     <input type="hidden" name="id" value="${MemVO.m_id}"> --%>
<%-- 			    <input type="hidden" name="m_id" value="${ChatVO.m_id}"> --%>
<%-- 			    <input type="hidden" name="s_id" value="${ChatVO.s_id}">				 --%>
<%-- 			    <input type="hidden" name="chat_content" value="${ChatVO.chat_content}">			 --%>
<%-- 			    <input type="hidden" name="chat_date" value="${ChatVO.chat_date}"> --%>
<%-- 			    <input type="hidden" name="m_account" value="${SellerOK.m_account}">			    			 --%>
<%-- 			    <input type="hidden" name="reason" value="${ReportVO.rep_content}">	 --%>
<%-- 			    <input type="hidden" name="reason" value="${ReportVO.rep_title}">					 --%>
<!-- 			    <input type="hidden" name="action" value="seller_reply">			 -->
<!-- 			</form> -->

<%--   <form ENCTYPE="multipart/form-data" method="post" action=" <c:url value="/ChatController"/>"  id="/ItemController" > --%>
  <form method="get" action=" <c:url value="/ChatController"/>"  id="/ItemController" >
      <label class="fontSize" >買家編號：</label>
      <input type="text" name="m_id" value="${BuyerVO.m_id}" class="fieldWidth" style="width: 180px;">
      <font size="-1" color="#FF0000">${MsgMap.errorIDEmpty}${MsgMap.errorIDDup}</font>
      <br/>
      
      <label class="fontSize" >回覆：</label>
      <textarea rows="5" cols="50" name="reply" class="fieldWidth" style="width: 200px"></textarea> 
      <font color="red" size="-1">${MsgMap.errorPassword2Empty}</font>            
      <br/>
      
      <div id="btnArea">
         <input type="submit" name="submit" id="submit" value="送出"/>
         <input type="reset" name="cancel" id="cancel" value="重填">
         <input type="hidden" name="action" id="cancel" value="seller_send">
<%--          <input type="hidden" name="s_id" value="${SellerOK.m_id}"> --%>
<%--          <input type="hidden" name="account" value="${SellerOK.m_account}"> --%>
         <input type="hidden" name="s_id" value="${LoginOK.m_id}"> 
			<input type="hidden" name="account" value="${LoginOK.m_account}">
      </div>
     
</form>
<%-- <a href="ChatController?action=MessageFromBuyer&id=${SellerOK.m_id}">回上一頁</a> --%>
<a href="ChatController?action=MessageFromBuyer&id=${LoginOK.m_id}">回上一頁</a>
<a href="HomeIndex.jsp">回首頁</a>
		</div>
	</div>
</div>

</body>
</html>