<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
</head>
<body>
<c:if test="${! empty delete}">
	<p>${delete}</p>
</c:if>
<table border="1">
	<thead>
		<tr>
			<td>o_id</td><td>s_id</td><td>m_id</td><td>o_date</td><td>o_remitDate</td>
			<td>o_tolPrice</td><td>o_sendDate</td><td>o_point</td><td>o_lastPrice</td>
			<td>sw_id</td><td>pay_id</td><td>o_recipient</td><td>o_address</td><td>o_procss</td>
			<td>o_memo</td>
		</tr>
	</thead>
	<tbody id="table1">
		<c:forEach var="orderVO" items="${list}" varStatus="vs">
			<tr align="center" valign="middle">
				<td>${orderVO.o_id}</td>
				<td>${orderVO.s_id}</td>
				<td>${orderVO.m_id}</td>
				<td>${orderVO.o_date}</td>
				<td>${orderVO.o_remitDate}</td>
				<td>${orderVO.o_tolPrice}</td>
				<td>${orderVO.o_sendDate}</td>
				<td>${orderVO.o_point}</td>
				<td>${orderVO.o_lastPrice}</td>
				<td>${orderVO.sw_id}</td>
				<td>${orderVO.pay_id}</td>
				<td>${orderVO.o_recipient}</td>
				<td>${orderVO.o_address}</td>
				<td>${orderVO.o_procss}</td>
				<td>${orderVO.o_memo}</td>				
			</tr>
			<tr align="center" valign="middle">
				<td><form action="Order.do" method="post">
					<input type="submit" value="明細" />
					<input type="hidden" name="action" value="getOne" />					
					<input type="hidden" name="o_id" value=${orderVO.o_id} />					
				</form></td>
<%-- 				<td><button class="orderlist" value="${orderVO.o_id}" onclick="orderlist(value)">看明細</button></td> --%>
			</tr>
		</c:forEach>
	</tbody>
</table>
<c:if test="${empty list}">目前您沒有任何訂單唷!快去購物吧!<a href="Item.go?action=getItems"></a></c:if>
<c:if test="${! empty errorMsgs}"><p>${errorMsgs}</p></c:if>
<a href="Order.do?action=cGetAll">返回我的購買訂單</a><br>
<a id="alink" href="index.jsp">回首頁</a>
<script type="text/javascript">
// 	function orderlist(o_id){
// 		console.log(o_id);
// 	}
// 	$(function(){
// 		$('.orderlist').click(function(event){
// 			var o_id = $(this).val();
// // 			console.log(o_id);
// // 			$(this).after("<p>"+ o_id +"</p>");
// // 			getOrderList(o_id);

// 			$.post('OrderList.do',{"o_id":o_id,"action":"JQ"});
// 		});
// 	});
// 	function getOrderList(o_id){
// 		$.getJSON('OrderList.do',{"o_id":o_id,"action":"JQ"},function(datas){
// 			   //datas = []
// 			   console.log(datas);
// 			   var frag = $(document.createDocumentFragment());
// 			   $.each(datas,function(idx,orderlist){
// 				   var cell1 = $("<td></td>").text(orderlist.o_id);
// 				   var cell2 = $("<td></td>").text(orderlist.ol_id);
// 				   var cell3 = $("<td></td>").text(orderlist.i_id);
// 				   var cell4 = $("<td></td>").text(orderlist.ol_memo);
// 				   var cell5 = $('<td></td>').html('<button class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button> <button class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span></button>');
// 				   var row =$("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5]);
				   
// 				   frag.append(row);					   
// 			   })
// 			   tb.html(frag);
// 		   })
		
// 		$.post("OrderList.do",{"o_id":o_id,"action":"JQ"},
// 			function(a){
// 				$.each(a,function(inx, orderlist){
// 				console.log(orderlist.ol_id);});
// 		});

// 		$.ajax({ type: 'POST',
// 				 url: "OrderList.do", 
// 				 data: {"o_id":o_id,"action":"JQ"}, 
// 				 success: function(abc){
// 					 console.log(abc);
// 					 console.log("C");
// 	      		 },error: function(result){
// 	      			 console.log("GG");
// 	      		 }
// 		});
// 	}
	
</script>
</body>
</html>