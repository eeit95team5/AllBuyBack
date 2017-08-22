<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<form action="<c:url value='/updateShop.SPRINGcontroller'/>" method="get">
商店編號：${shop.s_id }<input type="hidden" name="s_id" value="${shop.s_id }"><br/>
關於商店：${shop.s_aboutMe }<br/>
商店總分：${shop.s_score }<br/>
商店評價：${shop.s_avgScore }<br/>
商店人氣：${shop.s_popular }<br/>
商店點閱：${shop.s_click }<br/>
商店點數：${shop.s_point }<br/>
<button type="submit" name="shopaction" value="update">修改商店資訊</button>
</form>
<c:if test="${not empty item}">
	<table border=1>
		<tr>
			<td>i_id</td>
			<td>s_id</td>
			<td>i_name</td>
			<td>i_describe</td>
			<td>i_price</td>
			<td>i_quantity</td>
			<td>country_id</td>
			<td>i_arrivedDate</td>
			<td>i_onSellDate</td>
			<td>i_soldQuantity</td>
			<td>i_status</td>
			<td>i_class1</td>
			<td>i_class2</td>
			<td>i_class3</td>
			<td>i_popular</td>
			<td>i_click</td>
			<td>s_class1</td>
			<td>s_class2</td>
			<td>修改商品</td>
		</tr>		
		<c:forEach items="${item }" var="item" varStatus="i">
			<tr>
			<td>${item.i_id }</td>
			<td>${item.s_id }</td>
			<td>${item.i_name }</td>			
			<td>${item.i_describe }</td>			
			<td>${item.i_price }</td>			
			<td>${item.i_quantity }</td>			
			<td>${item.country_id }</td>			
			<td>${item.i_arrivedDate }</td>			
			<td>${item.i_onSellDate }</td>			
			<td>${item.i_soldQuantity }</td>			
			<td>${item.i_status }</td>			
			<td>${item.i_class1 }</td>			
			<td>${item.i_class2 }</td>			
			<td>${item.i_class3 }</td>			
			<td>${item.i_popular }</td>			
			<td>${item.i_click }</td>			
			<td>${item.s_class1 }</td>			
			<td>${item.s_class2 }</td>								
			<td><button  id="btn${i.count }" value="${item.i_id }">修改商品</button></td>							
			</tr>
			<c:if test="${i.last }">
				<br/><input id="count" type="hidden" value="${i.count }"/>
			</c:if>
		</c:forEach>
	</table>
</c:if>


<br/>
<span id="shop_message"></span>
<form action="<c:url value='/insertitem.html'/>" method="post">
<input type="hidden" name="s_id" value="${shop.s_id }"/>
<button type="submit">新增商品</button>
</form>
<a href="index.jsp"><input type="button" value="回首頁"/></a>
</body>
<script>

$(function(){	
	for(var i=1;i <= parseInt($('#count').val());i++){
		$('#btn'+i).click(function(){
			var path = "<%=request.getContextPath()%>";
			var url = path + "/updateItem.html?i_id=" + $(this).val();	
			window.location = url;	
		});
	}
	
	getMessageJSON();
})


function getMessageJSON(){
	$.post("<c:url value='/shop_messagejson.SPRINGcontroller'/>",{"s_id":"${shop.s_id}"},function(data){
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
		var hidden = $('<input type="hidden" id="sm_id' + i + '" value="' + sm_id + '"/>');
		var reply = $('<button type=\"button\" id=\"reply' + i + '\" value=\"' + i + '\" >回覆</button>');
		var hiddenB = $('<button type=\"button\" id=\"hiddenB' + i +'\" value=\"' + i + '\">隱藏</button>');
		var span = $('<span style=\"font-size:12px;color:blue\" id=\"spanmsg' + i + '\"></span><br/>');
		div.append(reply).append(hidden).append(hiddenB).append(span);
		
		if(sm_state == 2){
			var div2 = $('<div style="border:1px solid;margin:10px 10px 10px 40px;background-color:#FFDCB9"></div>').html(s_id + "於" + sm_replyDate + "回覆：<br/>" + sm_reply + "<br/>");
			div.append(div2);			
		}
		docFragment.append(div);			
	}
	$('#shop_message').empty()
	$('#shop_message').append(docFragment);	
	for(var i=0;i<data.msgs.length;i++){
		$('#reply'+i).click(function(){
			rep($(this).val());
		});
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

</script>
</html>