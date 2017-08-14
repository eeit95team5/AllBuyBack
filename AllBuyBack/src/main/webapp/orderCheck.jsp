<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="styles/main.css"/>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.css">
<link rel="stylesheet" href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="webjars/sweetalert/1.1.3/dist/sweetalert.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script>
<!-- <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- <script src=" http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> -->
<style>
	#mainBody{
		width:1024px;
		margin:auto;
	}
	#middleDiv, #footerDiv, #endDiv{
		width:1024px;
		margin:auto;
		text-align: center;
	}
	input[type="text"] , textarea{
		border-radius:5px;
		border:1px solid gray;
	}
	.memo{
		width:200px;
		white-space:normal;
		overflow:auto;
	}
	#lastTable{
		margin-bottom: 0px;
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
<script>
     $(function() {
        $( "#dialog" ).dialog({
           autoOpen: false,  
        });
        $( "#goComment" ).click(function() {
           $( "#dialog" ).dialog( "open" );
        });
        
     });
     
    
     $('#shipWay').change(function(){
    	var sw_id = $(this).val();
    	var newPrice = Number($('#'+sw_id).val());
      	var tolPrice = Number($('#o_tolPrice').text());
      	var point = Math.floor(Number($('#theO_point').val())/10);
       	$('#o_lastPrice').val((newPrice+tolPrice)-point);
       	$('#sw_id').val(sw_id);
       	$('#lastPricePrint').text(newPrice+tolPrice-point);
       	$('#sw_price').text(newPrice);
     });
     $('#cannelSubmit').click(function (e){
    	 var form = $(this).parents('#aform');
      	 console.log(form);
         e.preventDefault();
         swal({
        	  title: "真的要取消此訂單?",
        	  text: "沒買到好像會後悔，還是繼續買吧!",
        	  type: "warning",
        	  showCancelButton: true,
        	  confirmButtonColor: "#DD6B55",
        	  confirmButtonText: "取消訂單",
        	  cancelButtonText: "再讓我想想",
        	  closeOnConfirm: false
        	},
        	function(isConfirm){
        		if(isConfirm){
        			form.submit();
        		}
        	}
        );
     });
     $('#theSubmit').click(function(e){
    	 var form = $(this).parents('form');
    	 e.preventDefault();
    	 swal({
       	  title: "即將正式出單",
       	  text: "送出訂單後將不能再更改，只有在賣場收單前可以取消。",
       	  showCancelButton: true,
       	  confirmButtonColor: "#AEDEF4",
       	  confirmButtonText: "立刻送出",
       	  cancelButtonText: "再等等",
       	  closeOnConfirm: false
       	},function(isConfirm){
       		if(isConfirm){
       			form.submit();
       		}
       	});
     });
     $('#theO_point').change(function(e){
    	 var point = Number($(this).val());
    	 if(point%10!=0){
    		 swal({
    			 title: "點數將會浪費",
    			 text: "每10點折扣1元，個位數的部分將無作用，建議您修改確認"
    		 });
    	 }
    	 var sw_price = Number($('#sw_price').text());
    	 var tolPrice = Number($('#o_tolPrice').text());
    	 var dis = Math.floor(point/10);
    	 $('#lastPricePrint').text(tolPrice + sw_price - dis);
    	 $('#o_lastPrice').val(tolPrice + sw_price - dis);
     });
</script>
</head>
<body>
<!-- 登錄與未登錄開始 -->
<c:if test="${LoginOK==null}">
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
</c:if>
<!-- 差異間隔 -->
<c:if test="${LoginOK!=null}">
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

         <div class="myPicture">
             <img src="images/myPicture.jpg"/>
         </div>
<!------------------->

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
   

<!-------------------->
   
              </div><!--col-sm-12--> 
            </div><!--row--> 
          </div><!--container--> 
      </div><!--container-fluid-->
</nav>
</c:if>
<!-- 登錄與未登錄結束 -->
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


<!-- 主頁面開始 -->
<c:if test="${! empty OrderVO}">
<h1 align="center">訂單詳情</h1>
<form action="Order.do" method="post">
<div id="mainBody">
<table class="table">
	<tr class="info">
		<td colspan="4" style="text-align: center">訂單資訊</td>
		
	</tr>
		<tr>
			<td><label>訂單編號:</label>${OrderVO.o_id}</td>
			<td><label>賣場:</label><a href="shop.html?s_id=${OrderVO.s_id}">${s_name}</a></td>
			<td><label>購買者:</label>${LoginOK.m_name}</td>
			<td><label>交易階段:</label>${orderStatus}</td>
		</tr>
		<tr>
		<c:if test="${OrderVO.o_procss == 1}">
			<td><label>收件者:</label><input type="text" name="o_recipient" value="${OrderVO.o_recipient}" /></td>
			<td><label>收件地址:</label><input type="text" name="o_address" value="${OrderVO.o_address}" /></td>
			<td>
				<label>付款方式:</label>
				<select name="pay_id" id="pay_id">
						<option value="郵局匯款" <c:if test="${OrderVO.pay_id=='郵局匯款'}">selected</c:if>>郵局匯款</option>
						<option value="約定帳戶轉帳" <c:if test="${OrderVO.pay_id=='約定帳戶轉帳'}">selected</c:if>>約定帳戶轉帳</option>
						<option value="信用卡一次付清" <c:if test="${OrderVO.pay_id=='信用卡一次付清'}">selected</c:if>>信用卡一次付清</option>
						<option value="超商付款" <c:if test="${OrderVO.pay_id=='超商付款'}">selected</c:if>>超商付款</option>
				</select>
			</td>
			<td rowspan="2">
				<label style="vertical-align:text-bottom;">備註:</label>
				<textarea name="o_memo" cols="30" rows="4" style="resize:none;">${OrderVO.o_memo}</textarea>
			</td>
		</c:if>
		<c:if test="${OrderVO.o_procss != 1}">
			<td><label>收件者:</label>${OrderVO.o_recipient}</td>
			<td><label>收件地址:</label>${OrderVO.o_address}</td>
			<td><label>付款方式:</label>${OrderVO.pay_id}</td>
			<td rowspan="2">
				<label style="vertical-align:text-bottom">備註:</label>
				<textarea name="o_memo" cols="30" rows="4" style="resize:none;" readonly>${OrderVO.o_memo}</textarea>
			</td>
		</c:if>
		</tr>
		<tr>
			<td><label>下單時間:</label>${OrderVO.o_date}</td>
			<td><label>付款時間:</label>${OrderVO.o_remitDate}</td>
			<td><label>出貨時間:</label>${OrderVO.o_sendDate}</td>
		</tr>
</table>
</div>
<div id="middleDiv">
<table class="table" id="middleTable">
	<tr class="success"><td colspan="5">商品清單</td></tr>
		<tr>
			<td>商品名稱</td>
			<td>數量</td>
			<td>單價</td>
			<td>小計</td>
			<td class="memo">備註</td>
		</tr>
		<c:forEach var="orderListVO" items="${orderList}" varStatus="vs">
			<tr align="center" valign="middle" class="index">
				<td class="i_name ${vs.index}">${itemList[vs.index].i_name}</td>
				<td class="ol_quantity ${vs.index}">${orderListVO.ol_quantity}</td>
				<td class="ol_price ${vs.index}">${orderListVO.ol_price}</td>
				<td class="sum_price ${vs.index}">${orderListVO.ol_price * orderListVO.ol_quantity}</td>
				<td><div class="memo">${orderListVO.ol_memo}</div></td>
			</tr>
		</c:forEach>
</table>
<table class="table" id="lastTable" style="table-layout:fixed">
	<tr class="danger"><td colspan="5">結算</td></tr>
		<tr>
			<td>總金額</td>
			<td>折扣點數</td>
			<td>運送方式</td>
			<td>運費</td>
			<td>成交價</td>
		</tr>
		<tr>
			<td id="o_tolPrice">${OrderVO.o_tolPrice}</td>
			<c:choose>
				<c:when test="${OrderVO.o_procss == 1}">
					<td><input type="text" id="theO_point" title="每10點折扣1元" name="o_point" size="4" value="${OrderVO.o_point}" /></td>
					<td>
						<select id="shipWay">
						<c:forEach var="shipways" items="${shipwayList}">
							<c:if test="${shipways.sw_id eq shipway.sw_id}">
								<option value="${shipways.sw_id}" selected >${shipways.sw_name}</option>
							</c:if>
							<c:if test="${shipways.sw_id != shipway.sw_id}">
								<option value="${shipways.sw_id}" >${shipways.sw_name}</option>
							</c:if>
						</c:forEach>
						</select>
					</td>
					<td id="sw_price">${shipway.sw_price}</td>
					<input type="hidden" id="sw_id" name="sw_id" value="${shipway.sw_id}" />
					<input type="hidden" id="o_lastPrice" name="o_lastPrice" value="${OrderVO.o_lastPrice}" />
					<td id="lastPricePrint" style="background:#FFA042">${OrderVO.o_lastPrice}</td>
				</c:when>
				<c:otherwise>
					<td>${OrderVO.o_point}</td>
					<td>${shipway.sw_name}</td>
					<td>${shipway.sw_price}</td>
					<td style="background:#FFA042">${OrderVO.o_lastPrice}</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<c:if test="${OrderVO.o_procss == 1}">
		<tr>
			<td colspan="4"></td>
			<td>
				<input type="submit" value="確定修改" class="btn btn-info"/>
				<input type="hidden" name="action" value="modifyFromC"/>
				<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
			</td>
		</tr>
		</c:if>
</table>
</div>
</form>
<div id="footerDiv">
<c:if test="${OrderVO.o_procss > 0}">
<table class="table" id="endTable" style="table-layout:fixed">
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<c:if test="${OrderVO.o_procss == 1 || OrderVO.o_procss == 2}">
			<td>
			<form id="aform" action="Order.do" method="post">
				<input type="submit" value="取消訂單" id="cannelSubmit" class="btn btn-danger"/>
				<input type="hidden" name="action" value="cannel"/>
				<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
			</form>
			</td>
			</c:if>
		<c:if test="${OrderVO.o_procss != 1 && OrderVO.o_procss != 2}"><td></td></c:if>
		<c:if test="${OrderVO.o_procss >= 1 && OrderVO.o_procss <= 5}">
		<td>
		<form action="Order.do" method="post" id="theForm">
			<c:if test="${OrderVO.o_procss == 1}">
				<input type="submit" id="theSubmit" value="確定送出" class="btn btn-primary"/>
				<input type="hidden" name="action" value="confirmNext"/>
				<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
			</c:if>
			<c:if test="${OrderVO.o_procss == 2}">
				<p>訂單已送出，等待賣家收單...</p>
			</c:if>
			<c:if test="${OrderVO.o_procss == 3}">
				<input type="submit" value="完成付款" class="btn btn-primary"/>
				<input type="hidden" name="action" value="remit"/>
				<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
			</c:if>
			<c:if test="${OrderVO.o_procss == 4}">
				<p>完成付款，等待賣家出貨中...</p>
			</c:if>
			<c:if test="${OrderVO.o_procss == 5}">
				<p>賣家已出貨，是否到貨？</p>
				<input type="submit" value="確認到貨" class="btn btn-primary"/>
				<input type="hidden" name="action" value="confirmNext"/>
				<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
			</c:if>
		</form>
		</td>
		</c:if>
		<c:if test="${OrderVO.o_procss == 6}">
			<td>
				<c:if test="${OrderVO.s_commentStatus == 1}">
					<div id="dialog" title="請給予賣場評價" style='display:none'>
					<form action="Order.do" method="post">
						<label>評分：</label><input type="text" name="s_score" value="5" />(1~5分)<br>
						<label>評價：</label><textarea name="s_comment"></textarea>
						<input type="submit" value="送出評價" class="btn btn-primary"/>
						<input type="hidden" name="action" value="commentFromC"/>
						<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
					</form>
					</div>
					<input type="button" id="goComment" value="進行評價" class="btn btn-primary"/>
				</c:if>
				<c:if test="${OrderVO.s_commentStatus == 0}">
					<p>您已經給予評價囉!</p>
				</c:if>
				<c:if test="${OrderVO.m_commentStatus == 0}">
					<br />
					<p>對方給您 ${OrderVO.m_score} 的評價，<br />評價內容為：${OrderVO.m_comment}</p>
				</c:if>
				<c:if test="${OrderVO.m_commentStatus == 1}">
					<br />
					<p>對方尚未進行評價</p>
				</c:if>
			</td>
			</c:if>
			
	</tr>	
</table>
	</c:if>
</div>
</c:if>
<div id="endDiv">
	<c:if test="${OrderVO.o_procss <= 0}">
		<p>本訂單已關閉交易</p>
	</c:if>
	<c:if test="${OrderVO.o_procss == 7}">
		<p>本訂單已完成交易，雙方已給予評價</p>
	</c:if>
	<c:if test="${! empty res}"><p>${res}</p></c:if>
	<c:if test="${! empty errorMsgs}"><p>${errorMsgs}</p></c:if>
	<a href="Order.do?action=cGetAll">返回我的購買訂單</a><br>
	<a href="index.jsp">回首頁</a>
	<c:forEach var="ship" items="${shipwayList}">
		<input type="hidden" value="${ship.sw_price}" id="${ship.sw_id}" />
	</c:forEach>
</div>

<!-- 主頁面結束 -->
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
</body>
</html>