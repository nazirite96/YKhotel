<%@page import="review.reviewDTO"%>
<%@page import="tour.tourDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="tdao" class="tour.tourDAO" scope="session"></jsp:useBean>
<jsp:useBean id="rdao" class="review.reviewDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi/css/ykLayout.css">
</head>
<style>
body {
	width: 100%;
	text-align: center;
	background-color: white;
}

.tour2 { /*클릭한메뉴 색바꾸기*/
	color: #bd5734;
	font-weight: bold;
}

.tour2:link {
	color: #bd5734;
}

.tour2:visited {
	color: #bd5734;
}

/* 내용 */
.contents {
	margin: 0px auto;
	padding-top: 5px;
	margin-bottom: 20px;
	width: 100%;
	min-width: 500px;
	text-align: center;
}

.ac {
	margin-top: 100px;
	width: 100%;
}
/* 왼쪽으로 */
.up {
	
}

.lgo {
	position: fixed;
	top: 50%;
	left: 2%;
}

.lgo a {
	position: absolute;
	top: 50%;
	width: auto;
     padding: 10px 33px 10px 24px;
	color: rgb(235, 235, 235);
	margin-top: -22px;
	font-weight: bold;
	font-size: 80px;
}

.rgo {
	position: fixed;
	top: 50%;
	left: 93%;
}

.rgo a {
	position: absolute;
	top: 50%;
	width: auto;
	padding: 10px 27px 10px 27px;
	color: rgb(235, 235, 235);
	margin-top: -22px;
	font-weight: bold;
	font-size: 80px;
}

.rgo:hover, .lgo:hover {
	background-color: rgba(0, 0, 0, 0.8);
}
/* 이미지 영역*/
.mi {
	width: 100%;
	background-color: white;
}

/* 이미지*/
.mi a img {
	height: 80%;
	width: 70%;
}
/* 가운데 내용*/
.cntContents {
	margin: 0px auto;
	width: 80%;
	margin-bottom: 20px;
}

/* 타이틀 영역*/
.cntTit {
	background-color: white;
	width: 100%;
	margin-top: 50px;
	font-size: 30px;
	color: #454140;
}

.cntTit h2 {
	margin-bottom: 30px;
}

.cntTit hr {
	border-top: 4px solid #5F9EA0;
	width: 10%;
}


.middle {
 
	clear: both;
	margin-top: 3%;
}

.cntntList {
	margin: 0px auto;
	text-align:center;
	padding: 0px;
	font-size: 14pt;
	width:600px;
   
}
.cntntList td{
height:50px;
}
.cntntList a {
	text-decoration: none;
}

.alone {
	width: 500px;
	text-align: center;
}

.review {
	width: 400px;
	text-align: left;
}

.star {
	width: 100px;
	text-align: left;
}

.detail { /**ddddddddddddddddddddddddddddddddddddddddd*/
	width: 100%;
	margin: 0px auto;
	text-align: center;
}

.tit {
	text-align:left;
	padding-left: 5px;
	min-width: 80px;
	height: 40px;
	font-size:17px;
}

.slideImgLink {
	clear: both;
	padding-top: 25px;
	margin-top: 5%;
	margin-bottom: 5%;
}

.imglink {
	text-align: center;
	margin: 0px auto;
	padding: 5px 5px 2px 5px;
}

.imglink img {
	height: 120px;
	width: 220px;
}

.tourfirstimg { /*메뉴하단이미지*/
	width: 100%;
	margin-bottom: 30px;
}

.tourtitle {
	text-align: left;
	color: white;
	font-size: 70px;
	font-style: italic;
	position: absolute;
	bottom: 110px;
	left: 50px;
}

.detailTable {
width:70%;
margin: 0px auto;
padding-left:10px;
padding-right:10px;
   border-top:1px solid lightgray;
}
.detailTable td{
text-align:left;
height:40px;
font-size: 16px;
}
.d {
	font-size: 10px;
}

/*메인이미지*/
.fixedImg {
	position: fixed;
	width: 100%;
	z-index: -1;
}

.fixedImg_wrap {
	text-align: center;
	width: 100%;
	height: 330px;
	background-color: rgba(57, 85, 30, 0.55);
	position: relative;
	z-index: 1;
}

.fixedImg_wrap img {
	width: 60px;
	position: relative;
	top: 70px;
}

.fixedImg_wrap div {
	margin: 0 auto;
	color: white;
	position: relative;
}

.play {
	font-family: Lucida Bright;
	font-size: 35px;
	width: 250px;
	top: 100px;
}

.playtext {
	font-family: Modern;
	font-size: 14px;
	width: 150px;
	top: 120px;
}

.introimg_art img {
	width: 100%;
	height: 450px;
}

section {
	background-color: white;
}

.backin {
	width: 100%;
	background-color: white;
}

#frame {
	width: 220px;
	height: 120px;
	background: #ffffff;
	box-shadow: 0 1px 10px rgba(0, 0, 0, 0.5);
	position: relative;
	left: 10px;
	text-align: center;
	z-index: 0;
	transform: scale(1);
	transition: all 0.3s ease-in-out; /* 부드러운 모션을 위해 추가*/
}

.darkness {
	position: absolute;
	top: 0;
	left: 0;
	width: 220px;
	height: 120px;
	background: white;
	text-align: center;
	opacity: 0;
	transition: all .6s linear;
}

.btn-plus {
	position: absolute;
	width:150px;
	top: 30%;
	left: 15%;
	text-align: center;
	opacity: 0;
	transform: scale(2);
	transition: all .3s linear;
}

/* 추가된 부분 */
.btn-plus span {
	font-size: 20px;
	color: #ffffff;
	user-select: none;
	font-weight: bold;
}

/* 추가된 부분 */
.imga:hover .darkness {
	opacity: 0.4;
	text-align: center;
}

/* 추가된 부분 */
.imga:hover .btn-plus {
	opacity: 1;
	text-align: center;
	transform: scale(1);
}

.reviewtagname {
width:300px;
font-size: 35px;
margin:0 auto;
	
}
.reviewtagname hr{
border-top:4px solid #5F9EA0;
width:150px;
}
#frame:hover {
	transform: scale(1.2);
	z-index: 4;
}

.imgtd img {
	width: 220px;
	height: 120px;
	overflow: hidden
}

/*좌우버튼*/
/* Next & previous buttons */
.prev, .next {

  transition: 0.6s ease;
 border-radius:5%;
 
}



/* 호버하면 백그라운드가 까맣게 변하게*/
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.6);
}


.seeallReview_a{
border:1px solid gray;
padding:15px;
transition:all 0.5s ease;
}
.seeallReview_a:hover{
color:white;
background-color: #5F9EA0;
border:0;
}
</style>
<body>
	<%@include file="/ykheader.jsp"%>
	<br>
	<br>
	<br>
	<!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->



	<section>
		<article class="introimg_art">
			<div class="fixedImg">
				<img src="../img/top.jpg">
			</div>
		</article>
	</section>
	<div class="fixedImg_wrap">
		<img src="../img/5b.png">
		<div class="play">Tour Guide</div>
		<div class="playtext">재밌게 즐기세요!</div>
	</div>
	<div class="backin">
		<br>
	</div>
	<div style="background-color: white;">
		<br>
	</div>


	<section class="contents" style="background-color: white;">
		<%
			//관광지 최대값/최소값을 불러오기
		int max = tdao.maxTourRef();
		int min = tdao.minTourRef();
		String tour_s = request.getParameter("tour");
		if (tour_s == null || tour_s.equals("")) {
			tour_s = "1";
		} //불러온 값으로 최초위치/최후위치 일 경우 좌우 화살표 좌표를 처리해줌
		int tour = Integer.parseInt(tour_s);
		if (tour > max) {
			tour = min;
		} else if (tour < min) {
			tour = max;
		}
		%>

		<article class="cntContents" style="background-color: white;">
			<div class="cntTit" style="background-color: white;">
				<%
					String here = tdao.tourname(tour);
				%>
				<h2><%=here%></h2>
				<hr>
			</div>
		</article>
		<br>
		<br>
		<br>
		<br>
		<article class="up">
			<div class="up" style="background-color: white;">
				<div class="lgo" style="background-color: white;">
					<h2>
						<a  class="prev"  href="tourMain.jsp?tour=<%=tour - 1%>">&#10094;</a>
					</h2>
				</div>
				<div class="mi" style="background-color: white;">
					<a href="tourReview.jsp?tour_ref=<%=tour%>"><img
						src="/semi/img/travel<%=tour%>.jpg"></a>
				</div>
				<div class="rgo" style="background-color: white;">
					<h2>
						<a  class="next" href="tourMain.jsp?tour=<%=tour + 1%>">&#10095;</a>
					</h2>
				</div>
			</div>
		</article>

		<article>
			<div class="middle" style="background-color: white;">
				<div class="detail">
					<table class="detailTable"    >
						<%
							ArrayList<tourDTO> arr = tdao.getTourList(tour);
						if (arr == null || arr.size() == 0) {
						%>
						<tr>
							<td>등록된 내용이 없습니다.</td>
						</tr>
						<%
							} else {
								for (int i = 0; i < arr.size(); i++) {
						%>
						
						<tr>
							<%
								int total = rdao.totalcount(tour);
							%>
							<th class="tit"  style="width:150px;">관광지 주소</th><td style="width:520px;"><%=arr.get(i).getTour_add()%></td>
							<th class="tit">평균별점</th>			
							<td><a href="tourReview.jsp?tour_ref=<%=tour%>">
								<%
									//for (int z = 0; z < arr.get(i).getTour_staravg(); z++) {
								//out.print("★");
								//	}
								%> <%
 	switch (arr.get(i).getTour_staravg()) {
 case 5:
 	out.print("<img src='../star/star5.jpg' width='100px'>");
 	break;
 case 4:
 	out.print("<img src='../star/star4.jpg' width='100px'>");
 	break;
 case 3:
 	out.print("<img src='../star/star3.jpg' width='100px'>");
 	break;
 case 2:
 	out.print("<img src='../star/star2.jpg' width='100px'>");
 	break;
 case 1:
 	out.print("<img src='../star/star1.jpg' width='100px'>");
 	break;
 }
 %> (<%=total%>명 참여)
							</a> </td>
						</tr>

						<tr >
							<th class="tit">이동 시간</th>		<td><%=arr.get(i).getTour_movetime()%></td>
							<th class="tit">관광 시간</th>		<td><%=arr.get(i).getTour_runtime()%></td>
						</tr>
	
						<tr >

							<td colspan="4" style="height:180px; text-align:center; font-size:18px; padding:30px;"><%=arr.get(i).getTour_info()%><br></td>

						</tr>
					 <%
 	                             }

							}
						%>
					</table>
				</div>
			</div>
		</article>
		<br>
		<br>	<br>
		<div class="rl">
			<div class="reviewtagname">
			별점리뷰 보기
			<hr>
			<br>
			</div>
			<table class="cntntList" >
				<%
					ArrayList<reviewDTO> arr2 = rdao.getreview("review_idx", tour, 1, 5);
				if (arr2 == null || arr2.size() == 0) {
				%>
				<tr>
					<th class="alone">작성된 리뷰가 없습니다.</th>
				</tr>
				<%
					} else {
				for (int g = 0; g < arr2.size(); g++) {
				%>
				<tr>
					<td style="width:20%;"><%=arr2.get(g).getReview_id() %></td>
					<td class="star"  style="width:20%; text-align: center;" >
						<%
							switch (arr2.get(g).getReview_star()) {
						case 5:
							out.print("<img src='../star/star5.jpg' width='100px'>");
							break;
						case 4:
							out.print("<img src='../star/star4.jpg' width='100px'>");
							break;
						case 3:
							out.print("<img src='../star/star3.jpg' width='100px'>");
							break;
						case 2:
							out.print("<img src='../star/star2.jpg' width='100px'>");
							break;
						case 1:
							out.print("<img src='../star/star1.jpg' width='100px'>");
							break;
						}
						%>
					</td>
						<td class="review"   style="width:60%; text-align:center;"><a
						href="reviewContent.jsp?review_idx=<%=arr2.get(g).getReview_idx()%>">
							<%=arr2.get(g).getReview_subject()%></a></td>
				</tr>
				<%
					if (g == 5) {
					break;
				}
				}
				}
				%>
			
			</table>
			<br>
			<br>
			<br>
		<a   class="seeallReview_a" href="tourReview.jsp?tour_ref=<%=tour%>"><%=here%> 리뷰 쓰러가기</a>
		</div>
		<div class="slideImgLink">

			<table class="imglink">
				<tr>
					<%
						ArrayList<tourDTO> tourlist = tdao.tourbox();
					if (tourlist == null || tourlist.size() == 0) {

					} else {
						for (int q = 0; q < tourlist.size(); q++) {
					%>
					<td class="imgtd">
						<div id="frame">
							<a href="tourMain.jsp?tour=<%=tourlist.get(q).getTour_ref()%>"
								class="imga">
								<div class="darkness"></div>
								<div class="btn-plus">
									<span draggable="false"><%=tourlist.get(q).getTour_name()%><br>바로가기</span>
								</div> <img
								src="/semi/img/travel<%=tourlist.get(q).getTour_ref()%>.jpg">
							</a>

						</div>
					</td>
					<%
							}
						}
						%>
				</tr>
			</table>
		</div>
	</section>
	<%@include file="/ykfooter.jsp"%>
</body>
</html>