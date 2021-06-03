<%@page import="review.reviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@page import="java.sql.*" %>


<jsp:useBean id="rcdto" class="reviewComment.recomDTO" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="rcdto"/>
<jsp:useBean id="rcdao" class="reviewComment.recomDAO" scope="session"></jsp:useBean>
<%
int result=rcdao.postContent(rcdto);
String msg=result>0?"성공":"실패";
%>
<script>
window.alert('<%=msg%>');
location.href=document.referrer;
</script>
