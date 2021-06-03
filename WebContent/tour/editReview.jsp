<%@page import="review.reviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<jsp:useBean id="rdto" class="review.reviewDTO" scope="session"></jsp:useBean>
<jsp:useBean id="rdao" class="review.reviewDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css"
	href="/semi/css/ykLayout.css">
<style>
section article h1 {
	margin-top:0;
	font-size: 25px;
}
.writetitle {
	text-align: center;
}

.writetable {
 	margin: 0px auto;
}

.writetable_t {
		width: 900px;
	margin: 0px auto;
	border-spacing: 15px;
	position: relative;
	right: 50px;
}
.writetable_t textarea{
	border: 1px solid lightgray;
	border-radius: 4px;
	width: 100%;
	height: 500px;
	resize: none;
}
.wh{
text-align: left;
	width: 14%;
}
.wh2{
text-align: left;
	width: 14%;
}
.bt {
	text-align: center;
}
.sub{
		border: 1px solid lightgray;
	border-radius: 4px;
	width: 100%;
	height: 35px;
}
.bttd{
text-align: center;
}
</style>
<script>
function back(){
	location.href=document.referrer;
}
</script>
<body>
	<%@include file="/ykheader.jsp"%>
	<br><br><br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->
	<section>
		<article>
		<div class="writetitle">
			<h1>리뷰 수정하기</h1>
			<br><br>
			</div>
			<div class="writetable">
			
				<form action="editReview_ok.jsp" method="post"
					enctype="multipart/form-data">
					<table class="writetable_t">
						<%
							Integer review_idx = Integer.parseInt(request.getParameter("review_idx"));

						reviewDTO rt = rdao.reviewcontent(review_idx);
						%>
						<tr>
						<th class="wh2">별점</th>
							<td class="wh2"><select name="review_star">
									<option value="5">★★★★★</option>
									<option value="4">★★★★</option>
									<option value="3">★★★</option>
									<option value="2">★★</option>
									<option value="1">★</option>
							</select></td>
							<th class="wh2">첨부파일</th>
							<td class="wh2"><input type="file" name="review_imgname" value="<%=rt.getReview_imgname()%>">
							<input type="hidden" name="review_write_ref" value="<%=rt.getReview_write_ref()%>"> 
							<input type="hidden" name="review_idx" value="<%=review_idx%>"> 
							<input type="hidden" name="review_id" value="<%=rt.getReview_id()%>">
							</td>
						</tr>
						<tr>
							<th class="wh">제목</th>
							<td colspan="3"><input type="text" class="sub" name="review_subject"
								value="<%=rt.getReview_subject()%>"></td>
						</tr>
						<tr>
							<td colspan="4"><textarea rows="20" cols="80"
									name="review_content"><%=rt.getReview_content().replaceAll("\n", "<br>")%></textarea></td>
						</tr>
					<tr>
					<td class="bttd" colspan="4">
					<div class="bt">
					<input type="hidden" name="review_ref" value="<%=rt.getReview_ref()%>">
						<input type="submit" value="수정하기">
						<input type="button" value="취소하기" onclick="back()">
					</div>
					</td>
					</tr>
					</table>
				</form>
			</div>
		</article>
	</section>
	<%@include file="/ykfooter.jsp"%>
</body>
</html>