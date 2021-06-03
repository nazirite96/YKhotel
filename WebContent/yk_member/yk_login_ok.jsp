<%@page import="member.YkMemberDTO"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ykdao" class="member.YkMemberDAO"></jsp:useBean>
<jsp:useBean id="ykdto" class="member.YkMemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ykdto"/>
<%
String saveid=request.getParameter("saveid");
String id=request.getParameter("id");
String password=request.getParameter("password");
int result=ykdao.yk_login(id, password);

switch(result){

case 1:
	if(saveid!=null){
		Cookie ck=new Cookie("id",id);
		ck.setMaxAge(60*60*24);
		response.addCookie(ck);
	}else{
		Cookie ck=new Cookie("id",id);
		ck.setMaxAge(0);
		response.addCookie(ck);
	}
	%>
	<script>
	window.alert('로그인 되었습니다');
	opener.location.reload();
	window.close();
	</script>
	<%
	String dbname = ykdao.getUserNameInfo(id);
	int dbmaster = ykdao.getMasterInfo(id);
	
	session.setAttribute("id", id);
	session.setAttribute("sname", dbname);
	session.setAttribute("master", dbmaster);
	
	break;
case 2:
	%>
	<script>
	window.alert('비밀번호가 틀렸습니다');
	location.href='/semi/yk_member/yk_login.jsp';
	</script>
	<%
	break;
case 3:
	%>
	<script>
	window.alert('존재하지 않는 아이디입니다');
	location.href='/semi/yk_member/yk_login.jsp';
	</script>
	<%
	break;
}
%>