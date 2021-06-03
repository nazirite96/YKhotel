<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*"%>  <!-- multipartrequest 사용을 위한 임포트 -->
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<jsp:useBean id="dto" class = "room.review.RoomReviewDTO"></jsp:useBean>
<jsp:useBean id="rrdao" class = "room.review.RoomReviewDAO"></jsp:useBean>

<%
//룸 리뷰 업데이트

ServletContext context = getServletContext();
String saveDir = context.getRealPath("upload");

int maxsize=1024*1024*5;

try{
	MultipartRequest multi= new MultipartRequest(request,saveDir,maxsize,"UTF-8",
		new DefaultFileRenamePolicy());
	
	dto.setRoom_review_content(multi.getParameter("room_review_content"));
	dto.setRoom_review_id(multi.getParameter("room_review_id"));
	int room_review_roomidx =Integer.parseInt(multi.getParameter("room_review_roomIdx"));
	dto.setRoom_review_roomIdx(room_review_roomidx);
	int room_review_starScore = Integer.parseInt(multi.getParameter("room_review_starScore"));
	dto.setRoom_review_starScore(room_review_starScore);

	Enumeration files = multi.getFileNames();
	String room_review_img_s = (String)files.nextElement();
	String room_review_img = multi.getFilesystemName(room_review_img_s);
	if(room_review_img==null||room_review_img.equals("")){  
		room_review_img="base.jpg";
	}
	dto.setRoom_review_img(room_review_img);
}catch(Exception e){
	e.printStackTrace();
	%>
	<script>
	window.alert('용량이 부족합니다!');
	</script>
	
	<% 
}


int r = rrdao.insertRoomReview(dto);

%>
<script type="text/javascript">
window.alert('<%=r%>');
window.opener.location.href = window.opener.document.URL;

window.self.close();
</script>
