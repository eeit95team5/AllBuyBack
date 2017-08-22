<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	 
// 		$('#seller').click(function() {

// 			$.get("<c:url value='/ChatController'/>", {
// 				"action" : "MessageFromBuyer","id" : ${LoginOK.m_id}
// 			}, function(data) {
// 				$('#show').html(data)

// 			});

// 		});
		
   	 $('#seller').click(function(){
			var id = $('#m_id').val();
			//var s_id = $('#s_id').val();
			
//	 		console.log(i_id);
				window.open('ChatController?action=MessageFromBuyer&id='+id,'購買AllBuyBack廣告',
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
	             <img src="<c:url value='/UpdateDataServlet?status=selectPic&id=${shop.s_id }' />"  style="width:120px;height:120px;border-radius:99em;border:2px white solid;margin-top:-70px;margin-left:30px;z-index:2;position: absolute;">
	             <span class="glyphicon glyphicon-plane" style="color:#FFB90F;font-size:25px;margin-top: 60px;margin-left: 25px"></span><span class="glyphicon glyphicon-plane" style="color:#FFB90F;font-size:25px;"></span><span class="glyphicon glyphicon-plane" style="color:#FFB90F;font-size:25px;"></span><span class="glyphicon glyphicon-plane" style="color:#FFB90F;font-size:25px;"></span><span class="glyphicon glyphicon-plane" style="color:#FFB90F;font-size:25px;"></span>
	             <div id="sellerName" style="padding-top:10px;margin-top:-90px;margin-left:200px;font-family:微軟正黑體;font-size:22px;font-weight:600;letter-spacing:3px;">${member.m_name}</div>
                  <span class="glyphicon glyphicon-map-marker" style="position:absolute;top:70px;left:200px;font-size: 18px;"></span><div id="livingIn" style="position:absolute;top:67px;left:230px;font-family:微軟正黑體;font-size:18px;font-weight:500;letter-spacing:3px;">住在:台中</div>
                  <span class="glyphicon glyphicon-shopping-cart" style="position:absolute;top:70px;left:350px;font-size: 18px;"></span> <div id="livingIn" style="position:absolute;top:67px;left:380px;font-family:微軟正黑體;font-size:18px;font-weight:500;letter-spacing:3px;">代購區域:<c:if test="${not empty countrys}"><c:forEach items="${countrys}" var="country" varStatus="i">${country }<c:if test="${not i.last}" >、</c:if></c:forEach></c:if></div>
                  <span id="2spanmsg" style="position:absolute;top:40px;left:850px;font-size: 18px;"></span>
                  <c:choose>
                  <c:when test="${LoginOK.m_id == shop.s_id }">
                  <button id="keep_shop" style="position:absolute;top:1px;left:830px;color:white;font-family:微軟正黑體;font-size:18px;background-color: gray;border:gray;border-radius:15px 15px;padding:5px 15px"><span class="glyphicon glyphicon-eye-open" style="margin-right:6px;"></span>新增商品</button>
                  <button style="position:absolute;top:1px;left:960px;color:white;font-family:微軟正黑體;font-size:18px;background-color:rgb(42,186,171);border:rgb(42,186,171);border-radius:15px 15px;padding:5px 15px"><span class="glyphicon glyphicon-plane" style="margin-right:6px;"></span>修改商店資訊</button>
                  </c:when>
                  <c:otherwise>
                  <button id="keep_shop" style="position:absolute;top:1px;left:850px;color:white;font-family:微軟正黑體;font-size:18px;background-color: gray;border:gray;border-radius:15px 15px;padding:5px 15px"><span class="glyphicon glyphicon-eye-open" style="margin-right:6px;"></span>訂閱我</button>
                  <button style="position:absolute;top:1px;left:980px;color:white;font-family:微軟正黑體;font-size:18px;background-color:rgb(42,186,171);border:rgb(42,186,171);border-radius:15px 15px;padding:5px 15px"><span class="glyphicon glyphicon-plane" style="margin-right:6px;"></span>找我報價</button>                  
                  </c:otherwise>
                  </c:choose>
                  
                  <button id="seller"><span class="glyphicon glyphicon-plane" style="margin-right:6px;"></span>買家訊息</button>
			      <input type="hidden" name="m_id" id="m_id" value="${LoginOK.m_id}"> 
<%-- 			<input type="hidden" name="m_account" value="${LoginOK.m_account}"> --%>
<%-- 			<input type="hidden" name="s_id" id="s_id" value="${OrderVO.s_id}">  --%>
                 
           </div>
           <div style="height:150px;background-color:rgb(235,179,179);color:white;font-family:微軟正黑體;font-size:16px;font-weight:500;letter-spacing:3px;text-align: center;padding:30px  150px;">${shop.s_aboutMe}</div>
      </div>
   </div>
</div><!-- 上半部賣家個人介紹結束 -->

<!-- 中間賣場本館商品 -->

<div class="container-fluid" style="background-color: white;height:1000px;">
	<div class="container">  
	   <div class="row">
	     <div class="col-sm-12">
	          <div style="text-align: center;margin-top:30px;font-size:30px;font-weight: 600;letter-spacing: 5px;margin-bottom: 25px;">本館商品</div>     
	     </div>  
	  </div>
	  
	<div class="row">
	     <div class="col-sm-3">
	     	<c:if test="${ not empty items[0][1]}">
	     		         <c:if test="${LoginOK.m_id == shop.s_id }"><a href="<c:url value="updateItem.html?i_id=${items[0][1]}"/>"><span class="glyphicon glyphicon-pencil" style="font-size:15px;margin-left:245px;margin-top: -25px"></span></a></c:if>
	        <div class="adOuter" >
	           <a href="<c:url value="item.html?i_id=${items[0][1]}"/>"><img class="imgsrc" src='ReadPictureForItem?i_id=${items[0][1]}&i_pictureX=1' ></a>
	           <div  class="adContent">${items[0][3] }</div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom">${items[0][18] }</div>
	             <div class="sellerWho" >${member.m_name}的賣場</div>
	        </div>
	        </c:if>
	      </div>
	       <div class="col-sm-3">
	     <c:if test="${ not empty items[1][1]}">
	     	       <c:if test="${LoginOK.m_id == shop.s_id }"><a href="<c:url value="updateItem.html?i_id=${items[1][1]}"/>"><span class="glyphicon glyphicon-pencil" style="font-size:15px;margin-left:245px;margin-top: -25px"></span></a></c:if>
	        <div class="adOuter" >
	           <a href="<c:url value="item.html?i_id=${items[1][1]}"/>"><img class="imgsrc" src="ReadPictureForItem?i_id=${items[1][1]}&i_pictureX=1" ></a>
	           <div  class="adContent">${items[1][3] }</div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom">${items[1][18] }</div>
	             <div class="sellerWho" >${member.m_name}的賣場</div>
	        </div>
	      </c:if>
	      </div>
	     <div class="col-sm-3">
	     <c:if test="${ not empty items[2][1]}">
	     	         <c:if test="${LoginOK.m_id == shop.s_id }"><a href="<c:url value="updateItem.html?i_id=${items[2][1]}"/>"><span class="glyphicon glyphicon-pencil" style="font-size:15px;margin-left:245px;margin-top: -25px"></span></a></c:if>
	        <div class="adOuter" >
	           <a href="<c:url value="item.html?i_id=${items[2][1]}"/>"><img class="imgsrc" src="ReadPictureForItem?i_id=${items[2][1]}&i_pictureX=1" ></a>
	           <div  class="adContent">${items[2][3] }</div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom">${items[2][18] }</div>
	             <div class="sellerWho" >${member.m_name}的賣場</div>
	        </div>
	        </c:if>
	      </div>
	      
	      <div class="col-sm-3">
	     <c:if test="${ not empty items[3][1]}">
	     	         <c:if test="${LoginOK.m_id == shop.s_id }"><a href="<c:url value="updateItem.html?i_id=${items[3][1]}"/>"><span class="glyphicon glyphicon-pencil" style="font-size:15px;margin-left:245px;margin-top: -25px"></span></a></c:if>
	        <div class="adOuter" >
	           <a href="<c:url value="item.html?i_id=${items[3][1]}"/>"><img class="imgsrc" src="ReadPictureForItem?i_id=${items[3][1]}&i_pictureX=1" ></a>
	           <div  class="adContent">${items[3][3] }</div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom">${items[3][18] }</div>
	             <div class="sellerWho" >${member.m_name}的賣場</div>
	        </div>
	        </c:if>
	      </div>
	      
<!-- 	      <div class="col-sm-3">	       -->
<!-- 	        <div style="height:365px;background-color: #CDCDC1" > -->
<!-- 	            <div style="color:gray;padding:10px  20px;font-family: 微軟正黑體;font-size:15px">分類:</div> -->
<!-- 	              <div style="color:black;font-family: 微軟正黑體;font-size:15px;">賣家自定義分類   -->
<%-- 	                   <a href="<c:url value="shop.html?s_id=${shop.s_id}"/>">全部</a> <br/> --%>
<%-- 	                   <c:forEach items="${shop_Class1 }" var="shopclass1" varStatus="i"> --%>
<%-- 	                   &nbsp;&nbsp;&nbsp;<a href="">${shopclass1.s_class1Name}<c:out value=" -- 折扣 ${shopclass1.s_discount }"></c:out></a><br/> --%>
<%-- 	                   <c:forEach items="${shop_Class2 }" var="shopclass2"> --%>
<%-- 	                   <c:if test="${shopclass1.s_class1 == shopclass2.s_class1}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">${shopclass2.s_class2Name}<c:out value=" -- 折扣 ${shopclass2.s_discount }"></c:out> </a><br/></c:if> --%>
<%-- 	                   </c:forEach> --%>
<%-- 	                   </c:forEach> --%>
<!-- 	              </div> -->
<!-- 	        </div> -->
<!-- 	      </div> -->
	     
	     
	    
	 </div>
	 
	 <br>
	 <div class="row">
	     <div class="col-sm-3">
	      <c:if test="${ not empty items[4][1]}">
	      	         <c:if test="${LoginOK.m_id == shop.s_id }"><a href="<c:url value="updateItem.html?i_id=${items[4][1]}"/>"><span class="glyphicon glyphicon-pencil" style="font-size:15px;margin-left:245px;margin-top: -25px"></span></a></c:if>
	        <div class="adOuter" >
	           <a href="<c:url value="item.html?i_id=${items[4][1]}"/>"><img class="imgsrc" src="ReadPictureForItem?i_id=${items[4][1]}&i_pictureX=1" ></a>
	           <div  class="adContent">${items[4][3] }</div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom">${items[4][18] }</div>
	             <div class="sellerWho" >${member.m_name}的賣場</div>
	        </div>
	        </c:if>
	      </div>
	     
	       <div class="col-sm-3">
	        <c:if test="${ not empty items[5][1]}">
	        	         <c:if test="${LoginOK.m_id == shop.s_id }"><a href="<c:url value="updateItem.html?i_id=${items[5][1]}"/>"><span class="glyphicon glyphicon-pencil" style="font-size:15px;margin-left:245px;margin-top: -25px"></span></a></c:if>
	        <div class="adOuter" >
	           <a href="<c:url value="item.html?i_id=${items[5][1]}"/>"><img class="imgsrc" src="ReadPictureForItem?i_id=${items[5][1]}&i_pictureX=1" ></a>
	           <div  class="adContent">${items[5][3] }</div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom">${items[5][18] }</div>
	             <div class="sellerWho" >${member.m_name}的賣場</div>
	        </div>
	        </c:if>
	      </div>
	      
	     <div class="col-sm-3">
	      <c:if test="${ not empty items[6][1]}">
	      	         <c:if test="${LoginOK.m_id == shop.s_id }"><a href="<c:url value="updateItem.html?i_id=${items[6][1]}"/>"><span class="glyphicon glyphicon-pencil" style="font-size:15px;margin-left:245px;margin-top: -25px"></span></a></c:if>
	        <div class="adOuter" >
	           <a href="<c:url value="item.html?i_id=${items[6][1]}"/>"><img class="imgsrc" src="ReadPictureForItem?i_id=${items[6][1]}&i_pictureX=1" ></a>
	           <div  class="adContent">${items[6][3] }</div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom">${items[6][18] }</div>
	             <div class="sellerWho" >${member.m_name}的賣場</div>
	        </div>
	        </c:if>
	      </div>
	      
	      <div class="col-sm-3">
	     <c:if test="${ not empty items[7][1]}">
	     	         <c:if test="${LoginOK.m_id == shop.s_id }"><a href="<c:url value="updateItem.html?i_id=${items[7][1]}"/>"><span class="glyphicon glyphicon-pencil" style="font-size:15px;margin-left:245px;margin-top: -25px"></span></a></c:if>
	        <div class="adOuter" >
	           <a href="<c:url value="item.html?i_id=${items[7][1]}"/>"><img class="imgsrc" src="ReadPictureForItem?i_id=${items[7][1]}&i_pictureX=1" ></a>
	           <div  class="adContent">${items[7][3] }</div>
	           <span class="glyphicon glyphicon-map-marker marker" ></span> 
	             <div id="country" class="countryFrom">${items[7][18] }</div>
	             <div class="sellerWho" >${member.m_name}的賣場</div>
	        </div>
	        </c:if>
	      </div>
	     
	    
	 </div>
	 
			   <!--分頁搜尋-->
	     <br><br>
		<div class="center">
		  <div class="pagination">
		    <a href="<c:url value="shop.html?s_id=${shop.s_id}&pageNO=1"/>">&laquo;</a>
	    	<c:if test="${(booksperpagebean.pageNo - 2 >= 1) && (booksperpagebean.pageNo - 2 <= booksperpagebean.totalPages)}"><a href="<c:url value="shop.html?s_id=${shop.s_id}&pageNO=${booksperpagebean.pageNo - 2}"/>">${booksperpagebean.pageNo - 2}</a></c:if>
	    	<c:if test="${(booksperpagebean.pageNo - 1 >= 1) && (booksperpagebean.pageNo - 1 <= booksperpagebean.totalPages)}"><a href="<c:url value="shop.html?s_id=${shop.s_id}&pageNO=${booksperpagebean.pageNo - 1}"/>">${booksperpagebean.pageNo - 1}</a></c:if>
	    	<c:if test="${(booksperpagebean.pageNo - 0 >= 1) && (booksperpagebean.pageNo - 0 <= booksperpagebean.totalPages)}"><a href="<c:url value="shop.html?s_id=${shop.s_id}&pageNO=${booksperpagebean.pageNo - 0}"/>" class="active">${booksperpagebean.pageNo - 0}</a></c:if>
	    	<c:if test="${(booksperpagebean.pageNo + 1 >= 1) && (booksperpagebean.pageNo + 1 <= booksperpagebean.totalPages)}"><a href="<c:url value="shop.html?s_id=${shop.s_id}&pageNO=${booksperpagebean.pageNo + 1}"/>">${booksperpagebean.pageNo + 1}</a></c:if>
	    	<c:if test="${(booksperpagebean.pageNo + 2 >= 1) && (booksperpagebean.pageNo + 2 <= booksperpagebean.totalPages)}"><a href="<c:url value="shop.html?s_id=${shop.s_id}&pageNO=${booksperpagebean.pageNo + 2}"/>">${booksperpagebean.pageNo + 2}</a></c:if>
		    <a href="<c:url value="shop.html?s_id=${shop.s_id}&pageNO=${booksperpagebean.totalPages }"/>">&raquo;</a>
		    <input type="number" id="pageNo" name="pageNo" min="1" max="${booksperpagebean.totalPages}"/><button type="button">前往</button><span>共${booksperpagebean.totalPages }頁</span>
		  </div>
		</div>
	 
  </div>
</div>

<!-- 下半部 賣家的商品、評價留言、關於我 -->
<div class="container"><!--商品下半部-->
    <div class="row">
        <div class="col-sm-12">
            <div style=" margin-top:30px; height:700px;background-color:rgb(255,255,255);letter-spacing:10px;margin-bottom: 60px;">
           
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
    	<div id="shop_message"></div>
    	<form>
		<input type="hidden" name="s_id" id="hidden" value="${shop.s_id }" />
		<input type="hidden" name="action" value="Insert" />
		<textarea name="sm_content" id="sm_content" ></textarea>
		<button type="button" id="submit">送出</button><span id="showerror">${errors.login }${errors.noempty }</span>
	</form>
      
    </div>
    
 </div>

</div><!--第四層div結束-->

   </div>
  </div>
</div>

<jsp:include page="_Footer.jsp"></jsp:include>
</body>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	getMessageJSON();
	$('#submit').click(function(){
		insertItemMessage();
	})
	$('#keep_shop').click(function(){
		keep_shop();
	})
	
})

function insertItemMessage(){
	if(<c:out value="${empty LoginOK}">true</c:out>){
		$('#showerror').html("請先登入才能留言");
	}else if( (<c:out value="${shop.s_id}">-2</c:out>) == (<c:out value="${LoginOK.m_id}">-1</c:out>) ){
		$('#showerror').html("不能在自己的賣場留言");			
	}else if(<c:out value="${not empty LoginOK}">false</c:out>){
		if(!$('#sm_content').val()){
			$('#showerror').html("請輸入留言");
		}else if($('#sm_content').val()){	
			$.post("<c:url value='/shopmessage.SPRINGcontroller'/>",
				{"action":"Insert",
				"s_id":<c:out value="${shop.s_id }">-2</c:out>,				
				"m_id":<c:out value="${LoginOK.m_id}">-1</c:out>,
				"sm_content":$('#sm_content').val()},				
				function(data){showJSON(data);})/*post結束*/
			$('#sm_content').val("");
		}/*if結尾*/
	}/*if結尾*/
}


function getMessageJSON(){
	$.post("<c:url value='/shop_messagejson.SPRINGcontroller'/>",{"s_id":<c:out value="${shop.s_id}">0</c:out>,"action":"Query"},function(data){
		showJSON(data);
	})
}
var v;
function rep(v){	
	var textarea = $('<textarea id=\"textarea' + v + '\"/>');
	var button =$('<button type=\"button\" onclick=\"rep2(' + v + ')\">送出</button>');
	var span = $('<span id=\"rep' + v + '\"></span>');
	$('#reply'+v).after(span).after(button).after(textarea).prop( "disabled", true );			
}

function rep2(v){
	if(!$('#textarea'+v).val()){
		$('#rep'+v).text("回覆不可為空白");
	}else {
		$.post("<c:url value='/shopmessage.SPRINGcontroller'/>",{"action":"Update","sm_id":$('#sm_id'+v).val(),"sm_reply":$('#textarea'+v).val()},function(data){console.log(data);showJSON(data);})
		$('#rep'+v).text("");
	}		
}

function hid(v){
	$.post("<c:url value='/shopmessage.SPRINGcontroller'/>",{"action":"Hidden","sm_id":$('#sm_id'+v).val()},function(data){console.log(data);showJSON(data);})	
}

function showJSON(data2){
	var data = JSON.parse(data2);
	var docFragment = $(document.createDocumentFragment());				 
	for(var i=0;i<data.msgs.length;i++){
		var sm_hidden = data.msgs[i].sm_hidden;		
		var sm_id = data.msgs[i].sm_id;
		var s_id = data.msgs[i].s_id;
		var m_id = data.msgs[i].m_id;
		var sm_content = data.msgs[i].sm_content;					 
		var sm_date = data.msgs[i].sm_date;					 
		var sm_reply = data.msgs[i].sm_reply;
		var sm_replyDate = data.msgs[i].sm_replyDate;					 
		var sm_state = data.msgs[i].sm_state;
		var div = $("<div style=\"border-bottom:1px solid;background-color:#FFC78E\"></div>").html(m_id+" 於 "+sm_date+" 留言：<br/>"+sm_content);
		if((<c:out value="${LoginOK.m_id}">-1</c:out>) == s_id){			
			var hidden = $('<input type="hidden" id="sm_id' + i + '" value="' + sm_id + '"/>');
			var reply = $('<button type=\"button\" id=\"reply' + i + '\" value=\"' + i + '\" >回覆</button>');
			var hiddenB = $('<button type=\"button\" id=\"hiddenB' + i +'\" value=\"' + i + '\">隱藏</button>');
			var span = $('<span style=\"font-size:12px;color:blue\" id=\"spanmsg' + i + '\"></span><br/>');
			div.append(hidden).append(reply).append(hiddenB).append(span);
		}
		if(sm_hidden == 2 && m_id == (<c:out value="${LoginOK.m_id}">0</c:out>)){
			var span =$('<span style=\"font-size:12px;color:blue\">此留言已被隱藏</span>');
			div.append(span);
		}		
		if(sm_state == 2){
			var div2 = $('<div style="border:1px solid;margin:10px 10px 10px 40px;background-color:#FFDCB9"></div>').html(s_id + "於" + sm_replyDate + "回覆：<br/>" + sm_reply + "<br/>");
			div.append(div2);
		}
		if(sm_hidden != 2){
			docFragment.append(div);	
		}else if(<c:out value="${not empty LoginOK}">false</c:out>){
			if(s_id == <c:out value="${LoginOK.m_id}">-1</c:out>){				
				docFragment.append(div);
			}
			if(m_id == <c:out value="${LoginOK.m_id}">-1</c:out>){				
				docFragment.append(div);
			}
		}					
	}
	$('#shop_message').empty()
	$('#shop_message').append(docFragment);	
	if((<c:out value="${LoginOK.m_id}">-1</c:out>) == s_id){
		for(var i=0;i<data.msgs.length;i++){
			$('#reply'+i).click(function(){
				rep($(this).val());
			})
			$('#hiddenB'+i).click(function(){
				hid($(this).val());
			})
			if(data.msgs[i].sm_state==2){
				$('#reply'+i).prop("disabled", true);
			}
			if((data.msgs[i].sm_hidden)==2){
				$('#spanmsg'+i).text("留言狀態：隱藏");
			}else if((data.msgs[i].sm_hidden)==1){
				$('#spanmsg'+i).text("留言狀態：公開");			
			}
		}
	}
}


function keep_shop(){
	if(<c:out value="${empty LoginOK}">true</c:out>){
		$('#2spanmsg').text("請先登入");
	}else{
		$('#2spanmsg').text("test");		
		$.post("<c:url value='/keep_shop.SPRINGcontroller'/>",{"action":"Insert","m_id":<c:out value="${LoginOK.m_id}">0</c:out>,
			"s_id":<c:out value="${shop.s_id}">0</c:out>},function(){
				$('#2spanmsg').text("已將商店加入收藏");
			})			
	}
}
</script>
</html>