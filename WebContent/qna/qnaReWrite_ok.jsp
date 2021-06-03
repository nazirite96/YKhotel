<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdao" class="qna.QnaDAO"></jsp:useBean>
<jsp:useBean id="qdto" class="qna.QnaDTO"></jsp:useBean>
<jsp:setProperty property="*" name="qdto"/>
<%
int result = qdao.qnaReWrite(qdto);
String msg = result>0?"답변쓰기ok":"답변쓰기no";
%>
<script>
window.alert('<%=msg%>');
location.href='qnaList.jsp';
</script>