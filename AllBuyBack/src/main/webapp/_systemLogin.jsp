<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>後台系統登入頁面</title>

     <link rel="stylesheet" href="css/bootstrap.min.css"/>
     <script src="js/bootstrap.min.js"></script> 
<style>
    .footer_menu {
        text-align:center;
        
    }
    .footer_menu li {
         text-decoration:none;
         list-style-type:none;
        
     }
     .footer_menu li a {
         color: black/*white*/;   
         line-height:30px;
         text-decoration:none;
      }

input[type=text] {
    width: 60%;
    padding: 10px 10px;
    margin: 8px 0;
    box-sizing: border-box; 
    border-radius:5px 5px;
}

label {
    font-family:新細明體;
    font-size:20px;  
}

  fieldset {
            width:420px;
            border:1px  solid wheat;
            border-radius:15px;
            margin:15px;
            padding:60px 25px;
            background-color:wheat;
        }

</style>
</head>
<body>
<nav class="navbar navbar-inverse  navbar-fixed-top " style="border-bottom:1px rgb(41,64,87) solid;"  >
  <div  class="container-fluid" style="background-color:rgb(41,64,87);height:100px;position:relative;/*background-image:url('images/system.jpg');*/"  >
        <div class="container" style="padding-top:30px;padding-bottom:8px">
          <div class="row">
              <div class="col-sm-12">

                   <div class="navbar-header" style="font-size:20px;margin-right:120px;">
                    <a class="navbar-brand" style="color:white;font-family:Arial;font-size:1.8em">ALLBUYBACK &nbsp &nbsp 後台管理系統</a>
                   </div>

              </div>
          </div>
        </div>

</div>
</nav>

<div  class="container-fluid" style="background-color:#C1CDCD;height:700px;">
  <div class="container" style="">
         <div class="row">
              <div class="col-sm-6" style="height:700px;">
              </div>

               <div class="col-sm-6" style="height:700px;padding-top:200px;">
                  <form action="LoginServlet" method="post" style ="margin-left:70px;">
                    <fieldset >
                       
                      <label for="fname">帳號:</label>
                      <input type="text" id="fname" name="userId"><br/><br />
                      <label for="lname">密碼:</label>
                      <input type="text" id="lname" name="password"><br/><br />
                      <input style="font-family:微軟正黑體;font-size:20px;font-weight:500;border-radius:5px 5px;background-color:#E9967A;padding:5px 10px;margin-left:220px;" type="submit" value="登入">
<!--                       <button style="font-family:微軟正黑體;font-size:20px;font-weight:500;border-radius:5px 5px;background-color:#E9967A;padding:5px 10px;margin-left:220px;">登入</button> -->
                   </fieldset>   
                 </form>

              </div>
        </div>
  </div>
</div>
    
<!----------footer開始-------------->
<footer>
 <div class="container-fluid" style="background-color:white/*rgb(185,152,103)*/;height:140px;padding-left:30px;padding-top:30px" >
 
    	<div class="row">
        	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"><!--複製go1buy1-->
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

<div class="container-fluid" style="background-color:white/*rgb(41,64,87)*/;height:50px;color:black;/*text-align:center*/padding-top:0px;padding-left:320px;" >
    Copyright ©2017 - ALLBUYBACK 股份有限公司
</div>

</body>
</html>