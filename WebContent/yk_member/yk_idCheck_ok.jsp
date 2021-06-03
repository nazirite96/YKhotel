<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ykdto" class="member.YkMemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ykdto"/>
<jsp:useBean id="ykdao" class="member.YkMemberDAO"></jsp:useBean>
<%
int result=ykdao.yk_idCheck(ykdto);
if(result==1){
	%>
	<script>
	window.alert('아이디중복');
	location.href='/semi/yk_member/yk_idCheck.jsp';
	</script>
	<%
}else{
	%>
	<script>
	window.alert('아이디 사용가능');
	opener.document.yk_memberJoin.id.value='<%=ykdto.getId()%>';
	window.self.close();
	</script>
	<%
}
%>