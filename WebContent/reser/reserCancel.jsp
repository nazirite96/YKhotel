<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<jsp:useBean id = "rdao" class = "reser.ReserDAO"></jsp:useBean>
<%
	String reser_idx_s = request.getParameter("room_reser_idx_s");
	int reser_idx = Integer.parseInt(reser_idx_s);
	int result = rdao.reserCancel(reser_idx);
	String msg = result>0?"예약이 취소되었습니다.":"삭제 실패하셨습니다.";
	//ss
	%>
<script type="text/javascript">
window.alert('<%=msg%>');
location.href = "reserStatus.jsp";
</script>