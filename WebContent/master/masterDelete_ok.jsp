<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="madao" class="master.MasterDAO"></jsp:useBean>
<%
String idx_d=request.getParameter("idx");
int idx=Integer.parseInt(idx_d);
int result=madao.masterDelete(idx);
String msg=result>0?"게시글 삭제완료":"게시글이 존재하지 않습니다";
%>
<script>
window.alert('<%=msg%>');
opener.location.reload();
window.self.close();
</script>