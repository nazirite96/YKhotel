<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String checked="";
String id="";
Cookie saveid[] = request.getCookies();
if(saveid!=null){
	for(int i=0;i<saveid.length;i++){
		if("id".equals(saveid[i].getName())){
			id=saveid[i].getValue();
			checked="checked";
		}
	}	
}else{
	checked="";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
text-align: center;
}
form {
	text-align: center;
}
.iddiv input{
	width: 300px;
	height: 30px;
	border: 0px;
	border-bottom: 1px solid lightgray;
}

.pwddiv input {
	width: 300px;
	height: 30px;
	border: 0px;
	border-bottom: 1px solid lightgray;
	margin-bottom: 10px;
}

.loginul {
	text-align: center;
	margin-right: 40px;
}

.loginul li {
	list-style-type: none;
	display: inline;
}

.loginbt {
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

a:link { 
color: black; text-decoration: none;
}
 a:visited {
  color: black; text-decoration: none;
  }
 a:hover {
  color: #bd5734; text-decoration: none;
  }


</style>

<script>
function joingo(){
	
	opener.location.href='/semi/yk_member/yk_memberJoin.jsp';
	self.close();
	
}
</script>

</head>
<body>
<section>
<form name="loginfm" action="/semi/yk_member/yk_login_ok.jsp">

	<h2>로그인</h2>
	<div class="iddiv"><input type="text" name="id" value="<%=id%>" placeholder="아이디"></div>
	<div class="pwddiv"><input type="password" name="password" placeholder="비밀번호"></div>
	<div>
	<input type="submit" value="LOGIN"  class="loginbt">
	</div>
    <div class="cbxdiv">
	<input type="checkbox" name="saveid" value="on" <%=checked%> >ID저장
	</div>
	<div>
	<ul class="loginul">
	<li><a href="/semi/yk_member/yk_idFind.jsp">아이디찾기</a></li>
	<li><a href="/semi/yk_member/yk_pwdFind.jsp">비밀번호찾기</a></li>
	<li><a href="javascript:onclick=joingo()">회원가입</a></li>
	</ul>
	</div>
   
</form>
</section>
</body>
</html>