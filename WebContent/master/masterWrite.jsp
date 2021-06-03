<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mdap" class="member.YkMemberDAO"></jsp:useBean>
<!DOCTYPE html>
<%
	String id = (String) session.getAttribute("id");
String name = mdap.getUserNameInfo(id);
System.out.println(name);
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.titlemaster {
	display: table;
	width: 100%;
	margin: 0px auto;
	padding: 0;
	height: 70px;
	color: white;
	background-color: #404040;
	margin-bottom: 20px;
}

.titlemaster p {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
	margin-bottom: 50px;
}

.welcomediv {
	text-align: left;
	font-style: italic;
	font-size: 13px;
	margin-bottom: 45px;
}

body {
	text-align: center;
}

form {
	text-align: center;
}

.writediv input {
	width: 300px;
	height: 25px;
	border: 0;
	border: 1px solid lightgray;
	margin-bottom: 35px
}
</style>
</head>
<body>
	<section>
		<article>

			<form name="memofm" action="/semi/master/masterWrite_ok.jsp">
				<div class="titlemaster">
					<p>관리자 메모페이지</p>
				</div>
				<div>
					<input type="hidden" name="master_id" value="<%=id%>">
				</div>
				<div class="welcomediv">
					YK 펜션 :
					<%=name%>님 안녕하세요
				</div>
				<div class="writediv">
					<input type="text" name="master_content" required="required"
						placeholder="메모를 남겨주세요">
				</div>
				<div class="writebt">
					<input type="submit" value="등록하기"> <input type="reset"
						value="다시작성">
				</div>

			</form>

		</article>
	</section>
</body>
</html>