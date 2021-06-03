<%@page import="member.YkMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ykdto" class="member.YkMemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ykdto"/>
<jsp:useBean id="ykdao" class="member.YkMemberDAO"></jsp:useBean>
<%
String id=(String)session.getAttribute("id");
YkMemberDTO ydto=ykdao.getUserInfo(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi/css/ykLayout.css">
<style>
body{
text-align: center;
margin: 0px auto;
}
.profup_article{
	margin: 0px auto;
	text-align: center;
	width:500px;
	height:auto;
} 
.profup_article table{
margin: 0px auto;
margin-top: 60px;
margin-bottom: 60px;
text-align: left;

}
.profup_article td{
height: 50px;
}

</style>
</head>

<body>
<%@include file="../ykheader.jsp" %>
<br><br>
<section>
<img src="/semi/img/g1.jpg"     style="width:100%;">
</section>
<section>
<form action="/semi/yk_member/yk_myUpdate_ok.jsp"><!-- 수정하기 폼액션으로 묶었음 -->
<article class="profup_article">
	<h1>My Profile Page</h1>
	
		<table>
		<tr><th>아이디</th></tr>
		<tr><td><input type="hidden" name="id" value="<%=id%>" readonly><%=id%></td></tr>
		<tr><th>이름</th></tr>
		<tr><td><input type="text" name="name"value="<%=ydto.getName()%>" required="required"></td></tr>
		<tr><th>성별</th></tr>
		<tr><td><%=ydto.getSex()%></td></tr>
		<tr><th>E-mail</th></tr>
		<tr><td><input type="text" name="email" value="<%=ydto.getEmail()%>" required="required"></td></tr>
		<tr><th>주소</th></tr>
		<tr><td><input type="text" name="addr"value="<%=ydto.getAddr()%>" required="required"></td></tr>
		<tr><th>전화번호</th></tr>
		<tr><td><input type="text" name="tel"value="<%=ydto.getTel()%>" required="required"></td></tr>
		<tr><th>가입날짜</th></tr>
		<tr><td><%=ydto.getJoindate()%></td></tr>
		<tr><td align="right"><input type="submit" value="정보수정"></td></tr>
		</table>
	
</article>

</form>
</section>
<%@include file="../ykfooter.jsp" %>
</body>
</html>