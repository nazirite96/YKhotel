<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "qna.*" %>
<jsp:useBean id="qdto" class="qna.QnaDTO" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="qdto"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/ykLayout.css">
</head>
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
String qna_subject = request.getParameter("qna_subject");
String qna_ref = request.getParameter("qna_ref");
String qna_lev = request.getParameter("qna_lev");
String qna_sunbun = request.getParameter("qna_sunbun");
String sname=(String)session.getAttribute("sname");
%>
<body>
<%@ include file="/ykheader.jsp" %>
<br><br><br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->

<section>
	<article>
		<h2 style="text-align:center;">Q&A 답변쓰기</h2>
	</article>	
			<form name="qnaReWrite" action="qnaReWrite_ok.jsp">
			<input type="hidden" name="qna_ref" value="<%=qna_ref %>">
			<input type="hidden" name="qna_lev" value="<%=qna_lev %>">
			<input type="hidden" name="qna_sunbun" value="<%=qna_sunbun %>">
			<table>
			<thead>
				<tr>
					<td class="nametd">제목</td><!-- 답변쓰기 했을때 보이는 제목 영역 -->
					<td colspan="3" align="left" class="titletd">
					<input type="text" name="qna_subject" maxlength="50" value="Re:><%=qna_subject%>" required="required">
					</td>
				</tr>
				<tr>	
					<td class="nametd">관리자</td><!-- 답변쓰기 했을때 보이는 ID 영역 -->
					<td colspa="3" align="left" class="filetd">
					<input type="text" name="qna_id" value="<%=sname%>" readonly style="border:0;"></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td colspan="3" class="contd"><!-- 답변쓰기 했을때 보이는 글내용 영역 -->
					<textarea rows="20" cols="80" name="qna_content" required="required"></textarea></td>
				</tr>
				</tbody>
			</table>
			<input type="submit" value="글쓰기">&nbsp;&nbsp;
			<input type="reset" value="다시작성">
		</form>
</section>
<%@ include file="/ykfooter.jsp" %>
</body>
</html>