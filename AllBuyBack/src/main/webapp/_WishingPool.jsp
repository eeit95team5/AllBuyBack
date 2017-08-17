<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>許願池</title>

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
</style>
</head>
<body style="background-color:rgb(234,234,234)">
<jsp:include page="includeTop.jsp"></jsp:include>


<div class="container">
    <div class="row">
        <div class="col-sm-12" style="background-color:white;height:1030px;margin-bottom:50px;margin-top: 40px;padding-top: 20px">
            <div style="margin-bottom:30px;text-align:center;color:#E9967A;font-family:Algerian;font-weight:900;letter-spacing:7px;font-size:50px;">
                <span>Wishing Pool</span>
            </div>

            <div style="clear:both;padding-bottom:10px;border-bottom:1px solid #E9967A;letter-spacing:7px;font-size:25px;">
                <div class="wishOwner" style="font-size:20px;font-family:微軟正黑體;font-weight:700;color:#CD8162;margin-top: 15px;">許願人    </div><div class="wish" style="font-size:20px;font-family:微軟正黑體;font-weight:700;color:#CD8162;margin-top: 15px;">願望</div>
                <div class="wishContent" style="text-align:center;font-size:20px;font-family:微軟正黑體;font-weight:700;color:#CD8162;margin-top: 15px;">內容</div>
                 <button id="makeAWish" style="margin-left:145px;border:#20B2AA 2px solid;font-size:23px;font-weight:600;padding:10px 10px;background-color:white;color:#778899;">我要許願</button>
            
            </div>


            <div style="height:100px;clear:both;padding-bottom:50px;border-bottom:1px solid #E9967A;color:#8B7765;font-family:微軟正黑體;font-weight:700;">
                <div class="wishOwner" style="height:80px;line-height:100px;">小叮噹</div><div class="wish" style="height:80px;line-height:100px;">變白</div>
                <div class="wishContent" style="text-align:center;height:80px;line-height:100px;">請幫忙代購日本強力美白面膜</div>
                <button style="margin-top:22px;margin-left:150px;border:#CD8162 2px solid;font-size:20px;padding:10px 10px;background-color:white;color:#E9967A;">看願望</button>
            </div>
            
             <div style="height:100px;clear:both;padding-bottom:50px;border-bottom:1px solid #E9967A;color:#8B7765;font-family:微軟正黑體;font-weight:700;">
                <div class="wishOwner" style="height:80px;line-height:100px;">小叮噹</div><div class="wish" style="height:80px;line-height:100px;">變白</div>
                <div class="wishContent" style="text-align:center;height:80px;line-height:100px;">請幫忙代購日本強力美白面膜</div>
                <button style="margin-top:22px;margin-left:150px;border:#CD8162 2px solid;font-size:20px;padding:10px 10px;background-color:white;color:#E9967A;">看願望</button>
            </div>
            
             <div style="height:100px;clear:both;padding-bottom:50px;border-bottom:1px solid #E9967A;color:#8B7765;font-family:微軟正黑體;font-weight:700;">
                <div class="wishOwner" style="height:80px;line-height:100px;">小叮噹</div><div class="wish" style="height:80px;line-height:100px;">變白</div>
                <div class="wishContent" style="text-align:center;height:80px;line-height:100px;">請幫忙代購日本強力美白面膜</div>
                <button style="margin-top:22px;margin-left:150px;border:#CD8162 2px solid;font-size:20px;padding:10px 10px;background-color:white;color:#E9967A;">看願望</button>
            </div>
            
             <div style="height:100px;clear:both;padding-bottom:50px;border-bottom:1px solid #E9967A;color:#8B7765;font-family:微軟正黑體;font-weight:700;">
                <div class="wishOwner" style="height:80px;line-height:100px;">小叮噹</div><div class="wish" style="height:80px;line-height:100px;">變白</div>
                <div class="wishContent" style="text-align:center;height:80px;line-height:100px;">請幫忙代購日本強力美白面膜</div>
                <button style="margin-top:22px;margin-left:150px;border:#CD8162 2px solid;font-size:20px;padding:10px 10px;background-color:white;color:#E9967A;">看願望</button>
            </div>
            
             <div style="height:100px;clear:both;padding-bottom:50px;border-bottom:1px solid #E9967A;color:#8B7765;font-family:微軟正黑體;font-weight:700;">
                <div class="wishOwner" style="height:80px;line-height:100px;">小叮噹</div><div class="wish" style="height:80px;line-height:100px;">變白</div>
                <div class="wishContent" style="text-align:center;height:80px;line-height:100px;">請幫忙代購日本強力美白面膜</div>
                <button style="margin-top:22px;margin-left:150px;border:#CD8162 2px solid;font-size:20px;padding:10px 10px;background-color:white;color:#E9967A;">看願望</button>
            </div>

             <div style="height:100px;clear:both;padding-bottom:50px;border-bottom:1px solid #E9967A;color:#8B7765;font-family:微軟正黑體;font-weight:700;">
                <div class="wishOwner" style="height:80px;line-height:100px;">小叮噹</div><div class="wish" style="height:80px;line-height:100px;">變白</div>
                <div class="wishContent" style="text-align:center;height:80px;line-height:100px;">請幫忙代購日本強力美白面膜</div>
                <button style="margin-top:22px;margin-left:150px;border:#CD8162 2px solid;font-size:20px;padding:10px 10px;background-color:white;color:#E9967A;">看願望</button>
            </div>
            
             <div style="height:100px;clear:both;padding-bottom:50px;border-bottom:1px solid #E9967A;color:#8B7765;font-family:微軟正黑體;font-weight:700;">
                <div class="wishOwner" style="height:80px;line-height:100px;">小叮噹</div><div class="wish" style="height:80px;line-height:100px;">變白</div>
                <div class="wishContent" style="text-align:center;height:80px;line-height:100px;">請幫忙代購日本強力美白面膜</div>
                <button style="margin-top:22px;margin-left:150px;border:#CD8162 2px solid;font-size:20px;padding:10px 10px;background-color:white;color:#E9967A;">看願望</button>
            </div>

          
          
              <!--分頁搜尋-->
			<div class="center" style="margin-top: 50px;">
			  <div class="pagination">
			    <a href="#">&laquo;</a>
			    <a href="#"  class="active">1</a>
			    <a href="#">2</a>
			    <a href="#">3</a>
			    <a href="#">4</a>
			    <a href="#">5</a>
			    <a href="#">&raquo;</a>
			  </div>
			</div>



        </div>
    </div>
    
</div>
 

<jsp:include page="_Footer.jsp"></jsp:include>

</body>
</html>