<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ykdto" class="member.YkMemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ykdto"/>
<jsp:useBean id="ykdao" class="member.YkMemberDAO"></jsp:useBean>

<%
String eaddr=request.getParameter("eaddr");
String email_s=request.getParameter("email");
String email_s2=request.getParameter("email2");
String email=email_s+"@"+eaddr;
ykdto.setEmail(email);

String id=request.getParameter("id");
if(id.equals("")){
	%>
	<script>
	window.alert('아이디를 입력해주세요');
	location.href='/semi/yk_member/yk_memberJoin.jsp';
	</script>
	<%
}else{

	int result=ykdao.yk_memberJoin(ykdto);
	String msg = result>0?"회원가입 완료":"회원가입 실패";
	%>
	<script>
		window.alert('<%=msg%>');
		location.href='/semi/index.jsp';
	</script>
	<%
}
%>
