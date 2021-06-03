<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/ykLayout.css">
<style>
table {
	width: 700px;
	margin: 0px auto;
	border-spacing: 15px;
	position: relative;
	right: 50px;
}

section {
	text-align: center;
}

section article h1 {
	font-size: 25px;
	margin-bottom: 90px;
}

.nametd {
	text-align: right;
	width: 14%;
}

.titletd input {
	border: 2px solid lightgray;
	border-radius: 4px;
	width: 100%;
	height: 30px;
}

.contd textarea {
	border: 2px solid lightgray;
	border-radius: 4px;
	width: 100%;
	height: 400px;
	resize: none;
}
</style>
<%
String sname=(String)session.getAttribute("sname");
String id =(String)session.getAttribute("id");
%>
</head>
<body>
	<%@include file="/ykheader.jsp"%>
	<br><br><br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->
	<br>
	<br>
	<br>
	<br>
	<section>
		<article>
			<h1>Q&A 글쓰기</h1>
		</article>
		<form name="qnaWrite" action="qnaWrite_ok.jsp">
			<table>
				<thead>
					<tr>
						<td class="nametd">제목</td>
						<td colspan="3" align="left" class="titletd">
						<input type="text" name="qna_subject" maxlength="50" required="required">
						</td>
					</tr>
					<tr>
						<td class="nametd">ID</td>
						<td colspan="3" align="left" class="filetd">
						<input type="hidden" name="qna_id" value="<%=id%>">
						<input type="text" name="qna_id" value="<%=id %>" readonly style="border:0;" >
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td colspan="3" class="contd"><textarea cols="80" rows="20"
								name="qna_content" required="required"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" value="글쓰기">&nbsp;&nbsp;
			<input type="reset" value="다시작성">
		</form>
	</section>
	<%@include file="/ykfooter.jsp"%>
</body>
</html>