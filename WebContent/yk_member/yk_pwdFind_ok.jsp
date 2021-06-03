<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="ykdao" class="member.YkMemberDAO"></jsp:useBean>
<%
	String id = request.getParameter("pid");
String email = request.getParameter("pemail");
int ran = ykdao.pwdFind(id, email);
if (ran == 0) {
%>
<script>
	window.alert('일치하는 정보가 없습니다');
	location.href = '/semi/yk_member/yk_pwdFind.jsp';
</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	text-align: center;
}

form {
	text-align: center;
}

.ckndiv2 input {
	width: 350px;
	height: 38px;
	border: 0px;
	border-bottom: 1px solid lightgray;
	margin-bottom: 15px;
}

.newpwdiv input {
	width: 350px;
	height: 38px;
	border: 0px;
	border-bottom: 1px solid lightgray;
	margin-bottom: 10px;
}

h2 {
	margin-bottom: 20px;
}

.ckndiv {
	margin-bottom: 30px;
}

.newpwdbt input {
	width: 350px;
	height: 38px;
	border: 0px;
	font-style: italic;
	font-size: 19px;
	background-color: #404040;
	border-radius: 5px;
	color: white;
	margin: 10px;
}
</style>
</head>
<body>
	<section>
		<form action="/semi/yk_member/yk_pwdUpdate_ok.jsp">

			<h2>비밀번호 찾기 및 변경하기</h2>
			<div class="ckndiv">
				인증번호 :
				<%=ran%></div>
			<div>
				<input type="hidden" name="ran" value="<%=ran%>">
			</div>
			<div>
				<input type="hidden" name="pwdid" value="<%=id%>">
			</div>
			<div class="ckndiv2">
				<input type="text" name="checknum" placeholder="인증번호"
					required="required">
			</div>
			<div class="newpwdiv">
				<input type="text" name="newpwd" placeholder="변경할 비밀번호"
					required="required">
			</div>
			<div class="newpwdbt">
				<input type="submit" value="비밀번호 변경">
			</div>
		</form>
	</section>
</body>
</html>