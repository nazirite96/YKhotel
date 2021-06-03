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
.writetable {
	border: 1px solid;
	
}

.writetable_t {
	margin: 0px auto;
	text-align: center;
}

.bt {
	text-align: center;
}
</style>
<body>
	<%@include file="/ykheader.jsp"%>
	<br><br><br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->
	<section>
		<article>
			<h1>리뷰 보기</h1>
			<div class="writetable">
				<form action="editReview_ok.jsp" method="post"
					enctype="multipart/form-data">
					<table class=writetable_t">
						<%
							Integer review_idx = Integer.parseInt(request.getParameter("review_idx"));

						reviewDTO rt = rdao.reviewcontent(review_idx);
						%>
						<tr>
							<th>번호</th>
							<td><%=rt.getReview_write_ref()%>
							<input type="hidden" name="review_write_ref" value="<%=rt.getReview_write_ref()%>"> </td>
							<th>작성일</th>
							<td><%=rt.getReview_writedate()%>
							<input type="hidden" name="review_idx" value="<%=review_idx%>"> </td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><%=rt.getReview_id()%>
							<input type="hidden" name="review_id" value="<%=rt.getReview_id()%>"> </td>
							<th>별점</th>
							<td><select name="review_star">
									<option value="5">★★★★★</option>
									<option value="4">★★★★</option>
									<option value="3">★★★</option>
									<option value="2">★★</option>
									<option value="1">★</option>
							</select></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="review_subject"
								value="<%=rt.getReview_subject()%>"></td>
							<th>첨부파일</th>
							<td><input type="file" name="review_imgname" value="<%=rt.getReview_imgname()%>"></td>
						</tr>
						<tr>
							<td colspan="4"><textarea rows="10" cols="55"
									name="review_content"><%=rt.getReview_content().replaceAll("\n", "<br>")%></textarea></td>
						</tr>
					</table>
					<div class="bt">
					<input type="hidden" name="review_ref" value="<%=rt.getReview_ref()%>">
						<input type="submit" value="수정하기">
					</div>
				</form>
			</div>
		</article>
	</section>
	<%@include file="/ykfooter.jsp"%>
</body>
</html>