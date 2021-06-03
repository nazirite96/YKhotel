<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ykdao" class="member.YkMemberDAO"></jsp:useBean>
<%
String id=request.getParameter("pid");
String email=request.getParameter("pemail");
int ran=ykdao.pwdFind(id, email);
if(ran==0){
	%>
	<script>
	window.alert('일치하는 정보가 없습니다');
	location.href='/semi/yk_member/yk_pwdFind.jsp';
	</script>
	<%
	}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
<form action="/semi/yk_member/yk_pwdUpdate_ok.jsp">

	<h2>비밀번호 찾기 및 변경하기</h2>
	<div>인증번호 : <%=ran %></div>
	<div><input type="hidden" name="ran" value="<%=ran %>"></div>
	<div><input type="hidden" name="pwdid"value="<%=id%>"></div>
	<div>인증번호 입력 : <input type="text" name="checknum" ></div>
	<div>변경할 비밀번호 : <input type="text" name="newpwd"></div>
	<div>
	<input type="submit" value="비밀번호 변경">
	</div>
</form>
</section>
</body>
</html>