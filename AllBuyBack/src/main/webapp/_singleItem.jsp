<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>單一商品頁面</title>
    
    <link rel="stylesheet" href="styles/main.css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script src="js/bootstrap.min.js"></script> 

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

     <link rel="stylesheet" href="styles/singleItem.css"/>
<style>
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

/*------------------------*/
.myActive  {
    border-top:pink 5px solid;
}

</style>
<script type="text/javascript">
$(function() {
	
	$("#eye").mouseover(function() {
		$('#eyeCount').attr("style","display:block");
	});

)}
</script>

</head>
<body style="background-color:rgb(234,234,234)">

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
        <li><a href="#"" >首頁</a></li>

        <li><a href="#"">找商品<span class="glyphicon glyphicon-menu-down"></span></a>
              <ul>
                <li><a href="#">依類別瀏覽</a>
                    <ul>
                        <li><a href="#">流行服飾</a>
                             <ul>
                                <li><a href="#">日系</a>
                                    <ul>
                                        <li><a href="#">無印良品</a>
                                        </li>
                                        <li><a href="#">UNIQLO</a>
                                        </li>
                                        <li><a href="#">GLOBAL WORK</a>
                                        </li>
                                        <li><a href="#">23區</a>
                                        </li>
                                         <li><a href="#">其他</a>
                                        </li>                                   
                                    </ul>
                                </li>
                                <li><a href="#">韓系</a>
                                    <ul>
                                        <li><a href="#">87MM</a>
                                        </li>
                                        <li><a href="#">8ight Seconds</a>
                                        </li>
                                        <li><a href="#">Ader Error</a>
                                        </li>
                                        <li><a href="#">GOGOSING</a>
                                        </li>     
                                         <li><a href="#">其他</a>
                                        </li>                           
                                    </ul>
                                </li> 
                                <li><a href="#">美國</a>
                                    <ul>
                                        <li><a href="#">CK</a>
                                        </li>
                                        <li><a href="#">GAP</a>
                                        </li>
                                        <li><a href="#">Roots</a>
                                        </li>
                                        <li><a href="#">Timberland</a>
                                        </li>     
                                        <li><a href="#">其他</a>
                                        </li>                           
                                    </ul>
                            </li>    
                              <li><a href="#">歐洲</a>
                                    <ul>
                                        <li><a href="#">AIGLE</a>
                                        </li>
                                        <li><a href="#">Accessorize</a>
                                        </li>
                                        <li><a href="#">Kenzo</a>
                                        </li>
                                        <li><a href="#">Superdry</a>
                                        </li>     
                                        <li><a href="#">其他</a>
                                        </li>                           
                                    </ul>
                              </li>                                      
                             </ul>
                        </li>
                        <li><a href="#">異國美食</a>
                             <ul>
                                 <li><a href="#">零食</a>
                                    <ul>
                                        <li><a href="#">巧克力</a>
                                        </li>
                                        <li><a href="#">餅乾</a>
                                        </li>
                                        <li><a href="#">糖果</a>
                                        </li>    
                                        <li><a href="#">其他</a>
                                        </li>                           
                                    </ul>
                               </li>         
                                    <li><a href="#">飲品</a>
                                        <ul>
                                        <li><a href="#">咖啡</a>
                                        </li>
                                        <li><a href="#">茶</a>
                                        </li> 
                                        <li><a href="#">其他</a>
                                        </li>                           
                                        </ul>
                                    </li>                              
                                </ul>
                            </li><!--以下分類尚未填入-->
                            <li><a href="#">數位3C</a>
                                 <ul>
                                 <li><a href="#">手機</a>
                                    <ul>
                                        <li><a href="#">iPhone</a>
                                        </li>
                                        <li><a href="#">Samsung</a>
                                        </li>
                                        <li><a href="#">Sonic</a>
                                        </li>    
                                        <li><a href="#">Casio/卡西歐</a>
                                        </li>
                                        <li><a href="#">其他</a>
                                        </li>                           
                                    </ul>
                               </li>         
                                    <li><a href="#">相機</a>
                                        <ul>
                                        <li><a href="#">周邊配件</a>
                                        </li>
                                        <li><a href="#">手機殼</a>
                                        </li> 
                                        <li><a href="#">其他</a>
                                        </li>                           
                                        </ul>
                                    </li>
                                      <li><a href="#">電腦</a>
                                        <ul>
                                        <li><a href="#">ACER</a>
                                        </li>
                                        <li><a href="#">APPLE</a>
                                        </li> 
                                        <li><a href="#">ASUS</a>
                                        </li> 
                                        <li><a href="#">DELL</a>
                                        </li>                           
                                        </ul>
                                    </li>                                      
                                </ul>
                            </li>
                            <li><a href="#">美妝美體</a>
                                 <ul>
                                 <li><a href="#">化妝品</a>                                
                               </li>         
                                    <li><a href="#">保養清潔用品</a>                                       
                                    </li>                                                          
                                </ul>
                            </li>                         
                              <li><a href="#">運動用品</a>
                                  <ul>
                                  <li><a href="#">adidas</a>                              
                                  </li>         
                                  <li><a href="#">NIKE</a>                                   
                                  </li> 
                                  <li><a href="#">PUMA</a>                                   
                                  </li>  
                                  <li><a href="#">其他</a>                                   
                                  </li>                                 
                                </ul>
                            </li>                    
                            <li><a href="#">居家用品</a>
                                <ul>
                                  <li><a href="#">廚房系列</a>                              
                                  </li>         
                                  <li><a href="#">寢室系列</a>                                   
                                  </li> 
                                  <li><a href="#">其他</a>                                   
                                  </li>                               
                                </ul>
                            </li>
                            <li><a href="#">媽咪寶貝</a>
                                 <ul>
                                  <li><a href="#">服飾</a>                              
                                  </li>         
                                  <li><a href="#">食品</a>                                   
                                  </li> 
                                  <li><a href="#">教具玩具</a>                                   
                                  </li>                               
                                </ul>
                            </li> 
                            <li><a href="#">文具雜貨</a>
                                 <ul>
                                  <li><a href="#">Disney迪士尼系列</a>                              
                                  </li>         
                                  <li><a href="#">sanrio三麗鷗系列</a>                                   
                                  </li>                            
                                </ul>
                            </li>                      
                        </ul>
                    </li>

                <li><a href="#">依國家瀏覽</a>
                    <ul>
                        <li><a href="#">美洲</a>
                            <ul>
                                <li><a href="#">美國</a>
                                </li>
                                <li><a href="#">加拿大</a>
                                </li>                              
                            </ul>
                        </li>
                       
                        <li><a href="#">歐洲</a>
                              <ul>
                                <li><a href="#">英國</a>
                                </li>
                                <li><a href="#">法國</a>
                                </li>
                                <li><a href="#">德國</a>
                                </li>
                                 <li><a href="#">西班牙</a>
                                </li>
                                 <li><a href="#">義大利</a>
                                </li>
                             </ul>
                        </li>
                         <li><a href="#">亞洲</a>
                              <ul>
                                <li><a href="#">日本</a>
                                </li>
                                <li><a href="#">韓國</a>
                                </li>
                                <li><a href="#">香港</a>
                                </li>
                                <li><a href="#">泰國</a>
                                </li>
                                <li><a href="#">新加坡</a>
                                </li>
                            </ul>
                        </li>
                      
                    </ul>
                </li>

                <li><a href="#">依特色瀏覽</a>
                    <ul>
                        <li><a href="#">編輯精選</a>
                        </li>
                        <li><a href="#">熱門瀏覽</a>
                        </li>
                        <li><a href="#">最新上架</a>
                        </li>
                        <li><a href="#">最後倒數</a>                          
                        </li>                    
                    </ul>
                </li>
               
            </ul>
        </li>
        
        <li><a href="#" >找賣家<span class="glyphicon glyphicon-menu-down"></span></a>
            <ul>
                <li><a href="#">美洲</a>
                    <ul>
                        <li><a href="#">美國</a>
                        </li>
                        <li><a href="#">加拿大</a>
                        </li>
                    </ul>
                </li>
                <li><a href="#">歐洲</a>
                    <ul>
                        <li><a href="#">英國</a>
                        </li>
                        <li><a href="#">法國</a>
                        </li>
                        <li><a href="#">德國</a>
                        </li>
                         <li><a href="#">西班牙</a>
                        </li>
                         <li><a href="#">義大利</a>
                        </li>
                    </ul>
                </li>
              
                <li><a href="#">亞洲</a>
                    <ul>
                        <li><a href="#">日本</a>
                        </li>
                        <li><a href="#">韓國</a>
                        </li>
                        <li><a href="#">香港</a>
                        </li>
                        <li><a href="#">泰國</a>
                        </li>
                        <li><a href="#">新加坡</a>
                        </li>
                    </ul>
                </li>
                
                <li><a href="#">新進賣家</a>
                </li>
            </ul>
        </li>
        <li><a href="#"  >許願池</a>
        </li>
        <li><a href="#" >最新代購消息</a>
        </li>
    
    </ul>


     <form class="navbar-form navbar-left">
      <div class="input-group" style="width:180px;margin-left:30px;margin-right:30px">
        <input type="text" class="form-control" placeholder="您想代購什麼？"/>
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit" >
            <i class="glyphicon glyphicon-search" ></i>
          </button>
        </div>
      </div>
    </form>
   
     <button  class="btn btn-danger navbar-btn" 
         style="font-family:微軟正黑體;background-color:rgb(185,127,109);border:rgb(185,127,109);margin-right:10px" >註冊</button>
    <button  class="btn btn-danger navbar-btn" 
         style="font-family:微軟正黑體;background-color:rgb(185,127,109);border:rgb(185,127,109)" >登入</button>

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


<div class="container"><!--商品上半部-->
    <div class="row">
        <div class="col-sm-12">
            <div class="productArea1"  >
               <div class="productTitle" >限定預購！日本郵局「哆啦A夢餐具組」 單人9件超值華組</div>

                <div id="eyeCount" style="position:absolute;top:55px;left:35px;border-radius:5px 5px;background-color:black;color:white;font-size:10px;padding:2px 5px;display:none;">瀏覽數</div>
                <div id="eye"><span class="glyphicon glyphicon-eye-open icon-success" style="font-size:20px;color:gray"></span></div>
                <div id="heart"><span class="glyphicon glyphicon-heart icon-success" style="font-size:20px;;color:gray"></span></div>
                <div id="shoppingCart"><span  class="glyphicon glyphicon-shopping-cart icon-success" style="font-size:20px;;color:gray"></span></div> 
               

                   <div class="mainPhoto">
                     <img src="images/product.jpg" width="480" height="400" />
                   </div> 
                   <div class="smallPhoto1" >
                     <img src="images/product.jpg" width="90" />
                   </div>
                  <div class="smallPhoto2" >
                     <img src="images/product2.jpg" width="90" />
                   </div>
                  <div class="smallPhoto3" >
                     <img src="" width="90" />
                   </div>

                <div class="price">售價:</div>  
                <div class="brand">商品品牌:</div>  
                <div class="country">代購國家:</div>  
                <div class="waitDay">等待天數:</div> 
                <button class="favorite">加入收藏</button> 
                <button class="wantBuy">聯絡代購</button> 
                <div class="pay">付款方式:</div>  
                <div class="deliver">寄送方式:</div>  

            </div><!--productArea1區域-->
        </div>
    </div>
</div>


<div class="container"><!--商品下半部-->
    <div class="row">
        <div class="col-sm-8">
            <div class="productArea2">
           
  <ul class="nav nav-tabs">
    <li class="active myActive" style="font-family:微軟正黑體;font-size:18px;letter-spacing:4px;font-weight:600"><a data-toggle="tab" href="#menu1">商品描述</a></li>
    <li  style="font-family:微軟正黑體;font-size:18px;letter-spacing:4px;font-weight:600"><a data-toggle="tab" href="#menu2">費用與寄送資訊</a></li>
    <li  style="font-family:微軟正黑體;font-size:18px;letter-spacing:4px;font-weight:600"><a data-toggle="tab" href="#menu3">問與答</a></li>

  </ul>

  <div class="tab-content">
    <div id="menu1" class="tab-pane fade in active">
      <h3>商品描述</h3>
      <p>NATIVE INSTRUMENTS 的MASCHINE系列可說是DJ必備的生財工具，不管是做EDM歌曲、派對放歌、混音編曲都可以用 MASCHINE 來完成，最大的特色是它包含Pattern編曲機、音色取樣機、多種效果器，可載入其他插件，流暢的編曲環境和控制面板讓歌曲製作更方便。</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>費用與寄送資訊</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>問與答</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
  </div>

</div><!--productArea2-->


<div style="height:250px;background-color:#B0C4DE;margin-top:20px;padding-top:50px;margin-bottom:50px;
border-radius:5px 5px;text-align:center;font-size:20px;font-family:微軟正黑體;letter-spacing:3px;">
    
    <span class="glyphicon glyphicon-plane" style="color:white;font-size:25px;"></span>
    欲購買或發問點請選<br /><br /><br />
<button style="border-radius:5px 5px;border:rgb(42,186,171);background-color:rgb(42,186,171);color:white;padding:10px 30px;font-size:20px;margin-top:10px;font-weight:500;">聯絡代購</button>

</div>



 </div><!--8格-->

        <div class="col-sm-offset-1 col-sm-3">
            <div class="seller" >
                <div style="margin-top:20px;text-align:center;">ABOUT SELLER</div>
                <div style=" width:120px;height:120px; border-radius:99em;  /*border:2px lightgray solid*/margin-left:70px;margin-top:10px;"><img src="images/myPicture.jpg" style="border-radius:99em;width:120px;height:120px;"/></div>
                <div><h4 style="font-family:微軟正黑體;text-align:center;padding-top:10px;">韓國代購天堂</h4></div>
                
                <div style="text-align:center;margin-top:20px;">
                <span class="glyphicon glyphicon-plane" style="color:#EEB4B4;font-size:25px;"></span><span class="glyphicon glyphicon-plane" style="color:#EEB4B4;font-size:25px;"></span><span class="glyphicon glyphicon-plane" style="color:#EEB4B4;font-size:25px;"></span><span class="glyphicon glyphicon-plane" style="color:#EEB4B4;font-size:25px;"></span><span class="glyphicon glyphicon-plane" style="color:#EEB4B4;font-size:25px;"></span>
                </div>
                    
                <div style="color:gray;font-family:微軟正黑體;font-size:12px;text-align:center;margin-top:20px;">評價 | 關於我 | 代購商品</div>

                 <div style="text-align:center;margin-top:20px;"><button style="border-radius:5px 5px;border:black;background-color:black;color:white;width:250px;padding:7px 10px;"> <span class="glyphicon glyphicon-eye-open"><span style="margin-left:10px;font-size:20px;font-family:微軟正黑體;">&nbsp訂閱我</span></button></div>
                 <div style="color:gray;font-family:微軟正黑體;font-size:12px;text-align:center;margin-top:20px;">目前共有100人訂閱</div>
                  
                <div style="padding:2px 20px;color:#8B7B8B;font-family:微軟正黑體;font-size:15px;text-align:center;margin-top:20px;">喜歡賣家代購的好物？<br />訂閱即可在第一時間收到代購分享的最新代購文章、商品資訊和專欄喔！</div>

                 <div style="position:relative;margin-top:20px;color:white;font-family:微軟正黑體;font-size:15px;">
                     <div style="position:absolute;left:0px;background-color:gray;width:80px;height:80px;padding:15px 10px;text-align:center;">前5小時<br />最後上站</div>
                     <div style="position:absolute;left:90px;background-color:gray;width:80px;height:80px;padding:15px 10px;text-align:center;">90%<br />回應率</div>
                     <div style="position:absolute;left:180px;background-color:gray;width:80px;height:80px;padding:15px 10px;text-align:center;">3天內<br />平均回應</div>
                 </div>


            </div><!--seller區塊-->
        </div>


    </div><!--row-->
</div><!--container-->

<!----------footer開始-------------->
<footer>
 <div class="container-fluid" style="background-color:rgb(185,152,103);height:160px;padding-left:30px;padding-top:30px" >
 
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


<div class="container-fluid" style="background-color:rgb(41,64,87);height:45px;color:white;text-align:center;padding-top:15px;" >
    Copyright ©2017 - ALLBUYBACK 股份有限公司
</div>
<!----------footer結束-------------->





</body>
</html>