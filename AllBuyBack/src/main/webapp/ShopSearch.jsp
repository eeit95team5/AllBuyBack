<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="js/jquery-1.12.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/lightbox.js"></script>
<script>
	window.onload = function(){
		var form = document.getElementById("showShops");
		for(var i=0; i<form.countryCl.length; i++){
	 		form.countryCl[i].onclick = CountryLoad;
	 	}
		document.getElementById("conti1").onchange = selecthideConti1;
		document.getElementById("conti2").onchange = selecthideConti2;
		document.getElementById("conti3").onchange = selecthideConti3;
		
		$('span[name=countrySpan]').hide();
	}
	
	var xhr = null;
	function CountryLoad(){	
		var form = document.getElementById("showShops");
		//取得radio的值
		for (var i=0; i<form.countryCl.length; i++){
		   if (form.countryCl[i].checked){
			   xhr = new XMLHttpRequest();
				if (xhr != null) {
					xhr.open('POST', 'ShopSearch', true);   //***非同步***
					xhr.addEventListener("readystatechange", callback);
					xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
					xhr.send("countryCl=" + form.countryCl[i].value);
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
		 			var txt1 = document.createTextNode(items[i].s_id);
		 			cell1.appendChild(txt1);
		 			
		 			var cell2 = document.createElement("td");
		 			var txt2 = document.createTextNode(items[i].s_aboutMe);
		 			cell2.appendChild(txt2);
		 			
		 			var cell3 = document.createElement("td");
		 			var txt3 = document.createTextNode(items[i].s_score);
		 			cell3.appendChild(txt3);
		 			
		 			var cell4 = document.createElement("td");
		 			var txt4 = document.createTextNode(items[i].country_name);
		 			cell4.appendChild(txt4);
		 			
		 			var row = document.createElement("tr");
		 			row.appendChild(cell1);
		 			row.appendChild(cell2);
		 			row.appendChild(cell3);
		 			row.appendChild(cell4);
		 			fragment.appendChild(row);
		 		}
		 		myBody.appendChild(fragment);

		 	}else {
				alert(xhr.status + ":" + xhr.statusText);
			}
		}
	}
	
	function selecthideConti1(){		
		$('span[name=countrySpan]').hide();
		$('input[name=countryCl]:checked').removeAttr('checked');
		for(var i=1; i<=5; i++){
			document.getElementById("country"+i).style.display="";
		}
	}

	function selecthideConti2(){		
		$('span[name=countrySpan]').hide();
		$('input[name=countryCl]:checked').removeAttr('checked');
		for(var i=6; i<=10; i++){
			document.getElementById("country"+i).style.display="";
		}
	}

	function selecthideConti3(){		
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

<form id="showShops" name="showShops" action="ShopSearch" method="POST">
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
					<th>Shop Id</th>
					<th>About Me</th>
					<th>Shop Score</th>
					<th>country</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>

</body>
</html>



