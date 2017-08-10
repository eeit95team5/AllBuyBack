<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>倒數計時</title>



<link rel="stylesheet" href="<c:url value='/dialogJar/jquery-ui.css'/>">
<script src="<c:url value='/js/jquery-1.12.4.js'/>"></script>
<script src="<c:url value='/dialogJar/jquery-ui.js'/>"></script>
<script>
	$(function() {
		
		// setInterval 方法，需要给传当前的计时器变量，执行一次便可以自动重复执行，除非手动停止。
// 		var timer = setInterval(function() {
// 			_testBysetInterval(timer)
// 		}, 1000);
		
		
		//setTimeout 方法，只执行一次，需要反复调用。
		setTimeout(_testBysetTimeout, 1000);

	})

	function _testBysetInterval(timer) {
		var $timeSpan = $("#timeSpan1");
		time = parseInt($timeSpan.text());
		time--;
		if (time <= -1) {
			$timeSpan.css("color", "gray")
			clearInterval(timer);//需要清除计时器
		} else {
			$timeSpan.text(time);
		}
	}

	
	function _testBysetTimeout() {
		var $timeSpan = $("#timeSpan2");
		var time = $timeSpan.text();
		time = parseInt(time);
		time--;
		//如果到0的话 就停止计时，并且改变颜色
		if (time <= -1) {
			$timeSpan.css("color", "gray");
		} else {
			$timeSpan.text(time);
			setTimeout(_testBysetTimeout, 1000) //需要重复调用
		}
	}
</script>

</head>
<body>

<!-- 	倒计时：<span id="timeSpan1" style="color: red; font-size: 20px">10</span>秒 -->
	倒數計時：<span id="timeSpan2" style="color:red;font-size:20px">10</span>秒



</body>
</html>