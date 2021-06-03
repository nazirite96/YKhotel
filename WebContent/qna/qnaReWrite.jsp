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
.Qnaa a { /*클릭한메뉴 색바꾸기*/
	color: #bd5734;
	font-weight: bold;
}

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
	margin-top:0;
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
a.awrite {
    background-color: white;
    color: gray;
}
input.buttonstyle {
    border: 0px;
    background-color: white;
    color: gray;
}



/*메인이미지*/
.fixedImg{
position: fixed;
width:100%;
z-index:-1;
}
.fixedImg_wrap{
text-align:center;
width:100%;
height:340px;
background-color:rgba(57, 60, 30, 0.65);
position:relative;
z-index:1;
}
.fixedImg_wrap img{
width:60px;
position:relative;
top:70px;
}

.fixedImg_wrap div{
margin:0 auto;
color:white;
position:relative;
width: 350px;
}

.play{  font-family:Lucida Bright ;  font-size: 35px; width:250px;top:100px; }
.playtext{font-family:Modern;font-size: 14px; width:150px; top:120px;   }

.introimg_art img{
width:100%;
height: 450px;
}

a.awrite {
	background-color: white;
	color: gray;
	font-size: 15px;
}
input.inputimg{
  background-image : url('../img/icon_reply.gif'); 
  background-position:1%; 
  background-repeat:no-repeat;
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
<br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->

	<section>
		<article class="introimg_art">
			<div class="fixedImg">
				<img src="../img/728.jpg">
			</div>
		</article>
	</section>
	<div class="fixedImg_wrap">
		<img src="../img/5b.png">
		<div class="play">Play YK House</div>
		<div class="playtext">재밌게 즐기세요!</div>
	</div>

	<div style="background-color: white;">
		<br>
		<br>
		<br>
		<br>
	</div>

	<section style="background-color: white;">
	<article>
		<h1 style="text-align:center;">Q&A 답변쓰기</h1>
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
					<input type="text" name="qna_subject" maxlength="50" value="<%=qna_subject%>" required="required">
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
				<tfoot>
					<tr>
						<td colspan="3" style="text-align: right;">
						<input type="submit" value="글쓰기" class="buttonstyle" style="">&nbsp;&nbsp;
							<input type="reset" value="다시작성" class="buttonstyle"
							style="width: 70px; margin-right: 127px;">
							&nbsp;&nbsp;&nbsp;</td>
						<td style="width: 50px;text-align:right"><a href="qnaList.jsp" class="awrite">목록</a></td>
					</tr>
				</tfoot>				
			</table>
		</form>
</section>
	<div style="background-color: white;">
		<br><br><br><br>
	</div>
<%@ include file="/ykfooter.jsp" %>
</body>
</html>