<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<form action="<c:url value='/updateShop.SPRINGcontroller'/>" method="get">
商店編號：${shop.s_id }<input type="hidden" name="s_id" value="${shop.s_id }"><br/>
關於商店：${shop.s_aboutMe }<br/>
商店總分：${shop.s_score }<br/>
商店評價：${shop.s_avgScore }<br/>
商店人氣：${shop.s_popular }<br/>
商店點閱：${shop.s_click }<br/>
商店點數：${shop.s_point }<br/>
<button type="submit" name="shopaction" value="update">修改商店資訊</button>
</form>
<c:if test="${not empty item}">
	<table border=1>
		<tr>
			<td>i_id</td>
			<td>s_id</td>
			<td>i_name</td>
			<td>i_describe</td>
			<td>i_price</td>
			<td>i_quantity</td>
			<td>country_id</td>
			<td>i_arrivedDate</td>
			<td>i_onSellDate</td>
			<td>i_soldQuantity</td>
			<td>i_status</td>
			<td>i_class1</td>
			<td>i_class2</td>
			<td>i_class3</td>
			<td>i_popular</td>
			<td>i_click</td>
			<td>s_class1</td>
			<td>s_class2</td>
			<td>修改商品</td>
		</tr>		
		<c:forEach items="${item }" var="item" varStatus="i">
			<tr>
			<td>${item.i_id }</td>
			<td>${item.s_id }</td>
			<td>${item.i_name }</td>			
			<td>${item.i_describe }</td>			
			<td>${item.i_price }</td>			
			<td>${item.i_quantity }</td>			
			<td>${item.country_id }</td>			
			<td>${item.i_arrivedDate }</td>			
			<td>${item.i_onSellDate }</td>			
			<td>${item.i_soldQuantity }</td>			
			<td>${item.i_status }</td>			
			<td>${item.i_class1 }</td>			
			<td>${item.i_class2 }</td>			
			<td>${item.i_class3 }</td>			
			<td>${item.i_popular }</td>			
			<td>${item.i_click }</td>			
			<td>${item.s_class1 }</td>			
			<td>${item.s_class2 }</td>								
			<td><button  id="btn${i.count }" value="${item.i_id }">修改商品</button></td>							
			</tr>
			<c:if test="${i.last }">
				<br/><input id="count" type="hidden" value="${i.count }"/>
			</c:if>
		</c:forEach>
	</table>
</c:if>


<br/>
<form action="<c:url value='/insertitem.SPRINGcontroller'/>" method="get">
<input type="hidden" name="s_id" value="${shop.s_id }"/>
<button type="submit" name="prodaction" value="Insert">新增商品</button>
</form>
<a href="index.jsp"><input type="button" value="回首頁"/></a>
</body>
<script>


$(function(){	
	for(var i=1;i <= parseInt($('#count').val());i++){
		var id = "btn"+i;
		$('#'+id).click(function(){
			var path = "<%=request.getContextPath()%>";
			var url = path + "/updateItem.html?i_id=" + $(this).val();	
			window.location = url;	
		});
	}		
})

</script>
</html>