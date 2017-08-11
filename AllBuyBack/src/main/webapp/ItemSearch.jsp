<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Items Search</title>

<script src="js/jquery-1.12.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/lightbox.js"></script>
<script>
window.onload = function(){
	//查詢全部，觸發事件
    document.getElementById("radioAll").onclick = AllLoad;
    //大、中、小分類，觸發事件
    var form = document.getElementById("showItems2");
    var form2 = document.getElementById("showItems3");
    for(var i=0; i<form.BClass.length; i++){
 		form.BClass[i].onclick = BLoad;
 	}
 	for(var i=0; i<form.MClass.length; i++){
 		form.MClass[i].onclick = MLoad;
 	}
 	for(var i=0; i<form.SClass.length; i++){
 		form.SClass[i].onclick = SLoad;
 	}
 	for(var i=0; i<form2.countryCl.length; i++){
 		form2.countryCl[i].onclick = CountryLoad;
 	}
 	
	document.getElementById("bc1").onchange = selecthideBC1;
	document.getElementById("bc2").onchange = selecthideBC2;
	document.getElementById("mc1").onchange = selecthideMC1;
	document.getElementById("mc2").onchange = selecthideMC2;
	document.getElementById("mc5").onchange = selecthideMC5;
	document.getElementById("mc6").onchange = selecthideMC6;
	
	document.getElementById("conti1").onchange = selecthideConti1;
	document.getElementById("conti2").onchange = selecthideConti2;
	document.getElementById("conti3").onchange = selecthideConti3;
	
	//網頁載入時，先將中、小分類隱藏起來
	$('span[name=mcspan]').hide();
	$('span[name=scspan]').hide();
	$('span[name=countrySpan]').hide();
}

var xhr = null;
function AllLoad() {
	$('input[name=BClass]:checked').removeAttr('checked');
	$('input[name=MClass]:checked').removeAttr('checked');
	$('input[name=SClass]:checked').removeAttr('checked');
	$('span[name=mcspan]').hide();
	$('span[name=scspan]').hide();
	$('input[name=contiCl]:checked').removeAttr('checked');
	$('input[name=countryCl]:checked').removeAttr('checked');
	$('span[name=countrySpan]').hide();
	
	var rAll = document.getElementById("radioAll").value;
	xhr = new XMLHttpRequest();
	if (xhr != null) {
		xhr.open('POST', 'ItemSearch', true);   //***非同步***
		xhr.addEventListener("readystatechange", callback);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send("AllClass=" + rAll);
	} else {
		alert("您的瀏覽器不支援Ajax功能!!");
	}
}

function BLoad(){
	$('input[name=MClass]:checked').removeAttr('checked');
	$('input[name=SClass]:checked').removeAttr('checked');
	$('span[name=scspan]').hide();
	$('input[name=contiCl]:checked').removeAttr('checked');
	$('input[name=countryCl]:checked').removeAttr('checked');
	$('span[name=countrySpan]').hide();
	
	var form = document.getElementById("showItems2");
	//取得radio的值
	for (var i=0; i<form.BClass.length; i++){
	   if (form.BClass[i].checked){
		   xhr = new XMLHttpRequest();
			if (xhr != null) {
				xhr.open('POST', 'ItemSearch', true);   //***非同步***
				xhr.addEventListener("readystatechange", callback);
				xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				xhr.send("BClass=" + form.BClass[i].value);
			} else {
				alert("您的瀏覽器不支援Ajax功能!!");
			}
		   break;
	   }
	}
}

function MLoad(){
	$('input[name=SClass]:checked').removeAttr('checked');
	
	var form = document.getElementById("showItems2");
	//取得radio的值
	for (var i=0; i<form.BClass.length; i++){
		   if (form.BClass[i].checked){
			   for (var j=0; j<form.MClass.length; j++){
				   if (form.MClass[j].checked){
					   xhr = new XMLHttpRequest();
						if (xhr != null) {
							xhr.open('POST', 'ItemSearch', true);   //***非同步***
							xhr.addEventListener("readystatechange", callback);
							xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
							xhr.send("BClass=" + form.BClass[i].value + "&MClass=" + form.MClass[j].value);
						} else {
							alert("您的瀏覽器不支援Ajax功能!!");
						}
					   break;
				   }
				}
		   }
	}
}	

function SLoad(){
	var form = document.getElementById("showItems2");
	//取得radio的值
	for (var i=0; i<form.BClass.length; i++){
		if (form.BClass[i].checked){
			for (var j=0; j<form.MClass.length; j++){
				if (form.MClass[j].checked){
					for (var k=0; k<form.SClass.length; k++){
						if (form.SClass[k].checked){
							xhr = new XMLHttpRequest();
							if (xhr != null) {
								xhr.open('POST', 'ItemSearch', true);   //***非同步***
								xhr.addEventListener("readystatechange", callback);
								xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
								xhr.send("BClass=" + form.BClass[i].value + "&MClass=" + form.MClass[j].value + "&SClass=" + form.SClass[k].value);
							} else {
								alert("您的瀏覽器不支援Ajax功能!!");
							}
							break;
						}
					}
				}
			}
		}
	}
}

function CountryLoad(){	
	var form2 = document.getElementById("showItems3");
	//取得radio的值
	for (var i=0; i<form2.countryCl.length; i++){
	   if (form2.countryCl[i].checked){
		   xhr = new XMLHttpRequest();
			if (xhr != null) {
				xhr.open('POST', 'ItemSearch', true);   //***非同步***
				xhr.addEventListener("readystatechange", callback);
				xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				xhr.send("countryCl=" + form2.countryCl[i].value);
			} else {
				alert("您的瀏覽器不支援Ajax功能!!");
			}
		   break;
	   }
	}
}

function callback() {
 	if (xhr.readyState == 4) {
 		if(xhr.status == 200){
 			var datas = xhr.responseText;
	 		var items = JSON.parse(datas);
	 		
	 		var myBody = document.querySelector("table>tbody");
	 		while(myBody.hasChildNodes()){
	 			myBody.removeChild(myBody.lastChild);
	 		}
	 		
	 		var fragment = document.createDocumentFragment();
	 		for(var i=0; i<items.length; i++){
	 			var cell1 = document.createElement("td");
	 			var txt1 = document.createTextNode(items[i].i_name);
	 			cell1.appendChild(txt1);
	 			
	 			var cell2 = document.createElement("td");
	 			var txt2 = document.createTextNode(items[i].i_price);
	 			cell2.appendChild(txt2);
	 			
	 			var cell3 = document.createElement("td");
	 			var txt3 = document.createTextNode(items[i].i_quantity);
	 			cell3.appendChild(txt3);
	 			
	 			var cell4 = document.createElement("td");
	 			var txt4 = document.createTextNode(items[i].i_popular);
	 			cell4.appendChild(txt4);
	 			
	 			var cell5 = document.createElement("td");
	 			var txt5 = document.createTextNode(items[i].i_click);
	 			cell5.appendChild(txt5);
	 			
	 			var cell6 = document.createElement("td");
	 			var txt6 = document.createTextNode(items[i].country_name);
	 			cell6.appendChild(txt6);
	 			
	 			var row = document.createElement("tr");
	 			row.appendChild(cell1);
	 			row.appendChild(cell2);
	 			row.appendChild(cell3);
	 			row.appendChild(cell4);
	 			row.appendChild(cell5);
	 			row.appendChild(cell6);
	 			fragment.appendChild(row);
	 		}
	 		myBody.appendChild(fragment);

	 	}else {
			alert(xhr.status + ":" + xhr.statusText);
		}
	}
}

function selecthideBC1(){
	for(var i=1; i<=4; i++){
		document.getElementById("mc"+i).style.display="";
		document.getElementById("mc"+(i+4)).style.display="none";
	}
}
function selecthideBC2(){
	for(var i=1; i<=4; i++){
		document.getElementById("mc"+i).style.display="none";
		document.getElementById("mc"+(i+4)).style.display="";
	}
}
function selecthideMC1(){
	for(var i=1; i<=4; i++){
		document.getElementById("sc"+i).style.display="";
		document.getElementById("sc"+(i+4)).style.display="none";
		document.getElementById("sc"+(i+16)).style.display="none";
		document.getElementById("sc"+(i+20)).style.display="none";
	}
}
function selecthideMC2(){
	for(var i=1; i<=4; i++){
		document.getElementById("sc"+i).style.display="none";
		document.getElementById("sc"+(i+4)).style.display="";
		document.getElementById("sc"+(i+16)).style.display="none";
		document.getElementById("sc"+(i+20)).style.display="none";
	}
}
function selecthideMC5(){
	for(var i=1; i<=4; i++){
		document.getElementById("sc"+i).style.display="none";
		document.getElementById("sc"+(i+4)).style.display="nono";
		document.getElementById("sc"+(i+16)).style.display="";
		document.getElementById("sc"+(i+20)).style.display="none";
	}
}
function selecthideMC6(){
	for(var i=1; i<=4; i++){
		document.getElementById("sc"+i).style.display="none";
		document.getElementById("sc"+(i+4)).style.display="nono";
		document.getElementById("sc"+(i+16)).style.display="none";
		document.getElementById("sc"+(i+20)).style.display="";
	}
}

function selecthideConti1(){
	$('input[name=BClass]:checked').removeAttr('checked');
	$('input[name=MClass]:checked').removeAttr('checked');
	$('input[name=SClass]:checked').removeAttr('checked');
	$('span[name=mcspan]').hide();
	$('span[name=scspan]').hide();
	
	$('span[name=countrySpan]').hide();
	$('input[name=countryCl]:checked').removeAttr('checked');
	for(var i=1; i<=5; i++){
		document.getElementById("country"+i).style.display="";
	}
}

function selecthideConti2(){
	$('input[name=BClass]:checked').removeAttr('checked');
	$('input[name=MClass]:checked').removeAttr('checked');
	$('input[name=SClass]:checked').removeAttr('checked');
	$('span[name=mcspan]').hide();
	$('span[name=scspan]').hide();
	
	$('span[name=countrySpan]').hide();
	$('input[name=countryCl]:checked').removeAttr('checked');
	for(var i=6; i<=10; i++){
		document.getElementById("country"+i).style.display="";
	}
}

function selecthideConti3(){
	$('input[name=BClass]:checked').removeAttr('checked');
	$('input[name=MClass]:checked').removeAttr('checked');
	$('input[name=SClass]:checked').removeAttr('checked');
	$('span[name=mcspan]').hide();
	$('span[name=scspan]').hide();
	
	$('span[name=countrySpan]').hide();
	$('input[name=countryCl]:checked').removeAttr('checked');
	for(var i=11; i<=12; i++){
		document.getElementById("country"+i).style.display="";
	}
}

</script>

</head>

<body>
<a href="index.jsp"><input type="button" value="回首頁"></a><br>
<br>
<form id="showItems1" name="showItems1" action="ItemSearch" method="POST">
<input type="text" id="kw" name="keyword">
<input type="submit" value="關鍵字查詢">
</form>
<hr>

<input type="button" id="radioAll" name="AllClass" value="查詢全部">
<hr>

<form id="showItems2" name="showItems2" action="ItemSearch" method="POST">
	<label><span id="bc1" ><input type="radio" name="BClass" value="1000001">女裝</span></label>
	<label><span id="bc2" ><input type="radio" name="BClass" value="1000002">男裝</span></label>
	<label><span id="bc3" ><input type="radio" name="BClass" value="1000003">食品</span></label>
	<label><span id="bc4" ><input type="radio" name="BClass" value="1000004">電腦</span></label>
	<label><span id="bc5" ><input type="radio" name="BClass" value="1000005">手機</span></label>
	<label><span id="bc6" ><input type="radio" name="BClass" value="1000006">相機</span></label>
	<label><span id="bc7" ><input type="radio" name="BClass" value="1000007">生活</span></label>
	<label><span id="bc8" ><input type="radio" name="BClass" value="1000008">運動</span></label>
	<label><span id="bc9" ><input type="radio" name="BClass" value="1000009">交通</span></label>
	<label><span id="bc10" ><input type="radio" name="BClass" value="1000010">影音</span></label>
	<br>
	<label><span id="mc1" name="mcspan" ><input type="radio" name="MClass" value="1000001">女-襯衫</span></label>
	<label><span id="mc2" name="mcspan" ><input type="radio" name="MClass" value="1000002">女-背心</span></label>
	<label><span id="mc3" name="mcspan" ><input type="radio" name="MClass" value="1000003">女-毛衣</span></label>
	<label><span id="mc4" name="mcspan" ><input type="radio" name="MClass" value="1000004">女-外套</span></label>
	<label><span id="mc5" name="mcspan" ><input type="radio" name="MClass" value="1000005">男-襯衫</span></label>
	<label><span id="mc6" name="mcspan" ><input type="radio" name="MClass" value="1000006">男-毛衣</span></label>
	<label><span id="mc7" name="mcspan" ><input type="radio" name="MClass" value="1000007">男-褲子</span></label>
	<label><span id="mc8" name="mcspan" ><input type="radio" name="MClass" value="1000008">男-外套</span></label>
	<br>
	<label><span id="sc1" name="scspan" ><input type="radio" name="SClass" value="1000001">女-襯衫-無袖</span></label>
	<label><span id="sc2" name="scspan" ><input type="radio" name="SClass" value="1000002">女-襯衫-短袖</span></label>
	<label><span id="sc3" name="scspan" ><input type="radio" name="SClass" value="1000003">女-襯衫-七分袖</span></label>
	<label><span id="sc4" name="scspan" ><input type="radio" name="SClass" value="1000004">女-襯衫-長袖</span></label>
	<label><span id="sc5" name="scspan" ><input type="radio" name="SClass" value="1000005">女-背心-圓領</span></label>
	<label><span id="sc6" name="scspan" ><input type="radio" name="SClass" value="1000006">女-背心-V領</span></label>
	<label><span id="sc7" name="scspan" ><input type="radio" name="SClass" value="1000007">女-背心-高領</span></label>
	<label><span id="sc8" name="scspan" ><input type="radio" name="SClass" value="1000008">女-背心-連帽</span></label>
	<label><span id="sc17" name="scspan" ><input type="radio" name="SClass" value="1000017">男-襯衫-短袖</span></label>
	<label><span id="sc18" name="scspan" ><input type="radio" name="SClass" value="1000018">男-襯衫-七分袖</span></label>
	<label><span id="sc19" name="scspan" ><input type="radio" name="SClass" value="1000019">男-襯衫-長袖</span></label>
	<label><span id="sc20" name="scspan" ><input type="radio" name="SClass" value="1000020">男-襯衫-其他</span></label>
	<label><span id="sc21" name="scspan" ><input type="radio" name="SClass" value="1000021">男-毛衣-方領</span></label>
	<label><span id="sc22" name="scspan" ><input type="radio" name="SClass" value="1000022">男-毛衣-圓領</span></label>
	<label><span id="sc23" name="scspan" ><input type="radio" name="SClass" value="1000023">男-毛衣-V領</span></label>
	<label><span id="sc24" name="scspan" ><input type="radio" name="SClass" value="1000024">男-毛衣-U領</span></label>
	<br><br>
</form>
<hr>

<form id="showItems3" name="showItems3" action="ItemSearch" method="POST">
	<label><span id="conti1" ><input type="radio" name="contiCl" value="1000001">亞洲</span></label>
	<label><span id="conti2" ><input type="radio" name="contiCl" value="1000002">歐洲</span></label>
	<label><span id="conti3" ><input type="radio" name="contiCl" value="1000003">美洲</span></label>
	<br>
	<label><span id="country1" name="countrySpan"><input type="radio" name="countryCl" value="1000001">日本</span></label>
	<label><span id="country2" name="countrySpan"><input type="radio" name="countryCl" value="1000002">韓國</span></label>
	<label><span id="country3" name="countrySpan"><input type="radio" name="countryCl" value="1000003">香港</span></label>
	<label><span id="country4" name="countrySpan"><input type="radio" name="countryCl" value="1000004">新加坡</span></label>
	<label><span id="country5" name="countrySpan"><input type="radio" name="countryCl" value="1000005">泰國</span></label>
	<label><span id="country6" name="countrySpan"><input type="radio" name="countryCl" value="1000006">英國</span></label>
	<label><span id="country7" name="countrySpan"><input type="radio" name="countryCl" value="1000007">法國</span></label>
	<label><span id="country8" name="countrySpan"><input type="radio" name="countryCl" value="1000008">德國</span></label>
	<label><span id="country9" name="countrySpan"><input type="radio" name="countryCl" value="1000009">西班牙</span></label>
	<label><span id="country10" name="countrySpan"><input type="radio" name="countryCl" value="1000010">義大利</span></label>
	<label><span id="country11" name="countrySpan"><input type="radio" name="countryCl" value="1000011">美國</span></label>
	<label><span id="country12" name="countrySpan"><input type="radio" name="countryCl" value="1000012">加拿大</span></label>		
	<br>
</form>
<hr>


	<div>
		<table>
			<thead>
				<tr>
					<th>name</th>
					<th>price</th>
					<th>quantity</th>
					<th>popular</th>
					<th>click</th>
					<th>country</th>
					<th>pictur1</th>
				</tr>
			</thead>
			<tbody>
			  <c:forEach var="itemsVO" items="${list}">
				<tr>
					<td>${itemsVO.i_name}</td>
					<td>${itemsVO.i_price}</td>
					<td>${itemsVO.i_quantity}</td>
					<td>${itemsVO.i_popular}</td>
					<td>${itemsVO.i_click}</td>
					<td>${itemsVO.country_name}</td>
					<td><img height='50' width='50' src='ReadPictureForItem?i_id=${itemsVO.i_id}'>
				</tr>	
			  </c:forEach>
			</tbody>
		</table>
	</div>
	
</body>
</html>