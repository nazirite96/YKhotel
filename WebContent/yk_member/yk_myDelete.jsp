<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2{
	margin: 35px;
}

body{
	text-align: center;
}

form{
	text-align: center;
}
.myiddiv input{
	width: 350px;
	height: 38px;
	border: 0px;
	border-bottom: 1px solid lightgray;
	margin-bottom: 10px;
}
.mypwddiv input{
	width: 350px;
	height: 38px;
	border: 0px;
	border-bottom: 1px solid lightgray;
	margin-bottom: 10px;
}
.mydelbt{
	font-style: italic;
	font-size: 19px;
	width: 380px;
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
		<form action="/semi/yk_member/yk_myDelete_ok.jsp">
			
				<h2>회 원 탈 퇴</h2>
				<div class="myiddiv">
					<input type="text" name="id" value="<%=id%>" required="required">
				</div>
				<div class="mypwddiv">
					<input type="text" name="password" placeholder="비밀번호" required="required">
				</div>
				<div>
					<input class="mydelbt" type="submit" value="회원탈퇴">
				</div>
			
		</form>
	</section>
</body>
</html>