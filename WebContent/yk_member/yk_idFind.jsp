<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.namediv input{
	width: 300px;
	height: 30px;
	border: 0px;
	border-bottom: 1px solid lightgray;
}
.emaildiv input{
	width: 300px;
	height: 30px;
	border: 0px;
	border-bottom: 1px solid lightgray;
	margin-bottom: 10px;
}
.idfbt{
font-style:italic;
	font-size:17px;
	width: 300px;
	height: 30px;
	border: 0px;
	color: white;
	background-color: #404040;
	border-radius: 4px;
	margin:10px;
}
</style>
</head>
<body>
<section>
<form action="yk_idFind_ok.jsp">

	<h2>아이디 찾기</h2>
	<div class="namediv"><input type="text" name="fname" placeholder="이름"></div>
	<div class="emaildiv"><input type="text" name="femail" placeholder="E-mail"></div>
	<div>
	<input class="idfbt" type="submit" value="아이디찾기">
	</div>
</form>
</section>
</body>
</html>