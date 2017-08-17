<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty LoginOK}">
	<c:set var="target" value="${pageContext.request.servletPath}" scope="session"/>
	<c:redirect url="/login.jsp"/>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>許願紙</title>

  <link rel="stylesheet" href="styles/main.css"/>
  <link rel="stylesheet" href="css/bootstrap.min.css"/>
  <script src="js/bootstrap.min.js"></script> 

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
    -webkit-border-image: url(images/border1.png) 20 stretch; /* Safari 3.1-5 */
    -o-border-image: url(images/border1.png) 20 stretch; /* Opera 11-12.1 */
    border-image: url(images/border1.png) 20 stretch;
    height:1030px;
    width:800px;
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
        <div class="col-sm-12" style="background-color:#9AC0CD/*#00CDCD*/;height:1300px;margin-bottom:50px;margin-top: 40px;">


 <div style="margin-top:50px;margin-bottom:20px;text-align:center;color:#00008B;font-family:Algerian;font-weight:900;letter-spacing:8px;font-size:50px;">
    <span>許願紙</span>
 </div>



<form name="WishContent" id="WishContent1" action="MakeAWish" method="POST" enctype="multipart/form-data" ">
	<fieldset id="borderimg" style="background-color:#9AC0CD;">
		<table>
		<tbody>
			<tr>
			    <td width="200" height="100">許願人 :</td>
			    <td width="550" height="100" align="left" >
			    <input id='account1' style="text-align:left;border:1px solid gray;" name="account" disabled value="${LoginOK.m_account}" type="text" size="15">
			    </td>
			</tr>
			<tr>
			    <td width="200" height="100">許願標題 :</td>
			    <td width="550" height="100" align="left" >
			         <input id='title1' style="text-align:left;;border:1px solid gray;" name="title" value="${param.title}" type="text" size="15">
			         <div style="color:#FF0000; display: inline;">${ErrorMsg.title}</div>
			    </td>
			</tr>
			<tr>
			    <td width="200" height="100" style="margin-right: 50px;">許願內容 :</td>
			    <td width="550" height="100" align="left" >
			         <textarea cols="40" rows="5" name="content" id="content1" style="border:1px solid gray;">${param.content}</textarea>
			         <div style="color:#FF0000; display: inline">${ErrorMsg.content}</div>
			    </td>
			</tr>
			<tr>
			    <td width="200" height="100">圖片上傳1 :</td>
			    <td width="550" height="100" align="left" >
				      <span class="btn btn-default btn-file" style="background-color: #EED5D2;border:#EED5D2;font-size: 23px;font-family: 微軟正黑體;border-radius: 5px 5px">  
                                                                     選擇檔案 <input type="file" name="file1" id="file1" accept="image/*">  
                     </span>  
			    </td>
			</tr>
				<tr>
			    <td width="200" height="100">圖片上傳2 :</td>
			    <td width="550" height="100" align="left" >
				      <span class="btn btn-default btn-file" style="background-color: #EED5D2;border:#EED5D2;font-size: 23px;font-family: 微軟正黑體;border-radius: 5px 5px">  
                                                                     選擇檔案 <input type="file" name="file2" id="file2" accept="image/*">  
                     </span>  
			    </td>
			</tr>
				<tr>
			    <td width="200" height="100">圖片上傳3 :</td>
			    <td width="550" height="100" align="left" >
				      <span class="btn btn-default btn-file" style="background-color: #EED5D2;border:#EED5D2;font-size: 23px;font-family: 微軟正黑體;border-radius: 5px 5px">  
                                                                     選擇檔案 <input type="file" name="file3" id="file3" accept="image/*">  
                     </span>  
			    </td>
			</tr>
				<tr>
			    <td width="200" height="100">圖片上傳4 :</td>
			    <td width="550" height="100" align="left" >
				      <span class="btn btn-default btn-file" style="background-color: #EED5D2;border:#EED5D2;font-size: 23px;font-family: 微軟正黑體;border-radius: 5px 5px">  
                                                                     選擇檔案 <input type="file" name="file4" id="file4" accept="image/*">  
                     </span>  
			    </td>
			</tr>
				<tr>
			    <td width="200" height="100">圖片上傳5 :</td>
			    <td width="550" height="100" align="left" >
				      <span class="btn btn-default btn-file" style="background-color: #EED5D2;border:#EED5D2;font-size: 23px;font-family: 微軟正黑體;border-radius: 5px 5px">  
                                                                     選擇檔案 <input type="file" name="file5" id="file5" accept="image/*">  
                     </span>  
			    </td>
			</tr>
			<tr>
			    <td height="100" colspan="2" align="right">
			       <input class="btn btn-default" type="submit" value="許願" style="font-size:22px;font-weight:700;border-radius: 5px 5px;background-color: #8E388E;border:#8E388E;padding:8px 18px;margin-right: 30px;color:white" >
			       <a href="CheckYourList"><input class="btn btn-default" type="button" value="我的願望清單" style="font-size:22px;font-weight:700;border-radius: 5px 5px;background-color: #4F94CD;border:#4F94CD;padding:8px 18px;color:white"></a>
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