<%@page import="review.reviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@page import="java.sql.*" %>
	<%@page import="java.util.*" %>
	<%@page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>

	<jsp:useBean id="rdao" class="review.reviewDAO" scope="session"></jsp:useBean>

	<%
	String saveDirectory=application.getRealPath("/userimg");
	int maxPostSize= 1024*1024*10;
	String encoding="UTF-8";
	
	MultipartRequest mr=new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());

	String item="";
	String fileName=""; //파일명

	
	Enumeration files=mr.getFileNames();
	while(files.hasMoreElements()){
		item=(String)files.nextElement();
		fileName=mr.getFilesystemName(item);
	}
if(fileName==null||fileName.equals("")){
	
	fileName="base.jpg";
}
	
	
	reviewDTO rdto=new reviewDTO();
	int star=Integer.parseInt(mr.getParameter("review_star"));
	String sub=mr.getParameter("review_subject");
	String id=mr.getParameter("review_id");
	String con=mr.getParameter("review_content");
	int ref=Integer.parseInt(mr.getParameter("review_ref"));
	
	rdto.setReview_star(star);
	rdto.setReview_id(id);
	rdto.setReview_subject(sub);
	rdto.setReview_content(con);
	rdto.setReview_ref(ref);
	rdto.setReview_imgname(fileName);

	
	
	
	//이거는 글쓰기 기능~~~~~~~~~~~~~~~~~~~~이게없어질지도모름
	int count=rdao.postContent(rdto);
	String msg=count>0? "성공":"실패";
	
	%>
	<script type="text/javascript">

	window.alert('<%=msg%>');
	location.href="tourReview.jsp?tour_ref=<%=rdto.getReview_ref()%>";
</script>