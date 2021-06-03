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

/* 호버하면 백그라운드가 까맣게 변하게*/
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
.reser_atagDiv{
margin:0 auto;
text-align: center;
margin-top:60px;
}

.reser_a{
width:140px;
height:40px;
padding:10px 17px 10px 17px;
font-family: Modem;
font-size: 14px;
border:1px solid gray;
transition:all 0.5s ease;
}

.reser_a:hover{
color:white;
background-color: #7a3b2e;

}
.info_table{
margin:auto;
width:60%;
border:1px solid lightgray;
border-spacing: 0px;
border-collapse: collapse;
margin-top:40px;
margin-bottom:100px;
text-align: center;
}
.info_table .nametd{height: 30px; background-color: #E8E8E8; }
.info_table .contd{height: 70px; font-family: Fixedsys;   }

.a_button{
margin:0 auto;
width:500px;
text-align: center;
margin-bottom:60px;
}
.a_button a{
font-family: Modem;
font-size: 14px;
padding:10px 17px 10px 17px;
border:1px solid gray;
width:140px;
height: 40px;
text-align:center;
transition:all 0.5s ease;
}
.a_button a:hover{
color:white;
background-color: #7a3b2e;
}

.a_room{
position:relative;
right:5%;
}
.a_other{
position:relative;
left:5%;
}


/*예약안내관련*/
.reser_noticeDiv {
	width: 800px;
	margin: 0px auto;
	border: 1px solid lightgray;
	padding:20px;
	margin-bottom: 50px ;
}

.reser_noticeDiv h4 {
  text-align:center;
	font-size: 17px;

}

.reser_noticeDiv hr {
	width: 70px;
	border: 0px;
	border-top: 3px solid gray;
	margin-bottom:50px;
}

.reser_noticeDiv li{
margin-bottom:20px;
font-size:15px;
}
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
<div   class="reser_atagDiv">
<a href="/semi/reser/reserStatus.jsp"   class="reser_a">RESERVATION</a>
</div>
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

	
			<div class="reser_noticeDiv">
				<h4>예약관련 공지사항</h4>
				<hr>
				<ul>
					<li>해당 펜션은 미성년자의 경우 입실 불가하며 위반 시 환불이 불가하며 퇴실조치 됩니다.</li>
					<li>예약 인원에서 인원이 추가되는 경우 펜션에 미리 연락을 주시기 바랍니다.</li>
					<li>기준인원 초과 시 추가 인원에 대한 비용이 별도로 발생할 수 있습니다.</li>
					<li>최대 인원 초과 시 입실이 불가능할 수 있으며, 해당 사유로 환불 받을 수 없습니다.</li>
					<li>반려동물 입실 가능 펜션 외에 반려동물 동반 시 입실이 거부될 수 있으며, 해당 사유로 환불 받을 수
						없습니다.</li>
					<li>다음 이용 고객을 위해 입실, 퇴실 시간을 준수해 주시기 바랍니다.</li>
					<li>객실 및 주변시설 이용 시 시설물의 훼손, 분실에 대한 책임은 투숙객에게 있으며, 손해배상의 책임을 질
						수 있습니다.</li>
					<li>객실의 안전과 화재예방을 위해 객실 내에서 생선이나 고기 등을 굽는 직화 방식은 허용되지 않으며, <br>개인적으로
						준비해 오는 취사도구(그릴, 숯, 전기/전열기구 등)은 반입이 금지되어 있습니다.
					</li>
					<li>객실 내에서의 흡연은 금지되어 있으며, 지정된 장소를 이용해 주시기 바랍니다.</li>
					<li>다른 이용객에게 피해를 줄 수 있는 무분별한 오락, 음주, 고성방가는 삼가주시기 바랍니다.</li>
					<li>실시간예약 시 중복예약이 발생할 수 있으며, 해당 사유의 경우 고객센터를 통해 전액 환불받을 수
						있습니다. (ezen 404호 ykprince 측에서 확인 즉시 안내드립니다.)</li>
					<li>펜션별 기간 미확정으로 인해 요금 및 요금표가 잘못 반영된 경우, 자동 예약 취소 처리되며 정상 금액으로
						재예약할 수 있습니다.</li>
				</ul>
			</div>





<div class="a_button">
<a href="/semi/reser/room_review.jsp?room_idx=<%=room_idx%>"   class="a_room">ROOM REVIEW</a>
<a href="roommain.jsp" class="a_other">다른 방 보기</a>
</div>
<%@include file="../ykfooter.jsp" %>
</body>
</html>