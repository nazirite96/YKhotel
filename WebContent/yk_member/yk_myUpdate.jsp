<%@page import="member.YkMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="ykdto" class="member.YkMemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ykdto" />
<jsp:useBean id="ykdao" class="member.YkMemberDAO"></jsp:useBean>
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
	margin: 0px auto;
}

.profup_article {
	margin: 0px auto;
	text-align: center;
	width: 600px;
	height: auto;
	background-color: white;
}

.profup_article table {
	width: 350px;
	height: 500px;
	margin: 0px auto;
	text-align: center;
	border: 1px solid #a79e84;
	border-radius: 10px;
}

.profup_article table th {
	width: 300px;
	height: 25px;
	font-size: 15px;
	background-color: #a79e84;
	color: white;
	text-align: center;
}

.profup_artile table td {
	text-align: center;
	height: 25px;
}

.profup_article td input {
	height: 28px;
	width: 320px;
	margin: 5px 5px;
	border: 1px dashed #a79e84;
}

.updatebt input {
	font-size: 16px;
	width: 130px;
	height: 30px;
	margin-bottom: 40px;
	background-color: #404040;
	border-radius: 10px;
	color: white;
	text-align: center;
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
	width: 350px;
	top: 120px;
}

.introimg_art img {
	width: 100%;
	height: 370px;
}
</style>
</head>

<body>
	<%@include file="../ykheader.jsp"%>
	<br>
	<br>
	<br>
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
		<div class="playtext">'<%=ydto.getName()%>' 님의 회원정보 수정</div>
	</div>
	<div style="background-color: white;">
		<br> <br> <br> <br>
	</div>

	<section style="background-color: white;">
		<form action="/semi/yk_member/yk_myUpdate_ok.jsp">
			<!-- 수정하기 폼액션으로 묶었음 -->
			<article class="profup_article">
				<table>
					<tr>
						<th colspan="2">아 이 디</th>
					</tr>
					<tr>
						<td colspan="2"><input type="hidden" name="id"
							value="<%=id%>" readonly><%=id%></td>
					</tr>
					<tr>
						<th colspan="2">이 름</th>
					</tr>
					<tr>
						<td colspan="2"><input type="text" name="name"
							value="<%=ydto.getName()%>" placeholder="수정가능"
							required="required"></td>
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
						<td colspan="2"><input type="text" name="email"
							value="<%=ydto.getEmail()%>" required="required"></td>
					</tr>
					<tr>
						<th colspan="2">주 소</th>
					</tr>
					<tr>
						<td colspan="2"><input type="text" name="addr"
							value="<%=ydto.getAddr()%>" required="required"></td>
					</tr>
					<tr>
						<th colspan="2">전 화 번 호</th>
					</tr>
					<tr>
						<td colspan="2"><input type="text" name="tel"
							value="<%=ydto.getTel()%>" required="required"></td>
					</tr>
					<tr>
						<th colspan="2">가 입 날 짜</th>
					</tr>
					<tr>
						<td colspan="2"><%=ydto.getJoindate()%></td>
					</tr>
				</table>
				<br><br>
				<div class="updatebt">
					<input type="submit" value="정보수정">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="다시작성">
				</div>

			</article>

		</form>
	</section>
	<div style="background-color: white;">
		<br>
		<br>
		<br>
	</div>
	<%@include file="../ykfooter.jsp"%>
</body>
</html>