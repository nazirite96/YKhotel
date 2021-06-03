<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="rdao" class="review.reviewDAO" scope="session"></jsp:useBean>
<%

String sid=(String)session.getAttribute("id"); 
if (sid==null){
	%>
	<script>
window.alert('로그인 해야 참여 가능~');
location.href=document.referrer;
</script>
	<%
	}else{
	
//좋아요 하는 처리페이지
String idx_s=request.getParameter("idx");
String like_s=request.getParameter("like");
if(idx_s==null||idx_s.equals("")||like_s==null||like_s.equals("")){
	%>
	window.alert('문제 발생');
	<%
}
int idx=Integer.parseInt(idx_s);
int like=Integer.parseInt(like_s);
rdao.likeit(idx, like);

	}
%>
<script>

location.href=document.referrer;
</script>