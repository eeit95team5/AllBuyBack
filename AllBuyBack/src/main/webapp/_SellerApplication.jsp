<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>賣家進駐申請</title>

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

#formButton a{/*賣家申請進駐按鈕*/
  text-decoration: none;
}
</style>

<script>
  $(function(){
	  
	 $('#formButton').mouseover(function(){$(this).attr("style",
			 "margin-top:60px;font-family:微軟正黑體;font-size:25px;background-color: #CD5555;border:#CD5555;border-radius:5px 5px;padding:8px 20px;letter-spacing: 3px")}) 
	  
			 $('#formButton').mouseout(function(){$(this).attr("style",
			 "margin-top:60px;font-family:微軟正黑體;font-size:25px;background-color: rgb(255,140,133);border:rgb(42,186,171);border-radius:5px 5px;padding:8px 20px;letter-spacing: 3px")}) 		 
			 
  });

</script>


</head>
<body style="background-color:rgb(234,234,234)">
<jsp:include page="includeTop2.jsp"></jsp:include>


<div class="container-fluid" style="background-image:url(images/gray.png);background-size:cover;height:550px; ">
        
</div>
   

<div class="container-fluid"  style="background-color: white;height:400px;">

   <div class="row">
        <div class="col-sm-12">
            <div style="text-align:center;font-size: 45px;margin-top: -400px;color:white;font-weight:600;font-family:新細明體;letter-spacing: 3px;">全台最大國際代購媒合平台</div>
        </div>
    </div>
  
     
    <div class="row">
        <div class="col-sm-offset-4 col-sm-6">
            <img src="images/shopping-girl.png" width="200" style="margin-top: -320px;"> 
<!--              <img src="images/application.png" width="200" style="margin-top: -320px;"> -->
        </div>
    </div>
    
    
    <div class="row">
        <div class="col-sm-offset-6 col-sm-6">
          <div style="text-align:left;font-size: 22px;margin-top: -300px;color:white;font-weight:500;font-family:微軟正黑體;letter-spacing: 3px;">●專為跨國代購打造的友善環境</div>    
        </div>
    </div>
      <div class="row">
       <div class="col-sm-offset-6 col-sm-6">
          <div style="text-align:left;font-size: 22px;margin-top: -260px;color:white;font-weight:500;font-family:微軟正黑體;letter-spacing: 3px;">● 聚集喜好國際購物買家</div>    
        </div>
    </div>
     <div class="row">
       <div class="col-sm-offset-6 col-sm-6">
          <div style="text-align:left;font-size: 22px;margin-top: -220px;color:white;font-weight:500;font-family:微軟正黑體;letter-spacing: 3px;">● 交易流程化繁為簡</div>    
        </div>
    </div>
     <div class="row">
       <div class="col-sm-offset-6 col-sm-6">
          <div style="text-align:left;font-size: 22px;margin-top: -180px;color:white;font-weight:500;font-family:微軟正黑體;letter-spacing: 3px;">● 完整結合賣場、部落格與社群的C2C平台</div>    
        </div>
    </div>
    
     <div class="row">
       <div class="col-sm-offset-6  col-sm-4">         
         
         <button id="formButton" style="margin-top:60px;font-family:微軟正黑體;font-size:25px;background-color: rgb(255,140,133);border:rgb(42,186,171);border-radius:5px 5px;padding:8px 20px;letter-spacing: 3px"><a class="formButton" style="color:white;" href="_ApplicationForm.jsp">立即申請進駐</a></button> 
       
      </div> 
    </div>

</div><!-- 滿版白色結束 -->


<jsp:include page="_Footer.jsp"></jsp:include>
</body>
</html>