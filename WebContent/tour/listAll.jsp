<%@page import="review.reviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="rdao" class="review.reviewDAO" scope="session"></jsp:useBean>
<jsp:useBean id="tdao" class="tour.tourDAO" scope="session"></jsp:useBean>
<%
String how = request.getParameter("how");
if (how == null || how.equals("")) {
	how = "review_idx";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi/css/ykLayout.css">
</head>
<script>
function change(){
	var how=document.getElementById("selectbox").value;
		window.location.href='listAll.jsp?how='+how;
}
</script>
<style>
/**타이틀 이름*/
.titleName{
	text-align: center;
}
/**정렬기준*/
.descmodel{
text-align: right;
width: 78%;
margin-bottom: 20px;
}
/**글쓰기*/
.write{
text-align: right;
}
/**글 목록*/
.reviewlist{
}
.reviewlisttb{
	margin: 0px auto;
	border-spacing: 0px;
	width: 900px;
}
.reviewlisttb th{
	text-align: center;
	width: 150px;
	border-top:1px solid darkblue;
	border-bottom: 1px solid darkblue;
}
.reviewlisttb th{
	text-align: center;
	width: 150px;
	}
.dftd{
width: 15%;
text-align: center;
	}
.longtd{
	width: 50%;
	text-align: left;
}
.dfth{
width: 15%;
text-align: center;
	}
.longth{
	width: 50%;
	text-align: center;
}
	.dateth{
	width: 10%;
	}
	.datetd{
	width: 10%;
	}
.page{
	text-align: center;
	
}
.sp{
font-size: 13px;
color: blue;
}
</style>
<%
int totalCnt = rdao.getAllCnt();//디비에서 가져오는 거
int listSize = 5; //보여줄 리스트 수
int pageSize = 5; // 보여줄 페이지 수
String cp_s = request.getParameter("cp");
if (cp_s == null || cp_s.equals("")) {
	cp_s = "1";
}
int cp = Integer.parseInt(cp_s); //사용자 현재 위치 파라미터라는 전제

int totalpage = (totalCnt / listSize) + 1;
if (totalCnt % listSize == 0)
	totalpage--;

int userGroup = cp / pageSize; //사용자의 그룹값 위치
if (cp % pageSize == 0)
	userGroup--;
%>
<body>
	<%@include file="/ykheader.jsp"%>

	<br><br><br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->


	<section>
		<article>
			<div class="titleName">

			</div>
		</article>

		<article>
			<div class="descmodel">
			<select name="how" id="selectbox" onchange="change()">
				<option value="">정렬기준</option>
				<option value="review_idx">최신순</option>
				<option value="review_like">좋아요</option>
				<option value="review_star">별점</option>
			</select>
			</div>
		</article>
		<article>
			<div class="write">

			</div>
		</article>
		<article>
			<div class="reviewlist">
				<table class="reviewlisttb">
					<tr>
						<th></th>
						<th class="dfth">아이디</th>
						<th class="dfth">별점</th>
						<th class="longth">제목</th>
						<th class="dfth">좋아요</th>
						<th class="dateth" >작성일</th>
					</tr>
					<%
						ArrayList<reviewDTO> arr = rdao.getAllreview(how, cp, listSize);
						
					if (arr == null || arr.size() == 0) {
					%>
					<tr>
						<td colspan="4" align="center">등록된 게시글이 없습니다.</td>
					</tr>
					<%
						} else {
					for (int i = 0; i < arr.size(); i++) {
					%>
					<tr>
						<td><img src="../userimg/<%=arr.get(i).getReview_imgname()%>"
							width="60"></td>
						<td class="dftd"><%=arr.get(i).getReview_id()%></td>
						<td>
							<%
						//		for (int j = 0; j < arr.get(i).getReview_star(); j++) {
						//		out.print("★");
						//	}
							switch(arr.get(i).getReview_star()){
							case 5: out.print("<img src='../star/star5.jpg' width='70px'>");break;
							case 4: out.print("<img src='../star/star4.jpg' width='70px'>");break;
							case 3: out.print("<img src='../star/star3.jpg' width='70px'>");break;
							case 2: out.print("<img src='../star/star2.jpg' width='70px'>");break;
							case 1: out.print("<img src='../star/star1.jpg' width='70px'>");break;
							}
							%>
						</td>
						<%String name=tdao.getTourName(arr.get(i).getReview_ref());  %>
						<td class="longtd"><a
							href="reviewContent.jsp?review_idx=<%=arr.get(i).getReview_idx()%>"><span class="sp">[<%=name%>]</span> <%=arr.get(i).getReview_subject()%></a></td>
						<td class="dftd"><%=arr.get(i).getReview_like()%></td>
						<td class="datetd"><%=arr.get(i).getReview_writedate()%></td>
						<td></td>
					</tr>
					<%
						}
					}
					%>
				</table>
			</div>
		</article>
		<article>
		<div class="page">
		<%
			if (userGroup != 0) {
		%>
			<a href="listAll.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a>
		<%
			//그룹값 중 가장 큰 숫자 공식
		}
		%>
		<%
			for (int i = (userGroup * pageSize) + 1; i <= (userGroup * pageSize) + pageSize; i++) { //사용자의 위치에 따라 보여지는 페이지를 다르게 만듬
		%>&nbsp;&nbsp;<a
			href="listAll.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;<%
			if (i == totalpage) {
			break;
		}
		}
		%>
		<%
			//마지막 일떄 꺽괄호 안주기
		if (userGroup != ((totalpage / pageSize) - (totalpage % pageSize == 0 ? 1 : 0))) {
		%><a
			href="listAll.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>">&gt;&gt;</a>
		<%
			}
		%>
		</div>
		</article>
	</section>
	<%@include file="/ykfooter.jsp"%>
</body>
</html>