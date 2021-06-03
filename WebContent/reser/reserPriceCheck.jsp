<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="reser.ReserDTO"%>
<%@ page import="room.RoomDTO"%>
<jsp:useBean id="roomdao" class="room.RoomDAO"></jsp:useBean>
<jsp:useBean id="reserdao" class="reser.ReserDAO"></jsp:useBean>
<%
	String room_idx_s = request.getParameter("room_idx_s");
if (room_idx_s == null || room_idx_s.equals("")) {
%>
location.href = '/semi/reser/reserStatus.jsp';
<%
	return;
}
int room_idx = Integer.parseInt(room_idx_s);//방번호
RoomDTO roomDto = roomdao.getSelectRoom(room_idx);
String strdate = request.getParameter("strdate");//예약 시작 날짜
String enddate = request.getParameter("enddate");//예약 끝 날짜
long calDateDays = 0;
try {
// String Type을 Date Type으로 캐스팅하면서 생기는 예외로 인해 여기서 예외처리 해주지 않으면 컴파일러에서 에러가 발생해서 컴파일을 할 수 없다.
SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
// strdate,enddate 두 날짜를 parse()를 통해 Date형으로 변환.
java.util.Date FirstDate = format.parse(strdate);
java.util.Date SecondDate = format.parse(enddate);
// Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화 하고 있다.
// long type 으로 return 된다.
long calDate = FirstDate.getTime() - SecondDate.getTime();
// Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환해준다. 
// 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나온다.
calDateDays = calDate / (24 * 60 * 60 * 1000);

// 구하는 것은 두 날짜 사이에 거리 이므로 절대값으로 만들어준다.
calDateDays = Math.abs(calDateDays);
} catch (Exception e) {
// 예외 처리
e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/ykLayout.css">
<style>

/*예약안내관련*/
.reser_noticeDiv {
	width: 800px;
	margin: 0px auto;
	border: 1px solid lightgray;
	padding:20px;
}

.reser_noticeDiv h4 {
  text-align:center;
	font-size: 17px;

}

.reser_noticeDiv hr {
	width: 70px;
	border: 0px;
	border-top: 3px solid gray;
	margin-bottom:50px;
}

.reser_noticeDiv li{
margin-bottom:20px;
font-size:15px;
}

/*메인 테이블 관련*/
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
	function bbcUsed() {
		var bbc = document.getElementsByName('bbcuse1');
		if (bbc[0].checked == true) {
			document.getElementById('bbcuse').innerHTML = ''
					+ (
<%=roomDto.getRoom_price() * calDateDays%>
	+ (bbc[0].value * 10000));
			document.all.reser_totalprice_s.value = ''
					+ (
<%=roomDto.getRoom_price() * calDateDays%>
	+ (bbc[0].value * 10000));
			document.all.reser_bbc.value = '1';
		} else {
			document.getElementById('bbcuse').innerHTML = ''
					+ (
<%=roomDto.getRoom_price() * calDateDays%>
	);
			document.all.reser_totalprice_s.value = ''
					+ (
<%=roomDto.getRoom_price() * calDateDays%>
	);
			document.all.reser_bbc.value = '0';
		}
	}
</script>
</head>
<body>
	<%@ include file="../ykheader.jsp"%>
	<br><br><br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->
	<section>
		<article class="reser_article">
			<h2 align="center">가격 확인하기</h2>
			<!-- 총 가격은 방가격 * (끝날짜-시작날짜)이다 -->
			<table class="resertab" >
				<tr>
					<td rowspan="6" class="imgtd"><img
						src="<%=roomDto.getRoom_img()%>"></td>
				</tr>
				<tr>
					<td class="tdcheckin" >체크인 :</td>
					<td class="checkin" colspan="3"><%=strdate%> 14:00시</td>
					<td class="tdsmall tdcheckin" >체크아웃 :</td>
					<td class="checkin" colspan="2"><%=enddate%> 11:00시</td>

				</tr>
				<tr>
					<td class="tdsmall ">최소 인원 :</td>
					<td class="tdsmall2" colspan="2"><%=roomDto.getRoom_minperson()%>명</td>
					<td class="tdsmall">최대 인원 :</td>
					<td class="tdsmall2"><%=roomDto.getRoom_maxperson()%>명</td>
					<td class="tdsmall">총 가격 :</td>
					<td class="tdsmall2"><label id="bbcuse"><%=roomDto.getRoom_price() * calDateDays%>원</label></td>
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
					<input type="checkbox" name="bbcuse1" value="1" onclick="bbcUsed()">(일자 상관 없이 비용10,000\)</td>
				</tr>
				<tr>
					<td colspan="2" class="tdsmall">구비시설 :</td>
					<td colspan="5" >스파/월풀, 개별바비큐, 침대, 에어컨, TV,취사시설, 식탁, 냉장고, 전자레인지, 커피포트</td>
				</tr>

			</table>

			<div align="center" class="nowprice_div">
				<form name="reser" action="reser_ok.jsp">
					<input type="hidden" name="room_idx" value="<%=room_idx_s%>">
					<input type="hidden" name="strdate" value="<%=strdate%>"> <input
						type="hidden" name="enddate" value="<%=enddate%>"> <input
						type="hidden" name="id" value="<%=sid%>">
					<div>
						현재 총 금액&nbsp;&nbsp;&nbsp;<input type="text" name="reser_totalprice_s" class="nowp_tf"
							value="<%=roomDto.getRoom_price() * calDateDays%>" readonly>&nbsp;원
					</div>
					<input type="hidden" name="reser_bbc" value="0">
					<br> 
					<input type="submit" value="예약하기" class="nowp_bt">
				</form>
			</div>
		</article>



		<article>
			<div class="reser_noticeDiv">
				<h4>예약관련 공지사항</h4>
				<hr>
				<ul>
					<li>해당 펜션은 미성년자의 경우 입실 불가하며 위반 시 환불이 불가하며 퇴실조치 됩니다.</li>
					<li>예약 인원에서 인원이 추가되는 경우 펜션에 미리 연락을 주시기 바랍니다.</li>
					<li>기준인원 초과 시 추가 인원에 대한 비용이 별도로 발생할 수 있습니다.</li>
					<li>최대 인원 초과 시 입실이 불가능할 수 있으며, 해당 사유로 환불 받을 수 없습니다.</li>
					<li>반려동물 입실 가능 펜션 외에 반려동물 동반 시 입실이 거부될 수 있으며, 해당 사유로 환불 받을 수
						없습니다.</li>
					<li>다음 이용 고객을 위해 입실, 퇴실 시간을 준수해 주시기 바랍니다.</li>
					<li>객실 및 주변시설 이용 시 시설물의 훼손, 분실에 대한 책임은 투숙객에게 있으며, 손해배상의 책임을 질
						수 있습니다.</li>
					<li>객실의 안전과 화재예방을 위해 객실 내에서 생선이나 고기 등을 굽는 직화 방식은 허용되지 않으며, <br>개인적으로
						준비해 오는 취사도구(그릴, 숯, 전기/전열기구 등)은 반입이 금지되어 있습니다.
					</li>
					<li>객실 내에서의 흡연은 금지되어 있으며, 지정된 장소를 이용해 주시기 바랍니다.</li>
					<li>다른 이용객에게 피해를 줄 수 있는 무분별한 오락, 음주, 고성방가는 삼가주시기 바랍니다.</li>
					<li>실시간예약 시 중복예약이 발생할 수 있으며, 해당 사유의 경우 고객센터를 통해 전액 환불받을 수
						있습니다. (ezen 404호 ykprince 측에서 확인 즉시 안내드립니다.)</li>
					<li>펜션별 기간 미확정으로 인해 요금 및 요금표가 잘못 반영된 경우, 자동 예약 취소 처리되며 정상 금액으로
						재예약할 수 있습니다.</li>
				</ul>
			</div>
		</article>
	</section>
	<%@ include file="../ykfooter.jsp"%>

</body>
</html>