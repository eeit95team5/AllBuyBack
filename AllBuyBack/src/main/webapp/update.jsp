<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查詢與修改</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 共同頁首 -->
<link rel="stylesheet" href="styles/main.css" />
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
<link rel="stylesheet" href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="webjars/sweetalert/1.1.3/dist/sweetalert.css">
<link rel="stylesheet" href="styles/ad.css"/>
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script>
<!-- 我的頁面 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Tangerine">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">


<script>
	var loadFile = function(event) {
		var output = document.getElementById('output');
		output.src = URL.createObjectURL(event.target.files[0]);
	};
</script>

<style>
     /*設定熱門代購搜尋Bar，只有"首頁"和"導覽列進入找國家之後"用得到*/
    .hotSearch {
        font-family:微軟正黑體;
        line-height:60px;
        font-size:20px;
        font-weight:600;
        color:white;
        margin-left:10px;
    }
    .hotSearch a {
        color:white; 
       font-size:18px;
       font-weight:500;
    }
    .hotSearch a:link{
      text-decoration:none;
    }
    .hotSearch a:hover{
      color:lightgray;
    }
/*以下三個class貼在main裡不能跑會衝突*/
.ThisWeek {
	color: white;
	font-size: 16px;
	/*line-height:45px;*/
	margin-right: 10px;
	float: left;
	margin-top: 10px;
}

.ThisWeek:hover {
	color: lightgray;
	text-decoration: none;
}

.icon-success { /*改變bootstrap icon的顏色*/
	color: #FFB90F;
	float: left;
}
 /*設定登入後的大頭貼*/

.myPicture {
    width:45px;height:45px; /*正圓形，所以寬與高都設一樣*/
    border-radius:99em;
    margin-left:1020px;
    border:2px lightgray solid;
    text-align:center;
    margin-top:5px;
  
}
.myPicture img{
    width:40px;height:40px; /*照片比div外框小一點*/
    border-radius:99em;
}

.threeDot{
    width:38px;height:38px; /*照片比div外框小一點*/
    border-radius:99em;
    background-color: #B3B3B3;
    text-align:center;
    margin-left:1090px;
    margin-top:-40px;
    padding:7px;
    padding-left:9px;
    }
.threeDot span { /*三個垂直白點*/
    color:white;
    font-size:20px;
    }
/*--------------------------------------*/
.dropdown-content {
    display:none;
    position:absolute;
    right: 18px;
    background-color:lightgray;/*#B3B3B3; /*#C1CDCD;*/
    width: 180px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    margin-top:8px;
    line-height:15px;
    font-family:微軟正黑體;
    font-size:16px;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}


/*我的頁面*/
  .w3-tangerine {
    font-family: "Tangerine", serif;
}
 
  .w3-container{
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
    font-family:微軟正黑體;
    font-size: 20px;
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
      color: #294057 !important;
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
label,input{
	font-family:微軟正黑體;
    font-size: 20px;
}
  .btn {
      padding: 10px 20px;
      margin:10px;
      background-color: #333;
      color: #f1f1f1;
      border-radius: 8px;
      transition: .2s;
  }
  .btn:hover, .btn:focus {
      border: 1px solid #333;
      background-color: #fff;
      color: #000;
  }
  h1{color:#fff;font-weight: 400;}
  h2{text-align:center; }
  /*深藍*/
 .w3-theme  {color:#fff !important; background-color:#294057 !important}
 .w3-theme-l3 {color:#000 !important; background-color:#97b3ce !important}
 .w3-theme-l5 {color:#000 !important; background-color:#eff4f8 !important}
 
.color {
	background: linear-gradient(to bottom, #eff4f8 0%, #294057 100%);
	}
	
/* Add a dark gray background color to the modal header and center text */
.modal-header, h4, .close {
    background-color: #ffe6e6;
    color: #ff0000 !important;
    text-align: center;
    font-size: 50px;
}

.modal-header, .modal-body {
    padding: 30px 40px;
}

.btn:hover, .btn:focus{
	border:1px solid #333;
	background-color: #fff;
	color:#000;
}
	
</style>
  
 <script type="text/javascript">
$(function(){	
	$('#menu3').click(function(){		
		$.get("<c:url value='/MemController'/>",{"action":"MemberListAll"},
				function(data){
			$('#show').html(data)		
		});	
	});	
});
</script>
<c:if test="${! empty LoginOK}">
<script type="text/javascript">
    var i = 0;
    window.onload = function () {
        document.getElementById("threeDot").onclick = clickThreeDot;
    }
    
    function clickThreeDot() {
        if (i == 0) {
            document.getElementById("dropdown").style.display = "block";
            i++;
        }else if (i == 1) {
            document.getElementById("dropdown").style.display = "none";
            i = 0;
        }
    }
</script>
</c:if>
<!-- 88888 -->
<nav class="navbar navbar-inverse  navbar-fixed-top " style="border-bottom:1px #F5F5F5 solid;"  >
  <div  class="container-fluid" style="background-color:#F5F5F5;"  >

      <div class="container" style="padding-top:10px;padding-bottom:8px">
          <div class="row">
              <div class="col-sm-12">

    <div class="navbar-header" style="font-size:20px;margin-right:120px;">
      <a class="navbar-brand" 
          style="color:rgb(41,64,87);font-family:Stencil;font-size:1.2em" 
          href="HomeIndex.jsp">ALL BUY BACK</a>
    </div>

<ul class="drop-down-menu  nav navbar-nav" style="text-align:left">
        <li><a href="HomeIndex.jsp">首頁</a></li>

        <li><a href="#">找商品<span class="glyphicon glyphicon-menu-down"></span></a>
							<ul>
								<li><a href="AllClassItemSearch">依類別瀏覽</a>
									<ul>
										<li><a href="BClassItemSearch?BClass=1000001">流行服飾</a>
											<ul>
												<li><a href="MClassItemSearch?BClass=1000001&MClass=1000001">日系</a>
													<ul>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000001&SClass=1000001">無印良品</a></li>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000001&SClass=1000002">UNIQLO</a></li>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000001&SClass=1000003">GLOBAL WORK</a></li>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000001&SClass=1000004">23區</a></li>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000001&SClass=1000005">其他</a></li>
													</ul></li>
												<li><a href="MClassItemSearch?BClass=1000001&MClass=1000002">韓系</a>
													<ul>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000002&SClass=1000006">87MM</a></li>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000002&SClass=1000007">8ight Seconds</a></li>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000002&SClass=1000008">Ader Error</a></li>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000002&SClass=1000009">GOGOSING</a></li>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000002&SClass=1000010">其他</a></li>
													</ul></li>
												<li><a href="MClassItemSearch?BClass=1000001&MClass=1000003">美國</a>
													<ul>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000003&SClass=1000011">CK</a></li>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000003&SClass=1000012">GAP</a></li>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000003&SClass=1000013">Roots</a></li>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000003&SClass=1000014">Timberland</a></li>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000003&SClass=1000015">其他</a></li>
													</ul></li>
												<li><a href="MClassItemSearch?BClass=1000001&MClass=1000004">歐洲</a>
													<ul>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000004&SClass=1000016">AIGLE</a></li>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000004&SClass=1000017">Accessorize</a></li>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000004&SClass=1000018">Kenzo</a></li>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000004&SClass=1000019">Superdry</a></li>
														<li><a href="SClassItemSearch?BClass=1000001&MClass=1000004&SClass=1000020">其他</a></li>
													</ul></li>
											</ul></li>
										<li><a href="BClassItemSearch?BClass=1000002">異國美食</a>
											<ul>
												<li><a href="MClassItemSearch?BClass=1000002&MClass=1000005">零食</a>
													<ul>
														<li><a href="SClassItemSearch?BClass=1000002&MClass=1000005&SClass=1000021">巧克力</a></li>
														<li><a href="SClassItemSearch?BClass=1000002&MClass=1000005&SClass=1000022">餅乾</a></li>
														<li><a href="SClassItemSearch?BClass=1000002&MClass=1000005&SClass=1000023">糖果</a></li>
														<li><a href="SClassItemSearch?BClass=1000002&MClass=1000005&SClass=1000024">其他</a></li>
													</ul></li>
												<li><a href="MClassItemSearch?BClass=1000002&MClass=1000006">飲品</a>
													<ul>
														<li><a href="SClassItemSearch?BClass=1000002&MClass=1000006&SClass=1000025">咖啡</a></li>
														<li><a href="SClassItemSearch?BClass=1000002&MClass=1000006&SClass=1000026">茶</a></li>
														<li><a href="SClassItemSearch?BClass=1000002&MClass=1000006&SClass=1000027">其他</a></li>
													</ul></li>
											</ul></li>
										<!--以下分類尚未填入-->
										<li><a href="#">數位3C</a>
											<ul>
												<li><a href="#">手機</a>
													<ul>
														<li><a href="#">iPhone</a></li>
														<li><a href="#">Samsung</a></li>
														<li><a href="#">Sony</a></li>
														<li><a href="#">Casio/卡西歐</a></li>
														<li><a href="#">其他</a></li>
													</ul></li>
												<li><a href="#">相機</a>
													<ul>
														<li><a href="#">周邊配件</a></li>
														<li><a href="#">手機殼</a></li>
														<li><a href="#">其他</a></li>
													</ul></li>
												<li><a href="#">電腦</a>
													<ul>
														<li><a href="#">ACER</a></li>
														<li><a href="#">APPLE</a></li>
														<li><a href="#">ASUS</a></li>
														<li><a href="#">DELL</a></li>
													</ul></li>
											</ul></li>
										<li><a href="#">美妝美體</a>
											<ul>
												<li><a href="#">化妝品</a></li>
												<li><a href="#">保養清潔用品</a></li>
											</ul></li>
										<li><a href="#">運動用品</a>
											<ul>
												<li><a href="#">adidas</a></li>
												<li><a href="#">NIKE</a></li>
												<li><a href="#">PUMA</a></li>
												<li><a href="#">其他</a></li>
											</ul></li>
										<li><a href="#">居家用品</a>
											<ul>
												<li><a href="#">廚房系列</a></li>
												<li><a href="#">寢室系列</a></li>
												<li><a href="#">其他</a></li>
											</ul></li>
										<li><a href="#">媽咪寶貝</a>
											<ul>
												<li><a href="#">服飾</a></li>
												<li><a href="#">食品</a></li>
												<li><a href="#">教具玩具</a></li>
											</ul></li>
										<li><a href="#">文具雜貨</a>
											<ul>
												<li><a href="#">Disney迪士尼系列</a></li>
												<li><a href="#">sanrio三麗鷗系列</a></li>
											</ul></li>
									</ul></li>

								<li><a href="#">依國家瀏覽</a>
									<ul>
										<li><a href="#">亞洲</a>
											<ul>
												<li><a href="CountryItemSearch?countryCl=1000001">日本</a></li>
												<li><a href="CountryItemSearch?countryCl=1000002">韓國</a></li>
												<li><a href="CountryItemSearch?countryCl=1000003">香港</a></li>
												<li><a href="CountryItemSearch?countryCl=1000004">新加坡</a></li>
												<li><a href="CountryItemSearch?countryCl=1000005">泰國</a></li>
											</ul></li>
										<li><a href="#">歐洲</a>
											<ul>
												<li><a href="CountryItemSearch?countryCl=1000006">英國</a></li>
												<li><a href="CountryItemSearch?countryCl=1000007">法國</a></li>
												<li><a href="CountryItemSearch?countryCl=1000008">德國</a></li>
												<li><a href="CountryItemSearch?countryCl=1000009">西班牙</a></li>
												<li><a href="CountryItemSearch?countryCl=1000010">義大利</a></li>
											</ul></li>
										<li><a href="#">美洲</a>
											<ul>
												<li><a href="CountryItemSearch?countryCl=1000011">美國</a></li>
												<li><a href="CountryItemSearch?countryCl=1000012">加拿大</a></li>
											</ul></li>
									</ul></li>

								<li><a href="#">依特色瀏覽</a>
									<ul>
										<li><a href="#">編輯精選</a></li>
										<li><a href="#">熱門瀏覽</a></li>
										<li><a href="#">最新上架</a></li>
										<li><a href="#">最後倒數</a></li>
									</ul></li>

							</ul></li>
        
        <li><a href="#">找賣家<span class="glyphicon glyphicon-menu-down"></span></a>
							<ul>
								<li><a href="#">亞洲</a>
									<ul>
										<li><a href="ShopSearch?countryCl=1000001">日本</a></li>
										<li><a href="ShopSearch?countryCl=1000002">韓國</a></li>
										<li><a href="ShopSearch?countryCl=1000003">香港</a></li>
										<li><a href="ShopSearch?countryCl=1000004">新加坡</a></li>
										<li><a href="ShopSearch?countryCl=1000005">泰國</a></li>
									</ul></li>
								<li><a href="#">歐洲</a>
									<ul>
										<li><a href="ShopSearch?countryCl=1000006">英國</a></li>
										<li><a href="ShopSearch?countryCl=1000007">法國</a></li>
										<li><a href="ShopSearch?countryCl=1000008">德國</a></li>
										<li><a href="ShopSearch?countryCl=1000009">西班牙</a></li>
										<li><a href="ShopSearch?countryCl=1000010">義大利</a></li>
									</ul></li>
								<li><a href="#">美洲</a>
									<ul>
										<li><a href="ShopSearch?countryCl=1000011">美國</a></li>
										<li><a href="ShopSearch?countryCl=1000012">加拿大</a></li>
									</ul></li>


								<li><a href="#">新進賣家</a></li>
							</ul></li>
        <li><a href="#">許願池<span class="glyphicon glyphicon-menu-down"></span></a>
			<ul>
			<li><a href="_MakeAWish.jsp" >許願</a></li>
			<li><a href="CheckYourList">本人願望</a></li>
			<li><a href="CheckPeopleList">大家願望</a></li>
			</ul></li>
        <li><a href="#" >最新代購消息</a>
        </li>
    
    </ul>

<!--  
     <form class="navbar-form navbar-left" action="KeyWordItemSearch" method="POST">
      <div class="input-group" style="width:160px;margin-left:30px;margin-right:30px">
        <input type="text" class="form-control" name="keyword" placeholder="您想代購什麼？"/>
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit" style="height:34px">
            <i class="glyphicon glyphicon-search" ></i>
          </button>
        </div>
      </div>
    </form>-->
<!------------------->
<c:if test="${! empty LoginOK}">
         <div class="myPicture">
             <img src="<c:url value='/UpdateDataServlet?status=selectPic&id=${LoginOK.m_id}' />" />
         </div>

      <div class="threeDot" id="threeDot">
          <span class="glyphicon glyphicon-option-vertical"></span>
      </div>

         <div class="dropdown-content" id="dropdown">
            <a href="update.jsp">修改基本資料</a>
            <a href="ShoppingCart.go?action=select">我的購物車</a>
           <c:if test="${LoginOK.m_authority==2}"><a href="shop.html?s_id=${LoginOK.m_id}">我的賣場</a></c:if>
           <c:if test="${LoginOK.m_authority==1}"><a href="#">申請賣場</a></c:if>
            <a href="checkGB.do">挑戰時尚金頭腦</a>
            <a href="#">聯絡管理員</a>
            <a href="LogoutServlet" >登出</a>
         </div>
</c:if>
<!--<c:if test="${empty LoginOK}">
         <button  class="btn btn-danger navbar-btn" 
         style="font-family:微軟正黑體;background-color:rgb(185,127,109);border:rgb(185,127,109);margin-right:10px" >註冊</button>
    <button  class="btn btn-danger navbar-btn" data-toggle="modal" data-target="#myModal"
         style="font-family:微軟正黑體;background-color:rgb(185,127,109);border:rgb(185,127,109)" >登入</button>
   
</c:if>-->
<!-------------------->
   
              </div><!--col-sm-12--> 
            </div><!--row--> 
          </div><!--container--> 
      </div><!--container-fluid-->
</nav>

<!--只留下本週頭條及新手上路-->
<div class="container-fluid" style="margin-top:60px; background-color:rgb(41,64,87);height:75px;margin-bottom:20px;">
    <div class="container">
       <div class="row">
           <div class="col-sm-12">
               <h3 style="color:white;margin-top:26px;float:left;font-family:微軟正黑體;margin-right:25px">本週頭條&nbsp&nbsp</h3> 
                <div style="margin-top:20px">
                  <h3 style="float:left;margin-top:6px;margin-right:10px;"><span class="glyphicon glyphicon-star-empty icon-success"></span></h3>             
                  <a href="" class="ThisWeek">巴黎世家搶手帆布包</a>
                  <h3 style="float:left;margin-top:6px;margin-right:10px;"><span class="glyphicon glyphicon-star-empty icon-success"></span></h3>             
                  <a href="" class="ThisWeek">FURLA緊急折扣全面7折</a>
                  <h3 style="float:left;margin-top:6px;margin-right:10px;"><span class="glyphicon glyphicon-star-empty icon-success"></span></h3>                
                  <a href="" class="ThisWeek">Rebecca Minkoff季末出清</a>
                  <h3 style="float:left;margin-top:6px;margin-right:10px;"><span class="glyphicon glyphicon-star-empty icon-success"></span></h3>             
                  <a href="" class="ThisWeek">NIKE ROSHE TWO特價</a> 				            		                                           
               </div> 
  
   <!--            <button  class="btn btn-danger navbar-btn" style="font-family:微軟正黑體;
                background-color:#EE3B3B;border:#EE3B3B;color:white;margin-left:70px;" >新手上路</button>-->
       </div>
    </div><!--row結束-->
</div><!--container結束-->  
</div><!--container-fluid結束-->

<!--只留下本週頭條及新手上路-->
</head>

<body>
<!-- 我的 -->
<div id="contact" class="container">
<div class="w3-container w3-center w3-animate-zoom w3-tangerine color ">
 
	<h1 class="w3-jumbo ">Hi!${LoginOK.m_account }!Welcome to AllBuyBack!
  			<p>We love shopping!</p>
  	</h1>
</div>
	<ul class="nav nav-tabs">
  		<li class="active"><a data-toggle="tab" href="#home">查詢會員資料</a></li>
  		<li><a data-toggle="tab" href="#menu1">修改會員資料</a></li>
  		<li><a data-toggle="tab" href="#menu2">我的收藏</a></li>		
  		<li><a data-toggle="tab" href="#menu3">變漂亮專區</a></li>		
  		<li><a data-toggle="tab" href="#menu4">管理員通知</a></li>
	</ul>

	<div class="tab-content ">
  		<div id="home" class="tab-pane fade in active ">
    		
				
		<!--  		<input type="submit" value="送出" onclick="firstLoad">	-->
			<div class="row">
              <div class="col-sm-8">
				
				<div class="w3-panel w3-card-4 w3-theme">
  					<h2 class="w3-tangerine w3-xxxlarge w3-theme ">Your Member List</h2>
  					<div class="w3-container w3-theme-l3">
    				<p>
    				<ul class="w3-ul w3-card-4 #eff4f8 w3-theme-l5" style="width:100%">
      					<li class="w3-tangerine w3-xxlarge" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Id&nbsp;&nbsp;&nbsp;&nbsp;:${LoginOK.m_id }</li>
      					<li class="w3-tangerine w3-xxlarge">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Account&nbsp;&nbsp;&nbsp;&nbsp;:${LoginOK.m_account }</li>
      					<li class="w3-tangerine w3-xxlarge">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name&nbsp;&nbsp;&nbsp;&nbsp;:<font size="4">${LoginOK.m_name }</font></li>
      					<li class="w3-tangerine w3-xxlarge">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone&nbsp;&nbsp;&nbsp;&nbsp;:${LoginOK.m_phone }</li>
      					<li class="w3-tangerine w3-xxlarge">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address&nbsp;&nbsp;&nbsp;&nbsp;:<font size="4">${LoginOK.m_address }</font></li>
      					<li class="w3-tangerine w3-xxlarge">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Identity&nbsp;&nbsp;&nbsp;&nbsp;:${LoginOK.m_identity }</li>
      					<li class="w3-tangerine w3-xxlarge">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email&nbsp;&nbsp;&nbsp;&nbsp;:${LoginOK.m_email }</li>
      					<li class="w3-tangerine w3-xxlarge"><font size="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;總評價&nbsp;&nbsp;&nbsp;&nbsp;</font>:${LoginOK.m_scoreCount }</li>
      					<li class="w3-tangerine w3-xxlarge"><font size="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;平均分&nbsp;&nbsp;&nbsp;&nbsp;</font>:${LoginOK.m_avgScore }</li>
      					<li class="w3-tangerine w3-xxlarge"><font size="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最後上線時間&nbsp;&nbsp;&nbsp;&nbsp;</font>:${LoginOK.m_lastUsed }</li>
      					<li class="w3-tangerine w3-xxlarge"><font size="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;紅利&nbsp;&nbsp;&nbsp;&nbsp;</font>:${LoginOK.m_point }</li>
      					<li class="w3-tangerine w3-xxlarge"><font size="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;今日金頭腦次數&nbsp;&nbsp;&nbsp;&nbsp;</font>:${LoginOK.m_times_gb }</li>
    				</ul>
    				</p>
  					</div>		
  					<p></p>
			
  		</div>
  	</div>
  	</div>
  	</div>
  	
<!-- 小心	<div class="col-sm-4"> -->
  		<div id="menu1" class="tab-pane fade">
  			<div class="col-sm-4"> 
  		
  				<div class="w3-display-container w3-hover-opacity">
       				<a href="#demo2" data-toggle="collapse" onclick="document.getElementById('demo2').style.display='block'">
       					<img src="images/onepage_restaurant.jpg" > 
       				</a>
       			</div>	
       			<div class="w3-display-middle w3-display-hover">
       			<button class="w3-button w3-black w3-tangerine w3-xlarge">Press me!</button>
  				</div>
			</div>
		</div>
     		<div id="demo2" class="w3-modal">
  				<div class="w3-modal-content w3-animate-zoom">
    				<div class="w3-container w3-black">
      				 <span onclick="document.getElementById('demo2').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
      				<h1>Contact</h1>
    				</div>
    				<div class="w3-container">
        			<form  action="<c:url value="UpdateDataServlet" />" method="post" >
					<input type="hidden" name="status" value="update"> 
					<input type="hidden" name="account" value="${LoginOK.m_account }">
					<input type="hidden" name="id" value="${LoginOK.m_id }"> 
					
					<label for="password" class="w3-tangerine w3-xxlarge  w3-padding-5" >Password:</label><span>${wrong.password }</span>
					<input class="w3-input w3-animate-input" type="text" style="width:60%" id="password" type="text" name="password" value="${temp.m_password }">
			    	<label for="phone" class="w3-tangerine w3-xxlarge  w3-padding-5">Phone:</label><span>${wrong.phone}</span> 
			    	<input  class="w3-input w3-animate-input" type="text" style="width:60%" id="phone" type="text" name="phone" value="${temp.m_phone }">
			    	<label for="address" class="w3-tangerine w3-xxlarge  w3-padding-5">Address:</label><span>${wrong.address }</span> 
			    	<input class="w3-input w3-animate-input" type="text" style="width:60%" id="address" type="text" name="address" value="${temp.m_address }">
			    	<label for="email" class="w3-tangerine w3-xxlarge  w3-padding-5">Email:</label><span>${wrong.email }</span> 
			    	<input class="w3-input w3-animate-input" type="text" style="width:60%" id="email" type="text" name="email" value="${temp.m_email }">
			     	<button class="btn w3-tangerine w3-xlarge" type="submit">Send</button>
					</form>
					
					</div>
      			</div>
      		</div>
  		
  	    <div id="menu2" class="tab-pane fade" >
  	    	<form action="<c:url value='/FavoriteServlet' />">
  	    	<input type="hidden" name="id" value="${LoginOK.m_id }">
  	    	<button class="btn w3-tangerine w3-xlarge" type="submit">Send</button>
  	    	</form>
  	    	<c:forEach items="${favorite.shop}" var="favShop"> 
	 			<hr> 
	 			shopName: <c:out value="${favShop.m_account}" /> 
	 			<br> 
	 			</c:forEach>
	 			<c:forEach items="${favorite.item}" var="favItem"> 
	 			<hr> 
	 			itemName: <c:out value="${favItem.i_name}" /> 
	 			<br> 
	 			</c:forEach>
  		</div>
  		<div id="menu3" class="tab-pane fade">
    		<form action="<c:url value="/UpdatePhotoServlet" />" enctype="multipart/form-data" method="post">
			<input type="hidden" name="status" value="updatePic"> 
			<input type="hidden" name="account" value="${LoginOK.m_account }"> 
			<input type="hidden" name="id" value="${LoginOK.m_id }"> 
			<input type="hidden" name="password" value="${temp.m_password }">
			<input type="hidden" name="phone" value="${temp.m_phone }"> 
			<input type="hidden" name="address" value="${temp.m_address }">
			<input type="hidden" name="email" value="${temp.m_email }">
			<input type="hidden" name="point" value="${temp.m_point }"> 
			<input type="file" name="photo" size="40" accept="image/*" onchange="loadFile(event)" /> 
				<div style="height: 150px; width: 150px; border: 1px solid;">
				<img id="output" src="<c:url value='/UpdateDataServlet?status=selectPic&id=${LoginOK.m_id}' />" style="width: 150px; height: 150px" />
				</div>
			<button class="btn w3-tangerine w3-xlarge" type="submit">Send</button>			
			</form>
  		</div>
  		
  		<div id="menu4" class="tab-pane fade">	
  		</div>
   	</div>

</div>


</body>
</html>