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
		text-align:center;
	}
	input[type="text"] , textarea{
		border-radius:5px;
		border:1px solid gray;
	}
	.memo, .i_name, #lastTable div{
		width:240px;
		white-space:normal;
		overflow:auto;
	}
	#lastTable{
		margin-bottom: 0px;
	}
	#m_name{
		border:none;
		background:#FFF;
		color:blue;
	}
	#middleTable{
		margin-bottom: none;
	}
</style>
<script>
     $(function() {
        $( "#dialog" ).dialog({
           autoOpen: false,  
        });
        $( "#goComment" ).click(function() {
           $( "#dialog" ).dialog( "open" );
        });
     
     $('#o_tolPrice').change(function(){
    	 var newPrice = Number($(this).val());
      	 var shipPrice = Number($('#sw_price').text());
       	 $('#o_lastPrice').val(newPrice+shipPrice);
     });
     $('#cannelSubmit').click(function (e){
    	 var form = $(this).parents('#aform');
      	 console.log(form);
         e.preventDefault();
         swal({
        	  title: "真的要取消此訂單?",
        	  text: "可能會造成買家的負面印象",
        	  type: "warning",
        	  showCancelButton: true,
        	  confirmButtonColor: "#DD6B55",
        	  confirmButtonText: "取消訂單",
        	  cancelButtonText: "只是不小心按到"
        	},
        	function(isConfirm){
        		if(isConfirm){
        			form.submit();
        		}
        	}
        );
     });
     $('#m_score').dialog({
         autoOpen: false,
         title: "買方評價",
         width: 150,
         height: 130,
         position:{ my: "center", at: "top+240", of: window }
     });
     $('#m_name').mouseover(function(){
    	$('#m_score').dialog('open');
     }
     );
     });
</script>
</head>
<body>
<!-- 加入頁首 -->
<jsp:include page="includeTop.jsp"></jsp:include>
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
		<td>
			<label>賣場:</label>
			<a href="shop.html?s_id=${OrderVO.s_id}">${s_VO.m_name}</a>
		</td>
		<td>
			<label>購買者:</label>
			<button type="button" id="m_name">${m_VO.m_name}</button>
			<div id="m_score" style="display:none">
				<p><label>評價平均分: </label>${m_VO.m_avgScore}</p>
				<p><label>被評價次數： </label>${m_VO.m_scoreCount}</p>
			</div>
		</td>
		<td><label>交易階段:</label>${orderStatus}</td>
	</tr>
	<tr>
		<td><label>收件人:</label>${OrderVO.o_recipient}</td>
		<td><label>收件地址:</label>${OrderVO.o_address}</td>
		<td><label>運送方式:</label>${shipway.sw_name}</td>
		<td><label>付款方式:</label>${OrderVO.pay_id}</td>
	</tr>
	<tr>
		<td><label>下單時間:</label>${OrderVO.o_date}</td>
		<td><label>付款時間:</label>${OrderVO.o_remitDate}</td>
		<td><label>出貨時間:</label>${OrderVO.o_sendDate}</td>
		<c:choose>
			<c:when test="${OrderVO.o_procss == 1}">
				<td>
					<label style="vertical-align:top;">備註:</label>
					<textarea name="o_memo" cols="30" rows="1" style="resize:none;">${OrderVO.o_memo}</textarea>
				</td>
			</c:when>
			<c:otherwise>
				<td>
					<label style="vertical-align:top;">備註:</label>
					<textarea name="o_memo" cols="30" rows="1" style="resize:none;" readonly>${OrderVO.o_memo}</textarea>
				</td>
			</c:otherwise>
		</c:choose>
	</tr>
</table>
</div>
<div id="middleDiv">
<table id="middleTable" class="table">
	<tr class="success">
		<td colspan="5">商品清單</td>
	</tr>
		<tr>
			<td class="i_name">商品名稱</td>
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
		<tr class="danger">
			<td colspan="4">結算</td>
		</tr>
		<tr>
			<td>總價</td>
			<td>運費</td>
			<td>折扣點數</td>
			<td>成交價</td>	
		</tr>
		<tr>		
			<c:choose>
				<c:when test="${OrderVO.o_procss == 1}">
					<td>
						<div>
							<input type="text" id="o_tolPrice" size="7" name="o_tolPrice" value="${OrderVO.o_tolPrice}" />
						</div>
					</td>
				</c:when>
				<c:otherwise>
					<td><div>${OrderVO.o_tolPrice}</div></td>
				</c:otherwise>
			</c:choose>
			<td><div><span id="sw_price">${shipway.sw_price}</span></div></td>
			<td><div>${OrderVO.o_point}</div></td>
			<td style="background:#FFA042">
				<div>
					<span>${OrderVO.o_lastPrice}</span>
					<input id="o_lastPrice" type="hidden" value="${OrderVO.o_lastPrice}" name="o_lastPrice" />
				</div>
			</td>
		</tr>
		<c:if test="${OrderVO.o_procss == 1}">
		<tr>
			<td colspan="3"></td>
			<td>
				<input type="submit" value="確定修改" class="btn btn-info"/>
				<input type="hidden" name="action" value="modifyFromS"/>
				<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>	
			</td>
		</tr>
		</c:if>
</table>
</div>
</form>
<div id="footerDiv">
<c:if test="${OrderVO.o_procss > 0}">
<table class="table" style="table-layout:fixed">
	<tr>
		<td></td>
		<td></td>
		
		<c:if test="${(OrderVO.o_procss != 0 || OrderVO.o_procss!=-1) && OrderVO.o_procss < 3}">
			<td>
			<form action="Order.do" method="post" id="aform">
				<input type="submit" value="取消訂單" id="cannelSubmit" class="btn btn-danger"/>
				<input type="hidden" name="action" value="cannel"/>
				<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
			</form>
			</td>
		</c:if>
		<c:if test="${OrderVO.o_procss == 1}"><td>等待買家確認中..</td></c:if>	
		<c:if test="${OrderVO.o_procss != 1 && OrderVO.o_procss != 2}"><td></td></c:if>
			
		<c:if test="${OrderVO.o_procss>=2 && OrderVO.o_procss<=4}">
		<td>
		<form action="Order.do" method="post">
			<c:if test="${OrderVO.o_procss == 2}">
				<input type="submit" value="確定收單" class="btn btn-primary"/>
				<input type="hidden" name="action" value="confirmNext"/>
				<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
			</c:if>
			<c:if test="${OrderVO.o_procss == 3}">
				<p>接受訂單，等待買方付款中...</p>
			</c:if>
			<c:if test="${OrderVO.o_procss == 4}">
				<input type="submit" value="完成收款，已出貨" class="btn btn-primary"/>
				<input type="hidden" name="action" value="send"/>
				<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
			</c:if>
		</form>
		</td>
		</c:if>
		<c:if test="${OrderVO.o_procss == 5}">
			<td><p>已完成出貨，等待買家確認收貨中...</p></td>
		</c:if>
		<c:if test="${OrderVO.o_procss == 6}">
			<td>
				<c:if test="${OrderVO.m_commentStatus == 1}">
					<input type="button" id="goComment" value="進行評價" class="btn btn-primary"/>
					<div id="dialog" title="請給予買家評價" style='display:none'>
					<form action="Order.do" method="post">
						<label>評分：</label><input type="text" name="m_score" value="5" />(1~5分)<br>
						<label>評價：</label><textarea name="m_comment"></textarea>
						<input type="submit" value="送出評價" class="btn btn-primary"/>
						<input type="hidden" name="action" value="commentFromS"/>
						<input type="hidden" name="o_id" value="${OrderVO.o_id}"/>
					</form>
					</div>
				</c:if>
				<c:if test="${OrderVO.m_commentStatus == 0}">
					<p>您已經給予評價囉!</p>
				</c:if>
				<c:if test="${OrderVO.s_commentStatus == 0}">
					<br />
					<p>對方給您 ${OrderVO.s_score} 的評價，<br />評價內容為：${OrderVO.s_comment}</p>
				</c:if>
				<c:if test="${OrderVO.s_commentStatus == 1}">
					<br />
					<p>對方尚未進行評價</p>
				</c:if>
			</td>
		</c:if>

	</tr>
</table>
</c:if>
<c:if test="${OrderVO.o_procss <= 0}">
	<p>本訂單已關閉交易</p>
</c:if>
<c:if test="${OrderVO.o_procss == 7}">
	<p>本訂單已完成交易，雙方已給予評價</p>
	<p>對方給您 ${OrderVO.s_score} 的評價，評價內容為：${OrderVO.s_comment}</p>
</c:if>
</div>
</c:if>
<div id="endDiv">
<c:if test="${! empty res}"><p>${res}</p></c:if>
<c:if test="${! empty errorMsgs}"><p>${errorMsgs}</p></c:if>
<a href="Order.do?action=sGetAll">返回我的賣場訂單</a>
<a href="index.jsp">回首頁</a>
</div>
<!-- 加入頁尾 -->
<jsp:include page="_Footer.jsp"></jsp:include>
					
</body>
</html>