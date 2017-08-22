<%@page import="java.util.List,java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增商品</title>

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
<script type="text/javascript">

function clearForm() {
	var inputs = document.getElementsByTagName("input");
	for(var i=0; i<inputs.length; i++) {
		if(inputs[i].type=="text") {
			inputs[i].value="";
		}
	}
}

$(function(){
	$('#i_class1').change(getJSON2);
	$('#i_class2').change(getJSON3);
	$('#adds_class1').click(InsertS_Class1JSON)
	$('#adds_class2').click(InsertS_Class2JSON)
	document.getElementById('i_arrivedDate').valueAsDate = new Date();	
// 	document.getElementById('i_onSellDate').valueAsDate = new Date();
	getJSON1();	
	getS_Class1JSON()
})

function getJSON1(){
	$.getJSON("<c:url value='/item_class1json.SPRINGcontroller'/>",
			  function(data){			 
				 var docFragment = $(document.createDocumentFragment());				 
				 for(var i=0;i<data.data.length;i++){
					 var i_Class1 = data.data[i].i_Class1;
					 var i_ClassName1 = data.data[i].i_className1;
					 var option = $("<option></option>").val(i_Class1).text(i_ClassName1)
					 docFragment.append(option);
				 }				 
				 $('#i_class1').empty();
				 $('#i_class1').append(docFragment);
				 getJSON2();
			 }			 
	)
}

function getJSON2(){
	$.getJSON("<c:url value='/item_class2json.SPRINGcontroller'/>",
			 {"i_class1":$('#i_class1').val()},
			  function(data){			 
				 var docFragment = $(document.createDocumentFragment());				 
				 for(var i=0;i<data.data.length;i++){
					 var i_Class2 = data.data[i].i_Class2;
					 var i_ClassName2 = data.data[i].i_className2;
					 var option = $("<option></option>").val(i_Class2).text(i_ClassName2)
					 docFragment.append(option);
				 }				 
				 $('#i_class2').empty();
				 $('#i_class2').append(docFragment);
				 getJSON3();
			 }			 
	)
}

function getJSON3(){
	$.getJSON("<c:url value='/item_class3json.SPRINGcontroller'/>",
			 {"i_class2":$('#i_class2').val()},
			  function(data){		 
				 var docFragment = $(document.createDocumentFragment());				 
				 for(var i=0;i<data.data.length;i++){
					 var i_Class3 = data.data[i].i_Class3;
					 var i_ClassName3 = data.data[i].i_className3;
					 var option = $("<option></option>").val(i_Class3).text(i_ClassName3)
					 docFragment.append(option);
				 }
				 $('#i_class3').empty()
				 $('#i_class3').append(docFragment);			  
			 }
	)
}

function InsertS_Class1JSON(){		
	$.post("<c:url value='/shopclass1.SPRINGcontroller'/>",{"action":"Insert",
		"s_id":<c:out value="${shop.s_id}">0</c:out>,
		"s_class1Name":$('#2_s_class1name').val(),
		"s_discount":$('#s_discount1').val()},function(data){
			showS_Class1JSON(JSON.parse(data));
		})//$.post結尾	
}//function結尾

function InsertS_Class2JSON(){		
	$.post("<c:url value='/shopclass2.SPRINGcontroller'/>",{"action":"Insert",
		"s_id":<c:out value="${shop.s_id}">0</c:out>,
		"s_class1":$('#s_class1').val(),
		"s_class2Name":$('#2_s_class2name').val(),		
		"s_discount":$('#s_discount2').val()},function(data){
			showS_Class2JSON(JSON.parse(data));
		})//$.post結尾	
}//function結尾

function getS_Class1JSON(){
	$.post("<c:url value='/shopclass1.SPRINGcontroller'/>",{"action":"Select",
		"s_id":<c:out value="${shop.s_id}">0</c:out>},function(data){
			showS_Class1JSON(JSON.parse(data));
			getS_Class2JSON()
		})//$.post結尾	
}//function結尾

function getS_Class2JSON(){
	$.post("<c:url value='/shopclass2.SPRINGcontroller'/>",{"action":"Select",
		"s_class1":$('#s_class1').val(),
		"s_id":<c:out value="${shop.s_id}">0</c:out>},function(data){
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
		var option = $('<option value=\"' + s_class1 +'\">' + s_class1Name +'(折扣:' + s_discount + ')</option>')	
		
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
		var option = $('<option value=\"' + s_class2 +'\">' + s_class2Name +'(折扣:' + s_discount + ')</option>')		
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
        <div class="col-sm-12"  style="background-color: #BCD2EE;height:800px;padding-left:50px;position: relative;margin-bottom: 50px;margin-top: 50px">
        
	
	<h2  style="text-align: center;margin-top: 30px;font-family: 微軟正黑體;margin-bottom: 20px;">新增商品</h2>
	<div id="test"></div>

	<form action="<c:url value="/item.SPRINGcontroller"/>" method="get">
		<table>
			<tr>
				<input type="hidden" name="i_id"  value="" readonly="readonly"/>
				<input type="hidden" name="s_id" readonly="readonly"
						value=<c:choose>
								<c:when test="${not empty result}">${result.s_id}</c:when>
								<c:when test="${not empty shop}">${shop.s_id}</c:when>
								<c:when test="${not empty insert}">${insert.s_id}</c:when>
								<c:otherwise></c:otherwise>
								</c:choose> />
				<input type="hidden" name="i_soldQuantity" readonly="readonly"
					value=<c:choose>
								<c:when test="${not empty result}">"${result.i_soldQuantity}"</c:when>
								<c:otherwise>"0"</c:otherwise>
						</c:choose> />
				<input type="hidden" name="i_status" readonly="readonly"
					value="1" />
				<input type="hidden" name="i_popular" readonly="readonly"
					value=<c:choose>
								<c:when test="${not empty result.i_popular}">"${result.i_popular}"</c:when>
								<c:otherwise>"0"</c:otherwise>
						</c:choose> />
				<input type="hidden" name="i_click" readonly="readonly"
					value=<c:choose>
								<c:when test="${not empty result.i_click}">"${result.i_click}"</c:when>
								<c:otherwise>"0"</c:otherwise>
						</c:choose> />
			</tr>
			<tr>
				<td  class="tdclass">商品名稱：</td>
				<td><input type="text" name="i_name" value="${result.i_name}"  size="40"  style="height:30px"></td>
				<td>${errors.i_name}</td>
			</tr>
			<tr>
				<td class="tdclass">商品簡介：</td>
				<td><input type="text" name="i_describe"
					value="${result.i_describe}"   size="40"  style="height:30px"></td>
				<td>${errors.i_describe}</td>
			</tr>
			<tr>
				<td class="tdclass">商品價格：</td>
				<td><input type="text" name="i_price" value="${result.i_price}"   size="20"  style="height:30px"></td>
				<td>${errors.i_price}</td>
			</tr>
			<tr>
				<td class="tdclass">商品數量：</td>
				<td><input type="text" name="i_quantity" value="${result.i_quantity}"  size="20"  style="height:30px"></td>
				<td>${errors.i_quantity}</td>
			</tr>
			<tr>
				<td class="tdclass">所在國家：</td>
				<td  style="height:30px"><select id="country_id" name="country_id" style="height:30px;font-size:18px">
						<c:if test="${not empty country }">
							<c:forEach var="cBean" items="${country}">
								<option value="${cBean.country_id }"  style="font-size:18px">${cBean.country_name }</option>
							</c:forEach>
						</c:if>
				</select></td>
				<td>${errors.country_id}</td>
			</tr>
			<tr>
				<td class="tdclass">到貨時間：</td>
				<td><input type="date" name="i_arrivedDate" id="i_arrivedDate"  style="height:30px;font-size:18px"></td>
				<td>${errors.i_arrivedDate}</td>
			</tr>			
			<tr>
				<td class="tdclass">商品分類一：</td>
				<td><select id="i_class1" name="i_class1"  style="height:30px;font-size:18px"></select></td>
				<td>${errors.country_id}</td>
			</tr>
			<tr>
				<td class="tdclass">商品分類二：</td>
				<td><select id="i_class2" name="i_class2" style="height:30px;font-size:18px"></select></td>
				<td>${errors.i_class2}</td>
			</tr>
			<tr>
				<td class="tdclass">商品分類三：</td>
				<td><select id="i_class3" name="i_class3" style="height:30px;font-size:18px"></select></td>
				<td>${errors.i_class3}</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td>商店分類一：</td> -->
<!-- 				<td><select id="s_class1" name="s_class1"></select></td> -->
<!-- 				<td>新增商店分類一：</td> -->
<!-- 				<td><input type="text" id="2_s_class1name"/></td> -->
<!-- 				<td><input type="number" id="s_discount1" min="0" max="100"/> -->
<!-- 					<button type="button" id="adds_class1">新增</button></td> -->
<%-- 				<td>${errors.s_class1}</td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>商店分類二：</td> -->
<!-- 				<td><select id="s_class2" name="s_class2"></select></td> -->
<!-- 				<td>新增商店分類二：</td> -->
<!-- 				<td><input type="text" id="2_s_class2name"/></td> -->
<!-- 				<td><input type="number" id="s_discount2" min="0" max="100"/> -->
<!-- 					<button type="button" id="adds_class2">新增</button></td> -->
<%-- 				<td>${errors.s_class2}</td> --%>
<!-- 			</tr> -->
			<tr>
				<td><button type="submit" name="prodaction" value="Insert"  style="position:absolute;top:680px;left:330px;color:white;font-family:微軟正黑體;font-size:25px;background-color:rgb(42,186,171);border:rgb(42,186,171);border-radius:15px 15px;padding:5px 15px">新增商品</button></td>
			</tr>
		</table>
	</form>
	<form action="<c:url value='/shop.html'/>" method="get">
		<table>
			<tr>
				<td><a href="<c:url value='/HomeIndex.jsp'/>"> <input type="button" value="回首頁" style="position:absolute;top:680px;left:720px;color:white;font-family:微軟正黑體;font-size:25px;background-color:#EEA2AD;border:#EEA2AD;border-radius:15px 15px;padding:5px 15px"></a></td>				
				<td><button type="submit" name="s_id" value="${shop.s_id}${result.s_id}"  style="position:absolute;top:680px;left:520px;color:white;font-family:微軟正黑體;font-size:25px;background-color:gray;border:gray;border-radius:15px 15px;padding:5px 15px">回到商店</button></td>
			</tr>
		</table>
	</form>
	<h3>
		<span class="error">${errors.action}</span>
	</h3>
	<c:if test="${not empty insertsuccess}">
		<h3>新增商品成功!</h3>
	</c:if>
	
	
</div>
</div>
</div>	
	
	
	
<%-- 	<c:if test="${not empty insertsuccess}"> --%>
<!-- 		<table border="1"> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th>i_id</th> -->
<!-- 					<th>i_name</th> -->
<!-- 					<th>i_describe</th> -->
<!-- 					<th>i_price</th> -->
<!-- 					<th>s_id</th> -->
<!-- 					<th>i_quantity</th> -->
<!-- 					<th>country_id</th> -->
<!-- 					<th>i_arrivedDate</th> -->
<!-- 					<th>i_onSellDate</th> -->
<!-- 					<th>i_soldQuantity</th> -->
<!-- 					<th>i_status</th> -->
<!-- 					<th>i_class1</th> -->
<!-- 					<th>i_class2</th> -->
<!-- 					<th>i_class3</th> -->
<!-- 					<th>i_popular</th> -->
<!-- 					<th>i_click</th> -->
<!-- 					<th>s_class1</th> -->
<!-- 					<th>s_class2</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<%-- 				<c:if test="${not empty select}"> --%>
<%-- 					<c:forEach var="bean" items="${result}"> --%>
<!-- 						<tr> -->
<%-- 							<td>${bean.i_id}</td> --%>
<%-- 							<td>${bean.i_name}</td> --%>
<%-- 							<td>${bean.i_describe}</td> --%>
<%-- 							<td>${bean.i_price}</td> --%>
<%-- 							<td>${bean.s_id}</td> --%>
<%-- 							<td>${bean.i_quantity}</td> --%>
<%-- 							<td>${bean.country_id}</td> --%>
<%-- 							<td>${bean.i_arrivedDate}</td> --%>
<%-- 							<td>${bean.i_onSellDate}</td> --%>
<%-- 							<td>${bean.i_soldQuantity}</td> --%>
<%-- 							<td>${bean.i_status}</td> --%>
<%-- 							<td>${bean.i_class1}</td> --%>
<%-- 							<td>${bean.i_class2}</td> --%>
<%-- 							<td>${bean.i_class3}</td> --%>
<%-- 							<td>${bean.i_popular}</td> --%>
<%-- 							<td>${bean.i_click}</td> --%>
<%-- 							<td>${bean.s_class1}</td> --%>
<%-- 							<td>${bean.s_class2}</td> --%>
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
<%-- 				</c:if> --%>
<%-- 				<c:if test="${not empty insert || not empty delete || not empty update}"> --%>
<!-- 					<tr> -->
<%-- 						<td>${result.i_id}</td> --%>
<%-- 						<td>${result.i_name}</td> --%>
<%-- 						<td>${result.i_describe}</td> --%>
<%-- 						<td>${result.i_price}</td> --%>
<%-- 						<td>${result.s_id}</td> --%>
<%-- 						<td>${result.i_quantity}</td> --%>
<%-- 						<td>${result.country_id}</td> --%>
<%-- 						<td>${result.i_arrivedDate}</td> --%>
<%-- 						<td>${result.i_onSellDate}</td> --%>
<%-- 						<td>${result.i_soldQuantity}</td> --%>
<%-- 						<td>${result.i_status}</td> --%>
<%-- 						<td>${result.i_class1}</td> --%>
<%-- 						<td>${result.i_class2}</td> --%>
<%-- 						<td>${result.i_class3}</td> --%>
<%-- 						<td>${result.i_popular}</td> --%>
<%-- 						<td>${result.i_click}</td> --%>
<%-- 						<td>${result.s_class1}</td> --%>
<%-- 						<td>${result.s_class2}</td> --%>
<!-- 					</tr> -->
<%-- 				</c:if> --%>
<!-- 			</tbody> -->
<!-- 		</table> -->
<!-- 		<script type="text/javascript"> -->
<!--    			clearForm();  -->
<!--  		</script> -->
<%-- 	</c:if> --%>
	
<jsp:include page="_Footer.jsp"></jsp:include>
</body>
</html>