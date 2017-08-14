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


 <link rel="stylesheet" href="styles/main.css"/>
 <link rel="stylesheet" href="css/bootstrap.min.css"/>
 <script src="js/bootstrap.min.js"></script> 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
    height: 420px;
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
    padding-top: 150px;
    
}
#showAns:before{/*說明背景圖部分*/
    background: url(<c:url value="/images/shoppingEnd.jpg"/>);
    background-size: cover;
    width: 804px;
    height: 420px;
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






.ThisWeek {  /*關於本週頭條  以下三個class貼在main裡不能跑會衝突*/
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
.icon-success {  /*改變bootstrap icon的顏色*/
 color: #FFB90F;
   float:left;
}


/*底下分頁*/
.center {
    text-align: center;
}

.pagination {
    display: inline-block;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
    margin: 0 4px;
    font-size: 20px;
}

.pagination a.active {
    background-color: gray;
    color: white;
    border: 1px solid gray;
}

.pagination a:hover:not(.active) {
    background-color: #ddd;

}/*底下分頁結束*/

/*小搜尋結果顯示*/
/* Style the tab */
div.tab {
    overflow: hidden;
    border-bottom: 2px solid black;
    /*background-color: #f1f1f1;*/
    color:gray;
}

/* Style the buttons inside the tab */
div.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 12px 20px;
    transition: 0.3s;
    font-size: 18px;
    font-family:微軟正黑體;
}

/* Change background color of buttons on hover */
div.tab button:hover {
    /*background-color: #ddd;*/
    color:black;
}

/* Create an active/current tablink class */
div.tab button.active {
    /*background-color: #ccc;*/
    border-bottom:5px solid red!important;
    color:black;
    font-weight:700;
}
/* Style the tab content */
.tabcontent { /*div夾ul li小項目*/
    /*display: none;*/
    padding: 6px 7px;
    border-bottom: 3px solid lightgray;
    /*border-top: none;*/
    height:50px;
    margin-bottom:15px;
}

.showItemClass {/*ul設定*/
    overflow:auto;
    list-style-type:none;
        }
.showItemClass li{/*li設定*/
    float: left;
    width:6em;
    font-family:微軟正黑體;
    font-size:15px;
    text-align:left;
    border-right:1px solid lightgray;
}

 .showItemClass li a {
    display:block;
    line-height:2em;
    color:black;
    text-align:center;
    text-decoration:none;
        }
.showItemClass li a:hover {     
    color:gray;
}

.showItemClass li a.active {   /*額外加的 被選擇的小類別變色*/  
    color:red;
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
    	$timeSpan.css("color", "black");
    	countDown.text("時間到");
    	clearInterval(timer);//需要清除计时器
    	//

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
<nav class="navbar navbar-inverse  navbar-fixed-top " style="border-bottom:1px #F5F5F5 solid;"  >
  <div  class="container-fluid" style="background-color:#F5F5F5;"  >

      <div class="container" style="padding-top:10px;padding-bottom:8px">
          <div class="row">
              <div class="col-sm-12">

    <div class="navbar-header" style="font-size:20px;margin-right:120px;">
      <a class="navbar-brand" 
          style="color:rgb(41,64,87);font-family:Stencil;font-size:1.2em" 
          href="#">ALL BUY BACK</a>
    </div>

<ul class="drop-down-menu  nav navbar-nav" style="text-align:left">
        <li><a href="#"" >首頁</a></li>

        <li><a href="#"">找商品<span class="glyphicon glyphicon-menu-down"></span></a>
              <ul>
                <li><a href="#">依類別瀏覽</a>
                    <ul>
                        <li><a href="#">流行服飾</a>
                             <ul>
                                <li><a href="#">日系</a>
                                    <ul>
                                        <li><a href="#">無印良品</a>
                                        </li>
                                        <li><a href="#">UNIQLO</a>
                                        </li>
                                        <li><a href="#">GLOBAL WORK</a>
                                        </li>
                                        <li><a href="#">23區</a>
                                        </li>
                                         <li><a href="#">其他</a>
                                        </li>                                   
                                    </ul>
                                </li>
                                <li><a href="#">韓系</a>
                                    <ul>
                                        <li><a href="#">87MM</a>
                                        </li>
                                        <li><a href="#">8ight Seconds</a>
                                        </li>
                                        <li><a href="#">Ader Error</a>
                                        </li>
                                        <li><a href="#">GOGOSING</a>
                                        </li>     
                                         <li><a href="#">其他</a>
                                        </li>                           
                                    </ul>
                                </li> 
                                <li><a href="#">美國</a>
                                    <ul>
                                        <li><a href="#">CK</a>
                                        </li>
                                        <li><a href="#">GAP</a>
                                        </li>
                                        <li><a href="#">Roots</a>
                                        </li>
                                        <li><a href="#">Timberland</a>
                                        </li>     
                                        <li><a href="#">其他</a>
                                        </li>                           
                                    </ul>
                            </li>    
                              <li><a href="#">歐洲</a>
                                    <ul>
                                        <li><a href="#">AIGLE</a>
                                        </li>
                                        <li><a href="#">Accessorize</a>
                                        </li>
                                        <li><a href="#">Kenzo</a>
                                        </li>
                                        <li><a href="#">Superdry</a>
                                        </li>     
                                        <li><a href="#">其他</a>
                                        </li>                           
                                    </ul>
                              </li>                                      
                             </ul>
                        </li>
                        <li><a href="#">異國美食</a>
                             <ul>
                                 <li><a href="#">零食</a>
                                    <ul>
                                        <li><a href="#">巧克力</a>
                                        </li>
                                        <li><a href="#">餅乾</a>
                                        </li>
                                        <li><a href="#">糖果</a>
                                        </li>    
                                        <li><a href="#">其他</a>
                                        </li>                           
                                    </ul>
                               </li>         
                                    <li><a href="#">飲品</a>
                                        <ul>
                                        <li><a href="#">咖啡</a>
                                        </li>
                                        <li><a href="#">茶</a>
                                        </li> 
                                        <li><a href="#">其他</a>
                                        </li>                           
                                        </ul>
                                    </li>                              
                                </ul>
                            </li><!--以下分類尚未填入-->
                            <li><a href="#">數位3C</a>
                                 <ul>
                                 <li><a href="#">手機</a>
                                    <ul>
                                        <li><a href="#">iPhone</a>
                                        </li>
                                        <li><a href="#">Samsung</a>
                                        </li>
                                        <li><a href="#">Sonic</a>
                                        </li>    
                                        <li><a href="#">Casio/卡西歐</a>
                                        </li>
                                        <li><a href="#">其他</a>
                                        </li>                           
                                    </ul>
                               </li>         
                                    <li><a href="#">相機</a>
                                        <ul>
                                        <li><a href="#">周邊配件</a>
                                        </li>
                                        <li><a href="#">手機殼</a>
                                        </li> 
                                        <li><a href="#">其他</a>
                                        </li>                           
                                        </ul>
                                    </li>
                                      <li><a href="#">電腦</a>
                                        <ul>
                                        <li><a href="#">ACER</a>
                                        </li>
                                        <li><a href="#">APPLE</a>
                                        </li> 
                                        <li><a href="#">ASUS</a>
                                        </li> 
                                        <li><a href="#">DELL</a>
                                        </li>                           
                                        </ul>
                                    </li>                                      
                                </ul>
                            </li>
                            <li><a href="#">美妝美體</a>
                                 <ul>
                                 <li><a href="#">化妝品</a>                                
                               </li>         
                                    <li><a href="#">保養清潔用品</a>                                       
                                    </li>                                                          
                                </ul>
                            </li>                         
                              <li><a href="#">運動用品</a>
                                  <ul>
                                  <li><a href="#">adidas</a>                              
                                  </li>         
                                  <li><a href="#">NIKE</a>                                   
                                  </li> 
                                  <li><a href="#">PUMA</a>                                   
                                  </li>  
                                  <li><a href="#">其他</a>                                   
                                  </li>                                 
                                </ul>
                            </li>                    
                            <li><a href="#">居家用品</a>
                                <ul>
                                  <li><a href="#">廚房系列</a>                              
                                  </li>         
                                  <li><a href="#">寢室系列</a>                                   
                                  </li> 
                                  <li><a href="#">其他</a>                                   
                                  </li>                               
                                </ul>
                            </li>
                            <li><a href="#">媽咪寶貝</a>
                                 <ul>
                                  <li><a href="#">服飾</a>                              
                                  </li>         
                                  <li><a href="#">食品</a>                                   
                                  </li> 
                                  <li><a href="#">教具玩具</a>                                   
                                  </li>                               
                                </ul>
                            </li> 
                            <li><a href="#">文具雜貨</a>
                                 <ul>
                                  <li><a href="#">Disney迪士尼系列</a>                              
                                  </li>         
                                  <li><a href="#">sanrio三麗鷗系列</a>                                   
                                  </li>                            
                                </ul>
                            </li>                      
                        </ul>
                    </li>

                <li><a href="#">依國家瀏覽</a>
                    <ul>
                        <li><a href="#">美洲</a>
                            <ul>
                                <li><a href="#">美國</a>
                                </li>
                                <li><a href="#">加拿大</a>
                                </li>                              
                            </ul>
                        </li>
                       
                        <li><a href="#">歐洲</a>
                              <ul>
                                <li><a href="#">英國</a>
                                </li>
                                <li><a href="#">法國</a>
                                </li>
                                <li><a href="#">德國</a>
                                </li>
                                 <li><a href="#">西班牙</a>
                                </li>
                                 <li><a href="#">義大利</a>
                                </li>
                             </ul>
                        </li>
                         <li><a href="#">亞洲</a>
                              <ul>
                                <li><a href="#">日本</a>
                                </li>
                                <li><a href="#">韓國</a>
                                </li>
                                <li><a href="#">香港</a>
                                </li>
                                <li><a href="#">泰國</a>
                                </li>
                                <li><a href="#">新加坡</a>
                                </li>
                            </ul>
                        </li>
                      
                    </ul>
                </li>

                <li><a href="#">依特色瀏覽</a>
                    <ul>
                        <li><a href="#">編輯精選</a>
                        </li>
                        <li><a href="#">熱門瀏覽</a>
                        </li>
                        <li><a href="#">最新上架</a>
                        </li>
                        <li><a href="#">最後倒數</a>                          
                        </li>                    
                    </ul>
                </li>
               
            </ul>
        </li>
        
        <li><a href="#" >找賣家<span class="glyphicon glyphicon-menu-down"></span></a>
            <ul>
                <li><a href="#">美洲</a>
                    <ul>
                        <li><a href="#">美國</a>
                        </li>
                        <li><a href="#">加拿大</a>
                        </li>
                    </ul>
                </li>
                <li><a href="#">歐洲</a>
                    <ul>
                        <li><a href="#">英國</a>
                        </li>
                        <li><a href="#">法國</a>
                        </li>
                        <li><a href="#">德國</a>
                        </li>
                         <li><a href="#">西班牙</a>
                        </li>
                         <li><a href="#">義大利</a>
                        </li>
                    </ul>
                </li>
              
                <li><a href="#">亞洲</a>
                    <ul>
                        <li><a href="#">日本</a>
                        </li>
                        <li><a href="#">韓國</a>
                        </li>
                        <li><a href="#">香港</a>
                        </li>
                        <li><a href="#">泰國</a>
                        </li>
                        <li><a href="#">新加坡</a>
                        </li>
                    </ul>
                </li>
                
                <li><a href="#">新進賣家</a>
                </li>
            </ul>
        </li>
        <li><a href="#"  >許願池</a>
        </li>
        <li><a href="#" >最新代購消息</a>
        </li>
    
    </ul>


     <form class="navbar-form navbar-left">
      <div class="input-group" style="width:180px;margin-left:30px;margin-right:30px">
        <input type="text" class="form-control" placeholder="您想代購什麼？"/>
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit" >
            <i class="glyphicon glyphicon-search" ></i>
          </button>
        </div>
      </div>
    </form>
   
     <button  class="btn btn-danger navbar-btn" 
         style="font-family:微軟正黑體;background-color:rgb(185,127,109);border:rgb(185,127,109);margin-right:10px" >註冊</button>
    <button  class="btn btn-danger navbar-btn" 
         style="font-family:微軟正黑體;background-color:rgb(185,127,109);border:rgb(185,127,109)" >登入</button>

              </div><!--col-sm-12--> 
            </div><!--row--> 
          </div><!--container--> 
      </div><!--container-fluid-->
</nav>


<!--只留下本週頭條及新手上路-->
<div class="container-fluid" style="margin-top:60px; background-color:rgb(41,64,87);height:75px;margin-bottom:20px;">
    <div class="container">
       <div class="row">
           <div class="col-sm-12">
               <h3 style="color:white;margin-top:26px;float:left;font-family:微軟正黑體;margin-right:25px">本週頭條&nbsp&nbsp</h3> 
                <div style="margin-top:20px">
                  <h3 style="float:left;margin-top:6px;margin-right:10px;"><span class="glyphicon glyphicon-star-empty icon-success"></span></h3>             
                  <a href="" class="ThisWeek">巴黎世家搶手帆布包</a>
                  <h3 style="float:left;margin-top:6px;margin-right:10px;"><span class="glyphicon glyphicon-star-empty icon-success"></span></h3>             
                  <a href="" class="ThisWeek">FURLA緊急折扣全面7折</a>
                  <h3 style="float:left;margin-top:6px;margin-right:10px;"><span class="glyphicon glyphicon-star-empty icon-success"></span></h3>                
                  <a href="" class="ThisWeek">Rebecca Minkoff季末出清</a>
                  <h3 style="float:left;margin-top:6px;margin-right:10px;"><span class="glyphicon glyphicon-star-empty icon-success"></span></h3>             
                  <a href="" class="ThisWeek">NIKE ROSHE TWO特價</a> 				            		                                           
               </div> 
  
             <button  class="btn btn-danger navbar-btn" style="font-family:微軟正黑體;
                background-color:#EE3B3B;border:#EE3B3B;color:white;margin-left:70px;" >新手上路</button>
       </div>
    </div><!--row結束-->
</div><!--container結束-->  
</div><!--container-fluid結束-->
<!--只留下本週頭條及新手上路-->

<!--搜尋結果 只顯示兩層-->
<div class="container">
    <div class="row">
        <div class="col-sm-12">

          <div class="tab">
              <button class="tablinks"  >依類別瀏覽</button>
              <button class="tablinks" >依國家瀏覽</button>
              <button class="tablinks active" >依特色瀏覽</button>
         </div>

          <div class="tabcontent">
              <ul class="showItemClass">
                <li><a href="#">編輯精選</a>                              
                </li> 
                <li><a href="#" class="active">熱門瀏覽</a>                              
                </li>         
                <li><a href="#">最新上架</a>                                   
                </li> 
                <li><a href="#">最後倒數</a>                                   
                </li>                                                      
            </ul>
          </div>

      </div><!--12-->
    </div><!--row結束-->
</div><!--container結束-->




<!--廣告開始-->
<div class="container">
  <div class="row">
     <div class="col-sm-3"><div style="background-color:#CDC0B0;height:350px;">廣告</div></div>
    <div class="col-sm-3"><div style="background-color:#CDC0B0;height:350px;">廣告</div></div>
     <div class="col-sm-3"><div style="background-color:#CDC0B0;height:350px;">廣告</div></div>
     <div class="col-sm-3"><div style="background-color:#CDC0B0;height:350px;">廣告</div></div>
 </div>
<br />

   <div class="row">
     <div class="col-sm-3"><div style="background-color:#CDC0B0;height:350px;">廣告</div></div>
    <div class="col-sm-3"><div style="background-color:#CDC0B0;height:350px;">廣告</div></div>
     <div class="col-sm-3"><div style="background-color:#CDC0B0;height:350px;">廣告</div></div>
     <div class="col-sm-3"><div style="background-color:#CDC0B0;height:350px;">廣告</div></div>
 </div>
<br />

 <div class="row">
     <div class="col-sm-3"><div style="background-color:#CDC0B0;height:350px;">廣告</div></div>
    <div class="col-sm-3"><div style="background-color:#CDC0B0;height:350px;">廣告</div></div>
     <div class="col-sm-3"><div style="background-color:#CDC0B0;height:350px;">廣告</div></div>
     <div class="col-sm-3"><div style="background-color:#CDC0B0;height:350px;">廣告</div></div>
 </div>
<br />

   <div class="row">
     <div class="col-sm-3"><div style="background-color:#CDC0B0;height:350px;">廣告</div></div>
    <div class="col-sm-3"><div style="background-color:#CDC0B0;height:350px;">廣告</div></div>
     <div class="col-sm-3"><div style="background-color:#CDC0B0;height:350px;">廣告</div></div>
     <div class="col-sm-3"><div style="background-color:#CDC0B0;height:350px;">廣告</div></div>
 </div>
<br />

</div>

<!--分頁搜尋-->
<div class="center">
  <div class="pagination">
    <a href="#">&laquo;</a>
    <a href="#"  class="active">1</a>
    <a href="#">2</a>
    <a href="#">3</a>
    <a href="#">4</a>
    <a href="#">5</a>
    <a href="#">&raquo;</a>
  </div>
</div>



<!----------footer開始-------------->
<footer>
 <div class="container-fluid" style="background-color:rgb(185,152,103);height:160px;padding-left:30px;padding-top:30px" >
 
    	<div class="row">
        	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"><!--複製go1buy1-->
            	<ul class="footer_menu">
                	<li><a href="">新手上路</a></li>
                	<li><a href="">常見問題</a></li>  
                	<li><a class="">客服中心</a></li>                          
                </ul>
            </div>
        	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
            	<ul class="footer_menu">
                	<li><a href="">許願池</a></li>
                	<li><a href="">最新代購消息</a></li>
                	<li><a href="">代購賣家進駐申請</a></li>					            		                            
                </ul>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
            	<ul class="footer_menu">
            		<li><a href="">FB粉絲團</a></li>
                    <li><a href="">聯絡ALLBUYBACK</a></li>
                    <li><a href="">服務條款與隱私權政策</a></li>
                 </ul>
            </div>                    
        </div>
    </div>
</footer>


	<h1>我要挑戰今日任務</h1>

	<div id="dialog" title="<時尚金頭腦>" style="padding-top:5px;">
	
	   <div id="view0" style="display:block">
	      <div class="welcome"> <h2>歡迎來到「時尚金頭腦」!</h2>               
		          <h2>遊戲規則如下:<br>依序回答五個問題，<br>每題作答時間15秒， <br>答對三題可獲得紅利3點，<br>答對四題可獲得紅利5點，<br>答對五題可獲得紅利10點!<br>
		          還等什麼？快去挑戰!
		          </h2>	  </div>
	   </div>


		<div id="view1" style="display:none"> 
		    <div class="countDown"><div id="timeSpan1" >10</div></div>
			<div class="question" id="question1"></div>
			<div class="opt1" id="A1"></div>
			<div class="opt2" id="B1"></div>
			<div class="opt3" id="C1"></div>
			<div class="opt4" id="D1"></div>
			<div class="ans" id="ans1"></div>
 		</div> 
 		
 		<div id="view2" style="display:none"> 
 		    <div class="countDown">	<span id="timeSpan2" >10</span></div>
		 	<div class="question" id="question2"></div>
		    <div class="opt1" id="A2"></div>
			<div class="opt2" id="B2"></div>
			<div class="opt3" id="C2"></div>
			<div class="opt4" id="D2"></div>
			<div class="ans" id="ans2"></div>
 		</div> 
		
		<div id="view3" style="display:none"> 
		    <div class="countDown">	<span id="timeSpan3" >10</span></div>
			<div class="question" id="question3"></div>
			<div class="opt1" id="A3"></div>
			<div class="opt2" id="B3"></div>
			<div class="opt3" id="C3"></div>
			<div class="opt4" id="D3"></div>
			<div class="ans" id="ans3"></div>
 		</div> 
 		
 		<div id="view4" style="display:none"> 
 		    <div class="countDown">	<span id="timeSpan4" >10</span></div>
			<div class="question" id="question4"></div>
			<div class="opt1" id="A4"></div>
			<div class="opt2" id="B4"></div>
			<div class="opt3" id="C4"></div>
			<div class="opt4" id="D4"></div>
			<div class="ans" id="ans4" ></div>
 		</div> 
 		
 		<div id="view5" style="display:none"> 
 		    <div class="countDown"><span id="timeSpan5" >10</span></div>
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
					'GO':function(){

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
			            	$(".ui-dialog-buttonpane button:contains('GO')").attr("disabled", true);
			            	k=0;
			            }
					},		    		     
			        
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


</body>
</html>