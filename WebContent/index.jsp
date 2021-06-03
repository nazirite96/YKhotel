<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  type="text/css"  href="/semi/css/ykLayout.css">
<style>
body{

text-align:center;
}
.mainimg{
width:100%;
}
/*슬라이드*/
* {
box-sizing: border-box;
}
.mySlides {
display: none;
}
img {
vertical-align: middle;
}
/* Slideshow container */
.slideshow-container {
  max-width: 100%;
  position: relative;
  margin: auto;
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
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;

}

.active {   /*js로 이 클래스가 dot에 생길예정*/
  background-color: #717171;
}

/* Fading animation */
.fade {                                                              /*@keyframes 를 사용하기 위해선 세 가지가 필요*/
  -webkit-animation-name: fade;              /*animation-name : 사용자가 직접 지정한 이름,@keyframes 가 적용될 애니메이션의 이름
                                                                      스테이지 : from - to 로 0~100% 의 구간
                                                                           CSS 스타일*/
  -webkit-animation-duration: 1.5s;        /*-webkit-은 벤더프리픽스로 어떤 버전의크롬을 사용해도 적용되도록 쓴거라 없어도 됨*/ 
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {    /* CSS 애니메이션에서 구간을 정하고 각 구간별로 어떤 스타일을 적용시킬지 정하는 문법*/
  from {opacity: .4} 
  to {opacity: 1}
}


/*애니메이션 명이 fade 인 애니메이션에 0% 일 때 스타일을 opacity 를 4로 지정하고, 100% 일 때는 1 으로 지정하는 키프레임*/
@keyframes fade {  
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}

#vid{
width:100%;
 height:auto;
}
</style>

<script>

var slideIndex = 0;


function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    
    slideIndex++;
    
    if (slideIndex > slides.length) {slideIndex = 1}    
    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 3000); // Change image every 2 seconds
}

</script>
</head>
<body onload="showSlides();">
<%@include file="ykheader.jsp" %>
<br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->


<video id="vid"  autoplay="autoplay" loop="loop" muted="muted" >
 <source src="/semi/room/roomimg/vid.mp4" type="video/mp4"> 
</video>

<br><br><br>

<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="/semi/img/sss.jpg" style="width:100%">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="/semi/img/g1.jpg" style="width:100%">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="/semi/img/dds.jpg" style="width:100%">
  <div class="text"></div>
</div>

</div>

<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>



<br><br><br><br>

<%@include file="ykfooter.jsp" %>
</body>
</html>