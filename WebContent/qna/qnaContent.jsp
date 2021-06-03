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
	var qna_result=window.confirm('삭제 하시겠습니까?');
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
}
div{
text-align: center;
}

</style>
</head>
<body>
	<%@ include file="/ykheader.jsp"%>
	<br><br><br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->
	<section>
		<article>
			<h1>
				<br>Q&A<br>묻고 답하기
			</h1>
		</article>
		<table class="tabcon" cellspacing="0">
			<thead>
				<tr>
					<td class="tdsmall">제목</td>
					<td colspan="3" align="left" class="tdsub">&nbsp;&nbsp; <%
					if(dto.getQna_subject()==null){
					%> <%=dto.getQna_subject() %> <%
					}else if(dto.getQna_ref()>=9999){
					%> [공지사항]<%=dto.getQna_subject() %> 
					<%
					}else {
					%>	
					<%=dto.getQna_subject() %>
					<%	
					}
					%>
					</td>
					<td class="tdsmall">조회수</td>
					<td class="tdsmall2"><%=dto.getQna_readnum() %></td>
				</tr>
				<tr>
					<td class="tdsmall">아이디</td>
					<td class="tdid">&nbsp;&nbsp;<%=dto.getQna_id() %></td>
					<td class="tdsmall"></td>
					<td class="tdsmall2"></td>
					<td class="tdsmall">작성일</td>
					<td class="tddate">&nbsp;&nbsp;<%=dto.getQna_writedate() %></td>
				</tr>
			</thead>
			<tr style="height: 280px;">
				<td colspan="6" valign="center" class="tdcon">
					<%
							if (dto.getQna_content() == null) {
						%> <%=dto.getQna_content()%> <%
					 	} else {
					 %> <%=dto.getQna_content().replaceAll("\n", "<br>")%> <%
					 	}
					 %>
				</td>
			</tr>
			<tr>
				<td colspan="6" align="right">
					<%
							if (!session.getAttribute("id").equals(dto.getQna_id()) && !session.getAttribute("master").equals(1)) {
							// yk_member가 쓴 게시글이 qna_id랑 다르고 master의 값이 1이 아닐때  목록만 보이게함
						%> <a href="qnaList.jsp">목록</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <%
					 	} else if (session.getAttribute("id").equals(dto.getQna_id()) && !session.getAttribute("master").equals(1)) {
					 // yk_member가 쓴 게시글이 qna_id랑 같고 master의 값이 1이 아닐때 목록 수정 삭제만 보여주게함
					 %> <a href="qnaList.jsp">목록</a> &nbsp;&nbsp;&nbsp;&nbsp;
					<a href="qnaUpdate.jsp?qna_idx=<%=dto.getQna_idx()%>">수정</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:qna_Delete_Ok();">삭제</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <%
 					}
					 if (session.getAttribute("master").equals(1)) {// 마스터의 컬럼이 1이라는 가정하에 목록 수정 삭제 답변쓰기 보임
					 %> <a href="qnaList.jsp">목록</a> &nbsp;&nbsp;&nbsp;&nbsp;
					<a href="qnaUpdate.jsp?qna_idx=<%=dto.getQna_idx()%>">수정</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:qna_Delete_Ok();">삭제</a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<%
					if(dto.getQna_ref()<9999){
					%> 
					<a href="qnaReWrite.jsp?qna_subject=<%=dto.getQna_subject()%>&
				qna_ref=<%=dto.getQna_ref()%>&qna_lev=<%=dto.getQna_lev()%>&
				qna_sunbun=<%=dto.getQna_sunbun()%>">답변쓰기</a>
					<%
					}
							}
						%>
				</td>
			</tr>
		</table>
		</article>
	</section>
	<%@ include file="/ykfooter.jsp"%>
</body>
</html>