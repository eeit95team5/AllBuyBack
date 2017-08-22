<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
<link rel="stylesheet" href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="webjars/sweetalert/1.1.3/dist/sweetalert.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script>
<style>
	#mainBody{
		width:1024px;
		margin:auto;
		
	}
	#middleDiv, #footerDiv, #endDiv{
		width:1024px;
		margin:auto;
		text-align: center;
	}
	input[type="text"] , textarea{
		border-radius:5px;
		border:1px solid gray;
	}
	.memo{
		width:200px;
		white-space:normal;
		overflow:auto;
	}
	#lastTable{
		margin-bottom: 0px;
	}

</style>
	<script> </script>

<script>
$(function() {
$('#show').dialog({
	
 	autoOpen:false
 });

 $('#toSeller').click(function(){
	
 	$('#show').dialog('open');
	
 	$.post("<c:url value='/ChatController'/>",{"action":"show_both_message_seller","s_id":${OrderVO.s_id},"m_id":${LoginOK.m_id}},
 			function(data){
		
		$('#show').html(data)
 		});
 });
 
 
 $('#contact').click(function(){
		var m_id = $('#m_id').val();
		var s_id = $('#s_id').val();
		
// 		console.log(i_id);
			window.open('ChatController?action=show_both_message_seller&m_id='+m_id+'&s_id='+s_id,'購買AllBuyBack廣告',
					'height=650,width=650,scrollbars=0,resizable=0,location=0');
	});

 
 
   
        $( "#dialog" ).dialog({
           autoOpen: false,  
        });
        $( "#goComment" ).click(function() {
           $( "#dialog" ).dialog( "open" );
        });

     $('#shipWay').change(function(){
    	var sw_id = $(this).val();
    	var newPrice = Number($('#'+sw_id).val());
      	var tolPrice = Number($('#o_tolPrice').text());
      	var point = Math.floor(Number($('#theO_point').val())/10);
       	$('#o_lastPrice').val((newPrice+tolPrice)-point);
       	$('#sw_id').val(sw_id);
       	$('#lastPricePrint').text(newPrice+tolPrice-point);
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
        	  confirmButtonText: "取消訂單",
        	  cancelButtonText: "再讓我想想",
        	  closeOnConfirm: false
        	},
        	function(isConfirm){
        		if(isConfirm){
        			form.submit();
        		}
        	}
        );
     });
     $('#theSubmit').click(function(e){
    	 var form = $(this).parents('form');
    	 e.preventDefault();
    	 swal({
       	  title: "即將正式出單",
       	  text: "送出訂單後將不能再更改，只有在賣場收單前可以取消。",
       	  showCancelButton: true,
       	  confirmButtonColor: "#AEDEF4",
       	  confirmButtonText: "立刻送出",
       	  cancelButtonText: "再等等",
       	  closeOnConfirm: false
       	},function(isConfirm){
       		if(isConfirm){
       			form.submit();
       		}
       	});
     });
     $('#theO_point').change(function(e){
    	 var point = Number($(this).val());
    	 if(point>=0 && point< ${LoginOK.m_point} ){
	    	 if(point%10!=0){
	    		 swal({
	    			 title: "點數將會浪費",
	    			 text: "每10點折扣1元，個位數的部分將無作用，建議您確認修改"
	    		 });
	    	 }
	    	 
	    	 var sw_price = Number($('#sw_price').text());
	    	 var tolPrice = Number($('#o_tolPrice').text());
	    	 var dis = Math.floor(point/10);
	    	 $('#lastPricePrint').text(tolPrice + sw_price - dis);
	    	 $('#o_lastPrice').val(tolPrice + sw_price - dis);
    	 }else{
        	 if(point<0){
        	 swal({
    			 title: "點數不能為負值",
    			 type: "warning"
    		 });
        	 }else{
        		 swal({
        			 title: "不能超出您擁有的點數",
        			 text: "您的點數為${LoginOK.m_point}點",
        			 type: "warning"
        		 });
        	 }
        	 point = 0;
    		 var sw_price = Number($('#sw_price').text());
        	 var tolPrice = Number($('#o_tolPrice').text());
        	 var dis = Math.floor(point/10);
        	 $('#theO_point').val(0);
        	 $('#lastPricePrint').text(tolPrice + sw_price - dis);
        	 $('#o_lastPrice').val(tolPrice + sw_price - dis);
    	 }
     });
     });
</script>
</head>
<body>
<!-- 加入頁首 -->
<%-- <jsp:include page="includeTop.jsp"></jsp:include> --%>
<%@ include file="includeTop.jsp" %>
<!-- 主頁面開始 -->
<c:if test="${! empty OrderVO}">
<h1 align="center">訂單詳情</h1>
<form action="Order.do" method="post">
<div id="mainBody">
<table class="table">
	<tr class="info">
		<td colspan="4" style="text-align: center">訂單資訊</td>
		
	</tr>
		<tr>
			<td><label>訂單編號:</label>${OrderVO.o_id}</td>
			<td><label>賣場:</label><a href="shop.html?s_id=${OrderVO.s_id}">${s_VO.m_name}</a></td>
			<td><label>購買者:</label>${m_VO.m_name}</td>
			<td><label>交易階段:</label>${orderStatus}</td>
		</tr>
		<tr>
		<c:if test="${OrderVO.o_procss == 1}">
			<td><label>收件者:</label><input type="text" name="o_recipient" value="${OrderVO.o_recipient}" /></td>
			<td><label>收件地址:</label><input type="text" name="o_address" value="${OrderVO.o_address}" /></td>
			<td>
				<label>付款方式:</label>
				<select name="pay_id" id="pay_id">
						<option value="郵局匯款" <c:if test="${OrderVO.pay_id=='郵局匯款'}">selected</c:if>>郵局匯款</option>
						<option value="約定帳戶轉帳" <c:if test="${OrderVO.pay_id=='約定帳戶轉帳'}">selected</c:if>>約定帳戶轉帳</option>
						<option value="信用卡一次付清" <c:if test="${OrderVO.pay_id=='信用卡一次付清'}">selected</c:if>>信用卡一次付清</option>
						<option value="超商付款" <c:if test="${OrderVO.pay_id=='超商付款'}">selected</c:if>>超商付款</option>
				</select>
			</td>
			<td rowspan="2">
				<label style="vertical-align:text-bottom;">備註:</label>
				<textarea name="o_memo" cols="30" rows="4" style="resize:none;">${OrderVO.o_memo}</textarea>
			</td>
		</c:if>
		<c:if test="${OrderVO.o_procss != 1}">
			<td><label>收件者:</label>${OrderVO.o_recipient}</td>
			<td><label>收件地址:</label>${OrderVO.o_address}</td>
			<td><label>付款方式:</label>${OrderVO.pay_id}</td>
			<td rowspan="2">
				<label style="vertical-align:text-bottom">備註:</label>
				<textarea name="o_memo" cols="30" rows="4" style="resize:none;" readonly>${OrderVO.o_memo}</textarea>
			</td>
		</c:if>
		</tr>
		<tr>
			<td><label>下單時間:</label>${OrderVO.o_date}</td>
			<td><label>付款時間:</label>${OrderVO.o_remitDate}</td>
			<td><label>出貨時間:</label>${OrderVO.o_sendDate}</td>
		</tr>
</table>
</div>
<div id="middleDiv">
<table class="table" id="middleTable">
	<tr class="success"><td colspan="5">商品清單</td></tr>
		<tr>
			<td>商品名稱</td>
			<td>數量</td>
			<td>單價</td>
			<td>小計</td>
			<td class="memo">備註</td>
		</tr>
		<c:forEach var="orderListVO" items="${orderList}" varStatus="vs">
			<tr align="center" valign="middle" class="index">
				<td class="i_name ${vs.index}">${itemList[vs.index].i_name}</td>
				<td class="ol_quantity ${vs.index}">${orderListVO.ol_quantity}</td>
				<td class="ol_price ${vs.index}">${orderListVO.ol_price}</td>
				<td class="sum_price ${vs.index}">${orderListVO.ol_price * orderListVO.ol_quantity}</td>
				<td><div class="memo">${orderListVO.ol_memo}</div></td>
			</tr>
		</c:forEach>
</table>
<table class="table" id="lastTable" style="table-layout:fixed">
	<tr class="danger"><td colspan="5">結算</td></tr>
		<tr>
			<td>總金額</td>
			<td>折扣點數</td>
			<td>運送方式</td>
			<td>運費</td>
			<td>成交價</td>
		</tr>
		<tr>
			<td id="o_tolPrice">${OrderVO.o_tolPrice}</td>
			<c:choose>
				<c:when test="${OrderVO.o_procss == 1}">
					<td><input type="text" id="theO_point" title="每10點折扣1元，您有${LoginOK.m_point}點" name="o_point" size="4" value="${OrderVO.o_point}" /></td>
					<td>
						<select id="shipWay">
						<c:forEach var="shipways" items="${shipwayList}">
							<c:if test="${shipways.sw_id eq shipway.sw_id}">
								<option value="${shipways.sw_id}" selected >${shipways.sw_name}</option>
							</c:if>
							<c:if test="${shipways.sw_id != shipway.sw_id}">
								<option value="${shipways.sw_id}" >${shipways.sw_name}</option>
							</c:if>
						</c:forEach>
						</select>
					</td>
					<td id="sw_price">${shipway.sw_price}</td>
					<input type="hidden" id="sw_id" name="sw_id" value="${shipway.sw_id}" />
					<input type="hidden" id="o_lastPrice" name="o_lastPrice" value="${OrderVO.o_lastPrice}" />
					<td id="lastPricePrint" style="background:#FFA042">${OrderVO.o_lastPrice}</td>
				</c:when>
				<c:otherwise>
					<td>${OrderVO.o_point}</td>
					<td>${shipway.sw_name}</td>
					<td>${shipway.sw_price}</td>
					<td style="background:#FFA042">${OrderVO.o_lastPrice}</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<c:if test="${OrderVO.o_procss == 1}">
		<tr>
			<td colspan="3"></td>
			<td>
			</td>
			<td>
				<input type="submit" value="確定修改" class="btn btn-info"/>
				<input type="hidden" name="action" value="modifyFromC"/>
				<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
			</td>
		</tr>
		</c:if>
</table>
</div>
</form>
<div id="footerDiv">
<c:if test="${OrderVO.o_procss > 0 && OrderVO.o_procss<7}">
<table class="table" id="endTable" style="table-layout:fixed">
	<tr>
		<td></td>
		<td></td>
		<td>
		<c:if test="${!empty LoginOK }">	
				<form method="get" action="<c:url value="/ChatController"/>">
<!-- 				<input type="submit" value="聯絡賣場" class="btn btn-success">  -->
				<input type="button" id="contact" value="聯絡賣場" class="btn btn-success"> 
				<input type="hidden" id="m_id" name="m_id" value="${LoginOK.m_id}"> 
				<input type="hidden" name="m_account" value="${LoginOK.m_account}">
				<input type="hidden" id="s_id" name="s_id" value="${OrderVO.s_id}"> 
				<input type="hidden" name="action" value="show_both_message_seller">
				</form>
		</c:if>
		</td>
		<c:if test="${OrderVO.o_procss == 1 || OrderVO.o_procss == 2}">
			<td>
			<form id="aform" action="Order.do" method="post">
				<input type="submit" value="取消訂單" id="cannelSubmit" class="btn btn-danger"/>
				<input type="hidden" name="action" value="cannel"/>
				<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
			</form>
			</td>
		</c:if>
		
		<c:if test="${OrderVO.o_procss != 1 && OrderVO.o_procss != 2}"><td></td></c:if>
		<c:if test="${OrderVO.o_procss >= 1 && OrderVO.o_procss <= 5}">
		<td>
		<form action="Order.do" method="post" id="theForm">
			<c:if test="${OrderVO.o_procss == 1}">
				<input type="submit" id="theSubmit" value="確定送出" class="btn btn-primary"/>
				<input type="hidden" name="action" value="confirmNext"/>
				<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
			</c:if>
			<c:if test="${OrderVO.o_procss == 2}">
				<p>訂單已送出，等待賣家收單...</p>
			</c:if>
			<c:if test="${OrderVO.o_procss == 3}">
				<input type="submit" value="完成付款" class="btn btn-primary"/>
				<input type="hidden" name="action" value="remit"/>
				<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
			</c:if>
			<c:if test="${OrderVO.o_procss == 4}">
				<p>完成付款，等待賣家出貨中...</p>
			</c:if>
			<c:if test="${OrderVO.o_procss == 5}">
				<p>賣家已出貨，是否到貨？</p>
				<input type="submit" value="確認到貨" class="btn btn-primary"/>
				<input type="hidden" name="action" value="confirmNext"/>
				<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
			</c:if>
		</form>
		</td>
		</c:if>
		<c:if test="${OrderVO.o_procss == 6}">
			<td>
				<c:if test="${OrderVO.s_commentStatus == 1}">
					<div id="dialog" title="請給予賣場評價" style='display:none'>
					<form action="Order.do" method="post">
						<label>評分：</label><input type="text" name="s_score" value="5" />(1~5分)<br>
						<label>評價：</label><textarea name="s_comment"></textarea>
						<input type="submit" value="送出評價" class="btn btn-primary"/>
						<input type="hidden" name="action" value="commentFromC"/>
						<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
					</form>
					</div>
					<input type="button" id="goComment" value="進行評價" class="btn btn-primary"/>
				</c:if>
				<c:if test="${OrderVO.s_commentStatus == 0}">
					<p>您已經給予評價囉!</p>
				</c:if>
				<c:if test="${OrderVO.m_commentStatus == 0}">
					<br />
					<p>對方給您 ${OrderVO.m_score} 的評價，<br />評價內容為：${OrderVO.m_comment}</p>
				</c:if>
				<c:if test="${OrderVO.m_commentStatus == 1}">
					<br />
					<p>對方尚未進行評價</p>
				</c:if>
			</td>
			</c:if>
			
	</tr>	
</table>
	</c:if>
</div>
</c:if>
<div id="endDiv">
	<c:if test="${OrderVO.o_procss <= 0}">
		<p>本訂單已關閉交易</p>
	</c:if>
	<c:if test="${OrderVO.o_procss == 7}">
		<p>本訂單已完成交易，雙方已給予評價</p>
		<p>對方給您 ${OrderVO.m_score} 的評價，評價內容為：${OrderVO.m_comment}</p>
	</c:if>
	<c:if test="${! empty res}"><p>${res}</p></c:if>
	<c:if test="${! empty errorMsgs}"><p>${errorMsgs}</p></c:if>
	<a href="Order.do?action=cGetAll">返回我的購買訂單</a><br>
	<a href="HomeIndex.jsp">回首頁</a>
	<c:forEach var="ship" items="${shipwayList}">
		<input type="hidden" value="${ship.sw_price}" id="${ship.sw_id}" />
	</c:forEach>
</div>

<!-- 主頁面結束 -->
<!-- 加入頁尾 -->
<jsp:include page="_Footer.jsp"></jsp:include>
<%-- <%@ include file="_Footer.jsp" %> --%>
</body>
</html>