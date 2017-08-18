<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script></head>
<script>
	window.onload = function(){
		document.getElementById("sendbtn").onclick = MsgSend;
	}
	
	window.setInterval(MsgSendControl, 2000);
	
	function MsgSendControl(){
		if(document.getElementById("msgCont").value.length == 0){
			MsgSend();
		}
	}
	
	var xhr = null;
	function MsgSend() {
		
		var msgCont = document.getElementById("msgCont").value;
		$('#msgCont').val("");
		xhr = new XMLHttpRequest();
		if (xhr != null) {
			xhr.open('POST', 'TalkTalk', true);   //***非同步***
			xhr.addEventListener("readystatechange", callback);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("chat_content=" + msgCont + "&m_id=${m_id}&s_id=${s_id}");
		} else {
			alert("您的瀏覽器不支援Ajax功能!!");
		}
	}
	
	function callback() {
	 	if (xhr.readyState == 4) {
	 		if(xhr.status == 200){
	 			var datas = xhr.responseText;
		 		var items = JSON.parse(datas);
	 			var showContent = "";
		 		for(var i=0; i<items.length; i++){
		 			if(items[i].m_id == "${m_id}"){
						showContent = showContent + items[i].m_id + ": " + items[i].chat_content;
		 			}else{
		 				showContent = showContent + "\t\t" + items[i].chat_content + " :" + items[i].m_id;
		 			}
					showContent = showContent + "\n";
		 		}
		 		document.getElementById("receiveMsg").value = showContent;
		 		
		 		

		 	}else {
				alert(xhr.status + ":" + xhr.statusText);
			}
		}
	}
</script>

<style>
	*{
		margin:auto
	}
	#chathead{
		text-align:center
	}
	
</style>
</head>
<body>
	<form name="ChatContent" id="ChatContent1" action="ChatChat" method="POST">
	<table>
		<thead>
			<tr><th id="chathead" height="60">聊天室</th></tr>
		</thead>
		<tbody>
			<tr>
			    <td width="200" height="40" align="left" >
			         <textarea id="receiveMsg" cols="30" rows="5" style="resize:none" name="content" ></textarea>
			    </td>
			</tr>
			<tr>
			    <td width="200" height="40" align="left" >
			         <textarea id="msgCont" cols="30" rows="2" style="resize:none" name="content" ></textarea>
			    </td>
			</tr>
			<tr>
				<td><input id="sendbtn" type="button" value="送出"></td>
			</tr>
		</tbody>
	</table>
	</form>
</body>
</html>