<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增商品</title>
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
	getJSON1();	
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
</script>
</head>
<body>
	<h3>Welcome ${user.email}</h3>
	<h3>新增商品</h3>
	<div id="test"></div>

	<form action="<c:url value="/item.SPRINGcontroller"/>" method="get">
		<table>
			<tr>
				<td>i_id :</td>
				<td><input type="text" name="i_id"  value="" readonly="readonly"></td>
				<td>${errors.i_id}</td>
			</tr>
			<tr>
				<td>s_id :</td>
				<td><input type="text" name="s_id" readonly="readonly"
						value=<c:choose>
								<c:when test="${not empty result}">${result.s_id}</c:when>
								<c:when test="${not empty shop}">${shop.s_id}</c:when>
								<c:when test="${not empty insert}">${insert.s_id}</c:when>
								<c:otherwise></c:otherwise>
								</c:choose> ></td>
				<td>${errors.s_id}</td>
			</tr>

			<tr>
				<td>i_name :</td>
				<td><input type="text" name="i_name" value="${result.i_name}"></td>
				<td>${errors.i_name}</td>
			</tr>
			<tr>
				<td>i_describe :</td>
				<td><input type="text" name="i_describe"
					value="${result.i_describe}"></td>
				<td>${errors.i_describe}</td>
			</tr>
			<tr>
				<td>i_price :</td>
				<td><input type="text" name="i_price" value="${result.i_price}"></td>
				<td>${errors.i_price}</td>
			</tr>
			<tr>
				<td>i_quantity :</td>
				<td><input type="text" name="i_quantity" value="${result.i_quantity}"></td>
				<td>${errors.i_quantity}</td>
			</tr>
			<tr>
				<td>country_id :</td>
				<td><select id="country_id" name="country_id" >
						<c:if test="${not empty country }">
							<c:forEach var="cBean" items="${country}">
								<option value="${cBean.country_id }">${cBean.country_name }</option>
							</c:forEach>
						</c:if>
				</select></td>
				<td>${errors.country_id}</td>
			</tr>
			<tr>
				<td>i_arrivedDate :</td>
				<td><input type="text" name="i_arrivedDate" value=""></td>
				<td>${errors.i_arrivedDate}</td>
			</tr>
			<tr>
				<td>i_onSellDate :</td>
				<td><input type="text" name="i_onSellDate"
					value="" readonly="readonly"></td>
				<td>${errors.i_onSellDate}</td>
			</tr>
			<tr>
				<td>i_soldQuantity :</td>
				<td><input type="text" name="i_soldQuantity" readonly="readonly"
					value=<c:choose>
								<c:when test="${not empty result}">"${result.i_soldQuantity}"</c:when>
								<c:otherwise>"0"</c:otherwise>
						</c:choose> ></td>
				<td>${errors.i_soldQuantity}</td>
			</tr>
			
			<tr>
				<td>i_status :</td>
				<td><input type="text" name="i_status" readonly="readonly"
					value=<c:choose>
								<c:when test="${not empty result}">"${result.i_status}"</c:when>
								<c:otherwise>"1"</c:otherwise>
						</c:choose> ></td>
				<td>${errors.i_status}</td>
			</tr>
			<tr>
				<td>i_class1 :</td>
				<td><select id="i_class1" name="i_class1">
						<c:if test="${not empty item_class1 }">
							<c:forEach var="c1Bean" items="${item_class1}">
								<option value="${c1Bean.i_class1 }">${c1Bean.i_className1 }</option>
							</c:forEach>
						</c:if>
				</select></td>
				<td>${errors.country_id}</td>
			</tr>
			<tr>
				<td>i_class2 :</td>
				<td><select id="i_class2" name="i_class2">
				</select></td>
				<td>${errors.i_class2}</td>
			</tr>
			<tr>
				<td>i_class3 :</td>
				<td><select id="i_class3" name="i_class3">
				</select></td>
				<td>${errors.i_class3}</td>
			</tr>
			<tr>
				<td>i_popular :</td>
				<td><input type="text" name="i_popular" readonly="readonly"
					value=<c:choose>
								<c:when test="${not empty result.i_popular}">"${result.i_popular}"</c:when>
								<c:otherwise>"0"</c:otherwise>
						</c:choose> ></td>
				<td>${errors.i_popular}</td>
			</tr>
			<tr>
				<td>i_click :</td>
				<td><input type="text" name="i_click" readonly="readonly"
					value=<c:choose>
								<c:when test="${not empty result.i_click}">"${result.i_click}"</c:when>
								<c:otherwise>"0"</c:otherwise>
						</c:choose> > </td>
				<td>${errors.i_click}</td>
			</tr>
			<tr>
				<td>s_class1 :</td>
				<td><input type="text" name="s_class1"
					value="${result.s_class1}"></td>
				<td>${errors.s_class1}</td>
			</tr>
			<tr>
				<td>s_class2 :</td>
				<td><input type="text" name="s_class2"
					value="${result.s_class2}"></td>
				<td>${errors.s_class2}</td>
			</tr>
			<tr>
				<td><button type="submit" name="prodaction" value="Insert">新增商品</button></td>
			</tr>
		</table>
	</form>
	<form action="<c:url value='/shopmanager.html'/>" method="get">
		<table>
			<tr>
				<td><a href="<c:url value='/index.jsp'/>"> <input type="button" value="回首頁" ></a></td>				
				<td><button type="submit" name="s_id" value="${shop.s_id}${result.s_id}">回到商店</button></td>
			</tr>
		</table>
	</form>
	<h3>
		<span class="error">${errors.action}</span>
	</h3>
	<c:if test="${not empty insertsuccess}">
		<h3>Insert Product Table Success</h3>
	</c:if>
	<c:if test="${not empty insertsuccess}">
		<table border="1">
			<thead>
				<tr>
					<th>i_id</th>
					<th>i_name</th>
					<th>i_describe</th>
					<th>i_price</th>
					<th>s_id</th>
					<th>i_quantity</th>
					<th>country_id</th>
					<th>i_arrivedDate</th>
					<th>i_onSellDate</th>
					<th>i_soldQuantity</th>
					<th>i_status</th>
					<th>i_class1</th>
					<th>i_class2</th>
					<th>i_class3</th>
					<th>i_popular</th>
					<th>i_click</th>
					<th>s_class1</th>
					<th>s_class2</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty select}">
					<c:forEach var="bean" items="${result}">
						<tr>
							<td>${bean.i_id}</td>
							<td>${bean.i_name}</td>
							<td>${bean.i_describe}</td>
							<td>${bean.i_price}</td>
							<td>${bean.s_id}</td>
							<td>${bean.i_quantity}</td>
							<td>${bean.country_id}</td>
							<td>${bean.i_arrivedDate}</td>
							<td>${bean.i_onSellDate}</td>
							<td>${bean.i_soldQuantity}</td>
							<td>${bean.i_status}</td>
							<td>${bean.i_class1}</td>
							<td>${bean.i_class2}</td>
							<td>${bean.i_class3}</td>
							<td>${bean.i_popular}</td>
							<td>${bean.i_click}</td>
							<td>${bean.s_class1}</td>
							<td>${bean.s_class2}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if
					test="${not empty insert || not empty delete || not empty update}">
					<tr>
						<td>${result.i_id}</td>
						<td>${result.i_name}</td>
						<td>${result.i_describe}</td>
						<td>${result.i_price}</td>
						<td>${result.s_id}</td>
						<td>${result.i_quantity}</td>
						<td>${result.country_id}</td>
						<td>${result.i_arrivedDate}</td>
						<td>${result.i_onSellDate}</td>
						<td>${result.i_soldQuantity}</td>
						<td>${result.i_status}</td>
						<td>${result.i_class1}</td>
						<td>${result.i_class2}</td>
						<td>${result.i_class3}</td>
						<td>${result.i_popular}</td>
						<td>${result.i_click}</td>
						<td>${result.s_class1}</td>
						<td>${result.s_class2}</td>
					</tr>
				</c:if>
			</tbody>
		</table>
<!-- 		<script type="text/javascript"> -->
<!--  			clearForm(); -->
<!-- 		</script> -->
	</c:if>
</body>
</html>