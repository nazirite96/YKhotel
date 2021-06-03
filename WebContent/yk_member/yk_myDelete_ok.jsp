<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ykdao" class="member.YkMemberDAO"></jsp:useBean>
<%
String id=(String)session.getAttribute("id"); //세션에서 아이디를 받아옴
String password=request.getParameter("password");

int result=ykdao.yk_myDelete(id,password);
if(result>0){
String msg="정상적으로 회원탈퇴 되었습니다";
%>
<script>
window.alert('<%=msg%>');
<%session.invalidate();%>
opener.location.href='/semi/index.jsp';
self.close();
</script>
<%}else{
String msg="비밀번호가 틀렸습니다";
%>
<script>
window.alert('<%=msg%>');
self.close();
</script>
<%
}
%>