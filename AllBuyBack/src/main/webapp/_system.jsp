<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>後台系統</title>
<link rel="stylesheet"
	href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet"
	href="webjars/sweetalert/1.1.3/dist/sweetalert.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script>
<style>
#AllFunction {
	list-style-type: none;
	font-size: 30px;
}

#AllFunction li {
	line-height: 70px;
	width: 300px;
	/*border:red 1px solid;*/
	margin-left: 0px;
	padding-left: 35px;
}

#AllFunction li a {
	text-decoration: none;
	color: white;
	width: 300px;
}

#AllFunction li a:hover {
	font-size: 32px;
	color: lightgray;
}

.icon-success {
	color: #FFB90F; /* rgb(185,152,103);*/
	float: right;
	font-size: 35px;
}

#login {
	position: absolute;
	right: -30px;
}

#bell {
	position: absolute;
	right: 40px;
}

#rightButton {
	position: absolute;
	top: 20px;
	left: 1400px;
}
</style>
<script type="text/javascript">
	$(function() {

		$('.g1').click(function() {

			$.get("<c:url value='/MemController'/>", {
				"action" : "MemberListAll"
			}, function(data) {
				$('#show').html(data)

			});

		});

		$('.g2').click(function() {

			$.get("<c:url value='/ItemController'/>", {
				"action" : "ItemListAll"
			}, function(data) {
				$('#show').html(data)

			});

		});

		$('.g3').click(function() {

			$.get("<c:url value='/ItemController'/>", {
				"action" : "AccusedItemListAll"
			}, function(data) {
				$('#show').html(data)

			});

		});

		$('.g4').click(function() {

			$.get("<c:url value='/MemController'/>", {
				"action" : "BlackList"
			}, function(data) {
				$('#show').html(data)

			});

		});

		$('.g5').click(function() {

			$.get("<c:url value='/MemController'/>", {
				"action" : "MallList"
			}, function(data) {
				$('#show').html(data)

			});

		});

		$('.g6').click(function() {

			$.get("<c:url value='/ShopController'/>", {
				"action" : "MallApply"
			}, function(data) {
				$('#show').html(data)

			});

		});

		$('.g7').click(function() {

			$.get("<c:url value='/RepController'/>", {
				"action" : "ItemAccuse"
			}, function(data) {
				$('#show').html(data)

			});

		});

		$('.g8').click(function() {

			$.get("<c:url value='/Ad.go'/>", {
				"action" : "updateAd"
			}, function(data) {
				$('#show').html(data)

			});

		});

	});
</script>

</head>
<body>
	<nav class="navbar navbar-inverse  navbar-fixed-top "
		style="border-bottom:1px rgb(41,64,87) solid;">
	<div class="container-fluid"
		style="background-color: rgb(41, 64, 87); height: 100px; position: relative;">
		<div class="container" style="padding-top: 30px; padding-bottom: 8px">
			<div class="row">
				<div class="col-sm-12">

					<div class="navbar-header"
						style="font-size: 20px; margin-right: 120px;">
						<a class="navbar-brand"
							style="color: white; font-family: Arial; font-size: 1.8em">ALLBUYBACK
							&nbsp &nbsp 後台管理系統</a>
					</div>

					<div id="rightButton">
						<span id="login" class="glyphicon glyphicon-user icon-success"></span>
						<a href="LogoutServlet"><span id="bell"
							class="glyphicon glyphicon-bell icon-success"></span></a>
					</div>

				</div>
			</div>
		</div>

	</div>
	</nav>



	<div class="container-fluid"
		style="background-color: #C1CDCD; height: 950px;">
		<div class="row">
			<div class="col-sm-4">
				<div
					style="position: absolute; top: 100px; left: 0px; background-color: gray; height: 850px; width: 300px;">
					<div style="position: absolute; top: 40px; left: -40px;">
						<ul id="AllFunction">
							<li class="g1"><a>會員資料</a></li>
							<li class="g2"><a>商品資料</a></li>
							<li class="g3"><a>下架商品資料</a></li>
							<li class="g4"><a>黑名單</a></li>
							<li class="g5"><a>賣場名單</a></li>
							<li class="g6"><a>賣場申請審核</a></li>
							<li class="g7"><a>檢舉商品信件</a></li>
							<li class="g8"><a>廣告管理</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!------------------------------你的部分------------------------------>
			<div id="show"
				style="position: absolute; top: 120px; left: 330px; background-color: lightgray; height: 800px; width: 1550px; overflow: auto">

				<c:if test="${!empty Admin }">
					<h1>修改成功</h1>
				</c:if>

			</div>
			<!------------------------------你的部分結束------------------------------>
		</div>
		<!--row-->
	</div>
	<!--container-fluid-->

	<!----------footer開始-------------->

	<div class="container-fluid"
		style="background-color: rgb(41, 64, 87); height: 45px; color: white; text-align: center; padding-top: 15px;">
		Copyright ©2017 - ALLBUYBACK 股份有限公司</div>
</body>
</html>