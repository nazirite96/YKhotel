<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
<form action="/semi/yk_member/yk_myDelete_ok.jsp">
<fieldset>
	<legend>회원탈퇴</legend>
	<h3>회원탈퇴</h3>
	<div>ID<input type="text" name="id" value="<%=id%>"></div>
	<div>비밀번호<input type="text" name="password">
	<input type="submit" value="회원탈퇴"></div>
</fieldset>
</form>
</section>
</body>
</html>