<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <jsp:useBean id="rdto" class = "room.RoomDTO"></jsp:useBean>
   <jsp:useBean id="rdao" class = "room.RoomDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi/css/ykLayout.css">

<style type="text/css">
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0 ; }
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width:100%;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 40px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}


h1{
text-align:center;
font-family:Lucida Bright ;
margin-top:50px;
}

.reserDiv{
text-align:center;
margin:auto;
padding:10px;
width:140px;
height:40px;
font-family: Modem;
font-size: 14px;
border:1px solid gray;
margin-top:40px;
transition:all 0.5s ease;
}

.reserDiv:hover{
color:white;
background-color: #7a3b2e;
}
.reserDiv a:hover{
color:white;
}
.info_table{
margin:auto;
width:60%;
border:1px solid lightgray;
border-spacing: 0px;
border-collapse: collapse;
margin-top:40px;
margin-bottom:200px;
}
.info_table .nametd{height: 30px; background-color: #E8E8E8; }
.info_table .contd{height: 70px; font-family: Fixedsys;   }


</style>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}

</script>
</head>
<%
String roomidx_s=request.getParameter("room_idx");
if( roomidx_s==null){
	roomidx_s="22";
}
Integer  room_idx=Integer.parseInt(roomidx_s);

rdto=rdao.getSelectRoom(room_idx);

%>
<body onload="currentSlide(1)">
<%@include file="../ykheader.jsp" %>
<br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->


<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 5</div>
  <img src="./roomimg/01_04.jpg" style="width:100%">
  <div class="text"><%=rdto.getRoom_name() %></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 5</div>
  <img src="./roomimg/01_05.jpg" style="width:100%">
  <div class="text"><%=rdto.getRoom_name() %></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 5</div>
  <img src="./roomimg/02_03.jpg" style="width:100%">
  <div class="text"><%=rdto.getRoom_name() %></div>
</div>
<div class="mySlides fade">
  <div class="numbertext">4 / 5</div>
  <img src="./roomimg/02_04.jpg" style="width:100%">
  <div class="text"><%=rdto.getRoom_name() %></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">5 / 5</div>
  <img src="./roomimg/02_05.jpg" style="width:100%">
  <div class="text"><%=rdto.getRoom_name() %></div>
</div>


<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
   <span class="dot" onclick="currentSlide(4)"></span> 
  <span class="dot" onclick="currentSlide(5)"></span> 
</div>

<h1><%=rdto.getRoom_name() %></h1>
<div class="reserDiv" id="reserDiv_id"><a href="/semi/reser/reserStatus.jsp">RESERVATION</a></div>
<br>
<table border="1" class="info_table">
<tr>
<td class="nametd">객실명</td>
<td class="nametd">형태</td>
<td class="nametd">평수</td>
<td class="nametd">기준/최대</td>
</tr>
<tr>
<td class="contd"><%=rdto.getRoom_name() %></td>
<td class="contd"> (침대룸2+온돌룸1+화장실3), 독채형, 복층형</td>
<td class="contd"><%=rdto.getRoom_size() %></td>
<td class="contd"><%=rdto.getRoom_minperson() %>/<%=rdto.getRoom_maxperson() %></td>
</tr>


</table>


<%@include file="../ykfooter.jsp" %>
</body>
</html>