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
/* .myActive  { */
/*     border-top:pink 5px solid; */
/* } */


.marketName:hover {
  text-decoration: none;
/*   color:gray; */
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
    
 	$(".addToCart").click(function() {
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
    	
    	
    	
    	
    	$("#reportTag").mouseover(function() {
     		$('#report').attr("style","position:absolute;top:7px;left:1000px;border-radius:5px 5px;color:black;font-size:15px;width:100px;display:block");
     	});
        	

        	$("#reportTag").mouseout(function() {
     		$('#report').attr("style","display:none");
     	});
        	
        	$('#reportTag').click(function(){
        		var i_id = $('#i_id').val();
        		var m_id = $('#m_id').val();
        		//console.log(i_id);
        			window.open('ItemController?action=product_accuse&i_id='+i_id+'&m_id='+m_id, '購買AllBuyBack廣告',
        					'height=350,width=650,scrollbars=0,resizable=0,location=0');
        	});

    	
    	
    	
    	

});
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

               
                <span id="reportTag" class="glyphicon glyphicon-bullhorn" style="position:absolute;top:30px;left:1040px;font-size:20px;;color:gray">
                <input type="hidden" id="m_id" name="m_id" value="${LoginOK.m_id}"> 
				<input type="hidden" id="i_id" name="i_id" value="${itemVO.i_id}">
                </span>
                <div id="report" style="position:absolute;top:10px;left:1000px;border-radius:5px 5px;color:black;font-size:10px;display:none;">檢舉商品</div>
               
                <span id="buyAdTag" class="glyphicon glyphicon-tag " style="position:absolute;top:30px;left:1090px;font-size:20px;;color:gray"></span>
                <div id="buyAd" style="position:absolute;top:10px;left:1100px;border-radius:5px 5px;color:black;font-size:10px;display:none;">買廣告請點我</div>
                

                <div id="eyeCount" style="position:absolute;top:60px;left:35px;border-radius:5px 5px;background-color:black;color:white;font-size:10px;padding:2px 5px;display:none;">瀏覽數</div>
                <div id="eye"><span class="glyphicon glyphicon-eye-open " style="font-size:20px;color:gray"></span></div>
                <div style="position:absolute;top:80px;left:65px;color:gray">${itemVO.i_click }</div>
                
                
                <div id="heartCount" style="position:absolute;top:60px;left:105px;border-radius:5px 5px;background-color:black;color:white;font-size:10px;padding:2px 5px;display:none;">收藏數</div>
                <div id="heart"><span class="glyphicon glyphicon-heart " style="font-size:20px;;color:gray"></span></div>
                <div id="keepitemcount" style="position:absolute;top:80px;left:130px;color:gray">${keepitemcount }</div>
                
                
                <div id="shoppingCartCount" style="position:absolute;top:60px;left:105px;border-radius:5px 5px;background-color:black;color:white;font-size:10px;padding:2px 5px;display:none;">代購數</div>
                <div id="shoppingCart"><span  class="glyphicon glyphicon-shopping-cart " style="font-size:20px;;color:gray"></span></div> 
                <div style="position:absolute;top:80px;left:195px;color:gray">${itemVO.i_soldQuantity }</div>

                   <div class="mainPhoto">
                     <img src='ReadPictureForItem?i_id=${itemVO.i_id}&i_pictureX=1' width="480" height="400" />
                   </div> 
                   <div class="smallPhoto1" >
                     <img src='ReadPictureForItem?i_id=${itemVO.i_id}&i_pictureX=1' width="90" />
                   </div>
                  <div class="smallPhoto2" >
                     <img src='ReadPictureForItem?i_id=${itemVO.i_id}&i_pictureX=2' width="90" />
                   </div>
                  <div class="smallPhoto3" >
                     <img src='ReadPictureForItem?i_id=${itemVO.i_id}&i_pictureX=3' width="90" />
                   </div>

                <div class="price">商品售價:</div><span style="position: absolute;top:115px;left:680px;color:rgb(42,186,171);font-size:25px;font-weight:600;">NT$</span> <div style="position: absolute;top:99px;left:750px; height:65px;width:550px;font-family:微軟正黑體;color:rgb(42,186,171);font-size:25px;font-weight:600; line-height:65px;">${itemVO.i_price }</div> 
                <div class="brand">商品數量:</div> <div style="position: absolute;top:170px;left:680px;height:65px;width:550px;font-family:微軟正黑體;font-size:20px; line-height:65px; ">${itemVO.i_quantity }</div> 
                <div class="country">代購國家:</div>  <div style="position: absolute;top:240px;left:680px;height:65px;width:550px;font-family:微軟正黑體;font-size:20px; line-height:65px; ">${country.country_name }</div> 
                <div class="waitDay">到貨時間:</div> <div style="position: absolute;top:310px;left:680px;height:65px;width:550px;font-family:微軟正黑體;font-size:20px; line-height:65px; ">${i_arrivedDate }</div> 
                
                <div class="count">購買數量:
                 
                   <input type="number" id="ol_quantity" value="1" min="1" max="99"  style="width:60px;height:40px;padding-left: 10px;margin-left: 12px;">
                
                </div>
                <input type="hidden" id="i_id" name="i_id" value="${itemVO.i_id}" />
				<input type="hidden" id="s_id" name="s_id" value="${itemVO.s_id}" />
				<input type="hidden" id="m_account" name="m_account" value="${LoginOK.m_account}" />
				<input type="hidden" id="m_id" name="m_id" value="${LoginOK.m_id}" />
                <button class="shoppingButton" id="addToCart">加入購物車</button> 
                <button class="wantBuy">聯絡賣家</button> 
                <div class="pay">付款方式:</div>  <div style="position: absolute;top:520px;left:680px;height:65px;width:550px;font-family:微軟正黑體;font-size:20px; line-height:65px; ">超商付款,匯款,信用卡,貨到付款</div> 
                <div class="deliver">寄送方式:</div>  <div style="position: absolute;top:590px;left:680px;height:65px;width:550px;font-family:微軟正黑體;font-size:20px; line-height:65px; ">
                <c:if test="${not empty shipway }">
	                <c:forEach items="${shipway.shipway }" var="sway" varStatus="vars">
	                	<c:choose>
	                		<c:when test="${not vars.last }">${sway.sw_name },</c:when>
	                		<c:when test="${vars.last }">${sway.sw_name }</c:when>	                				                		
	                	</c:choose>	                	
	                </c:forEach>
                </c:if>
                </div> 
                
                <!-- ============位置已定!============ -->
				<button type="button" id="keepitem"  class="favorite">加入收藏</button><span id="KeepItemMsg"></span>
				<!-- ============位置已定!============ -->

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
      <c:forEach items="${shipway.shipway}" var="sw" varStatus="varS">
      	<p>${sw.sw_name }：${sw.sw_price }元</p>
      </c:forEach>
      
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
    
    <span class="glyphicon glyphicon-plane" style="color:white;font-size:28px;letter-spacing: 5px"></span>
    欲購買或發問點請選<br /><br /><br />
<button class="addToCart" style="border-radius:5px 5px;border:#8B7D6B;background-color:#8B7D6B;color:white;padding:10px 30px;font-size:20px;margin-top:10px;font-weight:500;margin-right:20px;">加入購物車</button>    
<button id="wantBuy" style="border-radius:5px 5px;border:rgb(42,186,171);background-color:rgb(42,186,171);color:white;padding:10px 30px;font-size:20px;margin-top:10px;font-weight:500;">聯絡賣家</button>

</div>

 </div><!--8格-->

        <div class="col-sm-offset-1 col-sm-3">
            <div class="seller" >
                <div style="margin-top:20px;text-align:center;">ABOUT SELLER</div>
                <div style="margin-left:70px;margin-top:10px;"><a href="<c:url value='/shop.html?s_id=${shop.s_id }'/>"><img style="width:120px;height:120px; border-radius:99em; " src="<c:url value='/UpdateDataServlet?status=selectPic&id=${shop.s_id }' />" /></a></div>
                <div><p  style="font-family:微軟正黑體;text-align:center;padding-top:10px;font-size:20px;"><a class="marketName" style="color:black" href="<c:url value='/shop.html?s_id=${shop.s_id }'/>">${member.m_name }的賣場</a></p></div>
                
                <div style="text-align:center;margin-top:20px;">
                <span class="glyphicon glyphicon-plane" style="color:#EEB4B4;font-size:25px;"></span><span class="glyphicon glyphicon-plane" style="color:#EEB4B4;font-size:25px;"></span><span class="glyphicon glyphicon-plane" style="color:#EEB4B4;font-size:25px;"></span><span class="glyphicon glyphicon-plane" style="color:#EEB4B4;font-size:25px;"></span><span class="glyphicon glyphicon-plane" style="color:#EEB4B4;font-size:25px;"></span>
                </div>
                    
                <div style="color:gray;font-family:微軟正黑體;font-size:12px;text-align:center;margin-top:20px;font-family:微軟正黑體;">評價 | 關於我 | 代購商品</div>

                 <div style="text-align:center;margin-top:20px;"><button id="keep_shop" value="${shop.s_id }" style="border-radius:5px 5px;border:black;background-color:black;color:white;width:250px;padding:7px 10px;"> <span class="glyphicon glyphicon-eye-open"><span style="margin-left:10px;font-size:20px;font-family:微軟正黑體;">&nbsp訂閱我</span></button></div>
                 <span id="spanmsg2">　</span>
                 <div id="keepshopcount" style="color:gray;font-family:微軟正黑體;font-size:12px;text-align:center;margin-top:20px;">目前共有${keepshopcount}人訂閱</div>
                  
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
<jsp:include page="_Footer.jsp"></jsp:include>

</body>
<script>

$(function(){	
	$('#insertitemmessage').click(insertItemMessage);
	$('#keep_shop').click(keep_shop);
	$('#keepitem').click(keep_item);
	getItemMessageJSON();
})

function keep_item(){	
	if(<c:out value="${empty LoginOK}">true</c:out>){
		$('#KeepItemMsg').text("請先登入");
	}else if((<c:out value="${LoginOK.m_id}">-1</c:out>) == (<c:out value="${itemVO.s_id}">-2</c:out>)){
		$('#KeepItemMsg').text("這是您自己的商品！");
	}else{
		$.post("<c:url value='/keep_item.SPRINGcontroller'/>",{"action":"Insert",
			"i_id":<c:out value="${itemVO.i_id}">0</c:out>,
			"m_id":<c:out value="${LoginOK.m_id}">0</c:out>},function(data){
				$('#KeepItemMsg').text("已將商品加入收藏");
				$('#keepitemcount').text(data);
			});	//post	
	}//else	
}//click

function keep_shop(){
	if(<c:out value="${empty LoginOK}">true</c:out>){
		$('#spanmsg2').text("請先登入");
	}else{
		$('#spanmsg2').text("test");		
		$.post("<c:url value='/keep_shop.SPRINGcontroller'/>",{"action":"Insert","m_id":<c:out value="${LoginOK.m_id}">0</c:out>,
			"s_id":<c:out value="${shop.s_id}">0</c:out>},function(data){
				$('#spanmsg2').text("已將商店加入收藏");
				$('#keepshopcount').text("目前共有"+data+"人訂閱");
			})			
	}
}

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


$('.wantBuy').click(function(){
	var m_id = $('#m_id').val();
	var s_id = $('#s_id').val();
	
	console.log(i_id);
		window.open('ChatController?action=show_both_message_seller&m_id='+m_id+'&s_id='+s_id,'購買AllBuyBack廣告',
				'height=650,width=650,scrollbars=0,resizable=0,location=0');
});

$('#wantBuy').click(function(){
	var m_id = $('#m_id').val();
	var s_id = $('#s_id').val();
	
	console.log(i_id);
		window.open('ChatController?action=show_both_message_seller&m_id='+m_id+'&s_id='+s_id,'購買AllBuyBack廣告',
				'height=650,width=650,scrollbars=0,resizable=0,location=0');
});






</script>
</html>