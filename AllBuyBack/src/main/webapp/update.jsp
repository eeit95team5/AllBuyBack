<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>查詢與修改</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	

<script>
	var loadFile = function(event) {
		var output = document.getElementById('output');
		output.src = URL.createObjectURL(event.target.files[0]);
	};
</script>
<!-- 
<c:if test="${not empty memberUpdateSuccess }">
	<script>
		alert("會員資料修改成功");
	</script>
</c:if>
<c:if test="${empty memberUpdateSuccess }">
	<script>
		alert("修改失敗，請依照正確格式輸入");
	</script>
</c:if>
<c:if test="${not empty picUpdateSuccess }">
	<script>
		alert("大頭照修改成功");
	</script>
</c:if>
<c:if test="${empty picUpdateSuccess }">
	<script>
		alert("請重新上傳大頭照");
	</script>
</c:if> -->
  <style>
  .container {
      padding: 80px 120px;
  }
  .person {
      border: 10px solid transparent;
      margin-bottom: 25px;
      width: 80%;
      height: 80%;
      opacity: 0.7;
  }
  .person:hover {
      border-color: #f1f1f1;
  }
  .nav-tabs li a {
    color: #777;
}
.navbar {
      font-family: Montserrat, sans-serif;
      margin-bottom: 0;
      background-color: #2d2d30;
      border: 0;
      font-size: 11px !important;
      letter-spacing: 4px;
      opacity: 0.9;
  }
  .navbar li a, .navbar .navbar-brand { 
      color: #d5d5d5 !important;
  }
  .navbar-nav li a:hover {
      color: #fff !important;
  }
  .navbar-nav li.active a {
      color: #fff !important;
      background-color: #29292c !important;
  }
  .navbar-default .navbar-toggle {
      border-color: transparent;
  }
  .w3-myfont {
  font-family: "Comic Sans MS", cursive, sans-serif;
}
  </style>
</head>

<body>

<div id="contact" class="container">
<div class="w3-container w3-center w3-animate-zoom">
 
	<h3 class="w3-myfont">${LoginOK.m_account }!Welcome to AllBuyBack
  			<p>We love shopping!</p>
  	</h3>
  	</div>
	<ul class="nav nav-tabs">
  		<li class="active"><a data-toggle="tab" href="#home">查詢會員資料</a></li>
  		<li><a data-toggle="tab" href="#menu1">修改會員資料</a></li>
  		<li><a data-toggle="tab" href="#menu2">我的收藏</a></li>
	</ul>

	<div class="tab-content">
  		<div id="home" class="tab-pane fade in active">
    		<form action="<c:url value="/UpdateDataServlet" />" method="post">
				<input type="hidden" name="status" value="query"> 
				<input type="hidden" name="account" value="${LoginOK.m_account }"> 
				<input type="submit" value="送出" onclick="firstLoad">	
				
				<div class="w3-panel w3-card-2 w3-light-grey">
  					<h3>Example</h3>
  					<div class="w3-container w3-white">
    				<p>
    				<ul class="w3-ul w3-card-4" style="width:50%">
      					<li>id&nbsp;&nbsp;&nbsp;&nbsp;:${temp.m_id }</li>
      					<li>Account&nbsp;&nbsp;&nbsp;&nbsp;:${temp.m_account }</li>
      					<li>password&nbsp;&nbsp;&nbsp;&nbsp;:${temp.m_password }</li>
    				</ul>
    				</p>
  					</div>		
			</form>
  		</div>
  	</div>
<!-- 小心	<div class="col-sm-4"> -->
  		<div id="menu1" class="tab-pane fade">
  			<div class="col-sm-4"> 
  				<div class="w3-display-container w3-hover-opacity">
       				<a href="#demo2" data-toggle="collapse">
       					<img src="bandmember.jpg"  class="img-circle person" alt="Ramdom " width="55" height="55"> 
       				</a>
       		<div class="w3-display-middle w3-display-hover">
       		<button class="w3-button w3-black">點我修改資料</button>
  </div>
</div>
     		<div id="demo2" class="collapse">
        		<form action="<c:url value="/UpdateDataServlet" />" method="post">
					<input type="hidden" name="status" value="update"> 
					<input type="hidden" name="account" value="${LoginOK.m_account }">
					<input type="hidden" name="id" value="${LoginOK.m_id }"> 
					<label>密碼:</label>
					<input class="w3-input w3-animate-input" type="text" style="width:30%" id="password" type="text" name="password" value="${temp.m_password }"><span>${wrong.password }</span>
			    	<label>電話:</label> 
			    	<input  class="w3-input w3-animate-input" type="text" style="width:30%" id="phone" type="text" name="phone" value="${temp.m_phone }"><span>${wrong.phone}</span>
			    	<label>住址:</label> 
			    	<input class="w3-input w3-animate-input" type="text" style="width:30%" id="address" type="text" name="address" value="${temp.m_address }"><span>${wrong.address }</span>
			    	<label>EMAIL:</label> 
			    	<input class="w3-input w3-animate-input" type="text" style="width:30%" id="email" type="text" name="email" value="${temp.m_email }"><span>${wrong.email }</span>
			    	<label>紅利:</label> ${temp.m_point } 
			     	<input type="submit" value="送出"> <br> <br> <br>
				</form>
      		</div>
      		</div>
  		</div>
  	    <div id="menu2" class="tab-pane fade">
    		<h2>Peter Griffin, Bass player</h2>
    		<p>I mean, sometimes I enjoy the show, but other times I enjoy other things.</p>
  		</div>
   	</div>

</div>



<!-- <div class="container text-center">
   <h3>${LoginOK.m_name }!Welcome to AllBuyBack</h3>
  <p><em>We love shopping!</em></p>
  

  <div class="row">
    <div class="col-sm-4">
     <p class="text-center"><strong>Name</strong></p><br>
      <a href="#demo" data-toggle="collapse">
        <img src="bandmember.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo" class="collapse">
        <p>Guitarist and Lead Vocalist</p>
        <p>Loves long walks on the beach</p>
        <p>Member since 1988</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>查詢會員資料</strong></p><br>
      	<form action="<c:url value="/UpdateDataServlet" />" method="post">
			<input type="hidden" name="status" value="query"> 
			<input type="hidden" name="account" value="${LoginOK.m_account }"> 
			<input type="submit" value="送出" onclick="firstLoad">	
		</form>
	<br>
	<br>
      <a href="#demo2" data-toggle="collapse">
       <img src="bandmember.jpg" type="submmit" title="點我修改資料"  class="img-circle person" alt="Random Name" width="255" height="255"> 
      </a>
      
      <div id="demo2" class="collapse">
        <form action="<c:url value="/UpdateDataServlet" />" method="post">

		
			<input type="hidden" name="status" value="update"> <input
				type="hidden" name="account" value="${LoginOK.m_account }">
			<input type="hidden" name="id" value="${LoginOK.m_id }"> <label>密碼:</label>
			<input id="password" type="text" name="password"
				value="${temp.m_password }"><span>${wrong.password }</span>
			<br> <label>電話:</label> <input id="phone" type="text"
				name="phone" value="${temp.m_phone }"><span>${wrong.phone}</span>
			<br> <label>住址:</label> <input id="address" type="text"
				name="address" value="${temp.m_address }"><span>${wrong.address }</span>
			<br> <label>EMAIL:</label> <input id="email" type="text"
				name="email" value="${temp.m_email }"><span>${wrong.email }</span>
			<br> <label>紅利:</label> ${temp.m_point } <br> <input
				type="submit" value="送出"> <br> <br> <br>
		
		</form>
      </div>
    </div>
     <div class="col-sm-4">
      <p class="text-center"><strong>Name</strong></p><br>
      <a href="#demo3" data-toggle="collapse">
        <img src="bandmember.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo3" class="collapse">
        <p>Bass player</p>
        <p>Loves math</p>
        <p>Member since 2005</p>
      </div>
    </div>  
  </div>
</div>-->
	
<!--  	<h2>查詢會員資料</h2>
	<form action="<c:url value="/UpdateDataServlet" />" method="post">
		<input type="hidden" name="status" value="query"> <input
			type="hidden" name="account" value="${LoginOK.m_account }"> <input
			type="submit" value="送出" onclick="firstLoad">
	</form>
  	<h2>修改會員資料</h2>
	<form action="<c:url value="/UpdateDataServlet" />" method="post">

		<div>
			<input type="hidden" name="status" value="update"> <input
				type="hidden" name="account" value="${LoginOK.m_account }">
			<input type="hidden" name="id" value="${LoginOK.m_id }"> <label>密碼:</label>
			<input id="password" type="text" name="password"
				value="${temp.m_password }"><span>${wrong.password }</span>
			<br> <label>電話:</label> <input id="phone" type="text"
				name="phone" value="${temp.m_phone }"><span>${wrong.phone}</span>
			<br> <label>住址:</label> <input id="address" type="text"
				name="address" value="${temp.m_address }"><span>${wrong.address }</span>
			<br> <label>EMAIL:</label> <input id="email" type="text"
				name="email" value="${temp.m_email }"><span>${wrong.email }</span>
			<br> <label>紅利:</label> ${temp.m_point } <br> <input
				type="submit" value="送出"> <br> <br> <br>
		</div>
	</form>-->



<!-- 修改大頭照 -->
<!--<div>
	<form action="<c:url value="/UpdatePhotoServlet" />" enctype="multipart/form-data" method="post">
		<input type="hidden" name="status" value="updatePic"> <input
			type="hidden" name="account" value="${LoginOK.m_account }"> <input
			type="hidden" name="id" value="${LoginOK.m_id }"> <input
			type="hidden" name="password" value="${temp.m_password }"> <input
			type="hidden" name="phone" value="${temp.m_phone }"> <input
			type="hidden" name="address" value="${temp.m_address }"> <input
			type="hidden" name="email" value="${temp.m_email }">
			<input type="hidden" name="point" value="${temp.m_point }"> 
			<input
			type="file" name="photo" size="40" accept="image/*"
			onchange="loadFile(event)" /> <input type="submit" value="上傳" />
			</form>
	<div style="height: 150px; width: 150px; border: 1px solid;">
		<img id="output" src="<c:url value='/UpdateDataServlet?status=selectPic&id=${LoginOK.m_id}' />" style="width: 150px; height: 150px" />
	</div>
</div>	
 -->
</body>
	<!--<c:set var="serverImg" value="${temp.photoString }" /> -->
	<c:if test="${ not empty requestScope.temp }" > 
    	<script>
    		var img = document.getElementById("output");
    		img.src = "<c:url value='/UpdateDataServlet?status=selectPic&id=${temp.m_id}' />"
    		console.log(img.src);
    		
    		//var img = "<c:out value='${serverImg}' />";
    		//console.log(img);
    		//document.getElementById("output").src = "data:image/jpeg;base64," + img; 
    	</script>         
    </c:if>
		
</html>