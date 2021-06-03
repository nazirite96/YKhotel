<%@page import="member.YkMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ykdao" class="member.YkMemberDAO"></jsp:useBean>
<jsp:useBean id="ykdto" class="member.YkMemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ykdto"/>
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
text-align:center;
margin:0 auto;
}
.profile_article{
text-align:center;

}
.profile_article h1{
font-size:25px;
}

.profile_article table{
width:300px;
text-align:left;
margin:0px auto;
margin-top:60px;
margin-bottom: 60px;


}
.profile_article table td{
height:50px;
}

</style>


</head>
<script>
function myUpdate(){
	location.href='/semi/yk_member/yk_myUpdate.jsp';
}
function myBye(){
	window.open('/semi/yk_member/yk_myDelete.jsp','myDelete','width=500 , height=300');
}
</script>

<body>
<%@include file="../ykheader.jsp" %>

<section>
<img src="/semi/img/g1.jpg"     style="width:100%;">
</section>


<section>
<article class="profile_article">
	<h1>My Profile Page</h1>

		<h3>내 정보 보기</h3>
		
		<table>
		<tr><th>아이디</th></tr>
		<tr><td><%=ydto.getId() %></td></tr>
		<tr><th>이름</th></tr>
		<tr><td><%=ydto.getName()%></td></tr>
		<tr><th>성별</th></tr>
		<tr><td><%=ydto.getSex()%></td></tr>
		<tr><th>E-mail</th></tr>
		<tr><td><%=ydto.getEmail()%></td></tr>
		<tr><th>주소</th></tr>
		<tr><td><%=ydto.getAddr()%></td></tr>
		<tr><th>전화번호</th></tr>
		<tr><td><%=ydto.getTel()%></td></tr>
		<tr><th>가입날짜</th></tr>
		<tr><td><%=ydto.getJoindate()%></td></tr>
		<tr><td><input type="button" value="회원정보수정" onclick="javascript:myUpdate();">
		<input type="button" value="회원탈퇴" onclick="javascript:myBye();"></td></tr>
		</table>

</article>
<!-- 폼으로 묶지 않고 인풋 버튼으로 온클릭 뿽숀 했음 -->
</section>
<%@include file="../ykfooter.jsp" %>
</body>
</html>