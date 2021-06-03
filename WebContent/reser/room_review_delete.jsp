<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="rrdao" class = "room.review.RoomReviewDAO"></jsp:useBean>
<%
String room_idx = request.getParameter("room_idx");
String room_review_idx_s=request.getParameter("room_review_idx");
int room_review_idx = 0;
if(room_review_idx_s!=null||!room_review_idx_s.equals("")){
	room_review_idx = Integer.parseInt( room_review_idx_s);
	
}
int result = rrdao.deleteRoomReview(room_review_idx);
String msg = result>0?"삭제성공":"삭제실패";
%>
<script>
	window.alert('<%=msg%>');
	location.href="/semi/reser/room_review.jsp?room_idx="+<%=room_idx%>;
</script>