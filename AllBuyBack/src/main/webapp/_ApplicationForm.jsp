<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>進駐申請表單</title>

<link rel="stylesheet" href="styles/main.css" />
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
<link rel="stylesheet" href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="webjars/sweetalert/1.1.3/dist/sweetalert.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script>

<style>

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

.st1 {
      width:750px;
      margin:20px;
      padding-bottom:10px;
      }
      
.labelClass {
       width:200px;
       float:left;
       text-align:right;
       /*border:1px solid red;*/
       /*margin-right:3px;*/
/*        padding-right:3px; */
       font-family: 微軟正黑體;
       font-size:15px;
       letter-spacing: 2px;
       font-weight:600;
      }


.whichCountry{
    font-family: 微軟正黑體;
    font-size:15px;
    font-weight:500;
    margin-left:5px;  
    margin-right:10px; 
}

.whichItem{
    font-family: 微軟正黑體;
    font-size:15px;
    font-weight:500;
    margin-left:5px;  
    margin-right:10px; 
}


#formSummit a{/*送出申請表按鈕*/
  text-decoration: none;
}
</style>
<script>
  $(function(){
	  
	 $('#formSummit').mouseover(function(){$(this).attr("style",
			 "margin-top:60px;font-family:微軟正黑體;font-size:25px;background-color: #458B74;border:#458B74;border-radius:5px 5px;padding:8px 20px;letter-spacing: 3px")}) 
	  
	 $('#formSummit').mouseout(function(){$(this).attr("style",
	 "margin-top:60px;font-family:微軟正黑體;font-size:25px;background-color: rgb(42,186,171);border:rgb(42,186,171);border-radius:5px 5px;padding:8px 20px;letter-spacing: 3px")}) 		 
			 
  });

</script>

</head>
<body style="background-color:rgb(234,234,234)">
<jsp:include page="includeTop2.jsp"></jsp:include>



<div class="container-fluid"  style="background-color: #6E6E6E;height:1200px">
   <div class="container"  style="background-color: white;height:900px;margin-top:150px;border-radius:15px 15px">

	   <div class="row">
	        <div class="col-sm-12"> 
                 <div style="text-align: center;font-family: 微軟正黑體;font-size: 25px;letter-spacing:5px;margin-top: 30px;padding-bottom:20px;border-bottom:2px solid lightgray;">填寫申請表</div>
                 <div style="color:gray;font-family: 微軟正黑體;font-size: 15px;margin:10px 15px;letter-spacing:1px;padding-bottom:20px;border-bottom:2px dotted lightgray;line-height: 30px">請填寫下面申請表格讓我們認識您，自介與資訊提供的詳盡程度，將會影響申請審核的結果。(* 為必填欄位) <br>
                                                   審核過程約需7個工作天，若通過審核，AllBuyBack將會寄發通知信到您留下的聯絡信箱。(未通過審核，將不再另行通知，如需確認可來信至客服信箱) </div>
                 
                  <div class="st1">
                    <label for="shopName" class="labelClass">*您的商店名稱 :</label><input type="text" id="shopName" name="shopName" autofocus autocomplete="off" required placeholder="中英文皆可，限20個字以內" size="40"  />
                  </div>
                  <div class="st1">
                    <label for="sellerName" class="labelClass">*您的名字 :</label><input type="text" id="sellerName" name="sellerName"  autocomplete="off" required placeholder="該如何稱呼您呢?" size="40"  />
                  </div>
                   <div class="st1">
                    <label for="mail" class="labelClass">*Email信箱 :</label><input type="text" id="mail" name="mail"  autocomplete="off" required placeholder="請務必填寫正確E-mail" size="60"  />
                  </div>
                 
                  <div class="st1">
	                <label class="labelClass">*代購國家(可複選):</label>
	              
	                <input type="checkbox" name="country" value="Japan" id="Japan" /><label for="Japan" class="whichCountry">日本</label>
	                <input type="checkbox" name="country" value="Korea" id="Korea" /><label for="Korea" class="whichCountry">韓國</label>
	                <input type="checkbox" name="country" value="HK" id="HK" /><label for="HK" class="whichCountry">香港</label>
	                <input type="checkbox" name="country" value="Singapore" id="Singapore" /><label for="Singapore" class="whichCountry">新加坡</label>
	                <input type="checkbox" name="country" value="Thai" id="Thai" /><label for="Thai" class="whichCountry">泰國</label><br>
	                <label class="labelClass"></label>
	                <input type="checkbox" name="country" value="England" id="England" /><label for="England" class="whichCountry">英國</label>
	                <input type="checkbox" name="country" value="France" id="France" /><label for="France" class="whichCountry">法國</label>
	                <input type="checkbox" name="country" value="Germany" id="Germany" /><label for="Germany" class="whichCountry">德國</label>
	                <input type="checkbox" name="country" value="Spain" id="Spain" /><label for="Spain" class="whichCountry">西班牙</label>
	                <input type="checkbox" name="country" value="Italy" id="Italy" /><label for="Italy" class="whichCountry">義大利</label><br>
	                <label class="labelClass"></label>
	                <input type="checkbox" name="country" value="America" id="America" /><label for="America" class="whichCountry">美國</label>
	                <input type="checkbox" name="country" value="Canada" id="Canada" /><label for="Canada" class="whichCountry">加拿大</label>
                     <input type="checkbox" name="country" value="countryOthers" id="countryOthers" /><label for="countryOthers" class="whichCountry">其他:</label><input type="text" size="12">
                 </div>
                 
                 <div class="st1">
	                <label class="labelClass">*代購商品類型(可複選):</label>
	              
	                <input type="checkbox" name="country" value="cloths" id="cloths" /><label for="cloths" class="whichItem">流行服飾</label>
	                <input type="checkbox" name="country" value="food" id="food" /><label for="food" class="whichItem">異國美食</label>
	                <input type="checkbox" name="country" value="3c" id="3c" /><label for="3c" class="whichItem">數位3C</label>
	                <input type="checkbox" name="country" value="beauty" id="beauty" /><label for="beauty" class="whichItem">美妝美體</label>
	                <input type="checkbox" name="country" value="sport" id="sport" /><label for="sport" class="whichItem">運動用品</label><br>
	                <label class="labelClass"></label>
	                <input type="checkbox" name="country" value="home" id="home" /><label for="home" class="whichItem">居家用品</label>
	                <input type="checkbox" name="country" value="baby" id="baby" /><label for="baby" class="whichItem">媽咪寶貝</label>
	                <input type="checkbox" name="country" value="stationery" id="stationery" /><label for="stationery" class="whichItem">文具雜貨</label>
	                <input type="checkbox" name="country" value="others" id="others" /><label for="others" class="whichItem">其他:</label><input type="text" size="10">
                 </div>
                 
                  <div class="st1">
	                 <label for="aboutYou" class="labelClass">*關於你:</label><textarea cols="62" rows="6" name="aboutYou" id="aboutYou"></textarea>
	              </div>
                 
                  <div style="text-align: center;">
                     <button id="formSummit" style="margin-top:60px;font-family:微軟正黑體;font-size:25px;background-color: rgb(42,186,171);border:rgb(42,186,171);border-radius:5px 5px;padding:8px 20px;letter-spacing: 3px;"><a class="formButton" style="color:white;" href="">送出申請表</a></button> 
                  </div>
            </div>
       </div>
   </div>


</div><!-- 滿版白色結束 -->


<jsp:include page="_Footer.jsp"></jsp:include>
</body>
</html>