<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="bdao" class="bbs.BbsDAO" scope="session"></jsp:useBean>
<%
/*게시글 고유번호로 파일삭제, 글삭제*/
String hiddenidx=request.getParameter("idx");  //게시글번호
Integer idx=Integer.parseInt(hiddenidx);

String imgname=request.getParameter("imgname");

	int result=bdao.bbsDelete(imgname,idx);
	if(result>0){
		%>
		<script>
		window.alert('삭제되었습니다');
		location.href='/semi/bbs/boardList.jsp';
		</script>
		<%
	}else{
		%>
		<script>
		window.alert('삭제실패');
		location.href='/semi/bbs/boardList.jsp';
		</script>
		<%		
	}
%>