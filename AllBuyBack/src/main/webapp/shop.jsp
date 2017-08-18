<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${shop.s_id }的商店</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(function(){
	
	getMessageJSON();
		
	
	$('#keep_shop').click(function(){
		if(<c:out value="${empty LoginOK}">true</c:out>){
			$('#spanmsg2').text("請先登入");
		}else{
			$('#spanmsg2').text("test");		
			$.post("<c:url value='/keep_shop.SPRINGcontroller'/>",{"action":"Insert","m_id":<c:out value="${LoginOK.m_id}">0</c:out>,
				"s_id":<c:out value="${shop.s_id}">0</c:out>},function(){
					$('#spanmsg2').text("已將商店加入收藏");
				})			
		}
	})
})

function getMessageJSON(){
	$.getJSON("<c:url value='/shop_messagejson.SPRINGcontroller'/>",{"s_id":$('#hidden').val(),"action":"Query"},function(data){
		showJSON(data);
	})
}

function showJSON(data){
	var docFragment = $(document.createDocumentFragment());				 
	for(var i=0;i<data.msgs.length;i++){
		var m_id = data.msgs[i].m_id;
		var s_id = data.msgs[i].s_id;
		var sm_content = data.msgs[i].sm_content;					 
		var sm_date = data.msgs[i].sm_date;					 
		var sm_hidden = data.msgs[i].sm_hidden;					 
		var sm_reply = data.msgs[i].sm_reply;					 
		var sm_replyDate = data.msgs[i].sm_replyDate;					 
		var sm_state = data.msgs[i].sm_state;					 
		var div = $("<div style=\"border-bottom:1px solid;background-color:#FFC78E\"></div>").html(m_id+" 於 "+sm_date+" 留言：<br/>"+sm_content+"<br/>");
		if(sm_hidden==2){
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
			if(m_id == <c:out value="${LoginOK.m_id}">-1</c:out>){				
				docFragment.append(div);
			}
		}		
	}
	$('#shop_message').empty()
	$('#shop_message').append(docFragment);
}
</script>
</head>
<body>
	<h3 id="head">${member.m_name }的商店</h3><button type="button" id="keep_shop" value="${shop.s_id }">將商店加入我的收藏</button><span id="spanmsg2"></span>
	<h5>${shop.s_aboutMe }</h5>
	<table>
		<tr>
			<c:forEach items="${items}" var="item" varStatus="varS">
				<c:if test="${item.i_status==0}"></c:if>
			<c:if test="${item.i_status==1}"><td><a href="<c:url value="/item.html?i_id=${item.i_id }"/>">${item.i_id }</a></td></c:if>	
			<c:if test="${item.i_status==2}"></c:if>
				<c:if test="${varS.count % 3 == 0}">
					<c:out value="</tr><tr>" escapeXml="false" />
				</c:if>
			</c:forEach>
		</tr>
	</table>
	<span id="shop_message"></span>
	<form>
		<input type="hidden" name="s_id" id="hidden" value="${shop.s_id }" />
		<input type="hidden" name="action" value="Insert" />
		<textarea name="sm_content" id="sm_content" ></textarea>
		<button type="button" id="submit">送出</button><span id="showerror">${errors.login }${errors.noempty }</span>
	</form>
	<a href="<c:url value='/index.jsp'/>"> <input type="button"
		value="回首頁"></a>
</body>
<script>
/*載入function開始*/
$(function(){
	/*註冊click開始*/
	$('#submit').click(function(){
		/*post開始*/
		if(<c:out value="${empty LoginOK}">true</c:out>){
			$('#showerror').html("請先登入才能留言");
		}else if( (<c:out value="${shop.s_id}">-2</c:out>) == (<c:out value="${LoginOK.m_id}">-1</c:out>) ){
			$('#showerror').html("不能在自己的賣場留言");			
		}else if(<c:out value="${not empty LoginOK}">false</c:out>){
			if(!$('#sm_content').val()){
				$('#showerror').html("請輸入留言");
			}else if($('#sm_content').val()){	
				$.post("<c:url value='/shopmessage.SPRINGcontroller'/>",
					{"action":"Insert","s_id":<c:out value="${shop.s_id }">-2</c:out>,"m_id":<c:out value="${LoginOK.m_id}">-1</c:out>,"sm_content":$('#sm_content').val()},
					function(data){showJSON(JSON.parse(data));})/*post結束*/
			}/*if結尾*/
		}/*if結尾*/
	})/*註冊click結尾*/
})/*載入function結尾*/

</script>
</html>
