<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.css">
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src=" http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
</head>
<body>
<c:if test="${! empty errorMsgs}"><p>${errorMsgs}</p></c:if>
<c:if test="${! empty OrderVO}">
<table border="1">
<form action="Order.do" method="post">
	<thead>
		<tr>
			<td>o_id</td><td>s_id</td><td>m_id</td><td>o_date</td><td>o_remitDate</td>
			<td>o_procss</td><td>o_sendDate</td><td>o_point</td>
			<td>sw_name</td><td>sw_price</td>
			<td bgcolor="red">o_tolPrice</td><td>o_lastPrice</td>
			<td>pay_id</td><td>o_address</td><td bgcolor="red">o_memo</td>
		</tr>
		<tr>
			<td>${OrderVO.o_id}</td><td>${OrderVO.s_id}</td><td>${OrderVO.m_id}</td>
			<td>${OrderVO.o_date}</td><td>${OrderVO.o_remitDate}</td>
			<td>${OrderVO.o_procss}</td>
			<td>${OrderVO.o_sendDate}</td><td>${OrderVO.o_point}</td>
			<td>${shipway.sw_name}</td>
			<td id="sw_price">${shipway.sw_price}</td>
			<c:choose>
				<c:when test="${OrderVO.o_procss == 1}">
					<td><input type="text" id="o_tolPrice" name="o_tolPrice" value="${OrderVO.o_tolPrice}" /></td>
					<td>${OrderVO.o_lastPrice}</td>
					<input id="o_lastPrice" type="hidden" value="${OrderVO.o_lastPrice}" name="o_lastPrice" />
				</c:when>
				<c:otherwise>
					<td>${OrderVO.o_tolPrice}</td>
					<td>${OrderVO.o_lastPrice}</td>
				</c:otherwise>
			</c:choose>
					<td>${OrderVO.pay_id}</td>
					<td>${OrderVO.o_address}</td>
			<c:choose>
				<c:when test="${OrderVO.o_procss == 1}">
					<td><input type="text" name="o_memo" value="${OrderVO.o_memo}" /></td>
				</c:when>
				<c:otherwise>
					<td>${OrderVO.o_memo}</td>
				</c:otherwise>
			</c:choose>
		</tr>
	</thead>
	<tbody>
		<tr>
<!-- 			<td>ol_id</td><td>o_id</td><td>i_id</td><td>ol_quantity</td><td>ol_price</td><td>小計</td><td>ol_memo</td> -->
			<td>i_name</td><td>ol_quantity</td><td>ol_price</td><td>小計</td><td>ol_memo</td>
		</tr>
		<c:forEach var="orderListVO" items="${orderList}" varStatus="vs">
			<tr align="center" valign="middle" class="index" name="${vs.index}">
<%-- 				<td>${orderListVO.ol_id}</td> --%>
<%-- 				<td>${orderListVO.o_id}</td> --%>
<%-- 				<td class="i_id ${vs.index}">${orderListVO.i_id}</td> --%>
				<td class="i_name ${vs.index}">${itemList[vs.index].i_name}</td>
				<td class="ol_quantity ${vs.index}">${orderListVO.ol_quantity}</td>
				<td class="ol_price ${vs.index}">${orderListVO.ol_price}</td>
				<td class="sum_price ${vs.index}">${orderListVO.ol_price * orderListVO.ol_quantity}</td>
				<td>${orderListVO.ol_memo}</td>
			</tr>
<!-- 			改成查詢物品資訊 -->
<!-- 			<tr align="center" valign="middle"> -->
<%-- 				<td><button class="orderlist" value="${orderListVO.ol_id}">OK</button></td> --%>
<!-- 			</tr> -->
		</c:forEach>

		<tr>
			<td colspan="13">
				<c:if test="${OrderVO.o_procss == 1}">
					<input type="submit" value="修改價格" />
					<input type="hidden" name="action" value="modifyFromS"/>
					<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>	
				</c:if>
			</td>
		</tr>
	</tbody>
</form>
</table>
<c:if test="${OrderVO.o_procss > 0}">
<table border="1">
	<form action="Order.do" method="post">
		<tr>
			<td colspan="13">
				<c:if test="${OrderVO.o_procss == 2}">
					<input type="submit" value="確定收單" />
					<input type="hidden" name="action" value="confirmNext"/>
					<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
				</c:if>
				<c:if test="${OrderVO.o_procss == 3}">
					<p>接受訂單，等待買方付款中...</p>
				</c:if>
				<c:if test="${OrderVO.o_procss == 4}">
					<input type="submit" value="完成收款，已出貨" />
					<input type="hidden" name="action" value="send"/>
					<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
				</c:if>
			</td>
		</tr>
	</form>
				<c:if test="${OrderVO.o_procss == 5}">
					<tr><td colspan="13"><p>已完成出貨，等待買家確認收貨中...</p></td></tr>
				</c:if>
				<c:if test="${OrderVO.o_procss == 6}">
				<tr>
				<td colspan="13">
					<c:if test="${OrderVO.m_commentStatus == 1}">
						<div id="dialog" title="請給予賣場評價" style='display:none'>
						<form action="Order.do" method="post">
							<label>評分：</label><input type="text" name="m_score" value="5" />(1~5分)<br>
							<label>評價：</label><textarea name="m_comment"></textarea>
							<input type="submit" value="送出評價"/>
							<input type="hidden" name="action" value="commentFromS"/>
							<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
						</form>
						</div>
					<input type="button" id="goComment" value="進行評價" />
					</c:if>
					<c:if test="${OrderVO.s_commentStatus == 0}">
						<br />
						<p>對方給你${OrderVO.s_score}的評價，評價內容為：<br />${OrderVO.s_comment}</p>
					</c:if>
					<c:if test="${OrderVO.s_commentStatus == 1}">
						<br />
						<p>對方尚未進行評價</p>
					</c:if>
				</td>
				</tr>
				</c:if>
<tr>
	<c:if test="${(OrderVO.o_procss != 0 || OrderVO.o_procss!=-1) && OrderVO.o_procss < 3}">
		<form action="Order.do" method="post">
			<td colspan="13">
				<input type="submit" value="取消訂單" />
				<input type="hidden" name="action" value="cannel"/>
				<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
			</td>
		</form>
	</c:if>
</tr>
</table>
</c:if>
<c:if test="${OrderVO.o_procss <= 0}">
	<p>本訂單已關閉交易</p>
</c:if>
<c:if test="${OrderVO.o_procss == 7}">
	<p>本訂單已完成交易，雙方已給予評價</p>
</c:if>
</c:if>
<c:if test="${! empty res}"><p>${res}</p></c:if>
<a href="Order.do?action=sGetAll">返回我的賣場訂單</a>
<a href="index.jsp">回首頁</a>
      <script>
         $(function() {
            $( "#dialog" ).dialog({
               autoOpen: false,  
            });
            $( "#goComment" ).click(function() {
               $( "#dialog" ).dialog( "open" );
            });
         });
         $('#o_tolPrice').change(function(){
        	 var newPrice = Number($(this).val());
        	 var shipPrice = Number($('#sw_price').text());
        	 $('#o_lastPrice').val(newPrice+shipPrice);
         });
      </script>
</body>
</html>