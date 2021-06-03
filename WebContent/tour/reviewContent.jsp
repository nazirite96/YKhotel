<%@page import="reviewComment.recomDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="review.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="rdto" class="review.reviewDTO" scope="session"></jsp:useBean>
<jsp:useBean id="rcdto" class="reviewComment.recomDTO" scope="session"></jsp:useBean>
<jsp:useBean id="rdao" class="review.reviewDAO" scope="session"></jsp:useBean>
<jsp:useBean id="rcdao" class="reviewComment.recomDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="/semi/css/ykLayout.css">
<%
	String idx_s = request.getParameter("review_idx");
if (idx_s == null || idx_s == ("")) {
	idx_s = "0";
}
Integer idx = Integer.parseInt(idx_s);
if (idx == 0) {
%>
<script>
	window.alert('이미 삭제된 게시글이거나 잘못된 접근입니다.');
	location.href = 'boardList.jsp';
</script>
<%
	}
%>
<script>
	function show2(idx, id) {
		var result = window.confirm('글을 삭제하시겠습니까?');

		if (result) {

			location.href = "dele.jsp?review_idx=" + idx + "&review_id=" + id;
		}
		/*확인인지 취소인지 값을 받기 위해 변수화*/
	}
	function show3(idx, id) {
		var result = window.confirm('글을 수정하시겠습니까?');

		if (result) {

			location.href = "editReview.jsp?review_idx=" + idx + "&review_id="
					+ id;
		}
		/*확인인지 취소인지 값을 받기 위해 변수화*/
	}
</script>
<style>
.theme2 {
	text-align: center;
}

.condv {
	
}

.condvtb {
	margin: 0px auto;
	border-spacing: 0px;
	width: 900px;
}

.condvtb th {
	width: 10%;
	height: 40px;
	text-align: center;
}

.condvtb td {
	width: 150px;
	text-align: center;
}

.likeimg {
	text-align: center;
}

.likenum {
	color: white;
	position: relative;
	top: -41px;
}

.likemsg {
	position: relative;
	top: -64px;
}

.likeAtag {
	text-decoration: none;
	color: white;
}

.likeAtag:link {
	color: white;
	text-decoration: none;
}

.likeAtag:visited {
	color: white;
	text-decoration: none;
}

.likeAtag:hover {
	color: white;
	text-decoration: none;
}

.nondiv {
	
}

.comenttb {
	width: 50%; margin : 0px auto;
	text-align: center;
	margin: 0px auto;
	border-spacing: 0px;
}

.comenttb td, th {
height: 40px;
}

.a {
	width: 10%;
	font-size: 13px;
	color:#454140;
	text-align: left;
}

.a2 {
	width: 10%;
	font-size: 17px;
	font-weight:bold;
	color:#454140;
	text-align: left;
	
}
.a2r {
	width: 10%;
	font-size: 17px;
	font-weight:bold;
	color:#808080;
	text-align: left;
	
}

.b {
	width: 30%;
	height: 200px;
	text-align: left;
}
.b2{
	text-align: left;
	padding: 3px;
}
.b2_re{
	height: 40px;
	border-radius: 5px;
	
}
.b2_re_bt{
border-radius: 3px;
	width: 50px;
	height: 40px;
}
.c {
	width: 10%;
	font-size: 13px;
	text-align: left;
}


.delcon {
	font-size: 10px;
	width:5%;
}

.mc {
	height: 400px;
}

.postcom {
	margin: 0px auto;
}

.dne {
	margin: 0px auto;
	text-align: center;
}

.cmfs {
	width: 800px;
}

.wd {
	width: 20px;
}

.tt {
	border-bottom: 1px solid rgb(205, 205, 205);
	border-top: 1px solid rgb(205, 205, 205);
}

.cmdiv {
	border: 1px solid rgb(245, 245, 245);
	text-align: center;
}

.cmt {
	padding-top: 30px;
	padding-bottom: 30px;
	width: 100%;
}
.goback{
	margin:auto;
	text-align: center;
}
.putcom{
	border-radius: 3px;
	width: 60px;
	height: 50px;
}
.putcom_t{
	height: 50px;
}
.endcom{
}
.coid{
text-align: left;

}
.delnre{
text-align: left;
font-size: 11px;
border-bottom: rgb(245,245,245);
}
</style>
<body>
	<%@include file="/ykheader.jsp"%>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->

	<script>
		function showdi(cidx) {
			var d = document.getElementById(cidx);
			if (d.style.display == 'none') {
				d.style.display = "block";
				d.style.border = "1px solid rgb(245,245,245)";
			} else {
				d.style.display = "none";
			}
		}
	</script>
	<section>
		<article>
			<div class="theme2">
				<h1>리뷰 보기</h1>
				<br>
			     <br>
			</div>
			<div class="condv">
				<table class="condvtb">
					<%
						Integer review_idx = Integer.parseInt(request.getParameter("review_idx"));
					reviewDTO rt = rdao.reviewcontent(review_idx);
					%>
					<tr>
						<th>번호</th>
						<td><%=rt.getReview_write_ref()%></td>
						<th class="wd">작성일</th>
						<td class="wd"><%=rt.getReview_writedate()%></td>
						<th>별점</th>
						<td>
							<%
								switch (rt.getReview_star()) {
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
					</tr>
			
					<tr>
						<th colspan="1" class="tt">제목</th>
						<td colspan="5" class="tt"><%=rt.getReview_subject()%></td>
					</tr>
      <tr>
						<th>작성자</th>
						<td><%=rt.getReview_id()%></td>
						<th>좋아요</th>
						<td><%=rt.getReview_like()%></td>
					</tr>

					<%
						if (rt.getReview_imgname() != null && !rt.getReview_imgname().equals("base.jpg")) {
					%>
					<tr>
						<td colspan="8"><br> <br> <br> <br> <img
							src="../userimg/<%=rt.getReview_imgname()%>" width="500px">
							<br> <br> <br>
							</td>
					</tr>
					<%
						}
					%>
					<tr>
						<td colspan="8" class="mc"><%=rt.getReview_content().replaceAll("\n", "<br>")%></td>
					</tr>
					<tr>
						<td class="likeimg" colspan="8"><br> <br>
							<br> <a
							href="likeIt.jsp?idx=<%=rt.getReview_idx()%>&like=<%=rt.getReview_like()%>"
							class="likeAtag"> <img src="/semi/img/bh.jpg"
								style="width: 45px;">
						</a></td>
					</tr>
					<tr>
						<td class="likenum" colspan="8"><a
							href="likeIt.jsp?idx=<%=rt.getReview_idx()%>&like=<%=rt.getReview_like()%>"
							class="likeAtag"> <%=rt.getReview_like()%>
						</a></td>
					</tr>
					<tr>
					<td colspan="8">
					<hr>
					</td>
					</tr>
				</table>
				</div>
				<div class="cmdiv">
				<%int count=rcdao.countComment(idx); %>
					<h4>총 <%=count %>개의 댓글이 있습니다.</h4>
					<table class="comenttb">
						<%
							
						%>
						<%
							int ref = rt.getReview_write_ref();
						ArrayList<recomDTO> arr = rcdao.listcomment(idx);
						if (arr == null || arr.size() == 0) {

						} else {
							for (int i = 0; i < arr.size(); i++) {
								int cidx = arr.get(i).getRecom_idx();
						%>
						
							<%
								if (arr.get(i).getRecom_lev() > 0) {
							%>
							<tr>
							<td class="coid">&nbsp;&nbsp;<img src="../img/comment.png" width="25px"
								height="20px;">&nbsp;<span class="a2r"><%=arr.get(i).getRecom_id()%></span><span class="c">&nbsp;&nbsp;<%=arr.get(i).getRecom_writedate()%></span></td>
								</tr>
								<tr>
								<td class="b">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=arr.get(i).getRecom_content()%></td>
							</tr>
							<tr>
							<td class="delnre">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:showdi(<%=cidx%>);">답글쓰기</a>
							<%
								if (arr.get(i).getRecom_id().equals(sid)) {
							%>
							<a
								href="delcon_ok.jsp?recom_idx=<%=arr.get(i).getRecom_idx()%>&recom_sunbun=<%=arr.get(i).getRecom_sunbun()%>">삭제하기</a>
							</td>
							<%
								}
							%>
						</tr>
							<%
								}else{
							%>
							<tr>
							<td class="coid"><span class="a2"><%=arr.get(i).getRecom_id()%></span><span class="c">&nbsp;&nbsp;<%=arr.get(i).getRecom_writedate()%></span></td>
							</tr>
							<tr>
							<td class="b">&nbsp;&nbsp;<%=arr.get(i).getRecom_content()%></td>
							</tr>
							<tr>
							<td class="delnre"><a href="javascript:showdi(<%=cidx%>);">답글쓰기</a>
							<%
								if (arr.get(i).getRecom_id().equals(sid)) {
							%>
							<a
								href="delcon_ok.jsp?recom_idx=<%=arr.get(i).getRecom_idx()%>&recom_sunbun=<%=arr.get(i).getRecom_sunbun()%>">삭제하기</a>
							</td>
							<%
								}
							%>
						</tr>
								<%
								}%>
							
						<tr>
							<td class="b2" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div id="<%=cidx%>" style="display: none;">
									<form name="con" action="recontent.jsp">
										<input type="hidden" name="recom_id" value="<%=sid%>">
										<input type="hidden" name="recom_sunbun"
											value="<%=arr.get(i).getRecom_sunbun()%>"> <input
											type="hidden" name="recom_ref"
											value="<%=arr.get(i).getRecom_ref()%>"> <input
											type="hidden" name="recom_review_idx" value="<%=idx%>"><input
											type="text" class="b2_re" name="recom_content" size="50">&nbsp;<input
											class="b2_re_bt" type="submit" value="작성">
									</form>
								</div>
							</td>
						</tr>
						<%
							}
						}
						%>
						<tr>
						<td colspan="5" class="endcom">
						</td>
						</tr>
					</table>
					<br><br>
					<table class="postcom">
						<%
							if (sid != null && !sid.equals("")) {
						%>

						<form name="comment" action="commentUp.jsp">
							<%
								
							%>
							<tr>
								<td><div class="cmt">
										<%=sid%><input type="hidden" name="recom_id" value="<%=sid%>">
										<input type="hidden" name="recom_review_idx" value="<%=idx%>">
										<input type="text" class="putcom_t" name="recom_content" size="50"> <input
											type="submit" class="putcom" value="작성">
									</div></td>
							</tr>
						</form>
						<%
							} else {
						%>
						<tr>
							<td>로그인 후 댓글을 작성하실 수 있습니다.</td>
						</tr>
						<%
							}
						%>

					</table>
					<br><br>
				</div>
		</article>
		<table class="dne">
		<tr>
				<td width="400px;"><div>
						<a
							href="/semi/tour/tourReview.jsp?tour_ref=<%=rt.getReview_ref()%>">리뷰
							목록 돌아가기</a>
					</div></td>
			</tr>
			<%
				if (sid != null && sid.equals(rt.getReview_id())) {
			%>
			<%
				String review_id = rt.getReview_id();
			%>
			<tr>
				<td><input type="hidden" name="review_idx"
					value="<%=rt.getReview_idx()%>"> <input type="hidden"
					name="review_id" value="<%=rt.getReview_id()%>"> <input
					type="button" value="삭제하기"
					onclick="show2('<%=review_idx%>','<%=review_id%>')"> <input
					type="hidden" name="idx" value="<%=rt.getReview_idx()%>"> <input
					type="hidden" name="writer" value="<%=rt.getReview_id()%>">
					<input type="button" value="수정하기"
					onclick="show3('<%=review_idx%>','<%=review_id%>')"></td>
			</tr>
		</table>
		<%
			}
		%>
		
		<div class="goback">
		<table>
		</table>
		</div>
	</section>
	<br><br><br><br>
	<hr>
	<%@include file="/ykfooter.jsp"%>
</body>
</html>