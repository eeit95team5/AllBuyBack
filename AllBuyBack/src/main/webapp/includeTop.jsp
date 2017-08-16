<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="styles/main.css"/>

 
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
  color:white;
  font-size:16px;
  /*line-height:45px;*/
  margin-right:10px;
  float:left;
  margin-top:10px;
}
.ThisWeek:hover {
   color:lightgray;
   text-decoration:none;
  
}
.icon-success {  /*本週頭條 星星 改變bootstrap icon的顏色*/
 color: #FFB90F;
   float:left;
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

</style>

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

<!-- <body style="background-color:rgb(234,234,234)"> -->

<nav class="navbar navbar-inverse  navbar-fixed-top " style="border-bottom:1px #F5F5F5 solid;"  >
  <div  class="container-fluid" style="background-color:#F5F5F5;"  >

      <div class="container" style="padding-top:10px;padding-bottom:8px">
          <div class="row">
              <div class="col-sm-12">

    <div class="navbar-header" style="font-size:20px;margin-right:120px;">
      <a class="navbar-brand" 
          style="color:rgb(41,64,87);font-family:Stencil;font-size:1.2em" 
          href="#">ALL BUY BACK</a>
    </div>

<ul class="drop-down-menu  nav navbar-nav" style="text-align:left">
        <li><a href="HomeIndex.jsp">首頁</a></li>

        <li><a href="#">找商品<span class="glyphicon glyphicon-menu-down"></span></a>
							<ul>
								<li><a href="AllClassItemSearch">依類別瀏覽</a>
									<ul>
										<li><a href="BClassItemSearch?BClass=1000001">流行服飾</a>
											<ul>
												<li><a href="MClassItemSearch?MClass=1000001">日系</a>
													<ul>
														<li><a href="SClassItemSearch?SClass=1000001">無印良品</a></li>
														<li><a href="SClassItemSearch?SClass=1000002">UNIQLO</a></li>
														<li><a href="SClassItemSearch?SClass=1000003">GLOBAL WORK</a></li>
														<li><a href="SClassItemSearch?SClass=1000004">23區</a></li>
														<li><a href="SClassItemSearch?SClass=1000005">其他</a></li>
													</ul></li>
												<li><a href="MClassItemSearch?MClass=1000002">韓系</a>
													<ul>
														<li><a href="SClassItemSearch?SClass=1000006">87MM</a></li>
														<li><a href="SClassItemSearch?SClass=1000007">8ight Seconds</a></li>
														<li><a href="SClassItemSearch?SClass=1000008">Ader Error</a></li>
														<li><a href="SClassItemSearch?SClass=1000009">GOGOSING</a></li>
														<li><a href="SClassItemSearch?SClass=1000010">其他</a></li>
													</ul></li>
												<li><a href="MClassItemSearch?MClass=1000003">美國</a>
													<ul>
														<li><a href="SClassItemSearch?SClass=1000011">CK</a></li>
														<li><a href="SClassItemSearch?SClass=1000012">GAP</a></li>
														<li><a href="SClassItemSearch?SClass=1000013">Roots</a></li>
														<li><a href="SClassItemSearch?SClass=1000014">Timberland</a></li>
														<li><a href="SClassItemSearch?SClass=1000015">其他</a></li>
													</ul></li>
												<li><a href="MClassItemSearch?MClass=1000004">歐洲</a>
													<ul>
														<li><a href="SClassItemSearch?SClass=1000016">AIGLE</a></li>
														<li><a href="SClassItemSearch?SClass=1000017">Accessorize</a></li>
														<li><a href="SClassItemSearch?SClass=1000018">Kenzo</a></li>
														<li><a href="SClassItemSearch?SClass=1000019">Superdry</a></li>
														<li><a href="SClassItemSearch?SClass=1000020">其他</a></li>
													</ul></li>
											</ul></li>
										<li><a href="BClassItemSearch?BClass=1000002">異國美食</a>
											<ul>
												<li><a href="MClassItemSearch?MClass=1000005">零食</a>
													<ul>
														<li><a href="SClassItemSearch?SClass=1000021">巧克力</a></li>
														<li><a href="SClassItemSearch?SClass=1000022">餅乾</a></li>
														<li><a href="SClassItemSearch?SClass=1000023">糖果</a></li>
														<li><a href="SClassItemSearch?SClass=1000024">其他</a></li>
													</ul></li>
												<li><a href="MClassItemSearch?MClass=1000006">飲品</a>
													<ul>
														<li><a href="SClassItemSearch?SClass=1000025">咖啡</a></li>
														<li><a href="SClassItemSearch?SClass=1000026">茶</a></li>
														<li><a href="SClassItemSearch?SClass=1000027">其他</a></li>
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
												<li><<a href="CountryItemSearch?countryCl=1000009">西班牙</a></li>
												<li><a href="CountryItemSearch?countryCl=1000010">義大利</a></li>
											</ul></li>
										<li><a href="#">美洲</a>
											<ul>
												<li><a href="CountryItemSearch?countryCl=1000011">美國</a></li>
												<li><<a href="CountryItemSearch?countryCl=1000012">加拿大</a></li>
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
			<li><a href="MakeAWishForm.jsp" >許願</a></li>
			<li><a href="CheckYourList">本人願望</a></li>
			<li><a href="CheckPeopleList">大家願望</a></li>
			</ul></li>
        <li><a href="#" >最新代購消息</a>
        </li>
    
    </ul>


     <form class="navbar-form navbar-left" action="KeyWordItemSearch" method="POST">
      <div class="input-group" style="width:160px;margin-left:30px;margin-right:30px">
        <input type="text" class="form-control" name="keyword" placeholder="您想代購什麼？"/>
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit" >
            <i class="glyphicon glyphicon-search" ></i>
          </button>
        </div>
      </div>
    </form>
<!------------------->
<c:if test="${! empty LoginOK}">
         <div class="myPicture">
             <img src=""/>
         </div>

      <div class="threeDot" id="threeDot">
          <span class="glyphicon glyphicon-option-vertical"></span>
      </div>

         <div class="dropdown-content" id="dropdown">
             <a href="#">修改基本資料</a>
             <a href="#">我的代購車</a>
            <a href="#">我的賣場</a>
            <a href="#">挑戰時尚金頭腦</a>
            <a href="#">聯絡管理員</a>
            <a href="#">登出</a>
         </div>
</c:if>
<c:if test="${empty LoginOK}">
         <button  class="btn btn-danger navbar-btn" 
         style="font-family:微軟正黑體;background-color:rgb(185,127,109);border:rgb(185,127,109);margin-right:10px" >註冊</button>
    <button  class="btn btn-danger navbar-btn" 
         style="font-family:微軟正黑體;background-color:rgb(185,127,109);border:rgb(185,127,109)" >登入</button>
   
</c:if>
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
  
             <button  class="btn btn-danger navbar-btn" style="font-family:微軟正黑體;
                background-color:#EE3B3B;border:#EE3B3B;color:white;margin-left:70px;" >新手上路</button>
       </div>
    </div><!--row結束-->
</div><!--container結束-->  
</div><!--container-fluid結束-->
<!--只留下本週頭條及新手上路-->
