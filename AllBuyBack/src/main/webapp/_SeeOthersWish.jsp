<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>看願望</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(function(){
	$('#CT_window').dialog({
		autoOpen:false,
		height:400,
		width:650,
	});
	$('#CT_btn').click(function(){
		$('#CT_window').dialog('open');
		
		$.ajax({
			type:"GET",
			url:"MakeWishComeTrue?w_Id=${wVO.w_id}",
			success:function(changePage){
				$('#CT_window').html(changePage);
			}
		});
// 		window.open("MakeWishComeTrue?w_Id=${wVO.w_id}", 'newwindow','height=400, width=680');
	});
	
	for(var i=1; i<=5; i++){
		$('#pic'+i).dialog({
			autoOpen:false,
			height:640,
			width:540,
			show: "blind",
			hide: "blind",
			buttons: { 
	             "Ok": function() { $(this).dialog("close"); }, 
	         }	
		});
	}
	
	$('#spic1').click(function(){
		$('#pic1').dialog('open');
	});
	$('#spic2').click(function(){
		$('#pic2').dialog('open');
	});
	$('#spic3').click(function(){
		$('#pic3').dialog('open');
	});
	$('#spic4').click(function(){
		$('#pic4').dialog('open');
	});
	$('#spic5').click(function(){
		$('#pic5').dialog('open');
	});
	
});

</script>


<style>
/*以下三個class貼在main裡不能跑會衝突*/
 .ThisWeek { 
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
.icon-success {  /*本週頭條 星星 改變bootstrap icon的顏色*/
 color: #FFB90F;
   float:left;
}

 /*設定登入後的大頭貼*/

.myPicture {
    width:45px;height:45px; /*正圓形，所以寬與高都設一樣*/
    border-radius:99em;
    margin-left:1020px;
    border:2px lightgray solid;
    text-align:center;
    margin-top:5px;
  
}
.myPicture img{
    width:40px;height:40px; /*照片比div外框小一點*/
    border-radius:99em;
}

.threeDot{
    width:38px;height:38px; /*照片比div外框小一點*/
    border-radius:99em;
    background-color: #B3B3B3;
    text-align:center;
    margin-left:1090px;
    margin-top:-40px;
    padding:7px;
    padding-left:9px;
    }
.threeDot span { /*三個垂直白點*/
    color:white;
    font-size:20px;
    }
/*--------------------------------------*/
.dropdown-content {
    display:none;
    position:absolute;
    right: 18px;
    background-color:lightgray;/*#B3B3B3; /*#C1CDCD;*/
    width: 180px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    margin-top:8px;
    line-height:15px;
    font-family:微軟正黑體;
    font-size:16px;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

/*------許願池部份-----*/
    .wishOwner {
    /*background-color:yellow;*/
    width:150px;
     float:left;
     color:black;
     font-size:25px;
     font-weight:500;
     letter-spacing:3px;
     font-family: 新細明體;
     padding-left: 10px;
     
    }
    .wish {
    /*background-color:pink;*/
    width:200px;
     float:left;
     padding-left:20px;
     color:black;
     font-weight:500;
     font-size:25px;
     letter-spacing:3px;
     font-family: 新細明體;
    }
    .wishContent {
      /*background-color:yellow;*/
      width:500px;
      float:left;
     color:black;
      font-weight:500;
      font-size:25px;
      font-family: 新細明體;
    
    }
    
    
/*----------底下分頁-----------*/
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
    background-color: #CD8162;
    color: white;
    border: 1px solid #CD8162;
}

.pagination a:hover:not(.active) {
    background-color: #ddd;

}/*底下分頁結束*/


#borderimg { 
    border: 10px solid transparent;
    padding: 20px 50px;
    -webkit-border-image: url(images/border.png) 20 stretch; /* Safari 3.1-5 */
    -o-border-image: url(images/border.png) 20 stretch; /* Opera 11-12.1 */
    border-image: url(images/border.png) 20 stretch;
    height:1120px;
    width:850px;
    margin-left:170px; 
}

tbody{
 font-size:25px;
 font-family:微軟正黑體;
}

/*上傳檔案按鈕*/

.btn-file {   
    position: relative;   
    overflow: hidden;   
}   
.btn-file input[type=file] {   
    position: absolute;   
    top: 0;   
    right: 0;   
    min-width: 100%;   
    min-height: 100%;   
    font-size: 100px;   
    text-align: right;   
    filter: alpha(opacity=0);   
    opacity: 0;   
    outline: none;   
    background: white;   
    cursor: inherit;   
    display: block;   
}  
</style>


</head>
<body style="background-color:rgb(234,234,234)">
<jsp:include page="includeTop.jsp"></jsp:include>


<div class="container">
    <div class="row">
        <div class="col-sm-12" style="background-color:#EED5B7;height:1350px;margin-bottom:50px;margin-top: 40px;">


 <div style="margin-top:50px;margin-bottom:20px;text-align:center;color:#E9967A;font-family:新細明體;font-weight:900;letter-spacing:8px;font-size:50px;">
    <span>喜歡這個願望嗎？趕快+1喔!</span>
 </div>



<form name="UpdateWishContent" id="UpdateWishContent1" action="UpdateWish?w_Id=${wVO.w_id}" method="POST" enctype="multipart/form-data">
	<fieldset id="borderimg" style="background-color:#EED5B7;">
		<table>
		<tbody>
		    <tr>
			    <td width="200" height="100">許願編號 :</td>
			    <td width="550" height="100" align="left" >
			   	<input id='w_Id1' style="text-align:left;border:1px solid #E9967A;" name="w_Id" disabled value="${wVO.w_id}" type="text" size="14">
			    </td>
			</tr>
			<tr>
			    <td width="200" height="100">許願人 :</td>
			    <td width="550" height="100" align="left" >
			   <input id='account1' style="text-align:left;border:1px solid #E9967A;" name="account" disabled value="${wVO.m_account}" type="text" size="14">
			    </td>
			</tr>
			<tr>
			    <td width="200" height="100">許願時間:</td>
			    <td width="550" height="100" align="left" >
			    <input id='date1' style="text-align:left;border:1px solid #E9967A;" name="date" disabled value="${wVO.w_date}" type="text" size="14">
		  </tr>
			
			<tr>
		    <td width="200" height="100">許願標題:</td>
		    <td width="550" height="100" align="left" >
		         <input id='title1' style="text-align:left;border:1px solid #E9967A;" name="title" disabled value="${wVO.w_title}" type="text" size="14">
		    </td>
		 </tr>
			<tr>
		    <td width="200" height="100">許願內容:</td>
		    <td width="550" height="100" align="left" >
		         <textarea cols="40" rows="5" name="content" id="content1" disabled style="border:1px solid #E9967A;">${wVO.w_content}</textarea>
		    </td>
		 </tr>
			<tr>
		    <td width="200" height="150">圖片:</td>
		    <td width="550" height="150" align="left" >
			    	<c:if test="${not empty p1}">
			    		<div style="float:left; margin:5px">
			    		<div id="pic1"><img height='500' width='500' src='ReadPictureForWP?w_Id=${wVO.w_id}&pic_id=${p1}'></div>
						<img id="spic1" height='100' width='100' src='ReadPictureForWP?w_Id=${wVO.w_id}&pic_id=${p1}'>
						</div>
					</c:if>
					<c:if test="${not empty p2}">
						<div style="float:left; margin:5px">
						<div id="pic2"><img height='500' width='500' src='ReadPictureForWP?w_Id=${wVO.w_id}&pic_id=${p2}'></div>
						<img id="spic2" height='100' width='100' src='ReadPictureForWP?w_Id=${wVO.w_id}&pic_id=${p2}'>
						</div>
					</c:if>
					<c:if test="${not empty p3}">
						<div style="float:left; margin:5px">
						<div id="pic3"><img height='500' width='500' src='ReadPictureForWP?w_Id=${wVO.w_id}&pic_id=${p3}'></div>
						<img id="spic3" height='100' width='100' src='ReadPictureForWP?w_Id=${wVO.w_id}&pic_id=${p3}'>
						</div>
					</c:if>
					<c:if test="${not empty p4}">
						<div style="float:left; margin:5px">
						<div id="pic4"><img height='500' width='500' src='ReadPictureForWP?w_Id=${wVO.w_id}&pic_id=${p4}'></div>
						<img id="spic4" height='100' width='100' src='ReadPictureForWP?w_Id=${wVO.w_id}&pic_id=${p4}'>
						</div>
					</c:if>
					<c:if test="${not empty p5}">
						<div style="float:left; margin:5px">
						<div id="pic5"><img height='500' width='500' src='ReadPictureForWP?w_Id=${wVO.w_id}&pic_id=${p5}'></div>
						<img id="spic5" height='100' width='100' src='ReadPictureForWP?w_Id=${wVO.w_id}&pic_id=${p5}'>
						</div>
					</c:if>
		    </td>
		</tr>
		<tr>
		    <td width="200" height="100">參與願望名單:</td>
		    <td width="550" height="100" align="left" >
		    	<c:forEach var="list" items="${wlList}">
		    		${list.m_account}<br>
		        </c:forEach>
		    </td>
		</tr>
		
        	<tr>
		    <td width="200" height="100">實現願望賣家:</td>
		    <td width="550" height="100" align="left" >
		    	<c:forEach var="as" items="${asVO}">
		    		${as.m_account}實現願望的內容: <a href="SingleItemContent?w_id=${wVO.w_id}&i_id=${iVO.i_id}">${iVO.i_name}</a>
		    		<c:if test="${not empty iVO.i_name}">
		    			<input type="button" value="加入購物車"><br>
		    		</c:if>
		    	</c:forEach>
		    </td>
		</tr>
			<tr>
		    <td height="150" colspan="2" align="center" >
		       <a href="AddOne?w_Id=${wVO.w_id}"><input class="btn" type="button" value="+1" style="font-size:22px;font-weight:700;border-radius: 5px 5px;background-color: #EE9572;padding:8px 18px;margin-right: 30px;color:black"></a>
		       <a href="CheckPeopleList"><input class="btn" type="button" value="回許願池" style="font-size:22px;font-weight:700;border-radius: 5px 5px;background-color: #FFC125;padding:8px 18px;margin-right: 30px;color:black"></a>
<%--                <a href="MakeWishComeTrue?w_Id=${wVO.w_id}"><input class="btn" type="button" value="接受願望"></a> --%>
			   <input id="CT_btn" class="btn" type="button" value="接受願望" style="font-size:22px;font-weight:700;border-radius: 5px 5px;background-color: #EE9572;padding:8px 18px">
			   <div id="CT_window"></div>
		       <br>
		       <font color='red' size='-1'>${errorMsg.login}</font>
		       <font color='red' size='-1'>${errorMsg.duplicateAccount}</font>
		       <font color='red' size='-1'>${errorMsg.doubleAccount}</font>
		       <font color='red' size='-1'>${errorMsg.AccountNoRight}</font>
		    </td>
		</tr>			
		
		</tbody>
		</table>
	</fieldset>
	</form>


        </div>
    </div>
    
</div>

<jsp:include page="_Footer.jsp"></jsp:include>


</body>
</html>