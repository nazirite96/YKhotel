<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ykdao" class="member.YkMemberDAO"></jsp:useBean>
<%
String name=request.getParameter("fname");
String email=request.getParameter("femail");
String id=ykdao.yk_idFind(name, email);
out.println(id);
if(id==null||id.equals("")){
	%>
	<script>
	window.alert('일치하는 정보가 없습니다');
	location.href='/semi/yk_member/yk_idFind.jsp';
	</script>
	<%
}else {
	%>
	<script>
window.alert('아이디는 <%=id%>입니다');
window.self.close();
</script>
	<%
}
%>    

