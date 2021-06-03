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



body{
text-align:center;
}
.tour2{   /*클릭한메뉴 색바꾸기*/
color:#bd5734;
font-weight: bold;
}
.tour2:link{  color:#bd5734; }
.tour2:visited{  color:#bd5734; }


/* 내용 */
.contents {
   margin: 0px auto;
   padding-top: 5px;
   margin-bottom: 20px;
   width: 90%;
   min-width: 500px;
   text-align: center;
}
.ac{
	margin-top: 100px;
	width: 100%;
}
/* 왼쪽으로 */
.lgo {
   float: left;
   position: relative;
   top: 300px;
   width: 10%;
   text-align: center;
}
.lgo a {
   text-decoration: none;
   color: black;
}

.rgo {
   
   position: absolute;
left:84%;
   bottom:-76%;   width: 10%;
   text-align: center;
   
   clear: both;
}

.rgo a {
   text-decoration: none;
   color: black;
}

/* 가운데 내용*/
.cntContents {
   margin: 0px auto;
   width : 80%;
   margin-bottom: 20px;
}

/* 타이틀 영역*/
.cntTit {
   width: 100%;

   text-align: center;
}
/* 이미지 영역*/
.mi {
   float: left;
   width: 80%;
}

/* 이미지*/
.mi a img {
 margin-left:10%;
   height: 100%;
   width: 100%;
}
/*사진정보 텍스트*/
.rl {
   clear:both;
   width: 47%;
   padding-left: 10px;
   padding-top: 30px;
   margin-left:20%;
}
.middle {
	clear: both;
	
}
.cntntList {
   margin: 0px;
   padding: 0px;
   border-top: 5px solid gray;
   border-bottom: 5px solid gray;
   font-size: 11pt;
   width:700px;
   margin-left:-6%; 
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

.detail {/**ddddddddddddddddddddddddddddddddddddddddd*/
   clear: both;
   width: 800px;
   margin-top: 0px;
   margin-left:13%;
   text-align: center;
}

.tit {
   width: 110px;
   padding-left: 5px;
   min-width: 80px;
   background-color: rgb(245,245,245);
}

.slideImgLink {
   clear: both;
   padding-top: 25px;
}
.imglink {
   text-align: center;
   margin: 0px auto;
   padding: 5px 5px 2px 5px;
   background-color: rgb(215,215,215);
}
.imglink img{
	height: 70px;
	width:100px;
}


.tourfirstimg{  /*메뉴하단이미지*/
width:100%;
margin-bottom:30px;
}

.tourtitle{

text-align: left;
color:white;
font-size:80px;
font-style:italic;
position:absolute;
bottom:110px;
left:50px;
}


/*****************************************************************************************/
.imgtd img{
width:150px;
height: 100px;
}

#frame{
  width:150px;
  height: 100px;
  background:#ffffff;
  box-shadow: 0 1px 10px rgba(0,0,0,0.5);
  position:relative;
  left:10px;
}

/*마우스오버하면 + 뜨기*/


/* 추가된 부분 */
.btn-plus {
  position:absolute;
  top:35px;
  left:48px;
  background:#e0876a;
  width:55px;
  height:55px;
  border-radius:50%;
  text-align:center;
  opacity:0;
  transform:scale(2);
  transition:all .3s linear;
}

/* 추가된 부분 */
.btn-plus span {
  font-size:15px;
  color:#ffffff;
  user-select:none;
}

/* 추가된 부분 */
.imga:hover .darkness{
  opacity:0.4;
}

/* 추가된 부분 */
.imga:hover .btn-plus {
  opacity:1;
  transform:scale(1);
}
.d{
	font-size: 10px;
}
</style>
<body>
	<%@include file="/ykheader.jsp"%>	
	<br><br><br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->
	
	<section>
	<article>
	<img src="../img/top.jpg"   class="tourfirstimg">
	</article>
	</section>
	
	
	<div class="tourtitle">Tour Guide</div>
	
	<section class="contents">
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
		<article>
			<div class="lgo">
				<h2>
					<a href="tourMain.jsp?tour=<%=tour - 1%>"><img src="/semi/img/left.png" width="120"> </a>
				</h2>
			</div>
		</article>
		
		<article class="cntContents">
			<div class="cntTit">
			<%String here=tdao.tourname(tour); %>
				<h2><%=here %></h2>
			</div>
			
			
			<div class="ac">
				<div class="mi">
					<a href="tourReview.jsp?tour_ref=<%=tour%>"><img
						src="/semi/img/travel<%=tour%>.jpg"></a>
				</div>
				
				<article>
				<div class="middle">
			<div class="detail">
				<table class="detailTable">
				<%
				ArrayList<tourDTO> arr = tdao.getTourList(tour);
				if (arr == null || arr.size() == 0) {
				%>
					<tr class="row">
						<td>등록된 내용이 없습니다.</td>
					</tr>
					<%
					} else {
						for (int i = 0; i < arr.size(); i++) {
					%>
					<tr class="row">
						<th class="tit">관광지 주소</th>
					</tr>
					<tr>
						<td><%=arr.get(i).getTour_add()%><br><br></td>
					</tr>					
					<tr class="row">
						<th class="tit">이동 시간</th>
					</tr>
					<tr>
						<td><%=arr.get(i).getTour_movetime()%><br><br></td>
					</tr>					
					<tr class="row">
						<th class="tit">관광 시간</th>
					</tr>
					<tr>
						<td><%=arr.get(i).getTour_runtime()%></td>
					</tr>					
					<tr class="row_d">
						<td><br><br><%=arr.get(i).getTour_info()%><br><br><br></td>
					</tr>
					<tr class="row">
							<%
							int total = rdao.totalcount(tour);
							%>
						<th class="tit">평균별점</th>
					</tr>
					<tr>
						<td>
						<% 
							//for (int z = 0; z < arr.get(i).getTour_staravg(); z++) {
							//out.print("★");
						//	}
						%>
						<%
						switch(arr.get(i).getTour_staravg()){
						case 5: out.print("<img src='../star/star5.jpg' width='100px'>");break;
						case 4: out.print("<img src='../star/star4.jpg' width='100px'>");break;
						case 3: out.print("<img src='../star/star3.jpg' width='100px'>");break;
						case 2: out.print("<img src='../star/star2.jpg' width='100px'>");break;
						case 1: out.print("<img src='../star/star1.jpg' width='100px'>");break;
						} %>
						(<%=total %>명 참여)
						<%
						}
						%>
						</td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
		</article>
		<br><br>
				<div class="rl">
					<table class="cntntList">
						<%
						ArrayList<reviewDTO> arr2 = rdao.getreview("review_idx", tour,1,5);
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
							<td><%=g+1 %></td>
							<td class="review"><a href="reviewContent.jsp?review_idx=<%=arr2.get(g).getReview_idx()%>">
								<%=arr2.get(g).getReview_subject()%></a>
							</td>
							<td class="star">
								<%
						switch(arr2.get(g).getReview_star()){
						case 5: out.print("<img src='../star/star5.jpg' width='100px'>");break;
						case 4: out.print("<img src='../star/star4.jpg' width='100px'>");break;
						case 3: out.print("<img src='../star/star3.jpg' width='100px'>");break;
						case 2: out.print("<img src='../star/star2.jpg' width='100px'>");break;
						case 1: out.print("<img src='../star/star1.jpg' width='100px'>");break;
						} %>
							</td>
						</tr>
						<%
								if (g == 5) {
									break;
								}
							}
						}
						%>
						<tr>
							<td colspan="3">
								<a href="tourReview.jsp?tour_ref=<%=tour%>"><%=here%> 리뷰 전체보기</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
		
		
			
		<article>
			<div class="rgo">
				<h2>
					<a href="tourMain.jsp?tour=<%=tour + 1%>"><img src="/semi/img/right.png" width="120"> </a>
				</h2>
			</div>
		</article>	
			</div>
		<article>
			<div class="slideImgLink">
				<table class="imglink">
					<tr>
						<%
							ArrayList<tourDTO> tourlist = tdao.tourbox();
						if (tourlist == null || tourlist.size() == 0) {
	
						} else {
							for (int q = 0; q < tourlist.size(); q++) {
						%>
						<td><a
							href="tourMain.jsp?tour=<%=tourlist.get(q).getTour_ref()%>"><img
								src="/semi/img/travel<%=tourlist.get(q).getTour_ref()%>.jpg"
								></a></td>
						<%
							}
						}
						%>
					</tr>
				</table>
			</div>	
		</article>

<article>
			<div class="slideImgLink2">
				<table class="imglink2">
					<tr>
						<%
							ArrayList<tourDTO> tourlist2 = tdao.tourbox();
						if (tourlist == null || tourlist.size() == 0) {
	
						} else {
							for (int q = 0; q < tourlist2.size(); q++) {
						%>
		<td class="imgtd">
		 <div id="frame">
		<a href="tourMain.jsp?tour=<%=tourlist2.get(q).getTour_ref()%>"  class="imga">
	    <div class="darkness"></div>
	     <div class="btn-plus"><span draggable="false" class="d"><%=tourlist2.get(q).getTour_name() %></span>
	     </div>
		<img src="/semi/img/travel<%=tourlist2.get(q).getTour_ref()%>.jpg" >
		</a>
       	</div>
						<%
							}
						}
						%>
					</tr>
				</table>
			</div>	
		</article>


	</section>
<%@include file="/ykfooter.jsp"%>
</body>
</html>