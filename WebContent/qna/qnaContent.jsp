<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="qna.*"%>
<jsp:useBean id="qdao" class="qna.QnaDAO" scope="session"></jsp:useBean>
<%
	String idx_s = request.getParameter("qna_idx");
if (idx_s == null || idx_s.equals("")) {
	idx_s = "0";
}
System.out.println(idx_s);
int qna_idx = Integer.parseInt(idx_s);
QnaDTO dto = qdao.getQnaContent(qna_idx);
if (dto == null) {
%>
<script>
	window.alert('삭제된 게시글이거나 비정상적인 접근 입니다.');
	location.href='qnaList.jsp';
	</script>
<%
	return;
}
if (session.getAttribute("id") == null) {
%>
<script>
	window.alert('로그인 후에 이용 해주시길 바랍니다.');
	location.href='qnaList.jsp';
	</script>
<%
	return;
}
%>
<script>
function qna_Delete_Ok(){
	var qna_result=window.confirm('해당 게시글을 삭제 하시겠습니까?');
	if(qna_result==true){
		location.href='qnaOpenDelete.jsp?qna_idx=<%=dto.getQna_idx()%>&qna_lev=<%=dto.getQna_lev()%>&qna_ref=<%=dto.getQna_ref()%>';
		}
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/ykLayout.css">
<style>
.Qnaa a { /*클릭한메뉴 색바꾸기*/
	color: #bd5734;
	font-weight: bold;
}

.contentimg{
width:100%;
}

.tabcon {
	width: 900px;
	margin: 0px auto;
}

.tabcon td {
	font-size: 16px;
	height: 45px;
}

.tdsmall {
	text-align: center;
	width: 15%;
	border-bottom: 1px solid lightgray;
}

.tdsmall2 {
	text-align: center;
	font-weight: bold;
	width: 1%;
	border-bottom: 1px solid lightgray;
}

.tdsub {
	font-weight: bold;
	width: 70%;
	border-bottom: 1px solid lightgray;
}

.tddate {
	text-align: left;
	font-weight: bold;
	border-bottom: 1px solid lightgray;
	width: 20%;
}

.tdid {
	text-align: left;
	font-weight: bold;
	width: 25%;
	border-bottom: 1px solid lightgray;
}

.tdcon {
	text-align: center;
}

section {
	text-align: center;
}

section article h1 {
	font-size: 26px;
	margin-top : 0px;
}

div {
	text-align: center;
}

a.awrite {
	background-color: white;
	color: gray;
}

span {
	color: #bd5734;
	font-weight: bold;
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
</head>
<body>
	<%@ include file="/ykheader.jsp"%>
	<br>
	<br>
	<br>
	<!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->

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
		<br>
		<br>
		<br>
		<br>
	</div>

	<section style="background-color: white;">
		<article>
			<h1>
				<br>Q&A<br>묻고 답하기
			</h1>
		</article>
		<table class="tabcon" cellspacing="0">
			<thead>
				<tr>
					<td class="tdsmall">제목</td>
					<td colspan="3" align="left" class="tdsub">&nbsp; <%
				 	if (dto.getQna_subject() == null) {
				 %> <%=dto.getQna_subject()%> <%
				 	} else if (dto.getQna_ref() >= 9999) {
				 %> <span>[공지사항]</span><%=dto.getQna_subject()%> <%
				 	} else {
				 %> <%=dto.getQna_subject()%> <%
				 	}
				 %>
					</td>
					<td class="tdsmall">조회수</td>
					<td class="tdsmall2"><%=dto.getQna_readnum()%></td>
				</tr>
				<tr>
					<td class="tdsmall">아이디</td>
					<td class="tdid">&nbsp;&nbsp;<%=dto.getQna_id()%></td>
					<td class="tdsmall"></td>
					<td class="tdsmall2"></td>
					<td class="tdsmall">작성일</td>
					<td class="tddate">&nbsp;&nbsp;&nbsp;&nbsp;<%=dto.getQna_writedate()%></td>
				</tr>
			</thead>
			<tr style="height: 280px;">
				<td colspan="6" valign="center" class="tdcon">
				<br><br><br>
					<%
						if (dto.getQna_content() == null) {
					%> <%=dto.getQna_content()%> <%
					 	} else {
					 %> <%=dto.getQna_content().replaceAll("\n", "<br>")%> <%
					 	}
					 %>
					 <br><br><br>
				</td>
			</tr>
			<tr>
				<td colspan="6" align="right">
				
					<%
						if (!session.getAttribute("id").equals(dto.getQna_id()) && !session.getAttribute("master").equals(1)) {
						// yk_member가 쓴 게시글이 qna_id랑 다르고 master의 값이 1이 아닐때  목록만 보이게함
					%> <a href="qnaList.jsp" class="awrite">목록</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <%
					 	} else if (session.getAttribute("id").equals(dto.getQna_id()) && !session.getAttribute("master").equals(1)) {
					 // yk_member가 쓴 게시글이 qna_id랑 같고 master의 값이 1이 아닐때 목록 수정 삭제만 보여주게함
					 %> <a href="qnaList.jsp" class="awrite">목록</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a
					href="qnaUpdate.jsp?qna_idx=<%=dto.getQna_idx()%>" class="awrite">수정</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:qna_Delete_Ok();"
					class="awrite">삭제</a> &nbsp;&nbsp;&nbsp;&nbsp; <%
					 	}
					 if (session.getAttribute("master").equals(1)) {// 마스터의 컬럼이 1이라는 가정하에 목록 수정 삭제 답변쓰기 보임
					 %> <a href="qnaList.jsp" class="awrite">목록</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a
					href="qnaUpdate.jsp?qna_idx=<%=dto.getQna_idx()%>" class="awrite">수정</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:qna_Delete_Ok();"
					class="awrite">삭제</a> &nbsp;&nbsp;&nbsp;&nbsp; <%
					 	if (dto.getQna_ref() < 9999) {
					 %> <a
					href="qnaReWrite.jsp?qna_subject=<%=dto.getQna_subject()%>&
				qna_ref=<%=dto.getQna_ref()%>&qna_lev=<%=dto.getQna_lev()%>&
				qna_sunbun=<%=dto.getQna_sunbun()%>"
					class="awrite">답변쓰기</a> <%
						 	}
						 }
						 %>
				</td>
			</tr>
		</table>
		</article>
	</section>
	<div style="background-color: white;">
		<br>
		<br>
		<br>
		<br>
	</div>
	<%@ include file="/ykfooter.jsp"%>
</body>
</html>