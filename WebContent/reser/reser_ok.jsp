<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "reser.*" %>
<%@ page import = "java.sql.*" %>  
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "room.RoomDTO" %>
<jsp:useBean id="roomdao" class = "room.RoomDAO"></jsp:useBean>
<jsp:useBean id="reserdao" class = "reser.ReserDAO"></jsp:useBean>
<%
	String room_idx_s = request.getParameter("room_idx");
	int reser_room = Integer.parseInt(room_idx_s);
	RoomDTO roomDto = roomdao.getSelectRoom(reser_room);
	String strdate = request.getParameter("strdate");
	String enddate = request.getParameter("enddate");
	String id = request.getParameter("id");
	String totalprice_s = request.getParameter("reser_totalprice_s");
	String reser_bbc_s = request.getParameter("reser_bbc");
	int reser_bbc = 0;
	if(reser_bbc_s!=null){
		reser_bbc = Integer.parseInt(reser_bbc_s);
	}
	int totalprice = Integer.parseInt(totalprice_s);
	java.sql.Date reser_checkin = null;
	java.sql.Date reser_checkout = null;
	
	try{ // String Type을 Date Type으로 캐스팅하면서 생기는 예외로 인해 여기서 예외처리 해주지 않으면 컴파일러에서 에러가 발생해서 컴파일을 할 수 없다.
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    // strdate,enddate 두 날짜를 parse()를 통해 Date형으로 변환.
	    java.util.Date FirstDate = format.parse(strdate);
	    java.util.Date SecondDate = format.parse(enddate);
	    reser_checkin= new java.sql.Date(FirstDate.getTime());
	    reser_checkout = new java.sql.Date(SecondDate.getTime());
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	//checkin,checkout,person,totalprice,id
	System.out.println(reser_checkin);
	System.out.println(reser_checkout);
	int result = reserdao.reserInsert(reser_room, reser_checkin, reser_checkout, roomDto.getRoom_minperson(), totalprice, id ,reser_bbc);
	
	String msg = result>0?"예약 성공하셨습니다.":"예약 실패하셨습니다.";
 
%>
<script>
	window.alert('<%=msg%>');
	location.href = "reserStatus.jsp";
	
</script>


    