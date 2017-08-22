<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜尋結果</title>

    <link rel="stylesheet" href="styles/main.css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script src="js/bootstrap.min.js"></script> 

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="styles/ad.css"/>

<style>
.ThisWeek {  /*關於本週頭條  以下三個class貼在main裡不能跑會衝突*/
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
.icon-success {  /*改變bootstrap icon的顏色*/
 color: #FFB90F;
   float:left;
}


/*底下分頁*/
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
    background-color: gray;
    color: white;
    border: 1px solid gray;
}

.pagination a:hover:not(.active) {
    background-color: #ddd;

}/*底下分頁結束*/


</style>

</head>
<body style="background-color:rgb(234,234,234)">
<jsp:include page="includeTop.jsp"></jsp:include>


<!--搜尋結果 只顯示兩層-->
<div class="container">
    <div class="row">
        <div class="col-sm-12">

          <div  style="padding-bottom:10px;margin-top:10px;margin-bottom: 20px;border-bottom: 2px solid; black;font-family:微軟正黑體;font-size:20px;font-weight:600;">
             <span class="glyphicon glyphicon-search" style="position:relative;margin-right: 10px;"></span>搜尋結果  /
                <div style="color:gray;position:absolute;top:11px;left:150px;"><a href="ShopSearch?countryCl=${countryNo}">${countryCl}</a></div>
             
          </div>

        
      </div><!--12-->
    </div><!--row結束-->
</div><!--container結束-->


<!--兩邊空白    廣告內容------->
<div class="container">
 <div class="row">
		<c:forEach var="shopVO" items="${shoplist}">
		<div class="col-sm-3">
			<div class="adOuter" style="margin: 10px">
				<a href="shop.html?s_id=${shopVO.s_id}"><img height="265" width="235" src="ReadPictureForItem?i_id=${shopVO.i_id}"></a>
				<div class="adContent" style="font-size:18px">平均評價: ${shopVO.s_avgScore}</div>
				<span class="glyphicon glyphicon-map-marker marker" ></span>
				<div id="country" class="countryFrom" style="margin:10px">${shopVO.country_name}</div>
				<div class="sellerWho" style="margin:10px">被收藏數: ${shopVO.s_popular} 被點擊數: ${shopVO.s_click}</div>
			</div>
		</div>
		</c:forEach>
  </div>
<br /><br />
 
<br /></div><!--兩邊空白結束-->


<!--分頁搜尋-->
<div class="center">
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



<jsp:include page="_Footer.jsp"></jsp:include>
</body>
</html>