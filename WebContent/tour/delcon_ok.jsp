<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rcdao" class="reviewComment.recomDAO" scope="session"></jsp:useBean>
<%
String idx_s=request.getParameter("recom_idx");
int idx=Integer.parseInt(idx_s);

int result=rcdao.delcomment(idx);
%>

<%
	String msg=result>0? "댓글이 삭제되었습니다.":"리뷰 삭제를 실패했습니다.";
	%>
<script type="text/javascript">
	window.alert('<%=msg%>');
	location.href=document.referrer;
</script>