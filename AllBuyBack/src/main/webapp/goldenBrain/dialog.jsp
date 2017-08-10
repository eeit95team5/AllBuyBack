<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Trquestionitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>有背景的dialog</title>


<!-- <link rel='stylesheet' href='../webjars/bootstrap/3.3.7-1/css/bootstrap.min.css'> -->
<!-- <script type='text/javascript' src='../webjars/jquery/3.2.1/dist/jquery.min.js'></script> -->
<!-- <script type='text/javascript' src='../webjars/bootstrap/3.3.7-1/js/bootstrap.min.js'></script> -->
<!-- <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script> -->
<!-- <link type="text/css" rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />  -->

<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->


<link rel="stylesheet" href="<c:url value='/dialogJar/jquery-ui.css'/>">
<script src="<c:url value='/js/jquery-1.12.4.js'/>"></script>
<script src="<c:url value='/dialogJar/jquery-ui.js'/>"></script>

<!-- CSS -->
<style>
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
   padding:20px 20px;
   
}
.opt1{
   border-radius:20px;
   background-color:#FF4500;
   width:375px;
   height:72px;
   float:left; 
   margin-bottom: 6px;
   position: relative;
}
.opt2{
    border-radius:20px;
    background-color:#6495ED;
    width:375px;
    height:72px;
    float:right;
    margin-bottom: 6px;
    position: relative;
}
.opt3{
    border-radius:20px;
    background-color:yellow;
    width:375px;
    height:72px;
    clear:both;
    float:left;
    position: relative;
}
.opt4{
     border-radius:20px;
     background-color:#66CD00;
     width:375px;
     height:72px;
     clear:right;
     float:right;
     position: relative;
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
    line-height:35px;
    text-align: right;
    font-weight:1200;
    font-family: 標楷體;
    color:white;
    
}

.welcome:before{/*遊戲說明背景圖部分*/
    background: url(<c:url value="/images/shopping.jpg"/>);
    background-size: cover;
    width: 810px;
    height: 370px;
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    z-index: -1;/*-1 可以当背景    若沒有此屬性文字會跑到圖片後面*/
/*     -webkit-filter: blur(1px); */
/*     filter: blur(1px); */
      
}
#showAns{
/*    border-radius:20px; */
/*    background-color:#EEE9E9; /*#EED5D2; /*#FFC1C1;*/ */
/*    margin:0 auto; */
/*    width:760px; */
/*    height:200px; */
   margin-bottom: 8px;
   padding-left: 20px;
   padding-top: 70px;
   
}

#showAns{/*說明文字部分*/
/*     width: 500px; */
/*     height: 300px; */
    line-height:30px;
    text-align:left;
    font-weight:700;
    font-family: 標楷體;
    color:black;
    
}
#showAns:before{/*說明背景圖部分*/
    background: url(<c:url value="/images/shoppingEnd.jpg"/>);
    background-size: cover;
    width: 804px;
    height: 370px;
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    z-index: -1;/*-1 可以当背景    若沒有此屬性文字會跑到圖片後面*/
     -webkit-filter: blur(1px); 
     filter: blur(1px); 
      
}

form{
/*border:1px solid black;*/
 border-radius:20px;
 margin-top: 80px;
 margin-left: 20px;
}


.countDown{
 /*border: 1px solid black;*/
 height: 30px;
 margin-top:0px!important;
}

#timeSpan1,#timeSpan2,#timeSpan3,#timeSpan4,#timeSpan5{
    width: 80px;
	height: 80px;
	line-height: 80px;
	border: 1px solid red;
	border-radius: 80px;	/* 高度 */
	text-align: center;
	margin-right: 5px;
}
</style>
<script type="text/javascript">

var k=0;//用來判斷要顯示第幾頁
var ansIsTrue=0;//紀錄答對題數
var ansIsFalse=0;//紀錄答錯題數(用不到)
var getBonus=0;//紀錄傳回Servlet的點數

function getJSON(){
	$.getJSON('<c:url value="/showQuestion.controller"/>', function(datas) {
		
		//$("#countDown").attr("style","color:red");
		
		for(var i=1;i<5;i++){//ABCD選項點下去變灰色
			$('.opt'+i).click(function(){$(this).attr("style","background-color:#A9A9A9");})
		}  

		for(var i=0;i<5;i++){
			$('#question'+(i+1)).html("<h3>"+(i+1)+"."+datas[i].question+"</h3>");
			$('#A'+(i+1)).html("<h3 style='padding-left:20px'>(A) "+datas[i].option1+"</h3><span class='optspan'></span>");
			$('#B'+(i+1)).html("<h3 style='padding-left:20px'>(B) "+datas[i].option2+"</h3><span class='optspan'></span>");
			$('#C'+(i+1)).html("<h3 style='padding-left:20px'>(C) "+datas[i].option3+"</h3><span class='optspan'></span>");
			$('#D'+(i+1)).html("<h3 style='padding-left:20px'>(D) "+datas[i].option4+"</h3><span class='optspan'></span>");
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

function disableButton(){//一開始要關閉的按鈕
   	$(".ui-dialog-buttonpane button:contains('下一題')").attr("disabled", true);
   	$(".ui-dialog-buttonpane button:contains('看結果')").attr("disabled", true);
};
  
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
		$('#showAns').html("<h2>答對題數:2<br><br>太可惜了!差一點點!歡迎再來挑戰時尚金頭腦!</h2>");
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
	$.post('<c:url value="/saveBonus.controller"/>',{"bonus":getBonus});
}


var timer;


function _testBysetInterval(timer) {
	
	for(var i=1;i<6;i++){
    
    if($('#view'+i).attr("style")=="display:block"){
		
    	var $timeSpan = $("#timeSpan"+i);
    	time = parseInt($timeSpan.text());
    	time--;
    	if(time<10 && time>-1){time="0"+time}
    	if (time <= -1) {
    	$timeSpan.css("color", "red")
    	clearInterval(timer);//需要清除计时器
    	}
    	else {
    	$timeSpan.text(time);
    	}

    }
	}
};
</script>

</head>
<body>

	<h1>我要挑戰今日任務</h1>

	<div id="dialog" title="<時尚金頭腦>" >
	
	   <div id="view0" style="display:block">
	      <div class="welcome"> <h2>歡迎來到「時尚金頭腦」!</h2>               
		          <h2>遊戲規則如下:<br>依序回答五個問題， <br>答對三題可獲得紅利3點，<br>答對四題可獲得紅利5點，<br>答對五題可獲得紅利10點!<br>
		          還等什麼？快去挑戰!
		          </h2>	  </div>
	   </div>


		<div id="view1" style="display:none"> 
		    <div class="countDown"><span id="timeSpan1" style="color:gray;font-size:30px">10</span></div>
			<div class="question" id="question1"></div>
			<div class="opt1" id="A1"></div>
			<div class="opt2" id="B1"></div>
			<div class="opt3" id="C1"></div>
			<div class="opt4" id="D1"></div>
			<div class="ans" id="ans1"></div>
 		</div> 
 		
 		<div id="view2" style="display:none"> 
 		    <div class="countDown">	倒數計時：<span id="timeSpan2" style="color:gray;font-size:30px">10</span></div>
		 	<div class="question" id="question2"></div>
		    <div class="opt1" id="A2"></div>
			<div class="opt2" id="B2"></div>
			<div class="opt3" id="C2"></div>
			<div class="opt4" id="D2"></div>
			<div class="ans" id="ans2"></div>
 		</div> 
		
		<div id="view3" style="display:none"> 
		    <div class="countDown">	倒數計時：<span id="timeSpan3" style="color:gray;font-size:30px">10</span></div>
			<div class="question" id="question3"></div>
			<div class="opt1" id="A3"></div>
			<div class="opt2" id="B3"></div>
			<div class="opt3" id="C3"></div>
			<div class="opt4" id="D3"></div>
			<div class="ans" id="ans3"></div>
 		</div> 
 		
 		<div id="view4" style="display:none"> 
 		    <div class="countDown">	倒數計時：<span id="timeSpan4" style="color:gray;font-size:30px">10</span></div>
			<div class="question" id="question4"></div>
			<div class="opt1" id="A4"></div>
			<div class="opt2" id="B4"></div>
			<div class="opt3" id="C4"></div>
			<div class="opt4" id="D4"></div>
			<div class="ans" id="ans4" ></div>
 		</div> 
 		
 		<div id="view5" style="display:none"> 
 		    <div class="countDown">	倒數計時：<span id="timeSpan5" style="color:gray;font-size:30px">10</span></div>
			<div class="question" id="question5"></div>
			<div class="opt1" id="A5"></div>
			<div class="opt2" id="B5"></div>
			<div class="opt3" id="C5"></div>
			<div class="opt4" id="D5"></div>
			<div class="ans" id="ans5" ></div>
 		</div> 

        <div id="view6" style="display:none">
        
	        <div id="showAns"></div>
	        <form action='<c:url value="/seeMyBonus.controller"/>' method="post">	        
	          <input type="hidden" id="bonus" name="bonus" value="" >
	          <input type="submit" value="查看紅利" style="font-family:標楷體;font-size:25px;background-color:#EE9572;border-radius:5px;border:#EE9572">
	        </form>
        
        </div>

	</div><!--dialog內容結束-->

	<button id="opener">Open Dialog</button>

	<!-- JavaScript -->
	<script type="text/javascript">
		$(function() {
			console.log("initialize dialog-------------------------------------");
						
			$("#dialog").dialog({
				autoOpen : false,
				resizable:false,
				width : 820,
				height :550,
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
					'挑戰': function() {
				        	$('#view'+k).attr("style","display:none");	
							$('#view'+(k+1)).attr("style","display:block");	
				            k++;
				            $(".ui-dialog-buttonpane button:contains('挑戰')").hide();
				            $(".ui-dialog-buttonpane button:contains('下一題')").removeAttr("disabled");
			   	         	$(".ui-dialog-buttonpane button:contains('看結果')").removeAttr("disabled");
			   	         	
			   	         
			   	            timer = setInterval(function () {
			   	        	_testBysetInterval(timer)
			   	        	}, 1000);
			   	         	
					      },
					'下一題' : function() {
						$('#view'+k).attr("style","display:none");	
						$('#view'+(k+1)).attr("style","display:block");	
			            k++;	
       		            if(k==5){  <!--最後一題時不顯示下一題的按鈕-->
			            	 $(".ui-dialog-buttonpane button:contains('下一題')").hide();
			            }
       		            
       		             clearInterval(timer);//若時間還沒走完，使用者已按下一頁，直接清掉沒跑完的timer，在啟動新的timer
       		             
       		             timer = setInterval(function () {
       		        	_testBysetInterval(timer)
       		        	}, 1000);  
       		            
       		            
				        },

				      "MyButton" : {
				          text: "看結果",
				          id: "my-button-id",
				          click: function(){					          
					           
				        	  clearInterval(timer);
				        	  $('#view'+k).attr("style","display:none");	
							  $('#view'+(k+1)).attr("style","display:block");	
					          k++;	
					          seeAnswer();
					          $(".ui-dialog-buttonpane button:contains('看結果')").hide();
					         //第五題時使用者點下選項後送出紅利到後端更新  
					          updateBonus();				         
 
				          }   
				       } ,
			        
			    	'結束' : function() {	
			    		$("#dialog").dialog("close");
			    		//destroy();
			    	},
					       

				},//button結束
				close:function(){
					k=0;
					clearContent;
					$('#view0').attr("style","display:block");
					for(var i=1;i<7;i++){$('#view'+i).attr("style","display:none")};
						
				},
			});<!--dialog設定結束-->
			disableButton();<!--必須放在執行打開dialog之後-->
			$("#opener").click(function() {
				$("#dialog").dialog("open");
			});
	});
</script>


</body>
</html>