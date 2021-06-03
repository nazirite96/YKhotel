<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdao" class="qna.QnaDAO"></jsp:useBean>
<%
String idx_s=request.getParameter("qna_idx");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}
int qna_idx = Integer.parseInt(idx_s);

String qna_ref_s = request.getParameter("qna_ref");
int qna_ref = Integer.parseInt(qna_ref_s);

String qna_lev_s = request.getParameter("qna_lev");
int qna_lev = Integer.parseInt(qna_lev_s);

if(qna_lev==0){//부모게시글이 지워지면 자식 게시글까지 지워지는것
	int result = qdao.qnaAllDelete(qna_ref);
	if(result>0){
		%>
		<script>
		location.href='qnaList.jsp';
		</script>
		<%
	}else{
		%>
		<script>
		window.alert('삭제실패');
		location.href='qnaList.jsp';
		</script>
		<%
	}
}else{//원하는 게시글만 지우는것
	int result = qdao.getDelQna(qna_idx);
	if(result>0){
		%>
		<script>
		location.href='qnaList.jsp';
		</script>
		<%
	}else{
		%>
		<script>
		window.alert('삭제실패');
		location.href='qnaList.jsp';
		</script>
		<%
	}
}
%>
