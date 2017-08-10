<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員專區(紅利點數)</title>
</head>
<body>

<h2>我的紅利</h2>


<%
 int bonus=(int)request.getAttribute("bonus");
// String myOldBonus=(String)request.getAttribute("myOldBonus");
// String theNewestBonus=(String)request.getAttribute("theNewestBonus");

 
 out.print("你現在有"+bonus+"點");
// out.print("你得到"+myOldBonus+"點");
//out.print("現在總共有"+theNewestBonus+"點");
%>


</body>
</html>