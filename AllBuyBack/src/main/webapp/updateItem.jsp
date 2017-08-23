<%@ page import="com.allbuyback.AllBuyBack.model.ItemBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改商品資訊</title>

<link rel="stylesheet" href="styles/main.css"/>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
<link rel="stylesheet" href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="webjars/sweetalert/1.1.3/dist/sweetalert.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="styles/singleItem.css"/>

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

/*------------------------*/
/* .myActive  { */
/*     border-top:pink 5px solid; */
/* } */


.marketName:hover {
  text-decoration: none;
/*   color:gray; */
}


.tdclass{
  font-family: 微軟正黑體;
  font-size: 25px;
  width:150px;
  height:60px;
}


</style>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

$(function(){
	$('#i_class1').change(getI_Class2JSON);
	$('#i_class2').change(getI_Class3JSON);
	$('#s_class1').change(getS_Class2JSON);
	$('#adds_class1').click(InsertS_Class1JSON)
	$('#adds_class2').click(InsertS_Class2JSON)
	getCountryJSON();
	getI_Class1JSON();
	getS_Class1JSON();
})

function getCountryJSON(){
	$.getJSON("<c:url value='/countryjson.SPRINGcontroller'/>",			                 
			  function(data){			 
				 var docFragment = $(document.createDocumentFragment());				 
				 for(var i=0;i<data.country.length;i++){
					 var country_id = data.country[i].country_id;
					 var country_name = data.country[i].country_name;
					 if("${itembean.country_id}"==country_id){
						 var option = $("<option selected=\"selected\"></option>").val(country_id).text(country_name);	 						 
					 }else{
						 var option = $("<option></option>").val(country_id).text(country_name);
					 }					 
					 docFragment.append(option);
				 }				 
				 $('#country_id').empty();
				 $('#country_id').append(docFragment);
			 }			 
	)
}

function getI_Class1JSON(){
	$.getJSON("<c:url value='/item_class1json.SPRINGcontroller'/>",			 
			  function(data){			 
		var docFragment = $(document.createDocumentFragment());				 
				 for(var i=0;i<data.data.length;i++){
					 var i_Class1 = data.data[i].i_Class1;
					 var i_ClassName1 = data.data[i].i_className1;
					 if("${itembean.i_class1}"==i_Class1){
						 var option = $("<option selected=\"selected\"></option>").val(i_Class1).text(i_ClassName1);	 						 
					 }else{
						 var option = $("<option></option>").val(i_Class1).text(i_ClassName1);
					 }					 
					 docFragment.append(option);
				 }				 
				 $('#i_class1').empty();
				 $('#i_class1').append(docFragment);
				 getI_Class2JSON();
			 }			 
	)
}

function getI_Class2JSON(){
	$.getJSON("<c:url value='/item_class2json.SPRINGcontroller'/>",
			 {"i_class1":$('#i_class1').val()},
			  function(data){			 
				 var docFragment = $(document.createDocumentFragment());				 
				 for(var i=0;i<data.data.length;i++){
					 var i_Class2 = data.data[i].i_Class2;
					 var i_ClassName2 = data.data[i].i_className2;
					 if("${itembean.i_class2}"==i_Class2){
						 var option = $("<option selected=\"selected\"></option>").val(i_Class2).text(i_ClassName2);	 						 
					 }else{
						 var option = $("<option></option>").val(i_Class2).text(i_ClassName2);
					 }
					 docFragment.append(option);
				 }				 
				 $('#i_class2').empty();
				 $('#i_class2').append(docFragment);
				 getI_Class3JSON();
			 }			 
	)
}

function getI_Class3JSON(){
	$.getJSON("<c:url value='/item_class3json.SPRINGcontroller'/>",
			 {"i_class2":$('#i_class2').val()},
			  function(data){		 
				 var docFragment = $(document.createDocumentFragment());				 
				 for(var i=0;i<data.data.length;i++){
					 var i_Class3 = data.data[i].i_Class3;
					 var i_ClassName3 = data.data[i].i_className3;					 
					 if("${itembean.i_class3}"==i_Class3){
						 var option = $("<option selected=\"selected\"></option>").val(i_Class3).text(i_ClassName3);	 						 
					 }else{
						 var option = $("<option></option>").val(i_Class3).text(i_ClassName3);
					 }
					 docFragment.append(option);
				 }
				 $('#i_class3').empty()
				 $('#i_class3').append(docFragment);			  
			 }
	)
}


function getS_Class1JSON(){
	$.post("<c:url value='/shopclass1.SPRINGcontroller'/>",{"action":"Select",
		"s_id":<c:out value="${itembean.s_id}">0</c:out>},function(data){
			showS_Class1JSON(JSON.parse(data));
			getS_Class2JSON()
		})//$.post結尾	
}//function結尾

function getS_Class2JSON(){
	$.post("<c:url value='/shopclass2.SPRINGcontroller'/>",{"action":"Select",
		"s_class1":$('#s_class1').val(),
		"s_id":<c:out value="${itembean.s_id}">0</c:out>},function(data){
			showS_Class2JSON(JSON.parse(data));
		})//$.post結尾	
}//function結尾



function InsertS_Class1JSON(){		
	$.post("<c:url value='/shopclass1.SPRINGcontroller'/>",{"action":"Insert",
		"s_id":<c:out value="${itembean.s_id}">0</c:out>,
		"s_class1Name":$('#2_s_class1name').val(),
		"s_discount":$('#s_discount1').val()},function(data){
			showS_Class1JSON(JSON.parse(data));
		})//$.post結尾	
}//function結尾

function InsertS_Class2JSON(){		
	$.post("<c:url value='/shopclass2.SPRINGcontroller'/>",{"action":"Insert",
		"s_id":<c:out value="${itembean.s_id}">0</c:out>,
		"s_class1":$('#s_class1').val(),
		"s_class2Name":$('#2_s_class2name').val(),		
		"s_discount":$('#s_discount2').val()},function(data){
			showS_Class2JSON(JSON.parse(data));
		})//$.post結尾	
}//function結尾

function showS_Class1JSON(data){
	var docFragment = $(document.createDocumentFragment());				 
	for(var i=0;i<data.data.length;i++){
		var s_id = data.data[i].s_id;
		var s_class1 = data.data[i].s_class1;
		var s_class1Name = data.data[i].s_class1Name;
		var s_discount = data.data[i].s_discount;
		if(<c:out value="${itembean.s_class1}">-1</c:out> == s_class1){
			var option = $('<option value=\"' + s_class1 +'\" selected=\"selected\">' + s_class1Name +'(折扣:' + s_discount + ')</option>')
		}else{
			var option = $('<option value=\"' + s_class1 +'\">' + s_class1Name +'(折扣:' + s_discount + ')</option>')	
		}
		
		docFragment.append(option);
	}
	$('#s_class1').empty()
	$('#s_class1').append(docFragment);
}

function showS_Class2JSON(data){
	var docFragment = $(document.createDocumentFragment());				 
	for(var i=0;i<data.data.length;i++){
		var s_id = data.data[i].s_id;
		var s_class1 = data.data[i].s_class1;
		var s_class2 = data.data[i].s_class2;
		var s_class2Name = data.data[i].s_class2Name;
		var s_discount = data.data[i].s_discount;
		if(<c:out value="${itembean.s_class2}">-1</c:out>==s_class2){
			var option = $('<option value=\"' + s_class2 +'\" selected=\"selected\">' + s_class2Name +'(折扣:' + s_discount + ')</option>')
		}else{
			var option = $('<option value=\"' + s_class2 +'\">' + s_class2Name +'(折扣:' + s_discount + ')</option>')
		}
		
		docFragment.append(option);
	}
	$('#s_class2').empty()
	$('#s_class2').append(docFragment);
}
</script>
</head>
<body style="background-color:rgb(234,234,234)">

<jsp:include page="includeTop.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <div class="col-sm-12"  style="background-color: #BCD2EE;height:1200px;padding-left:50px;position: relative;margin-bottom: 50px;margin-top: 50px">

<h2  style="text-align: center;margin-top: 30px;font-family: 微軟正黑體;margin-bottom: 20px;">修改商品</h2>

<form action="<c:url value='/item.SPRINGcontroller'/>" method="post" enctype="multipart/form-data">
	<table>
		<tr><td>
			<input type="hidden" name="i_id" id="i_id"  value="${itembean.i_id}" />
			<input type="hidden" name="s_id" id="s_id"  value="${itembean.s_id}" />
			<input type="hidden" name="i_onSellDate" id="i_onSellDate"  value="${i_onSellDate}" />
			<input type="hidden" name="i_soldQuantity"  id="i_soldQuantity" value="${itembean.i_soldQuantity}" />
			<input type="hidden" name="i_popular" id="i_popular"  value="${itembean.i_popular}" />
			<input type="hidden" name="i_click" id="i_click"  value="${itembean.i_click}" />
			<input type="hidden" name="prodaction" value="Update"/>
		</td></tr>
		<tr><td class="tdclass">商品名稱：</td><td><input type="text" name="i_name" id="i_name" value="${itembean.i_name}" size="40"  style="height:30px"/></td><td></td></tr>
		<tr><td class="tdclass">商品簡介：</td><td><input type="text" name="i_describe" id="i_describe" value="${itembean.i_describe}" size="40"  style="height:30px"/></td><td></td></tr>
		<tr><td class="tdclass">商品價格：</td><td><input type="text" name="i_price" id="i_price" value="${itembean.i_price}"  size="20"  style="height:30px"/></td><td>${errors.i_price}</td></tr>
		<tr><td class="tdclass">商品數量：</td><td><input type="text" name="i_quantity" id="i_quantity" value="${itembean.i_quantity}"  size="20"  style="height:30px"/></td><td>${errors.i_quantity}</td></tr>
		<tr><td class="tdclass">所在國家：</td><td><select id="country_id" name="country_id" style="height:30px;font-size:18px"></select></td></tr>
		<tr><td class="tdclass">到貨時間：</td><td><input type="date" name="i_arrivedDate" id="i_arrivedDate" value="${i_arrivedDate}" style="height:30px;font-size:18px"/></td><td>${errors.i_arrivedDate}</td></tr>		
		<tr><td class="tdclass">上架狀態：</td><td><select style="height:30px;font-size:18px" id="i_status" name="i_status" <c:if test="${itembean.i_status == 3}">disabled="disabled"</c:if>>
									<option style="font-size:18px" value="1" <c:if test="${itembean.i_status == 1}">selected="selected"</c:if>>上架</option>
									<option style="font-size:18px" value="2" <c:if test="${itembean.i_status == 2}">selected="selected"</c:if>>下架</option>
									<c:if test="${itembean.i_status == 3}"><option value="3" selected="selected">停權</option></c:if>
								</select></td><td></td></tr>																
		<tr><td class="tdclass">商品分類一：</td><td><select id="i_class1" name="i_class1" style="height:30px;font-size:18px"></select></td><td></td></tr>
		<tr><td class="tdclass">商品分類二：</td><td><select id="i_class2" name="i_class2" style="height:30px;font-size:18px"></select></td><td></td></tr>
		<tr><td class="tdclass">商品分類三：</td><td><select id="i_class3" name="i_class3" style="height:30px;font-size:18px"></select></td><td></td></tr>
		<tr><td class="tdclass">圖片一：</td><td><input type="file" id="picture1" name="picture1" style="height:30px;font-size:18px"/></td><td></td></tr>
		<tr><td class="tdclass">圖片二：</td><td><input type="file" id="picture2" name="picture2" style="height:30px;font-size:18px"/></td><td></td></tr>
		<tr><td class="tdclass">圖片三：</td><td><input type="file" id="picture3" name="picture3" style="height:30px;font-size:18px"/></td><td></td></tr>
		<tr><td class="tdclass">圖片四：</td><td><input type="file" id="picture4" name="picture4" style="height:30px;font-size:18px"/></td><td></td></tr>
		<tr><td class="tdclass">圖片五：</td><td><input type="file" id="picture5" name="picture5" style="height:30px;font-size:18px"/></td><td></td></tr>
	</table>
		<button style="position:absolute;top:1080px;left:390px;color:white;font-family:微軟正黑體;font-size:25px;background-color:rgb(42,186,171);border:rgb(42,186,171);border-radius:15px 15px;padding:5px 15px"  type="submit" <c:if test="${itembean.i_status == 3}">disabled="disabled"</c:if>>送出修改</button><c:if test="${itembean.i_status == 3}">此商品已被管理員下架，請<a href="">點此</a>與管理員聯絡</c:if>
	
</form>
<form action="<c:url value='/shop.html'/>" method="get">
			<button type="submit" name="s_id" value="${itembean.s_id }" style="position:absolute;top:1080px;left:630px;color:white;font-family:微軟正黑體;font-size:25px;background-color:#EEA2AD;border:#EEA2AD;border-radius:15px 15px;padding:5px 15px">回到商店</button>
</form>
<div><c:if test="${not empty update }">修改商品成功</c:if></div>


</div>
</div>
</div>	
	

<jsp:include page="_Footer.jsp"></jsp:include>		
</body>
</html>