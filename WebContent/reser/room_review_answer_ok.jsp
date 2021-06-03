<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rrdao" class = "room.review.RoomReviewDAO"></jsp:useBean>    
<%
String idx_s = request.getParameter("room_review_roomidx");
int idx = Integer.parseInt(idx_s);
String ref_s = request.getParameter("room_review_ref");
int ref = Integer.parseInt(ref_s);
String content = request.getParameter("room_review_content");
int result =rrdao.insertRoomReviewAnswer(idx, content, ref);

String msg = result>0?"답글 등록 성공":"답글 등록 실패";
%>

<script type="text/javascript">

window.opener.location.href = window.opener.document.URL;
window.self.close();
</script>
