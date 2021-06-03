<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "reser.ReserDTO" %>
<%@ page import = "java.sql.*" %>
<jsp:useBean id="reserdao" class = "reser.ReserDAO"></jsp:useBean>
<%
String id = (String)session.getAttribute("id");
if(id==null){
	%>
	<script>
	window.alert('로그인 후 이용 가능하십니다');
	location.href = '/semi';
	</script>
	<%
	return;
}
Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH)+1;
int date = cal.get(Calendar.DATE);
String today = year+"-"+month+"-"+date;


//checkout이 안된 정보들을 id를 기준을 가져온단.
ArrayList<ReserDTO> list = reserdao.reserCheck(today, id);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel= "styleSheet" type="text/css" href = "../css/ykLayout.css">
<style>
    .table {
    width:1000px;
      border-collapse: collapse;
      border-top: 3px solid #695e5e;
      margin:0px auto;
         margin-top:50px;
    }  
    .table th {
      color: #695e5e;
      background: #dad6d6;
      text-align: center;
    
    }
    .table td{
     height:60px;
     font-size: 18px;
    }
    .table th, .table td {
      padding: 10px;
      border: 1px solid #ddd;
       
    }
    .table th:first-child, .table td:first-child {
      border-left: 0;
    }
    .table th:last-child, .table td:last-child {
      border-right: 0;
    }
    .table tr td:first-child{
      text-align: center;
    }
    .table caption{
   	 caption-side: bottom;
     display: none;
     }
  </style>
<script type="text/javascript">
function cancel(idx) {
	if(window.confirm('예약을 취소하시겠습니까?')){
		location.href = 'reserCancel.jsp?room_reser_idx_s='+idx;
	}
}
</script>
</head>
<body>
	<%@ include file = "../ykheader.jsp" %>

	<br><br><br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->

	<section>
		<article style="margin:0px auto;text-align:center;">
		<h2>예약 확인 / 취소</h2>
			<table class = "table">
				<thead>
					<tr>
						<th>예약 번호</th>
						<th>예약 방</th>
						<th>체크인</th>
						<th>체크아웃</th>
						<th>인원</th>
						<th>금액</th>
						<th>예약자</th>
						<th>바베큐</th>
						<th>취소</th>
						
					</tr>
				</thead>
				<tbody>
					<%
					if(list!=null){
						for(int i = 0 ; i < list.size(); i++){
							%>
							<tr>
									<td><%=list.get(i).getReser_idx() %></td>
									<td><%=list.get(i).getReser_room() %></td>
									<td><%=list.get(i).getReser_checkin() %></td>
									<td><%=list.get(i).getReser_checkout() %></td>
									<td><%=list.get(i).getReser_person() %></td>
									<td><%=list.get(i).getReser_price() %></td>
									<td><%=list.get(i).getReser_id() %></td>
									<td><%=list.get(i).getReser_bbc()==1?"사용":"사용 안함" %></td>
									<td><input type = "button" name = "cancelBt" value = "예약 취소" onclick= "cancel(<%=list.get(i).getReser_idx()%>)"></td>
							</tr>
							<%
						}
					}else{
						%>
						<td>예약된 방이 없습니다.</td>
						<%
					}
					%>
				</tbody>
			</table>
		</article>
	</section>
	<br><br><br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->
	<%@ include file = "../ykfooter.jsp" %>
</body>
</html>