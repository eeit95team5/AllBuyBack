<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
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
	var n=0, i=0, j=0;
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
				 			window.open("BeginToTalk?s_id=1000001","","toolbar=no,location=no,directories=no,width=300,height=350");
					 	}		
				 	}		 		
		 		}
	 		}
		}
	}
</script>

</head>
<body>
	<h1>test</h1>
</body>
</html>