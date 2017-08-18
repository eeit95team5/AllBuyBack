<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>單一商品頁面</title>
    
    <link rel="stylesheet" href="styles/main.css"/>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
<link rel="stylesheet" href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="webjars/sweetalert/1.1.3/dist/sweetalert.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script>

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
 		$('#eyeCount').attr("style","position:absolute;top:60px;left:35px;border-radius:5px 5px;background-color:black;color:white;font-size:10px;padding:2px 5px;display:block;");
 	});

 	
 	$("#eye").mouseout(function() {
 		$('#eyeCount').attr("style","display:none;");
 	});
     /*---------------------------------------------------*/
     
      	$("#heart").mouseover(function() {
 		$('#heartCount').attr("style","position:absolute;top:60px;left:100px;border-radius:5px 5px;background-color:black;color:white;font-size:10px;padding:2px 5px;display:block;");
 	});

 	
 	$("#heart").mouseout(function() {
 		$('#heartCount').attr("style","display:none;");
 	});

     
    /*----------------------------------------------------*/
    
    
    $("#shoppingCart").mouseover(function() {
 		$('#shoppingCartCount').attr("style","position:absolute;top:60px;left:160px;border-radius:5px 5px;background-color:black;color:white;font-size:10px;padding:2px 5px;display:block;");
 	});

 	
 	$("#shoppingCart").mouseout(function() {
 		$('#shoppingCartCount').attr("style","display:none;");
 	});

 	
    /*----------------------------------------------------*/
    	
 	$("#addToCart").click(function() {
 		if(${empty LoginOK}){
 			$('#ab123').dialog('open');
 		}else{
 		var i_id = $('#i_id').val();
 		var s_id = $('#s_id').val();
 		console.log("ok");
 		var ol_quantity = $('#ol_quantity').val();
 		$.post("ShoppingCart.go",{'action':"addToCart",'i_id':i_id,'s_id':s_id,'ol_quantity':ol_quantity},
 			function(data){
 			var json = JSON.parse(data);
 			var str = json.a;
 			var theType = "success";
 			var theText = "再多看看別的商品吧!"
 			if(str=="加入購物車失敗，不能新增數量0以下" || str=="加入購物車失敗，剩餘數量不足"){
				theType = "error";
				theText = "請確定數量再加入購物車"
 			}
 			if(str=="這是您自己的商品唷!"){
 				theType = "error";
				theText = "去看看其他人的賣場吧!!"
 			}
				swal({
					title: str,
 					text: theText,
 					type: theType
				});
			})
 		}
 	});
    
 	/*----------------------------------------------------*/
    
    	$("#buyAdTag").mouseover(function() {
 		$('#buyAd').attr("style","position:absolute;top:7px;left:1100px;border-radius:5px 5px;color:black;font-size:15px;width:100px;display:block");
 	});
    	

    	$("#buyAdTag").mouseout(function() {
 		$('#buyAd').attr("style","display:none");
 	});

    	$("#buyAdTag").click(function() {/*點下去跳至買廣告頁面*/
    		var i_id = $('#i_id').val();
    			window.open('Ad.go?action=prepareBuy&i_id='+i_id, '購買AllBuyBack廣告',
    					'height=370,width=650,scrollbars=0,resizable=0,location=0');
    	});
    	
    	var offset=$('#point').offset();
    	console.log(offset.top+","+offset.left)	;
    	if(offset.top<100){   		
    		$('#hidden').attr("style","margin-top:70px;display:block");
    	}
    	


})
</script>

</head>
<body style="background-color:rgb(234,234,234)">

<jsp:include page="includeTop.jsp"></jsp:include>

<nav id="hidden" class="navbar navbar-inverse  navbar-fixed-top " style="margin-top:70px;display:none"  >
<div  class="container-fluid"  style="background-color: yellow;height:90px; "></div>
</nav>

<div class="container"><!--商品上半部-->
    <div class="row">
        <div class="col-sm-12">
            <div class="productArea1"  >
               <div class="productTitle" >${itemVO.i_name }</div>

               
                <span id="buyAdTag" class="glyphicon glyphicon-tag " style="position:absolute;top:30px;left:1090px;font-size:20px;;color:gray"></span>
                <div id="buyAd" style="position:absolute;top:10px;left:1100px;border-radius:5px 5px;color:black;font-size:10px;display:none;">買廣告請點我</div>
                

                <div id="eyeCount" style="position:absolute;top:60px;left:35px;border-radius:5px 5px;background-color:black;color:white;font-size:10px;padding:2px 5px;display:none;">瀏覽數</div>
                <div id="eye"><span class="glyphicon glyphicon-eye-open " style="font-size:20px;color:gray"></span></div>
                <div style="position:absolute;top:80px;left:65px;color:gray">${shop.s_click }</div>
                
                
                <div id="heartCount" style="position:absolute;top:60px;left:105px;border-radius:5px 5px;background-color:black;color:white;font-size:10px;padding:2px 5px;display:none;">收藏數</div>
                <div id="heart"><span class="glyphicon glyphicon-heart " style="font-size:20px;;color:gray"></span></div>
                <div style="position:absolute;top:80px;left:130px;color:gray">${keepitemcount }</div>
                
                
                <div id="shoppingCartCount" style="position:absolute;top:60px;left:105px;border-radius:5px 5px;background-color:black;color:white;font-size:10px;padding:2px 5px;display:none;">代購數</div>
                <div id="shoppingCart"><span  class="glyphicon glyphicon-shopping-cart " style="font-size:20px;;color:gray"></span></div> 
                <div style="position:absolute;top:80px;left:195px;color:gray">${itemVO.i_soldQuantity }</div>

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

                <div class="price">商品售價:</div> <div style="position: absolute;top:100px;left:700px;  height:65px;width:550px;font-family:微軟正黑體;font-size:20px; line-height:65px;">${itemVO.i_price }</div> 
                <div class="brand">商品數量:</div> <div style="position: absolute;top:170px;left:700px;height:65px;width:550px;font-family:微軟正黑體;font-size:20px; line-height:65px; ">${itemVO.i_quantity }</div> 
                <div class="country">代購國家:</div>  <div style="position: absolute;top:240px;left:700px;height:65px;width:550px;font-family:微軟正黑體;font-size:20px; line-height:65px; ">${itemVO.country_id }</div> 
                <div class="waitDay">到貨時間:</div> <div style="position: absolute;top:310px;left:700px;height:65px;width:550px;font-family:微軟正黑體;font-size:20px; line-height:65px; ">${i_arrivedDate }</div> 
                
                <div class="count">購買數量:
                 
                   <input type="number" id="ol_quantity" value="1" min="1" max="99"  style="width:60px;height:40px;padding-left: 10px;margin-left: 12px;">
                
                </div>
                <input type="hidden" id="i_id" name="i_id" value="${itemVO.i_id}" />
				<input type="hidden" id="s_id" name="s_id" value="${itemVO.s_id}" />
                <button class="shoppingButton" id="addToCart">加入購物車</button> 
                <button class="wantBuy">聯絡賣家</button> 
                <div class="pay">付款方式:</div>  <div style="position: absolute;top:520px;left:700px;height:65px;width:550px;font-family:微軟正黑體;font-size:20px; line-height:65px; ">0000000000</div> 
                <div class="deliver">寄送方式:</div>  <div style="position: absolute;top:590px;left:700px;height:65px;width:550px;font-family:微軟正黑體;font-size:20px; line-height:65px; ">0000000000</div> 

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
      <h3 id="point">商品描述</h3>
      <p>${itemVO.i_describe}</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>費用與寄送資訊</h3>
      <p>${shop.s_aboutMe }</p>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>問與答</h3>
      <span id="itemmsg"></span>
<form>
	<input type="hidden" name="i_id" id="hidden" value="${itemVO.i_id }" />
	<input type="hidden" name="action" value="Insert" />
	<textarea name="im_content" id="im_content" ></textarea>
	<button type="button" id="insertitemmessage">送出</button><span id="showerror">${errors.login }${errors.noempty }</span>
</form>
    </div>
  </div>

</div><!--productArea2-->


<div style="height:250px;background-color:#B0C4DE;margin-top:20px;padding-top:50px;margin-bottom:50px;
border-radius:5px 5px;text-align:center;font-size:20px;font-family:微軟正黑體;letter-spacing:3px;">
    
    <span class="glyphicon glyphicon-plane" style="color:white;font-size:25px;"></span>
    欲購買或發問點請選<br /><br /><br />
<button style="border-radius:5px 5px;border:rgb(42,186,171);background-color:rgb(42,186,171);color:white;padding:10px 30px;font-size:20px;margin-top:10px;font-weight:500;">聯絡賣家</button>

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
<script>

$(function(){
	$('#insertitemmessage').click(insertItemMessage);
	getItemMessageJSON();
})

function getItemMessageJSON(){
	$.post("<c:url value='/itemmessage.SPRINGcontroller'/>",{
		"action":"Select",	
		"i_id":"${itemVO.i_id}"},function(data){	
		showItemMessageJSON(data);
	})//post結束
}//function結束

function showItemMessageJSON(dataa){
	var data = JSON.parse(dataa);
	var docFragment = $(document.createDocumentFragment());				 
	for(var i=0;i<data.data.length;i++){
		var im_id = data.data[i].im_id;
		var m_id = data.data[i].m_id;
		var s_id = data.data[i].s_id;
		var i_id = data.data[i].i_id;
		var im_content = data.data[i].im_content;					 
		var im_date = data.data[i].im_date;					 
		var im_hidden = data.data[i].im_hidden;					 
		var im_reply = data.data[i].im_reply;					 
		var im_replyDate = data.data[i].im_replyDate;					 
		var im_state = data.data[i].im_state;
		var div = $("<div style=\"border-bottom:1px solid;background-color:#FFC78E\"></div>").html(m_id+" 於 "+im_date+" 留言：<br/>"+im_content);
		if((<c:out value="${LoginOK.m_id}">-1</c:out>) == s_id){			
			var hidden = $('<input type="hidden" id="im_id' + i + '" value="' + im_id + '"/>');
			var reply = $('<button type=\"button\" id=\"reply' + i + '\" value=\"' + i + '\" >回覆</button>');
			var hiddenB = $('<button type=\"button\" id=\"hiddenB' + i +'\" value=\"' + i + '\">隱藏</button>');
			var span = $('<span style=\"font-size:12px;color:blue\" id=\"spanmsg' + i + '\"></span><br/>');
			div.append(hidden).append(reply).append(hiddenB).append(span);
		}
		if(im_hidden == 2 && m_id == (<c:out value="${LoginOK.m_id}">0</c:out>)){
			var span =$('<span style=\"font-size:12px;color:blue\">此留言已被隱藏</span>');
			div.append(span);
		}		
		if(im_state == 2){
			var div2 = $('<div style="border:1px solid;margin:10px 10px 10px 40px;background-color:#FFDCB9"></div>').html(s_id + "於" + im_replyDate + "回覆：<br/>" + im_reply + "<br/>");
			div.append(div2);
		}
		if(im_hidden != 2){
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
	$('#itemmsg').empty()
	$('#itemmsg').append(docFragment);
	if((<c:out value="${LoginOK.m_id}">-1</c:out>) == s_id){
		for(var i=0;i<data.data.length;i++){
			$('#reply'+i).click(function(){
				rep($(this).val());
			})
			$('#hiddenB'+i).click(function(){
				hid($(this).val());
			})
			if(data.data[i].im_state==2){
				$('#reply'+i).prop("disabled", true);
			}
			if((data.data[i].im_hidden)==2){
				$('#spanmsg'+i).text("留言狀態：隱藏");
			}else if((data.data[i].im_hidden)==1){
				$('#spanmsg'+i).text("留言狀態：公開");			
			}
		}
	}
}

function hid(v){
	$.post("<c:url value='/itemmessage.SPRINGcontroller'/>",{"action":"Hidden","im_id":$('#im_id'+v).val()},function(data){showItemMessageJSON(data)})	
}

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
		$.post("<c:url value='/itemmessage.SPRINGcontroller'/>",{"action":"Update","im_id":$('#im_id'+v).val(),"im_reply":$('#textarea'+v).val()},function(data){showItemMessageJSON(data);})
		$('#rep'+v).text("");
	}		
}

function insertItemMessage(){
	if(<c:out value="${empty LoginOK}">true</c:out>){
		$('#showerror').html("請先登入才能留言");
	}else if( (<c:out value="${itemVO.s_id}">-2</c:out>) == (<c:out value="${LoginOK.m_id}">-1</c:out>) ){
		$('#showerror').html("不能在自己的賣場留言");			
	}else if(<c:out value="${not empty LoginOK}">false</c:out>){
		if(!$('#im_content').val()){
			$('#showerror').html("請輸入留言");
		}else if($('#im_content').val()){	
			$.post("<c:url value='/itemmessage.SPRINGcontroller'/>",
				{"action":"Insert",
				"i_id":<c:out value="${itemVO.i_id }">-3</c:out>,
				"s_id":<c:out value="${itemVO.s_id }">-2</c:out>,				
				"m_id":<c:out value="${LoginOK.m_id}">-1</c:out>,
				"im_content":$('#im_content').val()},				
				function(data){showItemMessageJSON(data);})/*post結束*/
			$('#im_content').val("");
		}/*if結尾*/
	}/*if結尾*/
}

$('#keepitem').click(function(){
	if(<c:out value="${empty LoginOK}">true</c:out>){
		$('#msg1').text("請先登入");
	}else if((<c:out value="${LoginOK.m_id}">-1</c:out>) == (<c:out value="${itemVO.s_id}">-2</c:out>)){
		$('#msg1').text("這是您自己的商品！");
	}else{
		$.post("<c:url value='/keep_item.SPRINGcontroller'/>",{"action":"Insert",
			"i_id":<c:out value="${itemVO.i_id}">0</c:out>,
			"m_id":<c:out value="${LoginOK.m_id}">0</c:out>},function(){
				$('#msg1').text("已將商品加入收藏");
			});	//post	
	}//else	
})//click


</script>
</html>