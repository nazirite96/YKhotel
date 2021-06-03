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
h2{
font-size: 45px;
}
.masterlist{
	width:1000px;
	margin: 0px auto;
	margin-top:50px;
	border-spacing: 1px;
	text-align: center;
}
.masterlist th{
	color:#454140;
	height: 36px;
	border-top:1px double lightgray;
	border-bottom:1px solid lightgray;
}
.td1{
	width:10%;
}
.td2{
	width:20%;
}
.td3{
	width:50%;
}
.td4{
	width:20%;
}
</style>
<script>
function deletegogo(){
	window.open('/semi/master/masterDelete.jsp','masterDelete','width=500, height=300');
}
function deleteAllgogo(){
	var result=window.confirm('게시글을 전부 삭제하시겠습니까?');
	if(result==true){
		location.href='/semi/master/masterDeleteAll_ok.jsp';
	}
}
function masterWritegogo(){
	window.open('/semi/master/masterWrite.jsp','masterWrite','width=500,height=300');
}
</script>
<%
	int totalCnt = madao.getTotalCnt();
int listSize = 5;
int pageSize = 3;
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
	<br><br><br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->
	
	<h2 align="center">Master Communication Page</h2>
	<form name="masterPagefm" action="javascript:masterWritegogo();">
		<section>
			<article>
				<table class="masterlist">
					<thead>
						<tr>
							<td colspan="4" align="right"><input type="button" value="한줄삭제" onclick="deletegogo();">
							<input type="button" value="전부삭제" onclick="deleteAllgogo()"></td>
						</tr>
						<tr>
							<th>번호</th>
							<th>작성자</th>
							<th>내용</th>
							<th>날짜</th>
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
							<td colspan="3" align="center">
								<%
									if (userGroup != 0) {
								%> <a
								href="masterPage.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a>
								<%
									}
								%>
								<%
								for(int i=(userGroup*pageSize)+1; i<=(userGroup*pageSize)+pageSize;i++){
									%>
									&nbsp;&nbsp;<a href="masterPage.jsp?cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;
									<%
									if(i==totalPage){
										break;
									}
								}
							
								if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize)==0?1:0)){
									%>
									<a href="masterPage.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a>
									<%
								}
								%>
							</td>
							<td><input type="submit" value="글쓰기"></td>
						</tr>
					</tfoot>
				</table>
			</article>
		</section>
	</form>
	<%@ include file="/ykfooter.jsp"%>
</body>
</html>