<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="room.RoomDTO" %>
<jsp:useBean id="rdao" class = "room.RoomDAO"></jsp:useBean>
<jsp:useBean id="reserdao" class="reser.ReserDAO"></jsp:useBean>
<jsp:useBean id="rrdao" class="room.review.RoomReviewDAO"></jsp:useBean>
<%
/** 
	클라이언트 정책
	1.예약은 회원만
	2.예약은 오늘 기준으로 3개월 후까지
*/
String reser_id = (String)session.getAttribute("id");
if(reser_id==null){
	%>
	<script>
	window.alert('예약은 회원만 가능합니다.');
	window.location.href='/semi/index.jsp';
	</script>
	<%
	return;
}


ArrayList<RoomDTO> list = rdao.getRoom();
Calendar cal = Calendar.getInstance();
//기간 검색 시작 날짜
String strdate = request.getParameter("strdate");
if(strdate==null){
	strdate="";
}
//기간 검색 끝 날짜
String enddate = request.getParameter("enddate");
if(enddate==null){
	enddate="";
}
//달력 기능에 넘오는 year과 month를 파라미터로 받는다
String strYear = request.getParameter("strYear");
String strMonth = request.getParameter("strMonth");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
//오늘에 해당하는 년 월 일을 받는다.
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int toMon = month;//최소
int toYe = year;
//달력의 범위를 정해준다.
int maxMon = month+3;//최대
int maxYe = year;
if(maxMon>=12){
	maxYe=year+1;
}
int date = cal.get(Calendar.DATE);//오늘
//input태그 date타입에 들어갈 min과 max값을 만들어준다.(오늘 기준 3개월 간만 예약을 받기 위해)
String reserRangeStart = year + "-" + (month+1) + "-" + date;
cal.add(Calendar.MONTH, 3);
String reserRangeEnd =  sdf.format(cal.getTime());
//달력에서 받아오는 파라미터를 받아서 year에 넣는다.
if(strYear!=null){
	
	year = Integer.parseInt(strYear);
}
if(strMonth != null){//첫페이지시 현재날짜
	month = Integer.parseInt(strMonth);
	if(month==12){
		year+=1;
		month=0;
	}
	if(month==-1){
		year-=1;
		month=11;
	}
}
//입력받은 날로 오늘
cal.set(year, month, 1);//날짜로 셋팅
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);//달의 마지막 날
int start = cal.get(java.util.Calendar.DAY_OF_WEEK);//시작 요일
int newLine = 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel= "styleSheet" type="text/css" href = "../css/ykLayout.css">
<style>



@media only screen and (max-width : 1600px) {
.reser{   /*클릭한곳 색바꾸기*/
color:#bd5734;
font-weight: bold;
}
.reser:link { 
color: #bd5734; text-decoration: none; font-weight: bold;
}
 .reser:visited {
  color: #bd5734; text-decoration: none; font-weight: bold;
  } 
#content{
	margin : 0px auto;
	width:1200px;
}
table{
	margin : 0px auto;
	width:100%;
	border-spacing: 0;
	border-collapse: collapse;
}
.calmonth_table td{font-size: 25px;  font-family: Modern;}

.caldates_table{border:1px solid lightgray; margin-bottom:70px;}
.ok{color:#17B7A1; }
.no{color:#989898;  }
.reserOk_textdiv a{color:#17B7A1;}
.reserOk_textdiv a:linked{color:#17B7A1;}
.reserOk_textdiv a:visited{color:#17B7A1;}
.reserNo_textdiv{color:#989898;  }
.reserOk_textdiv span,.reserNo_textdiv span{
margin-left: 10px;
margin-right: 10px;
}


/*날짜검색하는부분*/


input[type="date"] {
    color: #95a5a6;
    font-family: "Helvetica", arial, sans-serif;
    font-size: 18px;
    border:1px solid #ecf0f1;
    background:#ecf0f1;
    padding:5px;
    display: inline-block;
    height:50px;
    width:150px;
}

input[type="date"]:hover {
    color: black;
}


input[type="date"], focus {
    color: #95a5a6;
}
/*검색 버튼*/
input[type = "submit"]{
  background:#663300;
  color:#fff;
  border:none;
  position:relative;
  width:110px;
  height:57px;
  font-size :20px;
}
.datetodate{
  font-size :30px;
}

#serchplease{
margin:0 auto;
	height: 100px;
    width: 600px;   
    font-size:25px;
    border-top:2px solid lightgray;
    padding:20px;

}
.checkinout{
	font-size: 20px;
    color: #686256;
}
.checkinoutdiv{
    font-family: 'Noto Sans KR','apple sd gothic neo', 'malgun gothic','dotum', 'arial', sans-serif;
    font-size: 18px;
    font-weight: 900;
    margin:auto;
    color: #363636;
    line-height: 1.6;
    width:1030px;
    text-align:left;
}
.serchal{
	font-family: 'Noto Sans KR','apple sd gothic neo', 'malgun gothic','dotum', 'arial', sans-serif;
	fontsize: 14px;
	font-weight: 500;
	margin:auto;
	width:1030px;
	text-align:left;
}
.roominfodiv{
	text-align:left;
	width:980px;
	overflow: hidden;
    position: relative;
    margin-top: auto;
    margin-right: auto;
    margin-bottom: 24px;
    margin-left: auto;
    background: #fff;
	padding: 24px 24px 24px 24px;
    border: 1px solid rgba(0,0,0,0.08);
    border-radius: 4px;
}
.roompic{
	display: inline-block;
	margin: 0 20px 0 0;
	float: left;
}
.roominfoname{
	display: block;
    height: 22px;
    padding: 0;
    font-size: 20px;
    font-weight: bold;
    line-height: 1;
}
.roominfomps{
	height: 37px;
	font-family: 'Noto Sans KR','apple sd gothic neo', 'malgun gothic','dotum', 'arial', sans-serif;
    padding-top: 3px;
    color : gray;
    font-size: 13px;
    font-weight: 500;
    line-height: 1;
    
}


.left_div{
border: 1px solid gray;
text-align:center;
border-radius: 50%;
width:35px;
height:35px;
display: inline-block;

}
.left_div b{
position:relative;
font-size:20px;
left:0;
top:-2px;
color:gray;
}

.right_div{
border: 1px solid gray;
text-align:center;
border-radius: 50%;
width:35px;
height:35px;
display: inline-block;
}
.right_div b{
position:relative;
font-size:20px;
left:0;
top:-2px;
color:gray;
}

.search_article{
text-align:center;
width:500px;
margin:0 auto;

}
.search_article h2{
margin-bottom:40px;
}
.reserdate_div{
margin-bottom:70px;
}
.roominfoprice{
	display: block;
	width : 567px;
    padding-top: 24px;
    border-bottom: 1px solid rgba(0,0,0,0.08);
	height: 42px;
    font-size: 16px;
    line-height: 1;
}

.roominfopricediv{
	padding-left: 396px;
	font-weight : bold;
	
}
.price{
	
	font-size : 20px;
	padding-left: 409px;
	
}

.review{
	font-family: 'Noto Sans KR','apple sd gothic neo', 'malgun gothic','dotum', 'arial', sans-serif;
	font-weight:200;
	padding-top: 17px;
}
.reserdiv{
	display: inline-block;
    width: 580px;
    padding-top: 19px;
}
}
.reserbt{
	display: block;
	cursor:pointer;
    width: 100%;
    height: 40px;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    font-weight: normal;
    color: #fff;
    text-align: center;
    background: #454140;
    
}
.star{
	font-size:18;
	color:#e4e43a;
}
.starscore{
	font-weight:bold;
}
.reviewcount{
   
	color : #808080;
}
}




</style>
<script>
<!-- 시작 날짜를 선택하면 끝날짜는 시작 날짜 이후로 부터 선택 가능하게 하는 함수  -->
	function setend() {
		var start = new Date(document.all.strdate.value);
	 	start.setDate(start.getDate()+1);
		document.all.enddate.min= start.getFullYear()+'-'+(start.getMonth()<10?('0'+(start.getMonth()+1)):(start.getMonth()+1))+'-'+(start.getDate()<10?('0'+start.getDate()):(start.getDate()));
		document.all.enddate.value = document.all.enddate.min;
	}
</script>
</head>
<body>
<%@ include file = "/ykheader.jsp" %>
<br><br><br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->
<section>


	<article>
<form name="calendarFrm" id="calendarFrm" action="" method="post">
	<div id="content" >
	<table >
	<tr>
	<td height="60">
	       <table class="calmonth_table" >
	    
	       <tr>
	             <td align="center" >
	                    <%
	                    //오늘 기준 3개월 까지 이번달이면 이전달 버튼이 없다.
	                    if(month !=toMon){ %>
		                    <a href="reserStatus.jsp?strdate=<%=strdate %>&enddate=<%=enddate %>&strMonth=<%=(month-1)%>&strYear=<%=year %>" target="_self">
		                           <div class="left_div"><b >&#10092;</b></div><!-- 이전달 -->
		                    </a>
	                    <%
	                    }
	                    %>
		                    &nbsp;&nbsp;
			                    <%=year%>년
			                    <%=month+1%>월
		                    &nbsp;&nbsp;
	                    <%
	                    //오늘기준 3개월 후면 다음달 버튼이 없다.
	                    if(month !=(maxMon%12) ){
	                    	%>
		                    <a href="reserStatus.jsp?strdate=<%=strdate %>&enddate=<%=enddate %>&strMonth=<%=(month+1)%>&strYear=<%=year %>" target="_self">
		                           <!-- 다음달 -->   <div class="right_div"><b >&#10093;</b></div>
		                    </a>
	                    <%
	                    }
	                    %>
	             </td>
	       </tr>
	       </table>
	</td>
	</tr>
	
	</table>
		<ul>
		<li class="ok">예약 가능</li>
		<li class="no">예약 완료</li>
		</ul>
	<br>
	
	
	<table border="1" class="caldates_table">
	
	<thead>
	<tr bgcolor="#E8E8E8">
	
	       <td width='100px'   height="40px">
	       <div align="center"><font color="red">일</font></div>
	       </td>
	       <td width='100px'>
	       <div align="center">월</div>
	       </td>
	       <td width='100px'>
	       <div align="center">화</div>
	       </td>
	       <td width='100px'>
	       <div align="center">수</div>
	       </td>
	       <td width='100px'>
	       <div align="center">목</div>
	       </td>
	       <td width='100px'>
	       <div align="center">금</div>
	       </td>
	       <td width='100px'>
	       <div align="center"><font color="#529dbc">토</font></div>
	       </td>
	</tr>
	</thead>
	<tbody>
	<tr>
	<%
	//start는 달력에 있는 첫날이 무슨 요일인지 달력 첫줄은 1일 이전은 공백이기에 반복문으로 요일 전까지 공백을 만들어준다.
	//일요일 기준으로 1부터 7(토요일)까지이다.
	for(int i = 1; i < start ; i++ ){//첫 빈공란 반복문의 시작이 1인 이유는 달력의 시작인 일요일이 1로 매핑되어 있어서 이다.
	  %>
	  <td>&nbsp;</td>
	  <%
	  newLine++;
		}
	//index==일
	//endDay는 달의 마지막 일이다.
	for(int index = 1; index <= endDay; index++){
		//date는 오늘이다. 달과 오늘 날짜보다 지나면 예약 종료이다.
	 	if(index<date&&month==toMon){
	 		%>
	 		<td valign='top' align='left' height='120px'>
	      	 <%=index%>
	 		<div>예약종료</div>
	 		</td>
	 		<%
	 		//예약 날짜가 3개월 후이면 예약 불가이다.
	 		//maxMon은 이번 월 +3이기 때문에 %의 연산자로 나누어서 비교해준다.
	 	}else if(index>date&&month==(maxMon%12)){
	 		%>
	 		<td valign='top' align='left' height='120px'>
	      	 <%=index%>
	 		<div>예약불가</div>
	 		</td>
	 		<%
	 	}else{
	 	%>
			<td valign='top' align='left' height='120px'>
			
	      	 <%=index%>
	        <%
	        	for(int i = 0 ; i <list.size();i++){
	        		//year-month+1-index,room_get(idx)
	        		String today=year+"-"+(month+1)+"-"+index;
	        		if(!(reserdao.reserStatus(today, list.get(i).getRoom_idx()))){
	        		%>
		        		<div class="reserOk_textdiv">
			        			<a href = "reserPriceCheck.jsp?strdate=<%=today%>&enddate=<%=year+"-"+(month+1)+"-"+(index+1)%>&room_idx_s=<%=list.get(i).getRoom_idx()%>" ><span>&#8226;</span>&nbsp;<%=list.get(i).getRoom_name()%></a>		        		
		        		</div>
	        		<%
	        		}else{
	        			%>
	        			<div class="reserNo_textdiv">
	
			        		<span>&#8226;</span>&nbsp;<%=list.get(i).getRoom_name() %>

		        		</div>
	        			<%
	        		}
	        	}
	        %>
	        
	       </td>
	       <%
	 	}
	       if(newLine == 7)
	       {
	         %>
	         </tr>
	         <%
	         if(index <= endDay){
				%>
				<tr>
				<%
	         }
	         newLine=0;
	       }
	       newLine++;
	}
	//마지막 공란 LOOP
	while(newLine > 0 && newLine <= 7)
	{
	  %>
	  <td>&nbsp;</td>
	  <%
	  newLine++;
	}
	%>
	</tr>
	</tbody>
	</table>
	</div>
	</form>
	</article>
	
	
	
	<article class="search_article">
	<div>
		<form>
			<h2>예약 날짜선택</h2>
			<div class="reserdate_div">
			<!--  시작 날짜는 캘렌더에서 받은 오늘 날짜 기준으로 3달 후 이다 오늘 날짜는 reserRangeStart이고 3개월 후 날짜는 reserRangeEnd이다. -->
			<span><input type = "date" name = "strdate" min="<%=reserRangeStart%>" max="<%=reserRangeEnd%>" value="<%=strdate %>" required="required" onchange="setend()"></span><span class="datetodate">&nbsp;-&nbsp;</span>
			<span><input type = "date" name = "enddate" min="<%=strdate!=null?strdate:reserRangeStart %>" max="<%=reserRangeEnd%>" value="<%=enddate %>" required="required"></span>
		<input type = "submit" value = "검색" class="serch">
	   </div>
		</form>		
	</div>
	</article>
	
	
	
	<article style="margin:0px auto;text-align:center;">
		<%
			if(!(strdate.equals(""))){
				%>
				<div class="checkinoutdiv">체크인 : <b class = "checkinout"><%=strdate %> </b>체크아웃 : <b class="checkinout"><%=enddate %></b></div>
				<div class="serchal">이용 기간을 선택하여 예약가능한 객실을 선택 후 예약하기 버튼을 클릭하세요.</div>
				
				<br>
				<%
				int count =0;
				for(int i = 0 ; i < list.size();i++){
					if(reserdao.reserRange(strdate,enddate,list.get(i).getRoom_idx())){
						count++;
						%>
						<div class= "roominfodiv">
								<p class = "roompic"><img src="<%=list.get(i).getRoom_img() %>" width = "376px" height="226px"></p>
								<div class = "roominfoname"><%=list.get(i).getRoom_name() %></div>
								<div class = "roominfomps">
							
								<span class = "roominfoperson">인원<%=list.get(i).getRoom_minperson() %>/<%=list.get(i).getRoom_maxperson() %></span>
								<span class = "roominfosize">방 <%=list.get(i).getRoom_size() %></span>
								
								</div>
								<div class = "roominfopricediv"><span class = "roominfoprice"><span>하루 가격</span> <span class = "price"><%=list.get(i).getRoom_price() %>원</span> </span>
								</div>
								<%
									int[] ctsc = rrdao.getCntAndstarscore(list.get(i).getRoom_idx());
								%>
								<div class="review">
								<a href = "/semi/reser/room_review.jsp?room_idx=<%=list.get(i).getRoom_idx()%>"><span class="star">★</span><span class="starscore"><%=ctsc[0]==0?" 없음":" "+(ctsc[0]/ctsc[1])+"점" %></span> <span class="reviewcount"> (<%=ctsc[1] %>)</span></a>
								</div>
								<div class="reserdiv">
								<button class="reserbt" onclick= "javascript:location.href='/semi/reser/reserPriceCheck.jsp?strdate=<%=strdate%>&enddate=<%=enddate%>&&room_idx_s=<%=list.get(i).getRoom_idx()%>'">예약</button>
								</div>
							
							
						</div>
						
						<%
					}
				}
				if(count==0){
					%>
					<div>
						예약 가능한 방이 없습니다.
					</div>
					<%
				}
			}else{
				%>
				<div id="serchplease">원하시는 기간을 검색해주세요</div>
				<%
			}
		%>
	</article>
	<br>
	<br>
	<br>
</section>
<%@ include file = "/ykfooter.jsp" %>
</body>
</html>