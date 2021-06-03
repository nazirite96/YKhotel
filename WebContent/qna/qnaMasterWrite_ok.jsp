<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdao" class="qna.QnaDAO" scope="session"></jsp:useBean>
<jsp:useBean id="qdto" class="qna.QnaDTO" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="qdto"/>
<%
String qna_ref = request.getParameter("qna_ref");
String qna_sunbun = request.getParameter("qna_sunbun");
System.out.println(qna_ref);
System.out.println(qna_sunbun);
int result = qdao.qnaMasterWrite(qdto);


if(result<=0){
%>
<script>
window.alert('게시글 등록을 실패하셨습니다.');
location.href='qnaList.jsp';
</script>
<%
}else{
%>
<script>
location.href='qnaList.jsp';
</script>
<%
}
%>
