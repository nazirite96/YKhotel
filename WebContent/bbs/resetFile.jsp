<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="bdao" class="bbs.BbsDAO" scope="session"></jsp:useBean>
<%

//이미업로드된 이미지를 공용폴더에서 삭제해줌.

String idx_s=request.getParameter("idx");
Integer idx=Integer.parseInt(idx_s);
String imgname=request.getParameter("imgname");
int result=bdao.resetFile(imgname,idx);

if(result>0){
	%>
	<script>
	window.alert('파일이 초기화되었습니다.');
	location.href=document.referrer;
	</script>
	<%
}else{
	%>
	<script>
	window.alert('파일이 초기화실패');
	location.href=document.referrer;
	</script>
	<%
}

%>