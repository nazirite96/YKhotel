<%@page import="member.YkMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="ykdao" class="member.YkMemberDAO"></jsp:useBean>
<jsp:useBean id="ykdto" class="member.YkMemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ykdto" />
<%
	String id = (String) session.getAttribute("id");
YkMemberDTO ydto = ykdao.getUserInfo(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi/css/ykLayout.css">
<style>
body {
	text-align: center;
	margin: 0 auto;
}

.profile_article {
	text-align: center;
	background-color: white;
}

.profile_article h1 {
	font-size: 25px;
	color: #454140;
}

.profile_article table {
	width: 350px;
	text-align: left;
	margin: 0px auto;
	border: 1px solid #a79e84;
	border-radius: 10px;
}

.profile_article table td {
	height: 40px;
	text-align: center;
}

.profile_article table th {
	height: 25px;
	font-size: 15px;
	background-color: #a79e84;
	color: white;
	text-align: center;
}

.updoutbt input {
	font-size: 16px;
	width: 130px;
	height: 30px;
	margin-bottom: 40px;
	background-color: #404040;
	border-radius: 10px;
	color: white;
	border:0px;
}

/*메인 페이지*/
.fixedImg {
	position: fixed;
	width: 100%;
	z-index: -1;
}

.fixedImg_wrap {
	text-align: center;
	width: 100%;
	height: 370px;
	background-color: rgba(57, 60, 30, 0.65);
	position: relative;
	z-index: 1;
}

.fixedImg_wrap img {
	width: 60px;
	position: relative;
	top: 70px;
}

.fixedImg_wrap div {
	margin: 0 auto;
	color: white;
	position: relative;
}

.play {
	font-family: Lucida Bright;
	font-size: 35px;
	width: 400px;
	top: 100px;
}

.playtext {
	font-family: Modern;
	font-size: 15px;
	width: 300px;
	top: 120px;
}

.introimg_art img {
	width: 100%;
	height: 370px;
}
</style>


</head>
<script>
	function myUpdate() {
		location.href = '/semi/yk_member/yk_myUpdate.jsp';
	}
	function myBye() {
		window.open('/semi/yk_member/yk_myDelete.jsp', 'myDelete',
				'width=500 , height=300');
	}
</script>
<br><br><br>
<body>
	<%@include file="../ykheader.jsp"%>
	<section>
		<article class="introimg_art">
			<div class="fixedImg">
				<img src="/semi/img/myupdate_bg.jpg">
			</div>
		</article>
	</section>

	<div class="fixedImg_wrap">
		<img src="../img/5b.png">
		<div class="play">My Infomation</div>
		<div class="playtext">'<%=ydto.getName()%>' 님 회원정보</div>
	</div>
	<div style="background-color: white;">
		<br>
		<br>
		<br>
		<br>
	</div>



	<section>
		<article class="profile_article">

			<table>
				<tr>
					<th colspan="2">아 이 디</th>
				</tr>
				<tr>
					<td colspan="2"><%=ydto.getId()%></td>
				</tr>
				<tr>
					<th colspan="2">이 름</th>
				</tr>
				<tr>
					<td colspan="2"><%=ydto.getName()%></td>
				</tr>
				<tr>
					<th colspan="2">성 별</th>
				</tr>
				<tr>
					<td colspan="2"><%=ydto.getSex()%></td>
				</tr>
				<tr>
					<th colspan="2">E-mail</th>
				</tr>
				<tr>
					<td colspan="2"><%=ydto.getEmail()%></td>
				</tr>
				<tr>
					<th colspan="2">주 소</th>
				</tr>
				<tr>
					<td colspan="2"><%=ydto.getAddr()%></td>
				</tr>
				<tr>
					<th colspan="2">전 화 번 호</th>
				</tr>
				<tr>
					<td colspan="2"><%=ydto.getTel()%></td>
				</tr>
				<tr>
					<th colspan="2">가 입 날 짜</th>
				</tr>
				<tr>
					<td colspan="2"><%=ydto.getJoindate()%></td>
				</tr>
				
			</table>
			<br><br>
			<div class="updoutbt">
				<input type="button" value="회원정보수정" onclick="javascript:myUpdate();">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="회원탈퇴" onclick="javascript:myBye();">
			</div>

		</article>
		<!-- 폼으로 묶지 않고 인풋 버튼으로 온클릭 뿽숀 했음 -->
	</section>
	<div style="background-color: white;">
		<br>
		<br>
		<br>
	</div>
	<%@include file="../ykfooter.jsp"%>
</body>
</html>