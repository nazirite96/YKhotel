<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="master.*"%>
<jsp:useBean id="madao" class="master.MasterDAO"></jsp:useBean>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi/css/ykLayout.css">
</head>
<style>

.masterlist {
	width: 1000px;
	margin: 0px auto;
	border-spacing:0px;
	text-align: center;
}
.masterlist input{
	background-color: #404040;
	color:white;
	font-size: 15px;
	border-radius: 4px;
	border: 0px;
}

.mastersection {
	background-color: white;
}

.masterlist th {
	color: white;
	height: 30px;
	background-color: #404040;
}

.td1 {
	width: 10%;
	height: 40px;
}

.td2 {
	width: 20%;
	height: 40px;
}

.td3 {
	width: 50%;
	height: 40px;
}

.td4 {
	width: 20%;
	height: 40px;
}

.page_td {
	height: 100px;
}
/*메인 페이지*/
.fixedImg {
	position: fixed;
	width: 100%;
	z-index: -1;
}

.fixedImg_wrap {
	text-align: center;
	width: 100%;
	height: 370px;
	background-color: rgba(57, 60, 30, 0.65);
	position: relative;
	z-index: 1;
}

.fixedImg_wrap img {
	width: 60px;
	position: relative;
	top: 70px;
}

.fixedImg_wrap div {
	margin: 0 auto;
	color: white;
	position: relative;
}

.play {
	font-family: Lucida Bright;
	font-size: 35px;
	width: 400px;
	top: 100px;
}

.playtext {
	font-family: Modern;
	font-size: 14px;
	width: 150px;
	top: 120px;
}

.introimg_art img {
	width: 100%;
	height: 450px;
}
</style>
<script>
	function deletegogo() {
		window.open('/semi/master/masterDelete.jsp', 'masterDelete',
				'width=500, height=300');
	}
	function deleteAllgogo() {
		var result = window.confirm('게시글을 전부 삭제하시겠습니까?');
		if (result == true) {
			location.href = '/semi/master/masterDeleteAll_ok.jsp';
		}
	}
	function masterWritegogo() {
		window.open('/semi/master/masterWrite.jsp', 'masterWrite',
				'width=500,height=300');
	}
</script>
<%
	int totalCnt = madao.getTotalCnt();
int listSize = 15;
int pageSize = 5;
String cp_s = request.getParameter("cp");//밑에있는 cp값을 받아온다
if (cp_s == null || cp_s.equals("")) {
	cp_s = "1";
}
int cp = Integer.parseInt(cp_s);

int totalPage = (totalCnt / listSize) + 1;
if (totalCnt % listSize == 0)
	totalPage--;

int userGroup = cp / pageSize;
if (cp % pageSize == 0)
	userGroup--;
%>
<body>
	<%@ include file="/ykheader.jsp"%>
	<br>
	<br>
	<br>
	<!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->

	<section>
		<article class="introimg_art">
			<div class="fixedImg">
				<img src="/semi/img/master_bg1.jpg">
			</div>
		</article>
	</section>
	<div class="fixedImg_wrap">
		<img src="../img/5b.png">
		<div class="play">Master Communication</div>
		<div class="playtext">한줄쪽지를 남겨주세요</div>
	</div>

	<div style="background-color: white;">
		<br>
		<br>
		<br>
		<br>
	</div>
	
	<form name="masterPagefm" action="javascript:masterWritegogo();">
		<section class="mastersection">
			<article>
				<table class="masterlist">
					<thead>
						<tr>
							<td colspan="4" align="right"><input type="button"
								value="한줄삭제" onclick="deletegogo();"> <input
								type="button" value="전부삭제" onclick="deleteAllgogo()"></td>
						</tr>
						<tr>
							<th>번 호</th>
							<th>작성자</th>
							<th>내  용</th>
							<th>날  짜</th>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<MasterDTO> arr = madao.memoList(cp, listSize);
						if (arr == null || arr.size() == 0) {
						%>
						<tr>
							<td colspan="4">게시글이 아직 없습니다.</td>
						</tr>
						<%
							} else {
						for (int i = 0; i < arr.size(); i++) {
						%>
						<tr>
							<td class="td1"><%=arr.get(i).getMaster_idx()%></td>
							<td class="td2"><%=arr.get(i).getMaster_id()%></td>
							<td class="td3"><%=arr.get(i).getMaster_content()%></td>
							<td class="td4"><%=arr.get(i).getMaster_writedate()%></td>
						</tr>

						<%
							}
						}
						%>
					</tbody>
					<tfoot>
						<tr>
							<td class="page_td" colspan="4" align="center">
								<%
									if (userGroup != 0) {
								%> <a
								href="masterPage.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a>
								<%
									}
								%> <%
 	for (int i = (userGroup * pageSize) + 1; i <= (userGroup * pageSize) + pageSize; i++) {
 %> &nbsp;&nbsp;<a href="masterPage.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;
								<%
									if (i == totalPage) {
									break;
								}
								}

								if (userGroup != ((totalPage / pageSize) - (totalPage % pageSize) == 0 ? 1 : 0)) {
								%> <a href="masterPage.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>">&gt;&gt;</a>
								<%
									}
								%>
							</td>
						</tr>
						<tr>
							<td colspan="4" align="right"><input type="submit"
								value="글쓰기"></td>
						</tr>
						
					</tfoot>
					
				</table>
			</article>
		</section>
	</form>
	<div style="background-color: white;">
		<br>
		<br>
		<br>
		<br>
	</div>	
	<%@ include file="/ykfooter.jsp"%>
</body>
</html>