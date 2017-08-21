<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>AllBuyBack代購網</title>

<link rel="stylesheet" href="styles/main.css" />
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
<link rel="stylesheet" href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="webjars/sweetalert/1.1.3/dist/sweetalert.css">
<link rel="stylesheet" href="styles/ad.css"/>
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script>

<c:if test="${! empty LoginOK}">
	<script src="js/ReceiveChat.js"></script>
</c:if>

<script type="text/javascript">
	$(function(){
		// 	<!-- 聊天室開始(發訊者) -->
		$('#liid').click(function(){
			window.open("BeginToTalk?s_id=1000002","","toolbar=no,location=no,directories=no,width=300,height=350");
		});
		// 	<!-- 聊天室結束(發訊者) -->
		
		$.get("ShowAdOnHomeIndex",{},function(data){
			var addiv = $('#AdId');
			addiv.empty();
			$.each(JSON.parse(data),function(Adkey, Advalue){
				console.log(Advalue.i_id);
				console.log(Advalue.i_name);
				var cell1 = $('<div></div>').addClass("col-sm-3");
				var cell2 = $('<div></div>').addClass("adOuter");
				cell1.append(cell2);
				var celllink = $('<a></a>').attr("href", "item.html?i_id=" + Advalue.i_id);
				var cell3 = $('<img>').addClass("imgsrc");
				cell3.attr("src", "ReadPictureForItem?i_id="+Advalue.i_id);
				cell3.css("height", "270");
				cell3.css("width", "255");
				celllink.append(cell3);
				var cell4 = $('<div></div>').text(Advalue.i_name);
				cell4.addClass("adContent");
				var cell5 = $('<span></span').addClass("glyphicon glyphicon-map-marker marker");
				var cell6 = $('<div></div>').addClass("countryFrom").text(Advalue.country_name);
				var cell7 = $('<div></div>').addClass("sellerWho").text("暢銷指數: " + Advalue.i_popular + " 訂閱數： " + Advalue.i_click);
				cell2.append([celllink, cell4, cell5, cell6, cell7]);
				addiv.append(cell1);
			});
		});
// 		<div class="col-sm-3">
// 	        <div class="adOuter" >
// 	           <img id="imgid" class="imgsrc" src="images/cho_05.jpg" >
// 	           <div  class="adContent">來自日本的草莓巧克力，可以吃到一整顆完整的草莓喔!超級幸福~</div>
// 	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
// 	           <div id="country" class="countryFrom">美國</div>
// 	           <div class="sellerWho" >LOVE ShaSha 樂芙夏夏</div>
// 	        </div>
//      </div>
	})
</script>

<style>

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

#dropdown a:hover{
  color:#8B7D6B;
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
</head>
<body>
<div id="asdf" style="display:none;"></div>
	<nav class="navbar navbar-inverse  navbar-fixed-top" style="border-bottom:1px #F5F5F5 solid;">
	<div class="container-fluid" style="background-color: #F5F5F5;">

		<div class="container" style="padding-top: 10px; padding-bottom: 8px">
			<div class="row">
				<div class="col-sm-12">

					<div class="navbar-header" style="font-size: 20px; margin-right: 120px;">
						<a class="navbar-brand"	style="color: rgb(41, 64, 87); font-family: Stencil; font-size: 1.2em" href="HomeIndex.jsp">ALL BUY BACK</a>
					</div>

					<ul class="drop-down-menu  nav navbar-nav" style="text-align: left">
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
						<li><a href="#">最新代購消息</a></li>

					</ul>


					<form class="navbar-form navbar-left" action="KeyWordItemSearch" method="POST">
						<div class="input-group" style="width: 160px; margin-left: 30px; margin-right: 30px">
							<input type="text" class="form-control" name="keyword" placeholder="您想代購什麼？" />
							<div class="input-group-btn"  >
								<button class="btn btn-default" type="submit" style="height:34px">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</form>

<!------------------->
<c:if test="${! empty LoginOK}">
         <div class="myPicture">
             <img src="<c:url value='/UpdateDataServlet?status=selectPic&id=${LoginOK.m_id}' />" />
         </div>

      <div class="threeDot" id="threeDot">
          <span class="glyphicon glyphicon-option-vertical"></span>
      </div>

         <div class="dropdown-content" id="dropdown">
            <a href="<c:url value='/UpdateDataServlet?status=query&account=${LoginOK.m_account} ' />">修改基本資料</a>
            <a href="ShoppingCart.go?action=select">我的購物車</a>
           <c:if test="${LoginOK.m_authority==2}"><a href="shop.html?s_id=${LoginOK.m_id}">我的賣場</a></c:if>
           <c:if test="${LoginOK.m_authority==1}"><a href="MallInsert.jsp">申請賣場</a></c:if>
            <a href="checkGB.do">ALLBUYBACK金頭腦</a>
            <a href="#">聯絡管理員</a>
            <a href="LogoutServlet" >登出</a>
         </div>
</c:if>
<c:if test="${empty LoginOK}">
         <button  class="btn btn-danger navbar-btn" onclick="javascript:location.href='register.jsp'"
         style="font-family:微軟正黑體;background-color:rgb(185,127,109);border:rgb(185,127,109);margin-right:10px" >註冊</button>
    <button  class="btn btn-danger navbar-btn" data-toggle="modal" data-target="#myModal"
         style="font-family:微軟正黑體;background-color:rgb(185,127,109);border:rgb(185,127,109)" >登入</button>
   
</c:if>
<!-------------------->

				</div>
				<!--col-sm-12-->
			</div>
			<!--row-->
		</div>
		<!--container-->
	</div>
	<!--container-fluid--> </nav>


	<!--廣告看板開始-->
	<div class="container-fluid" style="margin-top: 60px; background-color: rgb(41, 64, 87); height: 470px;">
		<div class="container" style="margin-bottom: 18px;">
			<div class="row">
				<div class="col-sm-12">
					<h3 style="color: white; margin-top: 26px; float: left; font-family: 微軟正黑體; margin-right: 25px">本週頭條&nbsp&nbsp</h3>
					<div style="margin-top: 20px">
						<h3 style="float: left; margin-top: 6px; margin-right: 10px;">
							<span class="glyphicon glyphicon-star-empty icon-success"></span>
						</h3>
						<a href="" class="ThisWeek">巴黎世家搶手帆布包</a>
						<h3 style="float: left; margin-top: 6px; margin-right: 10px;">
							<span class="glyphicon glyphicon-star-empty icon-success"></span>
						</h3>
						<a href="" class="ThisWeek">FURLA緊急折扣全面7折</a>
						<h3 style="float: left; margin-top: 6px; margin-right: 10px;">
							<span class="glyphicon glyphicon-star-empty icon-success"></span>
						</h3>
						<a href="" class="ThisWeek">Rebecca Minkoff季末出清</a>
						<h3 style="float: left; margin-top: 6px; margin-right: 10px;">
							<span class="glyphicon glyphicon-star-empty icon-success"></span>
						</h3>
						<a href="" class="ThisWeek">NIKE ROSHE TWO特價</a>
					</div>

					<button class="btn btn-danger navbar-btn" style="font-family: 微軟正黑體; background-color: #EE3B3B; border: #EE3B3B; color: white; margin-left: 70px;">新手上路</button>
				</div>
			</div>
			<!--row結束-->
		</div>
		<!--container結束-->



		<div class="container">
			<div class="row">
				<div class=" col-sm-12 ">

					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators --廣告底下的小白點-->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
							<li data-target="#myCarousel" data-slide-to="3"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner">

							<div class="item active">
								<img src="images/minions-compressor.jpg" alt="" style="width: 100%;">
								<div class="carousel-caption"></div>
							</div>

							<div class="item">
								<img src="images/nordstrom.png" alt="" style="width: 100%;">
								<div class="carousel-caption"></div>
							</div>

							<div class="item">
								<img src="images/unboxwall.jpg" alt="" style="width: 100%;">
								<div class="carousel-caption"></div>
							</div>

							<div class="item">
								<img src="images/summerfashion.jpg" alt="" style="width: 100%;">
								<div class="carousel-caption"></div>
							</div>

						</div>

						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel"	data-slide="prev"> 
							<span class="glyphicon glyphicon-chevron-left"></span>
							<span class="sr-only">Previous</span>
						</a> 
						<a class="right carousel-control" href="#myCarousel" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!--container-fluid結束-->
	<!--廣告看板 結束-->


	
	<br />
	<br />

	<!--兩邊空白    廣告內容------->
<div class="container">
 <div class="row">
	     <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent">國家圖片先跳過 樣式還要改</div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	     
	       <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	      
	     <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	      
	      <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	     
	     
	    
	 </div>
<br />

<div class="row">
	       <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent">國家圖片先跳過</div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	     
	       <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	      
	     <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	      
	      <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	     
	     
	     
	    
	 </div>
<br />

<div class="row">
    <div class="col-sm-offset-5 col-sm-2">
        <div style="border-bottom:6px solid rgb(255,112,102);margin-bottom:25px">
            <h1 style="text-align:center;font-weight:700">編輯精選</h1>
        </div>
    </div>
</div>

  <div id="AdId" class="row">
<!-- 	     <div class="col-sm-3"> -->
<!-- 	        <div class="adOuter" > -->
<!-- 	           <img id="imgid" class="imgsrc" src="images/cho_05.jpg" > -->
<!-- 	           <div  class="adContent">來自日本的草莓巧克力，可以吃到一整顆完整的草莓喔!超級幸福~</div> -->
<!-- 	           <span class="glyphicon glyphicon-map-marker marker" ></span>  -->
<!-- 	             <div id="country" class="countryFrom">美國</div> -->
<!-- 	             <div class="sellerWho" >LOVE ShaSha 樂芙夏夏</div> -->
<!-- 	        </div> -->
<!-- 	      </div> -->
  </div>
<br />
<br />

<div class="row">
    <div class="col-sm-offset-5 col-sm-2">
        <div style="border-bottom:6px solid rgb(255,112,102);margin-bottom:25px">
            <h1 style="text-align:center;font-weight:700">熱門瀏覽</h1>
        </div>
    </div>
</div>

    <div class="row">
	     <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="images/cho_05.jpg" >
	           <div  class="adContent">來自日本的草莓巧克力，可以吃到一整顆完整的草莓喔!超級幸福~</div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom">美國</div>
	             <div class="sellerWho" >LOVE ShaSha 樂芙夏夏</div>
	        </div>
	      </div>
	     
	       <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	      
	     <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	      
	      <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	     
	     
	    
	 </div>
<br />

    <div class="row">
	     <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="images/cho_05.jpg" >
	           <div  class="adContent">來自日本的草莓巧克力，可以吃到一整顆完整的草莓喔!超級幸福~</div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom">美國</div>
	             <div class="sellerWho" >LOVE ShaSha 樂芙夏夏</div>
	        </div>
	      </div>
	     
	       <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	      
	     <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	      
	      <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	     
	     
	    
	 </div>
<br />

<div class="row">
    <div class="col-sm-offset-5 col-sm-2">
        <div style="border-bottom:6px solid rgb(255,112,102);margin-bottom:25px">
            <h1 style="text-align:center;font-weight:700">最新上架</h1>
        </div>
    </div>
</div>

    <div class="row">
	     <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="images/cho_05.jpg" >
	           <div  class="adContent">來自日本的草莓巧克力，可以吃到一整顆完整的草莓喔!超級幸福~</div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom">美國</div>
	             <div class="sellerWho" >LOVE ShaSha 樂芙夏夏</div>
	        </div>
	      </div>
	     
	       <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	      
	     <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	      
	      <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	     
	     
	    
	 </div>
<br />

      <div class="row">
	     <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="images/cho_05.jpg" >
	           <div  class="adContent">來自日本的草莓巧克力，可以吃到一整顆完整的草莓喔!超級幸福~</div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom">美國</div>
	             <div class="sellerWho" >LOVE ShaSha 樂芙夏夏</div>
	        </div>
	      </div>
	     
	       <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	      
	     <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	      
	      <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	     
	     
	    
	 </div>
<br />


<div class="row">
    <div class="col-sm-offset-5 col-sm-2">
        <div style="border-bottom:6px solid rgb(255,112,102);margin-bottom:25px">
            <h1 style="text-align:center;font-weight:700">最後倒數</h1>
        </div>
    </div>
</div>

   <div class="row">
	     <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="images/cho_05.jpg" >
	           <div  class="adContent">來自日本的草莓巧克力，可以吃到一整顆完整的草莓喔!超級幸福~</div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom">美國</div>
	             <div class="sellerWho" >LOVE ShaSha 樂芙夏夏</div>
	        </div>
	      </div>
	     
	       <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	      
	     <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	      
	      <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	     
	     
	    
	 </div>
<br />

    <div class="row">
	     <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="images/cho_05.jpg" >
	           <div  class="adContent">來自日本的草莓巧克力，可以吃到一整顆完整的草莓喔!超級幸福~</div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom">美國</div>
	             <div class="sellerWho" >LOVE ShaSha 樂芙夏夏</div>
	        </div>
	      </div>
	     
	       <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	      
	     <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	      
	      <div class="col-sm-3">
	        <div class="adOuter" >
	           <img class="imgsrc" src="" >
	           <div  class="adContent"></div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom"></div>
	             <div class="sellerWho" ></div>
	        </div>
	      </div>
	     
	     
	    
	 </div>
<br />
 
<br /></div><!--兩邊空白結束-->



	<!----------footer開始-------------->
	<footer>
	<div class="container-fluid" style="background-color: rgb(185, 152, 103); height: 160px; padding-left: 30px; padding-top: 30px">

		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
				<!--複製go1buy1-->
				<ul class="footer_menu">
					<li><a href="">新手上路</a></li>
					<li><a href="">常見問題</a></li>
					<li><a class="">客服中心</a></li>
				</ul>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
				<ul class="footer_menu">
					<li><a href="">許願池</a></li>
					<li><a href="">最新代購消息</a></li>
					<li><a href="">代購賣家進駐申請</a></li>
				</ul>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
				<ul class="footer_menu">
					<li><a href="">FB粉絲團</a></li>
					<li><a href="">聯絡ALLBUYBACK</a></li>
					<li><a href="">服務條款與隱私權政策</a></li>
				</ul>
			</div>
		</div>
	</div>
	</footer>


	<div class="container-fluid" style="background-color: rgb(41, 64, 87); height: 45px; color: white; text-align: center; padding-top: 15px;">
		Copyright ©2017 - ALLBUYBACK 股份有限公司</div>
	<!----------footer結束-------------->

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 style="font-family:Comic Sans MS;color:#ff944d"><span class="glyphicon glyphicon-leaf"></span>LogIn</h4>
      </div>
      <div class="modal-body">
        <form role="form" action="LoginServlet" method="post">
          <div class="form-group">
          	<input type="hidden" name="status" value="login">
           	<label for="psw" style="font-family:Comic Sans MS;color:#ff944d;font-size:25px"  ><span class="glyphicon glyphicon-tree-deciduous"></span>Account</label>
            <input type="text" class="form-control" id="psw" name="userId" placeholder="請輸入註冊帳號">
          </div>
          <div class="form-group">
            <label for="usrname" style="font-family:Comic Sans MS;color:#ff944d;font-size:25px"><span class="glyphicon glyphicon-grain"></span>Password</label>
     <!--         <input type="text" class="form-control" id="usrname" name="password" >-->
            <input type="password" class="form-control" id="usrname" name="password" >
          </div>
          <button type="submit" class="btn btn-block" style="font-family:Comic Sans MS;color:#ff944d;font-size:25px">Commit 
            <span class="glyphicon glyphicon-ok"></span>
          </button>
        </form>
      </div>
      <div class="modal-footer" id="wrong">
      <c:if test="${empty LoginOK}">
        <span>${errorMsg.LoginError}</span>
       </c:if>
      </div>
    </div>
  </div>
</div>
</body>
</html>
