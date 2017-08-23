<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊</title>
 <link rel="stylesheet" href="styles/main.css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script src="js/bootstrap.min.js"></script> 
    <script src="js/jquery-1.9.1.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- w3 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">	
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Tangerine">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
   
<style>

#button {
  border-radius: 4px;
  background-color: #294057;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 17px;
  padding: 20px;
  width: 90px;
  height:45%;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

#button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

#button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

#button:hover span {
  padding-right: 10px;
}

#button:hover span:after {
  opacity: 1;
  right: 0;
}
.ThisWeek {  /*關於本週頭條  以下三個class貼在main裡不能跑會衝突*/
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
.icon-success {  /*改變bootstrap icon的顏色*/
 color: #FFB90F;
   float:left;
}


/*底下分頁*/
.center {
    text-align: center;
}

.pagination {
    display: inline-block;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
    margin: 0 4px;
    font-size: 20px;
}

.pagination a.active {
    background-color: gray;
    color: white;
    border: 1px solid gray;
}

.pagination a:hover:not(.active) {
    background-color: #ddd;

}/*底下分頁結束*/

/*小搜尋結果顯示*/
/* Style the tab */
div.tab {
    overflow: hidden;
    border-bottom: 2px solid black;
    /*background-color: #f1f1f1;*/
    color:gray;
}

/* Style the buttons inside the tab */
div.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 12px 20px;
    transition: 0.3s;
    font-size: 18px;
    font-family:微軟正黑體;
}

/* Change background color of buttons on hover */
div.tab button:hover {
    /*background-color: #ddd;*/
    color:black;
}

/* Create an active/current tablink class */
div.tab button.active {
    /*background-color: #ccc;*/
    border-bottom:5px solid red!important;
    color:black;
    font-weight:700;
}
/* Style the tab content */
.tabcontent { /*div夾ul li小項目*/
    /*display: none;*/
    padding: 6px 7px;
    border-bottom: 3px solid lightgray;
    /*border-top: none;*/
    height:50px;
    margin-bottom:15px;
}

.showItemClass {/*ul設定*/
    overflow:auto;
    list-style-type:none;
        }
.showItemClass li{/*li設定*/
    float: left;
    width:6em;
    font-family:微軟正黑體;
    font-size:15px;
    text-align:left;
    border-right:1px solid lightgray;
}

 .showItemClass li a {
    display:block;
    line-height:2em;
    color:black;
    text-align:center;
    text-decoration:none;
        }
.showItemClass li a:hover {     
    color:gray;
}

.showItemClass li a.active {   /*額外加的 被選擇的小類別變色*/  
    color:red;
}

/*目前沒在用*/
.s1{
	text-align:center;
	font-family:微軟正黑體;
	font-size:40px;
}

.myinput {
    width:80%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: none;
    border-bottom: 2px solid rgba(255, 0, 0, 0.4);
  
}

label,p{
	font-family:微軟正黑體;
	font-size:22px;
	color:#B99867;
	
}

fieldset{
	background-color:#ffffff;
	border:1px solid #ffe6e6;
	border-radius: 15px;
	width:700px;
	padding-top: 20px;
	padding-left: 20px;
	padding-bottom: 20px;
}
/*目前沒在用*/
 /*#button {
 /*   background-color: #4CAF50; /* Green */
 /*  border: none;
 /*   color: white;
 /*   padding: 15px 32px;
 /*   text-align: center;
 /*   text-decoration: none;
 /*   display: inline-block;
 /*   font-size: 16px;
 /*   margin: 4px 2px;
 /*   cursor: pointer;
 /*   border-radius: 50%;
}*/

.myspan{
	font-family:微軟正黑體;
	font-size:12px;
	color:#B99867;
}
body {
    background: linear-gradient(to right, #ffffff 0%, #294057 100%);
}

</style>
</head>
<body>

<nav class="navbar navbar-inverse  navbar-fixed-top " style="border-bottom:1px #F5F5F5 solid;"  >
  <div  class="container-fluid" style="background-color:#F5F5F5;"  >

      <div class="container" style="padding-top:10px;padding-bottom:8px">
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


     <form class="navbar-form navbar-left">
      <div class="input-group" style="width:160px;margin-left:30px;margin-right:30px">
        <input type="text" class="form-control" placeholder="您想代購什麼？"/>
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit" style="height:34px">
            <i class="glyphicon glyphicon-search" ></i>
          </button>
        </div>
      </div>
    </form>
   
 

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
                <div style="margin-top: 20px">
						<h3 style="float: left; margin-top: 6px; margin-right: 10px;">
							<span class="glyphicon glyphicon-star-empty icon-success"></span>
						</h3>
						<a href="item.html?i_id=1000042" class="ThisWeek">Timberland海灘派對促銷</a>
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
						<a href="" class="ThisWeek">巴黎世家搶手帆布包</a>
					</div>

  
             <button  class="btn btn-danger navbar-btn" style="font-family:微軟正黑體;
                background-color:#EE3B3B;border:#EE3B3B;color:white;margin-left:70px;" >新手上路</button>
       </div>
    </div><!--row結束-->
</div><!--container結束-->  
</div><!--container-fluid結束-->
<!--只留下本週頭條及新手上路-->
<div class="container">
  <div class="row">
  	<div class="col-sm-5 col-sm-offset-2">
<fieldset>
<p style="text-align:center;font-size:30px">會員註冊</p>
 <form action="<c:url value="/RegisterServlet" />" method="post">
  <div>
  <label for="account"><Font color='#ff9999'>*</Font>帳號<Font color='#bfbfbf' size="2px">(必填)</Font></label>
  <br><input class="w3-input w3-animate-input" type="text" style="width:60%" id="account" name="account" value="${temp.m_account }"><span class="myspan">${wrong.account }</span>
  
  <div>
  <label for="password"><Font color='#ff9999'>*</Font>密碼<Font color='#bfbfbf' size="2px">(至少3字元且包含英文與數字)</Font></label>
  <br><input class="w3-input w3-animate-input" type="password" style="width:60%" id="password"  name="password"  value="${temp.m_password }"><span class="myspan">${wrong.password }</span>
  </div>
  
  <div>
  <label for="name"><Font color='#ff9999'>*</Font>姓名<Font color='#bfbfbf' size="2px">(必填)</Font></label>
  <br><input class="w3-input w3-animate-input" type="text" style="width:60%" name="name" value="${temp.m_name }"><span class="myspan">${wrong.name }</span>
  </div>
  
  <div>
  <label for="phone"><Font color='#ff9999'>*</Font>電話<Font color='#bfbfbf' size="2px">(必填)</Font></label>
  <br><input class="w3-input w3-animate-input" type="text" style="width:60%" id="phone" name="phone" value="${temp.m_phone }"><span class="myspan">${wrong.phone }</span>
  </div>
  
  <div>
  <label for="address"><Font color='#ff9999'>*</Font>住址<Font color='#bfbfbf' size="2px">(必填)</Font></label>
  <br><input class="w3-input w3-animate-input" type="text" style="width:60%" id="address" name="address" value="${temp.m_address }"><span class="myspan">${wrong.address }</span>
  </div>
  
  <div>
  <label for="identity"><Font color='#ff9999'>*</Font>身分證<Font color='#bfbfbf' size="2px">(必填)</Font></label>
  <br><input class="w3-input w3-animate-input" type="text" style="width:60%" id="identity" name="identity" value="${temp.m_identity }"><span class="myspan">${wrong.identity }</span>
  </div>
  
  <div>
  <label for="email"><Font color='#ff9999'>*</Font>Email<Font color='#bfbfbf' size="2px">(ex:jane@gmail.com)</Font></label>
  <br><input class="w3-input w3-animate-input" type="text" style="width:60%" id="email" name="email" value="${temp.m_email }"><span class="myspan">${wrong.email }</span>
  </div>
  
	<button id="button" type="submit"><span>送出</span></button> 
 
 </form>
 </fieldset>
</div> 
</div>
</div>

 <!--   <div class="container">
  			<div class="row">
  				<div class="col-sm-5 col-sm-offset-2">
		<label for="account" ><h4>*帳號:</h4></label>   
		<input type="text" id="account" name="account" size="15" maxlength="12" value="${temp.m_account }"><span>${wrong.account }</span>	 	
			</div> 
		</div>
	</div>
	
 	<div class="s1">
  		<label for="password" class="col-lg-10 control-label"><h4>*密碼:需包含英文及數字</h4></label>
		<input type="text" id="password" name="password" size="15" maxlength="12" value="${temp.m_password }"><span>${wrong.password }</span>
	</div>
	
	<div class="s1">	
		<label for="name" class="col-lg-10 control-label"><h4>*姓名:請填入真實姓名</h4></label>
		<input  type="text" id="name" name="name" size="15" maxlength="12" value="${temp.m_name }"><span>${wrong.name }</span>
	</div>
	<div class="s1">	
		<label for="phone" class="col-lg-10 control-label"><h4>*電話:</h4></label>
		<input  type="text" id="phone" name="phone" size="15" maxlength="12" value="${temp.m_phone }"><span>${wrong.phone }</span>
	</div>	
	<div class="s1">
		<label for="address" class="col-lg-10 control-label"><h4>*住址:</h4></label>
		<input  type="text" id="address" name="address" size="15" maxlength="12" value="${temp.m_address }"><span>${wrong.address }</span>
	</div>	
	<div class="s1">
		<label for="identity" class="col-lg-10 control-label"><h4>*身分證:</h4></label>
		<input  type="text" id="identity" name="identity" size="15" maxlength="12" value="${temp.m_identity }"><span>${wrong.identity }</span>
	</div>	
	<div class="s1">
		<label for="email" class="col-lg-10 control-label"><h4>*EMAIL:</h4></label>
		<input  type="text" id="email" name="email" size="15" maxlength="12" value="${temp.m_email }"><span>${wrong.email }</span>
	</div>		
				
	<div class="s1">	
	<input  type="submit" value="送出">
	</div> -->
</form>
</body>
</html>
 