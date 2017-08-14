<%@ page import="com.allbuyback.AllBuyBack.model.ItemBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改商品資訊</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

$(function(){
	$('#i_class1').change(getI_Class2JSON);
	$('#i_class2').change(getI_Class3JSON);
	getCountryJSON();
	getI_Class1JSON();	
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


</script>
</head>
<body>
<form action="<c:url value='/item.SPRINGcontroller'/>" method="get">
	<table>
		<tr><td>i_id</td><td><input type="text" name="i_id" id="i_id"  value="${itembean.i_id}" readonly="readonly"/></td><td>${errors.i_id}</td></tr>
		<tr><td>s_id</td><td><input type="text" name="s_id" id="s_id"  value="${itembean.s_id}" readonly="readonly"/></td><td>${errors.s_id}</td></tr>
		<tr><td>i_name</td><td><input type="text" name="i_name" id="i_name" value="${itembean.i_name}"/></td><td></td></tr>
		<tr><td>i_describe</td><td><input type="text" name="i_describe" id="i_describe" value="${itembean.i_describe}" /></td><td></td></tr>
		<tr><td>i_price</td><td><input type="text" name="i_price" id="i_price" value="${itembean.i_price}" /></td><td>${errors.i_price}</td></tr>
		<tr><td>i_quantity</td><td><input type="text" name="i_quantity" id="i_quantity" value="${itembean.i_quantity}" /></td><td>${errors.i_quantity}</td></tr>
		<tr><td>country_id</td><td><select id="country_id" name="country_id"></select></td></tr>
		<tr><td>i_arrivedDate</td><td><input type="text" name="i_arrivedDate" id="i_arrivedDate" value="${itembean.i_arrivedDate}" /></td><td>${errors.i_arrivedDate}</td></tr>
		<tr><td>i_onSellDate</td><td><input type="text" name="i_onSellDate" id="i_onSellDate"  value="${itembean.i_onSellDate}" readonly="readonly"/></td><td></td></tr>
		<tr><td>i_soldQuantity</td><td><input type="text" name="i_soldQuantity"  id="i_soldQuantity" value="${itembean.i_soldQuantity}" readonly="readonly"/></td><td>${errors.i_soldQuantity}</td></tr>
		<tr><td>i_status</td><td><input type="text" name="i_status" id="i_status" value="${itembean.i_status}" /></td><td></td></tr>
		<tr><td>i_class1</td><td><select id="i_class1" name="i_class1"></select></td><td></td></tr>
		<tr><td>i_class2</td><td><select id="i_class2" name="i_class2"></select></td><td></td></tr>
		<tr><td>i_class3</td><td><select id="i_class3" name="i_class3"></select></td><td></td></tr>
		<tr><td>i_popular</td><td><input type="text" name="i_popular" id="i_popular"  value="${itembean.i_popular}" readonly="readonly"/></td><td></td></tr>
		<tr><td>i_click</td><td><input type="text" name="i_click" id="i_click"  value="${itembean.i_click}" readonly="readonly"/></td><td></td></tr>
		<tr><td>s_class1</td><td><input type="text" name="s_class1" id="s_class1" value="${itembean.s_class1}" /></td><td></td></tr>
		<tr><td>s_class2</td><td><input type="text" name="s_class2" id="s_class2" value="${itembean.s_class2}" /></td><td></td></tr>
	</table>
		<button type="submit" name="prodaction" value="Update">送出修改</button>
	
</form>
<form action="<c:url value='/shopmanager.html'/>" method="get">
			<button type="submit" name="s_id" value="${itembean.s_id }">回到商店</button>
</form>
<div><c:if test="${not empty update }">修改商品成功</c:if></div>
		
</body>
</html>