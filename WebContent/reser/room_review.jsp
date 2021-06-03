<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>  
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "reser.ReserDTO" %>    
<%@ page import = "room.RoomDTO" %>
<%@ page import = "room.review.RoomReviewDTO"%>
<jsp:useBean id="roomdao" class = "room.RoomDAO"></jsp:useBean>
<jsp:useBean id="reserdao" class = "reser.ReserDAO"></jsp:useBean>
<jsp:useBean id="rrdao" class = "room.review.RoomReviewDAO"></jsp:useBean>
<%
	String id = (String)session.getAttribute("id");
	String room_idx_s = request.getParameter("room_idx");
	int room_idx=0;
	if(room_idx_s!=null||!room_idx_s.equals("")){
		room_idx=Integer.parseInt(room_idx_s);
	}
	int[] totalCnt=rrdao.getCntAndstarscore(room_idx);//db로부터
	int listSize=6;//보여줄 리스트 수
	int pageSize=5;//보여줄 페이지 수
	String cp_s = request.getParameter("cp");
	if(cp_s==null||cp_s.equals("")){
		cp_s="1";
	}
	int cp = Integer.parseInt(cp_s);
	
	int totalPage=(totalCnt[1]/listSize)+1;
	if(totalCnt[1]%listSize==0){
		totalPage--;
	}
	int userGroup = cp/pageSize;
	if(cp%pageSize==0){
		userGroup--;
	}
%>

<%
if(room_idx_s==null||room_idx_s.equals("")){
	%>
	<script>
	location.href = '/semi/reser/reserStatus.jsp';
	</script>
	<%
	return;
}
RoomDTO roomDto = roomdao.getSelectRoom(room_idx);
ArrayList<RoomReviewDTO> list = rrdao.getRoomReview(room_idx,cp,listSize);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "../css/ykLayout.css">
<style>
.reser_article h2 {
	font-size: 23px;
	margin-bottom: 60px;
}


.resertab {
   color:#454140;
	width: 950px;
	margin: 0px auto;
	border-spacing:10px;
	margin-bottom: 70px;
	border:3px solid #686256;

}

.resertab img {
	width: 200px;
}

.tdsmall{
width:10%;
font-weight: bold;
}
.tdbig{
font-weight: bold;
}
.tdcheckin{
font-weight: bold;
}

.checkin{
color:#7a3b2e;
font-size:16px;
font-style: italic;
}
.imgtd {
	width: 250px;
}

.nowprice_div {
	margin-bottom: 70px;
}
.nowprice_div div{
font-size: 19px;
font-weight: bold;
}

.nowp_tf{
width:120px;
height:28px;
font-size: 22px;

}
.nowp_bt{

width:95px;
height:32px;
font-size: 16px;
color:white;
border:0px;
border-radius:4%;
background-color: #4f3222;
}

</style>
<script>
function popup() {
	window.open('room_review_write.jsp?room_idx=<%=room_idx%>&id=<%=id%>','review','width=500,height=280,left=300,top=100');
}
function deleteReview(idx){
	if(window.confirm('정말 삭제 하시겠습니까?')){
		window.document.location.href = 'room_review_delete.jsp?room_review_idx='+idx+'&room_idx='+<%=room_idx%>;
	}
}
function updateReview(idx){
	window.open('room_review_update.jsp?room_review_idx='+idx,'reviewupdate','width=500,height=280,left=300,top=100');
}

function answerReview(ref,idx){
	window.open('room_review_answer.jsp?room_review_ref='+ref+'&room_review_roomidx='+idx,'reviewanswer','width=500,height=280,left=300,top=100');
}
</script>
</head>
<body>
<%@ include file = "../ykheader.jsp" %>
	<section>
		<article>
		
			<br><br><br><br><br>
			<h2 align="center">리뷰 쓰기</h2>
			<h2 align="center"> <%=roomDto.getRoom_name() %> 리뷰</h2>
			<!-- 총 가격은 방가격 * (끝날짜-시작날짜)이다 -->
			<h2 align="center">가격 확인하기</h2>
			<!-- 총 가격은 방가격 * (끝날짜-시작날짜)이다 -->
			<table class="resertab" >
				<tr>
					<td rowspan="6" class="imgtd"><img
						src="<%=roomDto.getRoom_img()%>"></td>
				</tr>
				<tr>
					<td class="tdcheckin" >체크인 :</td>
					<td class="checkin" colspan="3"> 14:00시</td>
					<td class="tdsmall tdcheckin" >체크아웃 :</td>
					<td class="checkin" colspan="2"> 11:00시</td>

				</tr>
				<tr>
					<td class="tdsmall ">최소 인원 :</td>
					<td class="tdsmall2" colspan="2"><%=roomDto.getRoom_minperson()%>명</td>
					<td class="tdsmall">최대 인원 :</td>
					<td class="tdsmall2"><%=roomDto.getRoom_maxperson()%>명</td>
					<td class="tdsmall">총 가격 :</td>
					<td class="tdsmall2"><label id="bbcuse"><%=roomDto.getRoom_price()%>원</label></td>
				</tr>
				<tr>
					<td class="tdsmall">방 이름 :</td>
					<td class="tdsmall2" colspan="2"><%=roomDto.getRoom_name()%></td>
					<td class="tdsmall">방 사이즈 :</td>
					<td class="tdsmall2" colspan="3"><%=roomDto.getRoom_size()%></td>
				</tr>
				<tr>
					<td colspan="3" class="tdbig">바베큐 사용여부 :</td>
					<td colspan="4" >
					가능 (일자 상관 없이 비용10,000\)</td>
				</tr>
				<tr>
					<td colspan="2" class="tdsmall">구비시설 :</td>
					<td colspan="5" >스파/월풀, 개별바비큐, 침대, 에어컨, TV,취사시설, 식탁, 냉장고, 전자레인지, 커피포트</td>
				</tr>

			</table>
		</article>
		<br>
		<br>
		<br>
		<article>
		<div style = "margin : 0px auto; text-align : center">
			<input type ="button" value = "리뷰글쓰기" onclick="popup()">
		</div>
		<table class="resertab">
		<%
		if(list!=null){
			for(int i = 0 ; i <list.size(); i++){
		%>
			<tr>
				<td rowspan="2">아이콘</td>
				<td><%=list.get(i).getRoom_review_id() %></td>
			</tr>
			<tr>
				<td>별점 :<%
				for(int j = 0 ; j <list.get(i).getRoom_review_starScore();j++){
					%>
					*
					<%
				}
					%></td>
				<td><%=list.get(i).getRoom_review_writeDate() %></td>
			</tr>
			
			
				<%
			
			String img = list.get(i).getRoom_review_img();
			if((img!=null||!img.equals(""))&&!img.equals("base.jpg")){
				%>
					<tr><td colspan = "5"><img src="/semi/upload/<%=img%>"></td>
				<%
			}
			%>
			
			<tr>
			
				<td colspan = "5"><%=list.get(i).getRoom_review_content()%></td>
     		</tr>
		
		<%
			
			%>
			<tr>
			<%
			
			if(list.get(i).getRoom_review_id().equals(sid)){
					%>
						<td><input type = "button" value="삭제" onclick="deleteReview(<%=list.get(i).getRoom_review_idx()%>)"></td>
						<td><input type = "button" value="수정" onclick="updateReview(<%=list.get(i).getRoom_review_idx()%>)"></td>
						
					<%
				}
			if(master==1&&!list.get(i).getRoom_review_id().equals("관리자")){
				%>
					<td><input type = "button" value="답변" onclick="answerReview(<%=list.get(i).getRoom_review_ref()%>,<%=list.get(i).getRoom_review_roomIdx()%>)"></td>
				<%
			}else if(master==1){
				%>
				<td><input type = "button" value="삭제" onclick="deleteReview(<%=list.get(i).getRoom_review_idx()%>)"></td>
				<%
			}
			
			}
			%>
			</tr>
			<%
		}else{
			%>
			<tr>
			<td>리뷰할게 업습니다.</td></tr>
			<%
		}
		%>
		</table>


		
		<div style = "margin : 0px auto ; text-align : center">
		<%
		if(list!=null){
			for(int i = 0 ; i <list.size(); i++){
				%>
				<div>
				<span>별점 :<%
				for(int j = 0 ; j <list.get(i).getRoom_review_starScore();j++){
					%>
					*
					<%
				}
					%></span>
				<span>id : <%=list.get(i).getRoom_review_id() %></span>|
				<span>글쓴 날짜 <%=list.get(i).getRoom_review_writeDate() %></span>
				<span>content<%=list.get(i).getRoom_review_content()%></span>
				<%
				String img = list.get(i).getRoom_review_img();
				if((img!=null||!img.equals(""))&&!img.equals("base.jpg")){
					%>
						<span><img src="/semi/upload/<%=img%>"></span>
					<%
				}
				if(list.get(i).getRoom_review_id().equals(sid)){
					%>
						<span><input type = "button" value="삭제" onclick="deleteReview(<%=list.get(i).getRoom_review_idx()%>)"></span>
						<span><input type = "button" value="수정" onclick="updateReview(<%=list.get(i).getRoom_review_idx()%>)"></span>
						
					<%
				}
				if(master==1&&!list.get(i).getRoom_review_id().equals("관리자")){
					%>
						<span><input type = "button" value="답변" onclick="answerReview(<%=list.get(i).getRoom_review_ref()%>,<%=list.get(i).getRoom_review_roomIdx()%>)"></span>
					<%
				}else if(master==1){
					%>
					<span><input type = "button" value="삭제" onclick="deleteReview(<%=list.get(i).getRoom_review_idx()%>)"></span>
					<%
				}
				%>
				
				
				</div>
				<%
			}
		}else{
			%>
			<span>리뷰가 없습니다.</span>
			<%
		}
		%>
		</div>
		<div style = "margin : 0px auto; text-align : center">
		<%
						 	if (userGroup != 0) {
						 %><a href="room_review.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>&room_idx=<%=room_idx%>">&lt;&lt;</a> <%
						 	}
						 %> <%
						 	for (int i = (userGroup * pageSize) + 1; i <= (userGroup * pageSize) + pageSize; i++) {
										 %> &nbsp;&nbsp;<a href="room_review.jsp?cp=<%=i%>&room_idx=<%=room_idx%>"><%=i%></a>&nbsp;&nbsp;
													<%
														if (i == totalPage) {
															break;
														}
													}
													%> <%
						 	if (userGroup != ((totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0))) {
						 %> <a href="room_review.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>&room_idx=<%=room_idx%>">&gt;&gt;</a> <%
						 	}
						 %> 
		
		</div>
		</article>
		
	</section>
<%@ include file = "../ykfooter.jsp" %>

</body>
</html>