<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.css">
<link rel="stylesheet" href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="webjars/sweetalert/1.1.3/dist/sweetalert.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script>
<!-- <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- <script src=" http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> -->
</head>
<body>
<c:if test="${! empty errorMsgs}"><p>${errorMsgs}</p></c:if>
<c:if test="${! empty OrderVO}">
<table border="1">
<form action="Order.do" method="post">
	<thead>
		<tr>
			<td>訂單編號</td><td colspan="10">${OrderVO.o_id}</td>
		</tr>
		<tr>
			<td>賣場s_id</td>
			<td>購買者m_id</td>
			<td>下單時間o_date</td>
			<td>付款時間o_remitDate</td>
			<td>交易階段o_procss</td>
			<td>總金額o_tolPrice</td>
			<td>出貨時間o_sendDate</td>
			<td bgcolor="red">折扣點數o_point</td>
			<td bgcolor="red">運送方式sw_id</td>
			<td bgcolor="red">運費sw_price</td>
			<td>最終價格o_lastPrice</td>
			<td bgcolor="red">付款方式pay_id</td>
			<td bgcolor="red">收件者o_recipient</td>
			<td bgcolor="red">收件地址o_address</td>
			<td bgcolor="red">備註o_memo</td>
		</tr>
		<tr>
			<td>${OrderVO.s_id}</td>
			<td>${OrderVO.m_id}</td>
			<td>${OrderVO.o_date}</td>
			<td>${OrderVO.o_remitDate}</td>
			<td>${OrderVO.o_procss}</td>
			<td id="o_tolPrice">${OrderVO.o_tolPrice}</td>
			<td>${OrderVO.o_sendDate}</td>
			<c:choose>
				<c:when test="${OrderVO.o_procss == 1}">
					<td><input type="text" name="o_point" value="${OrderVO.o_point}" /></td>
<%-- 					<td><input type="text" name="sw_id" value="${OrderVO.sw_id}" /></td> --%>
					<td><select class="createOrder ${s_id_group} sw_id" id="shipWay">
						<c:forEach var="shipways" items="${shipwayList}">
							<c:if test="${shipways.sw_id eq shipway.sw_id}">
								<option value="${shipways.sw_id}" selected >${shipways.sw_name}</option>
							</c:if>
							<c:if test="${shipways.sw_id != shipway.sw_id}">
								<option value="${shipways.sw_id}" >${shipways.sw_name}</option>
							</c:if>
						</c:forEach>
					</select></td>
					<td id="sw_price">${shipway.sw_price}</td>
<!-- 					更新價格尚未製作 -->
					<input type="hidden" id="sw_id" name="sw_id" value="${shipway.sw_id}" />
					<input type="hidden" id="o_lastPrice" name="o_lastPrice" value="${OrderVO.o_lastPrice}" />
					<td id="lastPricePrint">${OrderVO.o_lastPrice}</td>
					<td><input type="text" name="pay_id" value="${OrderVO.pay_id}" /></td>
					<td><input type="text" name="o_recipient" value="${OrderVO.o_recipient}" /></td>
					<td><input type="text" name="o_address" value="${OrderVO.o_address}" /></td>
					<td><input type="text" name="o_memo" value="${OrderVO.o_memo}" /></td>
				</c:when>
				<c:otherwise>
					<td>${OrderVO.o_point}</td>
					<td>${shipway.sw_name}</td>
					<td>${shipway.sw_price}</td>
					<td>${OrderVO.o_lastPrice}</td>
					<td>${OrderVO.pay_id}</td>
					<td>${OrderVO.o_recipient}</td>
					<td>${OrderVO.o_address}</td>
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

		<c:if test="${OrderVO.o_procss == 1}">
		<tr>
			<td colspan="13">
				<input type="submit" value="修改" />
				<input type="hidden" name="action" value="modifyFromC"/>
				<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
			</td>
		</tr>
		</c:if>
	</tbody>
</form>
</table>
<c:if test="${OrderVO.o_procss > 0}">
<table border="1">
	<form action="Order.do" method="post">
		<tr>
			<td colspan="13">
				<c:if test="${OrderVO.o_procss == 1}">
					<input type="submit" value="確定送出" /><span>送出訂單後將不能再更改</span>
					<input type="hidden" name="action" value="confirmNext"/>
					<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
				</c:if>
				<c:if test="${OrderVO.o_procss == 2}">
					<p>訂單已送出，等待賣家收單...</p>
				</c:if>
				<c:if test="${OrderVO.o_procss == 3}">
					<input type="submit" value="完成付款" />
					<input type="hidden" name="action" value="remit"/>
					<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
				</c:if>
				<c:if test="${OrderVO.o_procss == 4}">
					<p>完成付款，等待賣家出貨中...</p>
				</c:if>
				<c:if test="${OrderVO.o_procss == 5}">
					<p>賣家已出貨，是否到貨？</p>
					<input type="submit" value="確認到貨" />
					<input type="hidden" name="action" value="confirmNext"/>
					<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
				</c:if>
			</td>
		</tr>
	</form>
				<c:if test="${OrderVO.o_procss == 6}">
				<tr>
				<td colspan="13">
					<c:if test="${OrderVO.s_commentStatus == 1}">
						<div id="dialog" title="請給予賣場評價" style='display:none'>
						<form action="Order.do" method="post">
							<label>評分：</label><input type="text" name="s_score" value="5" />(1~5分)<br>
							<label>評價：</label><textarea name="s_comment"></textarea>
							<input type="submit" value="送出評價"/>
							<input type="hidden" name="action" value="commentFromC"/>
							<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
<!-- 							<input type="hidden" name="s_comment"/> -->
						</form>
						</div>
						<input type="button" id="goComment" value="進行評價" />
					</c:if>
					<c:if test="${OrderVO.m_commentStatus == 0}">
						<br />
						<p>對方給你${OrderVO.m_score}的評價，評價內容為：<br />${OrderVO.m_comment}</p>
					</c:if>
					<c:if test="${OrderVO.m_commentStatus == 1}">
						<br />
						<p>對方尚未進行評價</p>
					</c:if>
				</td>
				</tr>
				</c:if>
<c:if test="${OrderVO.o_procss == 1 || OrderVO.o_procss == 2}">
	<tr>
		<td colspan="13">
			<form id="aform" action="Order.do" method="post">
				<input type="submit" value="取消訂單" id="cannelSubmit"/><span>只有賣家收單前能夠取消</span>
				<input type="hidden" name="action" value="cannel"/>
				<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
			</form>
		</td>
	</tr>
</c:if>
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

<a href="Order.do?action=cGetAll">返回我的購買訂單</a><br>
<a href="index.jsp">回首頁</a>
<c:forEach var="ship" items="${shipwayList}">
	<input type="hidden" value="${ship.sw_price}" id="${ship.sw_id}" />
</c:forEach>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
      <script>
         $(function() {
            $( "#dialog" ).dialog({
               autoOpen: false,  
            });
            $( "#goComment" ).click(function() {
               $( "#dialog" ).dialog( "open" );
            });
            
         });
         
         $('#shipWay').change(function(){
        	var sw_id = $(this).val();
        	var newPrice = Number($('#'+sw_id).val());
        	var tolPrice = Number($('#o_tolPrice').text());
        	$('#o_lastPrice').val(newPrice+tolPrice);
        	$('#sw_id').val(sw_id);
        	$('#lastPricePrint').text(newPrice+tolPrice);
        	$('#sw_price').text(newPrice);
         });
         $('#cannelSubmit').click(function (e){
        	 var form = $(this).parents('#aform');
        	 console.log(form);
        	 e.preventDefault();
        	 swal({
        		  title: "真的要取消此訂單?",
        		  text: "沒買到好像會後悔，還是繼續買吧!",
        		  type: "warning",
        		  showCancelButton: true,
        		  confirmButtonColor: "#DD6B55",
        		  confirmButtonText: "取消!",
        		  closeOnConfirm: false
        		},
        		function(isConfirm){
        			if(isConfirm){
        				form.submit();
        			}
        		  
        		});
         });
      </script>
</body>
</html>