<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdao" class="qna.QnaDAO"></jsp:useBean>
<jsp:useBean id="qdto" class="qna.QnaDTO"></jsp:useBean>
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
<body>
<%@ include file="/ykheader.jsp" %>
<br><br><br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->

<section>
	<article>
		<h2 style="text-align:center;">Q&A<br>묻고 답하기</h2>
		<form name="qnaUpdate" action="qnaUpdate_ok.jsp">
			<table width="550" cellspacing="0" style="margin:0px auto;border-top: 3px solid gray;">
				<tr><!-- idx값 넘겨주기 위해 hidden을 사용 -->
				<input type="hidden" name="qna_idx" value="<%=qdto.getQna_idx()%>">
					<th style="border-left: 1px solid gray;border-right: 1px solid gray;border-bottom: 1px solid gray;">
					제목
					</th><!-- 제목 -->
					<td colspan="3"  style="border-right: 1px solid gray;border-bottom: 1px solid gray; height: 25px">
					<input type="text" name="qna_subject" value="<%=qdto.getQna_subject() %>" size=50px  style="border:0;height: 25px" required="required">
					</td>
				</tr>
				<tr><!-- 작성자와,등록일 -->
					<th style="border-left: 1px solid gray;border-right: 1px solid gray;border-bottom: 1px solid gray;height: 25px;">작성자</th>
					<td style="border-bottom: 1px solid gray;"><%=qdto.getQna_id()%></td>
					<th style="border-left: 1px solid gray;border-right: 1px solid gray;border-bottom: 1px solid gray;height: 25px;">등록일</th>
					<td style="border-right: 1px solid gray;border-bottom: 1px solid gray"><%=qdto.getQna_writedate() %></td>
				</tr>
				<tr height="250"><!-- 수정을 눌렸을때 기존의 데이터들을 넘겨줌(글내용) -->
					<td colspan="4" align="Left" valign="top" style="border-left: 1px solid gray;border-right: 1px solid gray;border-bottom: 3px solid gray">
					<textarea rows="20" cols="75" name="qna_content" style="border:0;resize:none;"required="required"><%=qdto.getQna_content() %></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
					<input type="submit" value="게시글수정">
					<input type="reset" value="다시작성">
					<a href="javascript:history.back();"><input type="button" value="뒤로가기"></a>
					</td>
				</tr>
			</table>
		</form>
	</article>
</section>
<%@ include file="/ykfooter.jsp" %>
</body>
</html>