<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>(未登入)首頁</title>

    <link rel="stylesheet" href="styles/main.css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script src="js/bootstrap.min.js"></script> 

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="styles/ad.css"/>
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
.icon-success {  /*改變bootstrap icon的顏色*/
 color: #FFB90F;
   float:left;
}

</style>
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
          <button class="btn btn-default" type="submit" style="height:34px">
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


<!--廣告看板開始-->
<div class="container-fluid" style="margin-top:60px; background-color:rgb(41,64,87);height:470px;">
<div class="container" style="margin-bottom:18px;">
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
        <img src="images/minions-compressor.jpg" alt="" style="width:100%;">
        <div class="carousel-caption">
        </div>
      </div>

      <div class="item">
        <img src="images/nordstrom.png" alt="" style="width:100%;">
        <div class="carousel-caption">
        </div>
      </div>
    
      <div class="item">
        <img src="images/unboxwall.jpg" alt="" style="width:100%;">
        <div class="carousel-caption">
        </div>
      </div>

     <div class="item">
        <img src="images/summerfashion.jpg" alt="" style="width:100%;">
        <div class="carousel-caption">
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
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
</div><!--container-fluid結束-->
<!--廣告看板 結束-->


<!--快速搜尋國家 開始-->
<div class="container-fluid" style="background-color:rgb(185,152,103);height:60px;">
    <div class="container"">
     <div class="row">
        <div class="col-sm-12">
            <span style="font-family:微軟正黑體;line-height:60px;font-size:20px;font-weight:600;
                         color:white;float:left;margin-right:10px">您想找哪一國代購 :</span>

<!--          <div class="input-group" style="width:200px;line-height:50px;float:left;margin-right:20px">
               <input type="text" class="form-control" placeholder="請選擇..." style="margin-top:8px"/>
                 <div class="input-group-btn">
                   <button class="btn btn-default" type="submit" >
                   <i class="glyphicon glyphicon-triangle-bottom" ></i>
                  </button>
                 </div>
           </div>-->

<form style="margin-bottom:10px; display: inline;"><!--複製go1buy1 網頁原始碼-->
	  <select data-placeholder="請選擇…"  name="" id="selectCountry" style="width:180px;height:30px;color:gray">
            <optgroup label="美洲">
            <option value="US">United States - 美國</option>
            <option value="CA">Canada - 加拿大</option>
            <optgroup label="歐洲">
            <option value="UK">United Kingdom - 英國</option>
            <option value="FR">France - 法國</option>
            <option value="DE">Germany - 德國</option> 
            <option value="ES">Spain - 西班牙</option> 
            <option value="IT">Italy - 義大利</option>  
            <option value="GR">Greece - 希臘</option> 
            <option value="BE">Belgium - 比利時</option>
            <option value="PT">Portugal - 葡萄牙</option>
            <option value="DK">Denmark - 丹麥</option>
            <option value="NL">Netherlands - 荷蘭</option>
            <optgroup label="亞洲">
            <option value="JP">Japan - 日本</option> 
            <option value="KR">Korea - 韓國</option>
            <option value="TH">Thailand - 泰國</option>
            <option value="HK">Hong Kong - 香港</option> 
            <option value="SG">Singapore - 新加坡</option>
	      </select>
	    <input type="text" name="ref" style="display:none;" value="index"/><!--作用?-->
 </form>

           <span class="hotSearch" >熱門 : 
               <a href="#">美國代購 </a> |
               <a href="#">日本代購 </a> | 
               <a href="#">韓國代購 </a> |
               <a href="#">英國代購 </a> |
               <a href="#">法國代購 </a> |
          </span>
       
             </div><!--col-sm-12-->
     </div><!--row-->
  </div><!--container-->
</div>
 <!--快速搜尋國家 結束-->
<br /><br />

<!--兩邊空白    廣告內容------->
<div class="container">
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
            <h1 style="text-align:center;font-weight:700">編輯精選</h1>
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