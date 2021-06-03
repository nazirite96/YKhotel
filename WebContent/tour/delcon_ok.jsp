<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rcdao" class="reviewComment.recomDAO" scope="session"></jsp:useBean>
<%
String idx_s=request.getParameter("recom_idx");
int idx=Integer.parseInt(idx_s);

int result=rcdao.delcomment(idx);
%>

<%
	String msg=result>0? "성공":"실패";
	%>
<script type="text/javascript">
	window.alert('<%=msg%>');
	location.href=document.referrer;
</script>