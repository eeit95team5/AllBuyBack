<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的賣場</title>
  
    <link rel="stylesheet" href="styles/main.css"/>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
<link rel="stylesheet" href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="webjars/sweetalert/1.1.3/dist/sweetalert.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script>

 <link rel="stylesheet" href="styles/ad.css"/>

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

.myActive  {
    border-top:pink 5px solid;
}



  
/*-------評價留言部分------*/

.imgP{
  width:90px;
  height:90px;
  border-radius:99em;
  border:2px white solid;
  margin-top:10px;
  margin-left:30px;
}

.name{
  position:absolute;
  top:25px;
  left:150px;
  letter-spacing: 2px;
  font-weight: 600;
}
.buy{
  position:absolute;
  top:25px;
  left:230px;
  letter-spacing: 2px;
  color:gray;
}
.time{
  position:absolute;
  top:25px;
  left:980px;
  letter-spacing: 2px;
  color:gray;
}
.buyWhat{
  position:absolute;
  top:1px;/*a 的距離設定比較特殊*/
  left:60px;
  letter-spacing: 2px;
  color:red;
  width:600px;
  background-color: yellow;

}

.saySomething{
  position:absolute;
  top:60px;
  left:150px;
  letter-spacing: 2px;
/*   font-weight: 600; */
  font-size:18px;
  font-family:微軟正黑體;

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
</style>
<script type="text/javascript">

$(function() {
	
	 $('#seller').click(function(){
			var id = $('#m_id').val();
// 			var s_id = $('#s_id').val();
			
//	 		console.log(i_id);
				window.open('ChatController?action=MessageFromSeller&id='+id,'購買AllBuyBack廣告',
						'height=650,width=650,scrollbars=0,resizable=0,location=0');
				
				
				
		});
});


</script>
</head>
<body style="background-color:rgb(234,234,234)">
<jsp:include page="includeTop.jsp"></jsp:include>

<!-- 上半部賣家個人介紹 -->
<div class="container" style="margin-top: 40px;margin-bottom: 30px;">
   <div class="row">
      <div class="col-sm-12">
          <div style="background-color: white;height:300px;"><img src="images/shop3.jpg" style="background-color: gray;width:1140px;height:280px;z-index:1;position: absolute;"></div>
           <div style="background-color: white;height:100px;position: relative;">
	             <img src="images/myPicture.jpg"  style="width:120px;height:120px;border-radius:99em;border:2px white solid;margin-top:-70px;margin-left:30px;z-index:2;position: absolute;">
	             <span class="glyphicon glyphicon-plane" style="color:#FFB90F;font-size:25px;margin-top: 60px;margin-left: 25px"></span><span class="glyphicon glyphicon-plane" style="color:#FFB90F;font-size:25px;"></span><span class="glyphicon glyphicon-plane" style="color:#FFB90F;font-size:25px;"></span><span class="glyphicon glyphicon-plane" style="color:#FFB90F;font-size:25px;"></span><span class="glyphicon glyphicon-plane" style="color:#FFB90F;font-size:25px;"></span>
	             <div id="sellerName" style="padding-top:10px;margin-top:-90px;margin-left:200px;font-family:微軟正黑體;font-size:22px;font-weight:600;letter-spacing:3px;">LOVE ShaSha 樂芙夏夏</div>
                  <span class="glyphicon glyphicon-map-marker" style="position:absolute;top:70px;left:200px;font-size: 18px;"></span><div id="livingIn" style="position:absolute;top:67px;left:230px;font-family:微軟正黑體;font-size:18px;font-weight:500;letter-spacing:3px;">住在:台中</div>
                  <span class="glyphicon glyphicon-shopping-cart" style="position:absolute;top:70px;left:350px;font-size: 18px;"></span> <div id="livingIn" style="position:absolute;top:67px;left:380px;font-family:微軟正黑體;font-size:18px;font-weight:500;letter-spacing:3px;">代購區域:日本、韓國、香港</div>
                   
                  <button style="position:absolute;top:1px;left:850px;color:white;font-family:微軟正黑體;font-size:18px;background-color: gray;border:gray;border-radius:15px 15px;padding:5px 15px"><span class="glyphicon glyphicon-eye-open" style="margin-right:6px;"></span>訂閱我</button>
                  <button style="position:absolute;top:1px;left:980px;color:white;font-family:微軟正黑體;font-size:18px;background-color:rgb(42,186,171);border:rgb(42,186,171);border-radius:15px 15px;padding:5px 15px"><span class="glyphicon glyphicon-plane" style="margin-right:6px;"></span>找我報價</button>
                  <button id="seller"><span class="glyphicon glyphicon-plane" style="margin-right:6px;"></span>買家訊息</button>
			      <input type="hidden" name="m_id" id="m_id" value="${LoginOK.m_id}"> 
<%-- 			<input type="hidden" name="m_account" value="${LoginOK.m_account}"> --%>
<%-- 			<input type="hidden" name="s_id" id="s_id" value="${OrderVO.s_id}">  --%>
                 
           </div>
           <div style="height:150px;background-color:rgb(235,179,179);color:white;font-family:微軟正黑體;font-size:16px;font-weight:500;letter-spacing:3px;text-align: center;padding:30px  150px;">{LOVE ShaSha 樂芙夏夏} 8/13~8/18 日本東京連線代購...✈ "日本美妝、服飾包包、伴手禮以及日本迪士尼的全系列商品皆可代購噢！ ♡♡有需要什麼日本代購商品，歡迎聯絡我們提單詢問喔！公告更新時間：2017/07/24 23:21:38</div>
      </div>
   </div>
</div><!-- 上半部賣家個人介紹結束 -->

<!-- 中間賣場本館商品 -->

<div class="container-fluid" style="background-color: wheat;height:1000px;">
	<div class="container">  
	   <div class="row">
	     <div class="col-sm-12">
	          <div style="text-align: center;margin-top:30px;font-size:30px;font-weight: 600;letter-spacing: 5px;margin-bottom: 25px;">本館商品</div>     
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
	        <div style="height:365px;background-color: #CDCDC1" >
	            <div style="color:gray;padding:10px  20px;font-family: 微軟正黑體;font-size:15px">分類:</div>
	              <div style="color:black;font-family: 微軟正黑體;font-size:15px;"><!-- 賣家自定義分類 -->  
	                   <a>全部</a>
	              </div>
	        </div>
	      </div>
	     
	     
	    
	 </div>
	 
	 <br>
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
	     
	    
	 </div>
	 
			   <!--分頁搜尋-->
	     <br><br>
		<div class="center">
		  <div class="pagination">
		    <a href="#">&laquo;</a>
		    <a href="#"  class="active">1</a>
		    <a href="#">2</a>
		    <a href="#">3</a>
		    <a href="#">4</a>
		    <a href="#">5</a>
		    <a href="#">&raquo;</a>
		  </div>
		</div>
	 
  </div>
</div>

<!-- 下半部 賣家的商品、評價留言、關於我 -->
<div class="container"><!--商品下半部-->
    <div class="row">
        <div class="col-sm-12">
            <div style=" margin-top:30px; height:700px;background-color:rgb(255,255,255);letter-spacing:10px;">
           
  <ul class="nav nav-tabs">
    <li class="active myActive" style="font-family:微軟正黑體;font-size:18px;letter-spacing:4px;font-weight:600"><a data-toggle="tab" href="#menu1">我的評價留言</a></li>
    <li  style="font-family:微軟正黑體;font-size:18px;letter-spacing:4px;font-weight:600"><a data-toggle="tab" href="#menu2">留言板</a></li>

  </ul>

  <div class="tab-content">
    <div id="menu1" class="tab-pane fade in active">
	   <!-- 一個人的留言區塊 -->
	   <div style="position: relative;">
	   <img src="images/myPicture.jpg"  class="imgP" >
       <div class="name" >米老鼠</div>
       <div class="buy" >代購了:<a href="" class="buyWhat" >棒球帽</a></div>
       <div class="time" >顯示時間</div>
       <div class="saySomething">包裝精美，謝謝!</div>
       </div><br>
       <!-- 一個人的留言結束 -->
       <!-- 一個人的留言區塊 -->
	   <div style="position: relative;">
	   <img src="images/myPicture.jpg"  class="imgP" >
       <div class="name" >米老鼠</div>
       <div class="buy" >代購了:<a href="" class="buyWhat" >棒球帽</a></div>
       <div class="time" >顯示時間</div>
       <div class="saySomething">包裝精美，謝謝!</div>
       </div><br>
       <!-- 一個人的留言結束 -->
       
     
    
    
    
    </div><!-- 評價留言結束 -->
    
    <div id="menu2" class="tab-pane fade">
      
    </div>
    
  
 </div>

</div><!--第四層div結束-->

   </div>
  </div>
</div>
  



<jsp:include page="_Footer.jsp"></jsp:include>
</body>
</html>