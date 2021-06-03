<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdao" class="qna.QnaDAO"></jsp:useBean>
<jsp:useBean id="qdto" class="qna.QnaDTO"></jsp:useBean>
<jsp:setProperty property="*" name="qdto"/>

<%
int result = qdao.getUpdateQna2(qdto);//qnaUpdate.jsp에서 작성한 수정한 데이터들을 db로 다시 저장
String msg = result>0?"수정 되었습니다":"수정 실패했습니다";
%>
<script>
window.alert('<%=msg%>');
location.href='qnaList.jsp';
</script>