<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="rdto" class="review.reviewDTO" scope="session"></jsp:useBean>
<jsp:useBean id="rdao" class="review.reviewDAO" scope="session"></jsp:useBean>
<%
String aa=request.getParameter("review_idx");
int idx=Integer.parseInt(aa);
String id=request.getParameter("review_id");

int result=rdao.deleteReview(idx, id);
out.print(result);
%>

<%
	String msg=result>0? "성공":"실패";
	%>
<script type="text/javascript">
	window.alert('<%=msg%>');
	location.href="tourMain.jsp";
</script>