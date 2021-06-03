<%@page import="room.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="rdao" class="room.RoomDAO" ></jsp:useBean> >
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  type="text/css"  href="/semi/css/ykLayout.css">
<link rel="stylesheet"  type="text/css"  href="/semi/css/roommainLayout.css">
</head>
<body>
<%@include file="/ykheader.jsp" %>
<br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->

<div class="allwrap"> 

<div class="wrap">
<img src="/semi/img/map.jpg">
</div>

<div class="mainnameDiv">
 <div><span>POOL VLLA PENSION</span><br><h1>YK_HOUSE</h1></div>
</div>
 
 <%
 ArrayList<RoomDTO> arr= rdao.getRoom();

 %>
 
 
<div class="poin1 poin">
<a href="showroom.jsp?room_idx=<%=arr.get(0).getRoom_idx() %>"  class="roomAtag"><img src="/semi/img/pin.png" ></a>
<div class="roomtext moon1" >
<a href="showroom.jsp?room_idx=<%=arr.get(0).getRoom_idx() %>"  class="roomAtag">
&nbsp;Moon 101호&nbsp;</a>
</div>
</div>


<div class="poin2 poin">
<a href="showroom.jsp?room_idx=<%=arr.get(1).getRoom_idx() %>"  class="roomAtag"><img src="/semi/img/pin.png" ></a>
<div class="roomtext moon2"><a href="showroom.jsp?room_idx=<%=arr.get(1).getRoom_idx() %>"  class="roomAtag">
&nbsp;Moon 102호&nbsp;</a>
</div>
</div>


<div class="poin3 poin">
<a href="showroom.jsp?room_idx=<%=arr.get(2).getRoom_idx() %>"  class="roomAtag" ><img src="/semi/img/pin.png"  ></a>
<div class="roomtext galaxy1"><a href="showroom.jsp?room_idx=<%=arr.get(2).getRoom_idx() %>"  class="roomAtag">
&nbsp;Galaxy 201호&nbsp;</a>
</div>
</div>


<div class="poin4 poin">
<a href="showroom.jsp?room_idx=<%=arr.get(3).getRoom_idx() %>"  class="roomAtag"><img src="/semi/img/pin.png"  ></a>
<div class="roomtext galaxy2"><a href="showroom.jsp?room_idx=<%=arr.get(3).getRoom_idx() %>"  class="roomAtag">
&nbsp;Galaxy 202호&nbsp;</a>
</div>
</div>


<div class="cafe">CAFE</div>

</div>


<%@include file="/ykfooter.jsp" %>
</body>
</html>