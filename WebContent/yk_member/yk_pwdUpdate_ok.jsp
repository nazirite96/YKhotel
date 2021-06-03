<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ykdao" class="member.YkMemberDAO"></jsp:useBean>
<%
String id=request.getParameter("pwdid");
String pwd=request.getParameter("newpwd");
String ran=request.getParameter("ran");
String checknum=request.getParameter("checknum");

if(ran.equals(checknum)){
	int result=ykdao.pwdUpdate(id, pwd);
	%>
	<script>
	window.alert('비밀번호 변경완료');
	location.href='/semi/yk_member/yk_login.jsp';
	</script>
	<%
}else{
	%>
	<script>
	window.alert('인증번호를 잘못 입력하셨습니다');
	location.href='/semi/yk_member/yk_login.jsp';
	</script>
	<%
}
%>