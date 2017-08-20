<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Trquestionitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>金頭腦</title>


<link rel="stylesheet" href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="webjars/sweetalert/1.1.3/dist/sweetalert.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script>


<!--  <link rel="stylesheet" href="styles/main.css"/> -->

<!-- <link rel="stylesheet" href="webjars/jquery-ui/1.12.1/themes/base/jquery-ui.min.css"> -->
<!-- <link rel="stylesheet" href="webjars/sweetalert/1.1.3/dist/sweetalert.css"> -->
<!-- <script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script> -->
<!-- <script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script> -->
<!-- <script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script> -->
<!-- <script src="webjars/sweetalert/1.1.3/dist/sweetalert.min.js"></script> -->

<!-- CSS -->
<style>
/*以下三個class貼在main裡不能跑會衝突*/
 .ThisWeek { 
  color:white;
  font-size:16px;
  /*line-height:45px;*/
  margin-right:10px;
  float:left;
  margin-top:10px;
}
.ThisWeek:hover {
   color:lightgray;
   text-decoration:none;
  
}
.icon-success {  /*本週頭條 星星 改變bootstrap icon的顏色*/
 color: #FFB90F;
   float:left;
}

 /*設定登入後的大頭貼*/

.myPicture {
    width:45px;height:45px; /*正圓形，所以寬與高都設一樣*/
    border-radius:99em;
    margin-left:1020px;
    border:2px lightgray solid;
    text-align:center;
    margin-top:5px;
  
}
.myPicture img{
    width:40px;height:40px; /*照片比div外框小一點*/
    border-radius:99em;
}

.threeDot{
    width:38px;height:38px; /*照片比div外框小一點*/
    border-radius:99em;
    background-color: #B3B3B3;
    text-align:center;
    margin-left:1090px;
    margin-top:-40px;
    padding:7px;
    padding-left:9px;
    }
.threeDot span { /*三個垂直白點*/
    color:white;
    font-size:20px;
    }
/*--------------------------------------*/
.dropdown-content {
    display:none;
    position:absolute;
    right: 18px;
    background-color:lightgray;/*#B3B3B3; /*#C1CDCD;*/
    width: 180px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    margin-top:8px;
    line-height:15px;
    font-family:微軟正黑體;
    font-size:16px;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

/*----------以下是金頭腦部分-------*/

* {
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}
.ui-widget-header{
  margin-bottom:4px;
}
.ui-widget-header, .ui-state-default, ui-button {
	background:#A1A1A1;/*#E9967A;/*#66CDAA;#b9cd6d;*/
	border: 1px solid #A1A1A1;
	color: #FFFFFF;
	font-weight:bold;
	font-family: 標楷體;
}

#dialog{
   display:none;
   padding: 25px;
}

.question{
   border-radius:20px;
   background-color:#FFC1C1;/*#EEE9E9; /*#EED5D2; */
   margin:0 auto;
   width:760px;
   height:150px;
   margin-bottom:10px;
   padding:25px 25px;
   
}
.opt1{
   border-radius:20px;
   background-color:#FF4500;
   width:375px;
   height:72px;
   float:left; 
   margin-bottom:6px;
   position: relative;
   padding-top:5px;
}
.opt2{
    border-radius:20px;
    background-color:#6495ED;
    width:375px;
    height:72px;
    float:right;
    margin-bottom: 6px;
    position: relative;
    padding-top:5px;
}
.opt3{
    border-radius:20px;
    background-color:yellow;
    width:375px;
    height:72px;
    clear:both;
    float:left;
    position: relative;
    padding-top:5px;
}
.opt4{
     border-radius:20px;
     background-color:#66CD00;
     width:375px;
     height:72px;
     clear:right;
     float:right;
     position: relative;
     padding-top:5px;
}

 .opt1:hover,.opt2:hover,.opt3:hover,.opt4:hover { 
 background-color: #A9A9A9; 
 } 
 
.ans{/*解答*/
     display:none;
}
 
.optspan{ /*顯示圈叉*/
 /*border:1px black solid;*/
 position: absolute;
 color:white;
 right:40px;
 top:10px;
 font-size:40px;
 font-weight: 50px;
}

.welcome{/*遊戲說明文字部分*/
/*     width: 500px; */
/*     height: 300px; */
    line-height:45px; 
    text-align: left;
    font-weight:1200;
    font-family:細明體/*標楷體*/;
    color:#8B8378/*#8B2323*/;
    padding-top: 20px;
    padding-left:50px;
    font-size:30px;
    font-weight:600;
    
}

.welcome:before{/*遊戲說明背景圖部分*/
/*     background: url(<c:url value="/images/shopping.jpg"/>); */
    background: url(<c:url value="/images/girl02.jpg"/>);
    background-size: cover;
    width: 810px;
    height: 420px;
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    z-index: -1;/*-1 可以当背景    若沒有此屬性文字會跑到圖片後面*/
/*       -webkit-filter: blur(1px);   */
/*       filter: blur(1px);   */
      
}
#showAns{/*說明文字部分*/
/*    border-radius:20px; */
/*    background-color:#EEE9E9; /*#EED5D2; /*#FFC1C1;*/ */
/*    margin:0 auto; */
/*    width:760px; */
/*    height:200px; */
   margin-bottom: 8px;
   padding-left: 20px;
   
   line-height:30px;
    text-align:left;
    font-weight:700;
    font-family: 細明體/*標楷體*/;
    color:black;
    padding-top:80px;
   
}

#showAns:before{/*說明背景圖部分*/
    background: url(<c:url value="/images/girl03.png"/>);
    background-size: cover;
    width: 804px;
    height: 420px;
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    z-index: -1;/*-1 可以当背景    若沒有此屬性文字會跑到圖片後面*/
/*      -webkit-filter: blur(1px);  */
/*      filter: blur(1px);  */
      
}

form{
/*border:1px solid black;*/
 border-radius:20px;
 margin-top: 80px;
 margin-left: 20px;
}


.countDown{
position:relative;
/*  border: 1px solid blue; */
 width: 760px; 
 height: 80px;
/* height: 30px;*/
 margin-top:1px!important;
 margin-bottom: 6px;
}

#timeSpan1,#timeSpan2,#timeSpan3,#timeSpan4,#timeSpan5{
    position:absolute;
    width: 80px;
	height: 80px;
	line-height: 80px;
	border: 1px solid #66CDAA;
	background-color:#66CDAA;
	color:white;
	border-radius: 80px;	/* 高度 */
	text-align: center;
	right:3px;
	font-size:50px;
}
</style>
<script type="text/javascript">
var k=0;//用來判斷要顯示第幾頁
var ansIsTrue=0;//紀錄答對題數
var ansIsFalse=0;//紀錄答錯題數(用不到)
var getBonus=0;//紀錄傳回Servlet的點數
var playAlready=0;//紀錄如果已全部作答完畢且得到紅利，按下右上角叉叉後不得再挑戰

function getJSON(){
	$.getJSON('<c:url value="/showQuestion.do"/>', function(datas) {
		openGoButton();
		for(var i=1;i<5;i++){//ABCD選項點下去變灰色
			$('.opt'+i).click(function(){$(this).attr("style","background-color:#A9A9A9");})
		}  

		for(var i=0;i<5;i++){
			$('#question'+(i+1)).html("<h3>"+(i+1)+"."+datas[i].question+"</h3>");
			$('#A'+(i+1)).html("<h3 style='padding-left:25px'>(A) "+datas[i].option1+"</h3><span class='optspan'></span>");
			$('#B'+(i+1)).html("<h3 style='padding-left:25px'>(B) "+datas[i].option2+"</h3><span class='optspan'></span>");
			$('#C'+(i+1)).html("<h3 style='padding-left:25px'>(C) "+datas[i].option3+"</h3><span class='optspan'></span>");
			$('#D'+(i+1)).html("<h3 style='padding-left:25px'>(D) "+datas[i].option4+"</h3><span class='optspan'></span>");
			$('#ans'+(i+1)).html(datas[i].answer+"<br>");
	
	<!--取得題目資料後做判斷 -->
	
	$("#A"+(i+1)).click(function(){
	 for(var i=1;i<6;i++){
	 if($('#view'+i).attr("style")!="display:none"){
	  
	  var ans=$('#ans'+i).text();
	  
	  if($(this).text().charAt(1)==ans){
		  $(this).find('span').html("O");
		  ansIsTrue++;
	  }else {											
		  $(this).find('span').html("X");
		  ansIsFalse++;
		  }
	  
	  $('#B'+i).unbind("click").attr("style","background-color:#6495ED");
	  $('#C'+i).unbind("click").attr("style","background-color:yellow");
	  $('#D'+i).unbind("click").attr("style","background-color:#66CD00");

	 }
	 
	 
	 }
	}); 
	
	         $("#B"+(i+1)).click(function(){
	 
	 for(var i=1;i<6;i++){
	 if($('#view'+i).attr("style")!="display:none"){
	  if($(this).text().charAt(1)==$('#ans'+i).text()){
		  $(this).find('span').html("O");
		  ansIsTrue++;
	  }else {										
		  $(this).find('span').html("X");
		  ansIsFalse++;
		  }
	  $('#A'+i).unbind("click").attr("style","background-color:#FF4500");
	  $('#C'+i).unbind("click").attr("style","background-color:yellow");
	  $('#D'+i).unbind("click").attr("style","background-color:#66CD00");   
	    }
	 }
	}); 
	
	         $("#C"+(i+1)).click(function(){
	 
	 for(var i=1;i<6;i++){
	 if($('#view'+i).attr("style")!="display:none"){
	  if($(this).text().charAt(1)==$('#ans'+i).text()){
		  $(this).find('span').html("O");
		  ansIsTrue++;
	  }else {										
		  $(this).find('span').html("X");
		  ansIsFalse++;
		  }
	  $('#A'+i).unbind("click").attr("style","background-color:#FF4500");
	  $('#B'+i).unbind("click").attr("style","background-color:#6495ED");
	  $('#D'+i).unbind("click").attr("style","background-color:#66CD00");   
	   
	    }
	 }
	}); 
	         
	         
	         $("#D"+(i+1)).click(function(){
	 
	 for(var i=1;i<6;i++){
	 if($('#view'+i).attr("style")!="display:none"){
	  if($(this).text().charAt(1)==$('#ans'+i).text()){
		  $(this).find('span').html("O");
		  ansIsTrue++;
	  }else {										
		  $(this).find('span').html("X");
		  ansIsFalse++;
		  }
	  $('#A'+i).unbind("click").attr("style","background-color:#FF4500");
	  $('#B'+i).unbind("click").attr("style","background-color:#6495ED");
	  $('#C'+i).unbind("click").attr("style","background-color:yellow");
	   
	    }
	 }
	}); 
	
	     }<!--最外層for迴圈結束-->
	});<!--$.getJSON結束-->
};

function clearContent(){
	for(var i=0;i<5;i++){
		$('#question'+(i+1)).html("");
		$('#A'+(i+1)).html("");
		$('#B'+(i+1)).html("");
		$('#C'+(i+1)).html("");
		$('#D'+(i+1)).html("");
	}
};<!--function結束-->

// function disableButton(){//一開始要關閉的按鈕  
//    	$(".ui-dialog-buttonpane button:contains('下一題')").attr("disabled", true);
//    	$(".ui-dialog-buttonpane button:contains('看結果')").attr("disabled", true);
// };

function openGoButton(){
	$(".ui-dialog-buttonpane button:contains('GO')").removeAttr("disabled");
}
  
function seeAnswer(){
	if(ansIsTrue==5){
		$('#showAns').html("<h2>答對題數:5<br><br>恭喜你獲得紅利10點!</h2>");
	    getBonus=10;
	    $('#bonus').val(getBonus);
	}
	  
	if(ansIsTrue==4){
		$('#showAns').html("<h2>答對題數:4<br><br>恭喜你獲得紅利5點!</h2>");
	    getBonus=5;
	    $('#bonus').val(getBonus);
	}
	 
	if(ansIsTrue==3){
		$('#showAns').html("<h2>答對題數:3<br><br>恭喜你獲得紅利3點!</h2>");
		getBonus=3; 
		$('#bonus').val(getBonus);
	}
	
	if(ansIsTrue==2){// getBonus=0;
		$('#showAns').html("<h2>答對題數:2<br><br>太可惜了!差一點點!</h2>");
		$('#bonus').val(getBonus);
	}
	  	        	    
	if(ansIsTrue==1){// getBonus=0;
		$('#showAns').html("<h2>答對題數:1<br><br>別氣餒!歡迎再來挑戰時尚金頭腦!</h2>");
		$('#bonus').val(getBonus);
	}
	 
	if(ansIsTrue==0){// getBonus=0;
		$('#showAns').html("<h2>答對題數:0<br><br>運氣不好，再接再厲!</h2>"); 
		$('#bonus').val(getBonus);
	}
};
  
function updateBonus(){ //送出並更新紅利
	$.post('<c:url value="/saveBonus.do"/>',{"bonus":getBonus});
}


var timer;
var countDown=$('.countDown');
function _testBysetInterval(timer) {
	
	for(var i=1;i<6;i++){
    
    if($('#view'+i).attr("style")=="display:block"){
		
    	var $timeSpan = $("#timeSpan"+i);
    	time = parseInt($timeSpan.text());
    	time--;
    	if(time<10 && time>-1){time="0"+time}
    	if (time <= -1) {
    	//$timeSpan.css("color", "black");
    	//$timeSpan.html("<p style='font-size:3px'>時間到</P>");
    	//clearInterval(timer);//需要清除计时器
    	
        
    	//$('#buttonGo').click();
        
    	clearInterval(timer);						 
		 $('#view'+k).attr("style","display:none");	
		 $('#view'+(k+1)).attr("style","display:block");	
         k++;
      
    	}
    	else {
    	$timeSpan.text(time);
    	}

    }
	}
};
</script>

</head>
<body style="background-color:rgb(234,234,234)">
<jsp:include page="includeTop.jsp"></jsp:include>

<div class="container"  style="">
    <div class="row">
        <div class="col-sm-12">
           <div   style="background-image:url(images/brain.png);background-size:cover;height:650px;margin-bottom: 50px;margin-top: 40px;">
              <div style="font-family:微軟正黑體;font-size:25px;padding: 70px 60px;line-height: 30px">
                    <h1>---歡迎挑戰「ALLBUYBACK金頭腦」---</h1><br>你是購物達人嗎？<br><br>永遠掌握最新的購物資訊？<br><br>對品牌/商品是不是夠有SENSE呢？<br><br>玩個遊戲就知道囉!
              </div>
              <button id="opener" style="margin-top:-10px;margin-left:60px;font-family:微軟正黑體;font-size:25px;background-color: rgb(42,186,171);border:rgb(42,186,171);border-radius:5px 5px;padding:8px 20px;letter-spacing: 3px;color:white;">我要挑戰</button>
              
              
           </div>
        </div>
    </div>
</div>

	<div id="dialog" title="<時尚金頭腦>" style="padding-top:5px;">
	
	   <div id="view0" style="display:block">
	      <div class="welcome" >            
		          遊戲規則如下:<br>依序回答五個問題，<br>每題作答時間15秒， <br>答對三題可獲得紅利3點，<br>答對四題可獲得紅利5點，<br>答對五題可獲得紅利10點!<br>
		          還等什麼？快去挑戰!
		  </div>
	   </div>


		<div id="view1" style="display:none"> 
		    <div class="countDown"><div id="timeSpan1" >15</div></div>
			<div class="question" id="question1"></div>
			<div class="opt1" id="A1"></div>
			<div class="opt2" id="B1"></div>
			<div class="opt3" id="C1"></div>
			<div class="opt4" id="D1"></div>
			<div class="ans" id="ans1"></div>
 		</div> 
 		
 		<div id="view2" style="display:none"> 
 		    <div class="countDown">	<span id="timeSpan2" >15</span></div>
		 	<div class="question" id="question2"></div>
		    <div class="opt1" id="A2"></div>
			<div class="opt2" id="B2"></div>
			<div class="opt3" id="C2"></div>
			<div class="opt4" id="D2"></div>
			<div class="ans" id="ans2"></div>
 		</div> 
		
		<div id="view3" style="display:none"> 
		    <div class="countDown">	<span id="timeSpan3" >15</span></div>
			<div class="question" id="question3"></div>
			<div class="opt1" id="A3"></div>
			<div class="opt2" id="B3"></div>
			<div class="opt3" id="C3"></div>
			<div class="opt4" id="D3"></div>
			<div class="ans" id="ans3"></div>
 		</div> 
 		
 		<div id="view4" style="display:none"> 
 		    <div class="countDown">	<span id="timeSpan4" >15</span></div>
			<div class="question" id="question4"></div>
			<div class="opt1" id="A4"></div>
			<div class="opt2" id="B4"></div>
			<div class="opt3" id="C4"></div>
			<div class="opt4" id="D4"></div>
			<div class="ans" id="ans4" ></div>
 		</div> 
 		
 		<div id="view5" style="display:none"> 
 		    <div class="countDown"><span id="timeSpan5" >15</span></div>
			<div class="question" id="question5"></div>
			<div class="opt1" id="A5"></div>
			<div class="opt2" id="B5"></div>
			<div class="opt3" id="C5"></div>
			<div class="opt4" id="D5"></div>
			<div class="ans" id="ans5" ></div>
 		</div> 

        <div id="view6" style="display:none">  
	        <div id="showAns"></div>
	        <form action='<c:url value="/seeMyBonus.do"/>' method="post">	        
	          <input type="hidden" id="bonus" name="bonus" value="" ><br><br><br>
	          <input type="submit" value="查看紅利" style="padding:3px 10px;font-family:標楷體;font-size:25px;background-color:#CDB79E/*#EE9572*/;border-radius:5px;border:#EE9572;">
	        </form>   
        </div>

	</div><!--dialog內容結束-->


	<!-- JavaScript -->
	<script type="text/javascript">
		$(function() {
			console.log("initialize dialog-------------------------------------");
						
			$("#dialog").dialog({
				autoOpen : false,
				resizable:false,
				width : 820,
				height :560,
				modal:true,
			    show: {
			        effect: 'fade',
			        duration: 300
			      },
		        hide: {
			        effect: 'fade',
			        duration: 300
			      },
				open : getJSON,
				buttons : {
// 					'GO':function(){

// 						 clearInterval(timer);						 
// 						 $('#view'+k).attr("style","display:none");	
// 						 $('#view'+(k+1)).attr("style","display:block");	
// 			             k++;						
// 			             timer = setInterval(function () {
// 			   	        	_testBysetInterval(timer)
// 			   	        	}, 1000);			            
// 			            if(k==5){ //到第五題的時候，點下GO進入顯示答題結果及紅利發送
// 		            	   seeAnswer();
// 		            	   updateBonus();
// 			            }	
// 			            if(k==6){
// 			            	$(".ui-dialog-buttonpane button:contains('GO')").attr("disabled", true);
// 			            	k=0;
// 			            }
// 					},	
					
					
					
					  "MyButton" : {
				          text: "Go",
				          id: "buttonGo",
				          click: function(){					          
					           
				        	  clearInterval(timer);						 
								 $('#view'+k).attr("style","display:none");	
								 $('#view'+(k+1)).attr("style","display:block");	
					             k++;						
					             timer = setInterval(function () {
					   	        	_testBysetInterval(timer)
					   	        	}, 1000);			            
					            if(k==5){ //到第五題的時候，點下GO進入顯示答題結果及紅利發送
				            	   seeAnswer();
				            	   updateBonus();
					            }	
					            if(k==6){
					            	//$(".ui-dialog-buttonpane button:contains('MyButton')").attr("disabled", true);
					            	$('#buttonGo').attr("disabled", true);
					            	k=0;
					            }
 
				          }   
				       } ,
			        
			        
				},//button結束
				close:function(){
					k=0;
					clearContent;
					$('#view0').attr("style","display:block");
					for(var i=1;i<7;i++){$('#view'+i).attr("style","display:none")};
						
				},
			});<!--dialog設定結束-->
			//openGoButton;<!--必須放在執行打開dialog之後-->
			$("#opener").click(function() {
				$("#dialog").dialog("open");
			});
	});
</script>



<jsp:include page="_Footer.jsp"></jsp:include>
</body>
</html>