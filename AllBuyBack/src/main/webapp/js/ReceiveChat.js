// 	<!-- 聊天室開始(收件者) -->
$(function(){
	setInterval(check, 2000);
	
	var xhr = null;
	function check(){
	   xhr = new XMLHttpRequest();
		if (xhr != null) {
			xhr.open('POST', 'ReceiveTalk', true);   //***非同步***
			xhr.addEventListener("readystatechange", callback);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send();
		} else {
			alert("您的瀏覽器不支援Ajax功能!!");
		}		
	}
	var n=0, i="", j="";
	function callback(){
		if (xhr.readyState == 4) {
	 		if(xhr.status == 200){
	 			var datas = xhr.responseText;
	 			if(datas.length != 0){
			 		var items = JSON.parse(datas);
				 	if(n==0){
				 		i=items[0].chat_date;
				 		n=1;
				 	}else{
				 		j=items[0].chat_date;
				 		n=0;
				 	}
				 	console.log(i);
				 	console.log(j);
				 	console.log(i==j);
				 	if(j != 0){
				 		if(i != j){
					 		window.open("BeginToTalk?s_id="+items[0].m_id,"_BeginToTalk","toolbar=no,location=no,directories=no,width=300,height=350");
					 	}		
				 	}		 		
		 		}
	 		}
		}
	}
})
// 	<!-- 聊天室結束(收件者) -->