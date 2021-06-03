<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdao" class="qna.QnaDAO"></jsp:useBean>
<jsp:useBean id="qdto" class="qna.QnaDTO"></jsp:useBean>
<jsp:setProperty property="*" name="qdto"/>
<%
String qna_ref = request.getParameter("qna_ref");
String qna_sunbun = request.getParameter("qna_sunbun");
System.out.println(qna_ref);
System.out.println(qna_sunbun);
int result = qdao.qnaMasterWrite(qdto);
String msg = result>0?"글쓰기 성공":"글쓰기 실패";
%>
<script>
window.alert('<%=msg%>');
location.href='qnaList.jsp';
</script>
