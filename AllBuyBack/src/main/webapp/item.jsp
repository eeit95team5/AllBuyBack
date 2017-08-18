<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.css">
<link rel="stylesheet" href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="webjars/sweetalert/1.1.3/dist/sweetalert.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script>

</head>
<body>
<table border="1">
	<thead>
		<tr>
			<td>排序</td><td>i_id</td><td>s_id</td><td>品名</td>
			<td>i_arrivedDate</td><td>價格</td><td>數量</td><td>描述</td>
			<td>ol_quantity</td><td>ol_memo</td>
		</tr>
	</thead>
	<tbody id="table1">
		
			<tr align="center" valign="middle">
			<form id="cartForm" action="ShoppingCart.go" method="post">
				<td>${vs.index}</td>
				<td>${itemVO.i_id}</td>
				<td>${itemVO.s_id}</td>
				<td>${itemVO.i_name}</td>
				<td>${itemVO.i_arrivedDate}</td>
				<td>${itemVO.i_price}</td>
				<td>${itemVO.i_quantity}</td>
				<td>${itemVO.i_describe}</td>
				<td>
					<input id="ol_quantity" type="text" name="ol_quantity" />
				</td>
				<td>
					<input id="ol_memo" type="text" name="ol_memo" />
				</td>
				<td>
					<button type="button" id="addCart" class="btn" >加入購物車</button>
<!-- 					<input type="submit" id="addCart" class="btn" value="加入購物車" /> -->
					<input type="hidden" id="addToCart" name="action" value="addToCart" />
					<input type="hidden" id="i_id" name="i_id" value="${itemVO.i_id}" />
					<input type="hidden" id="s_id" name="s_id" value="${itemVO.s_id}" />
				</td>
							
			</form>
			<td>
				<c:if test="${!empty LoginOK}">
					<form method="get" action="<c:url value="/ItemController"/>">
<!-- 						<input type="submit" value="檢舉">  -->
						<input type="button" id="accuse" value="檢舉"> 
						<input type="hidden" id="m_id" name="m_id" value="${LoginOK.m_id}"> 
						<input type="hidden" id="i_id" name="i_id" value="${itemVO.i_id}"> 
						<input type="hidden" name="action" value="product_accuse">
					</form>
				</c:if>
			</td>
			<td>
				<c:if test="${!empty LoginOK }">	
				<form method="get" action="<c:url value="/ChatController"/>">
				<input type="submit" value="聯絡賣場" class="btn btn-success"> 
				<input type="hidden" name="m_id" value="${LoginOK.m_id}"> 
				<input type="hidden" name="m_account" value="${LoginOK.m_account}">
				<input type="hidden" name="s_id" value="${itemVO.s_id}"> 
				<input type="hidden" name="action" value="show_both_message_seller">
				</form>
		</c:if>
			</td>
			<td>
				<button type="button" id="buyAd">購買廣告</button>
			</td>
			</tr>		
	</tbody>
</table>

<c:if test="${! empty Msg}"><p>${Msg}</p></c:if>
<a href="ShoppingCart.go?action=select">ShoppingCart</a>
<form action="ShoppingCart.go" method="post">
	<input type="submit" value="查看購物車" />
	<input type="hidden" name="action" value="select" />
</form>
<c:if test="${! empty errorMsgs}"><p>${errorMsgs}</p></c:if>
<button type="button" id="keepitem">加入收藏</button><span id="KeepItemMsg"></span><br/>
<form action="<c:url value='/shop.html'/>" method="get">
	<input type="hidden" name="s_id" value="${itemVO.s_id }"/><button type="submit" >回到賣場</button>	
</form><br/>
<a href="<c:url value='/index.jsp'/>"> <input type="button" value="回首頁"></a>

<span id="itemmsg"></span>
<form>
	<input type="hidden" name="i_id" id="hidden" value="${itemVO.i_id }" />
	<input type="hidden" name="action" value="Insert" />
	<textarea name="im_content" id="im_content" ></textarea>
	<button type="button" id="insertitemmessage">送出</button><span id="showerror">${errors.login }${errors.noempty }</span>
</form>

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

$('#addCart').click(function (){
// 	 var form = $(this).parents('#cartForm');
// 	 console.log(form);
	 var action = $('#addToCart').val();
	 var i_id = $('#i_id').val();
	 var s_id = $('#s_id').val();
	 var ol_quantity = $('#ol_quantity').val();
	 var ol_memo = $('#ol_memo').val();
	 $.post("ShoppingCart.go",{'action':action,'i_id':i_id,'s_id':s_id,'ol_quantity':ol_quantity,'ol_memo':ol_memo},
			 function(data){
		 var json = JSON.parse(data);
		 var str = json.a;
		 var theType = "success";
		 var theText = "再多看看別的商品吧!"
		 if(str=="加入購物車失敗，不能新增數量0以下" || str=="加入購物車失敗，剩餘數量不足"){
			 theType = "error";
			 theText = "請確定數量再加入購物車"
		 }
			 swal({
				  title: str,
				  text: theText,
				  type: theType
				});
	 })
	 
});

$('#buyAd').click(function(){
	var i_id = $('#i_id').val();
	console.log(i_id);
		window.open('Ad.go?action=prepareBuy&i_id='+i_id, '購買AllBuyBack廣告',
				'height=350,width=650,scrollbars=0,resizable=0,location=0');
});

$('#accuse').click(function(){
	var i_id = $('#i_id').val();
	var m_id = $('#m_id').val();
	console.log(i_id);
		window.open('ItemController?action=product_accuse&i_id='+i_id+'&m_id='+m_id, '購買AllBuyBack廣告',
				'height=350,width=650,scrollbars=0,resizable=0,location=0');
});


$('#keepitem').click(function(){
	if(<c:out value="${empty LoginOK}">true</c:out>){
		$('#KeepItemMsg').text("請先登入");
	}else if((<c:out value="${LoginOK.m_id}">-1</c:out>) == (<c:out value="${itemVO.s_id}">-2</c:out>)){
		$('#KeepItemMsg').text("這是您自己的商品！");
	}else{
		$.post("<c:url value='/keep_item.SPRINGcontroller'/>",{"action":"Insert",
			"i_id":<c:out value="${itemVO.i_id}">0</c:out>,
			"m_id":<c:out value="${LoginOK.m_id}">0</c:out>},function(){
				$('#KeepItemMsg').text("已將商品加入收藏");
			});	//post	
	}//else	
})//click
	
</script>

</html>
