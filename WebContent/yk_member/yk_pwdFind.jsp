<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2 {
	margin: 35px;
}

body {
	text-align: center;
}

form {
	text-align: center;
}

.pwddiv input {
	width: 350px;
	height: 38px;
	border: 0px;
	border-bottom: 1px solid lightgray;
}

.emaildiv input {
	width: 350px;
	height: 38px;
	border: 0px;
	border-bottom: 1px solid lightgray;
	margin-bottom: 10px;
}

.pwdfbt {
	font-style: italic;
	font-size: 19px;
	width: 350px;
	height: 38px;
	border: 0px;
	color: white;
	background-color: #404040;
	border-radius: 4px;
	margin: 10px;
}
</style>
</head>
<body>
	<section>
		<form action="yk_pwdFind_ok.jsp">

			<h2>비밀번호 찾기</h2>
			<div class="pwddiv">
				<input type="text" name="pid" placeholder="아이디" required="required">
			</div>
			<div class="emaildiv">
				<input type="text" name="pemail" placeholder="E-mail" required="required">
			</div>
			<div>
				<input class="pwdfbt" type="submit" value="비밀번호 찾기">
			</div>
		</form>
	</section>
</body>
</html>