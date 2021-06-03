<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdao" class="qna.QnaDAO" scope="session"></jsp:useBean>
<jsp:useBean id="qdto" class="qna.QnaDTO" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="qdto"/>

<%
String qna_idx_s = request.getParameter("qna_idx");
if(qna_idx_s==null||qna_idx_s.equals("")){
	qna_idx_s="0";
}
int qna_idx = Integer.parseInt(qna_idx_s);
int result = qdao.getUpdateQna2(qdto);//qnaUpdate.jsp에서 작성한 수정한 데이터들을 db로 다시 저장

if(result<=0){
%>
<script>
window.alert('게시글 수정을 실패하셨습니다.');
location.href='qnaContent.jsp?qna_idx=<%=qna_idx%>';
</script>
<%	
}else{
%>
<script>
location.href='qnaContent.jsp?qna_idx=<%=qna_idx%>';
</script>
<%
}
%>
