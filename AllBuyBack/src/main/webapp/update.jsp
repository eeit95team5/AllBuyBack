<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript" src="test.js"></script>
<title>查詢與修改</title>
<style type="text/css">
	#dropZone{
		width:120px;
		height:120px;
		border:1px solid ;
		float:none;
		
	}
	#thumb{
		height: 50px;
		margin:5px;
	}
</style>
<script type="text/javascript">
	function fileViewer(){
		var theFiles = document.getElementById("file1").files;
		for(i=0;i<theFiles.length;i++){
			var reader = new FileReader();
			reader.readAsDataURL(theFiles[i]);
			reader.onload = function(e){
				var fileContent= e.target.result;
				var imgObj = document.createElement("img");
				imgObj.setAttribute("src",fileContent);
				imgObj.setAttribute("width", "120");
				imgObj.setAttribute("height", "120");
				imgObj.setAttribute("class","thumb");
				document.getElementById("dropZone").appendChild(imgObj);
			}
		}
	}
	

</script>
</head>
<body>
	<h2>查詢會員資料</h2>
	<form action="<c:url value="/UpdateDataServlet" />" method="post">
		<input type="hidden" name="status" value="query"> 
		<input type="hidden" name="account" value="${LoginOK.m_account }">
		<input type="submit" value="送出" onclick="firstLoad">
	</form>
	<h2>修改會員資料</h2>
	<form action="<c:url value="/UpdateDataServlet" />" method="post">

		<div>
			<input type="hidden" name="status" value="update"> 
			<input type="hidden" name="account" value="${LoginOK.m_account }">
			<input type="hidden" name="id" value="${LoginOK.m_id }">
			
			
			<label></label> 
			<input id="file1" type="file" name="picture" multiple="multiple" accept="image/*" onchange="fileViewer()" />
			<br>
			<div id="dropZone" ></div>
			
			<label>密碼:</label> 
			<input id="password" type="text" name="password" value="${temp.m_password }"><span>${wrong.password }</span>
			<br> 
			<label>電話:</label> 
			<input id="phone" type="text" name="phone" value="${temp.m_phone }"><span>${wrong.phone}</span>
			<br> 
			<label>住址:</label> 
			<input id="address" type="text" name="address" value="${temp.m_address }"><span>${wrong.address }</span>
			<br> 
			<label>EMAIL:</label> 
			<input id="email" type="text" name="email"  value="${temp.m_email }"><span>${wrong.email }</span>
			<br> 
			<label>紅利:</label> ${temp.m_point }
			<br>
			<label>評價總筆數:</label> ${temp.m_scoreCount}
			<br>
			<label>平均得分:</label> ${temp.m_avgScore}
			<br>
			<input type="submit" value="送出"> 
			<br>
			<br>
			<br>
		</div>
	</form>
	<hr>
	
<!--	<form>
  	<input id="changePic" type='file' />	
		
    
		<input type="submit" value="上傳"/>
	</form>-->
</body>
<!--  <script>
$("#changePic").change(function(e) {

    for (var i = 0; i < e.originalEvent.srcElement.files.length; i++) {
        
        var file = e.originalEvent.srcElement.files[i];
        var el = document.getElementsById( 'pic' );
        el.parentNode.removeChild( el );
        var img = document.createElement("img");
        var reader = new FileReader();
        reader.onloadend = function() {
             img.src = reader.result;
             img.setAttribute('id', 'pic');
             img.setAttribute('width', '30%');
             img.setAttribute('height', '30%');
        }
        reader.readAsDataURL(file);
        $("input").after(img);
    }
});
</script>-->
</html>