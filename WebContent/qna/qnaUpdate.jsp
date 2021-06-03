<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdao" class="qna.QnaDAO" scope="session"></jsp:useBean>
<jsp:useBean id="qdto" class="qna.QnaDTO" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="qdto"/>
<%
String qna_idx_s = request.getParameter("qna_idx");
if(qna_idx_s==null||qna_idx_s.equals("")){
	qna_idx_s="0";
}
int qna_idx = Integer.parseInt(qna_idx_s);

qdto = qdao.getUpdateQna(qdto); //수정(글본문의 데이터를 넘겨주기 위해 쓴 메서드)
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/ykLayout.css">
</head>
<style>
.contentimg{
width:100%;
}

.tabcon{
width:700px;
margin: 0px auto;
}
.tabcon td{
font-size:16px;
height: 45px;
}

.tdsmall{
text-align:center;
width: 15%;
border-bottom:1px solid lightgray;
}
.tdsmall2{
text-align:center;
font-weight:bold;
width:1%;
border-bottom:1px solid lightgray;
}
.tdsub{
font-weight:bold;
width:70%;
border-bottom:1px solid lightgray;
}
.tddate{
text-align:left;
font-weight:bold;
border-bottom:1px solid lightgray;
width:20%;
}
.tdid{
text-align:left;
font-weight:bold;
width:25%;
border-bottom:1px solid lightgray;
}
.tdcon{
text-align:center;
}
section{
text-align: center;
}

section article h1{
font-size:26px;
margin-top : 0px;
}
div{
text-align: center;
}
input.buttonstyle {
    border: 0px;
    background-color: white;
    color: gray;
}
input.tdsubject {
    height: 45px;
    font-weight: bold;
    width: 550px;
    font-size: 16px;
}
/*메인이미지*/
.fixedImg {
	position: fixed;
	width: 100%;
	z-index: -1;
}

.fixedImg_wrap {
	text-align: center;
	width: 100%;
	height: 340px;
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
	width: 350px;
}

.play {
	font-family: Lucida Bright;
	font-size: 35px;
	width: 250px;
	top: 100px;
}

.playtext {
	font-family: Modern;
	font-size: 14px;
	width: 150px;
	top: 120px;
}

.introimg_art img {
	width: 100%;
	height: 450px;
}
</style>
<body>
<%@ include file="/ykheader.jsp" %>
<br><br><br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->

	<section>
		<article class="introimg_art">
			<div class="fixedImg">
				<img src="../img/728.jpg">
			</div>
		</article>
	</section>
	<div class="fixedImg_wrap">
		<img src="../img/5b.png">
		<div class="play">Happy YK House</div>
		<div class="playtext">행복을 전해드립니다!</div>
	</div>

	<div style="background-color: white;">
		<br> <br> <br> <br>
	</div>

	<section style="background-color: white;">
	<article>
		<h1 style="text-align:center;">Q&A<br>묻고 답하기</h1>
		<form name="qnaUpdate" action="qnaUpdate_ok.jsp">
			<table class="tabcon" cellspacing="0">
				<tr><!-- idx값 넘겨주기 위해 hidden을 사용 -->
				<input type="hidden" name="qna_idx" value="<%=qdto.getQna_idx()%>">
					<td class="tdsmall">제목</td><!-- 제목 -->
					<td colspan="5" align="left" class="tdsub">
					<input type="text" class="tdsubject" name="qna_subject" value="<%=qdto.getQna_subject() %>"style="border:0" required="required" >
					</td>
				</tr>
				<tr><!-- 작성자와,등록일 -->
					<td class="tdsmall">작성자</td>
					<td class="tdid"><%=qdto.getQna_id()%></td>
					<td class="tdsmall"></td>
					<td class="tdsmall2"></td>
					<td class="tdsmall">등록일</td>
					<td class="tddate">&nbsp;&nbsp;<%=qdto.getQna_writedate() %></td>
				</tr>
				<tr style="height: 280px;"><!-- 수정을 눌렸을때 기존의 데이터들을 넘겨줌(글내용) -->
					<td colspan="6" valign="center" class = "tdcon">
					<textarea rows="20" cols="100" name="qna_content" style="resize: none;border:0;"required="required"><%=qdto.getQna_content() %></textarea>
					</td>
				</tr>
				<br>
				<tr>
					<td colspan="6" align="right" class="buttonStyle">
					<input type="submit" value="게시글수정" class="buttonstyle">
					<input type="reset" value="다시작성" class="buttonstyle">
					<a href="javascript:history.back();"><input type="button" value="뒤로가기" class="buttonstyle"></a>
					</td>
				</tr>
			</table>
		</form>
	</article>
</section>
	<div style="background-color: white;">
		<br><br><br><br>
	</div>
<%@ include file="/ykfooter.jsp" %>
</body>
</html>