<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="qna.*"%>
<jsp:useBean id="qdao" class="qna.QnaDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/ykLayout.css">
<style>
.Qnaa a { /*클릭한메뉴 색바꾸기*/
	color: #bd5734;
	font-weight: bold;
}

table {
	width: 1000px;
	margin: 0px auto;
	margin-top: 50px;
	border-spacing: 0px;
}

table th {
	height: 40px;
	border-top: 1px double lightgray;
	border-bottom: 1px solid lightgray;
}

table td {
	height: 35px;
}

#writeClick {
	text-align: right;
}

p {
	text-align: center;
}

.qnasubeject {
	width: 60%;
}

.qnawrite {
	width: 15%;
}

.qnadate {
	width: 20%;
}

.qnaread {
	width: 10%;
}

.qnaidx {
	width: 10%;
}

span {
	color: #bd5734;
	font-weight: bold;
}

div#tablediv {
	margin-top: 40px;
}

tr.trnbsp {
	height: 30px;
}

a.awrite {
	margin-right: 15px;
	background-color: white;
	color: gray;
}

input.buttonstyle {
	border: 1px solid darkgray;
    background-color: white;
    font-size: 12px;
    height: 27px;
    color: gray;
}

a.buttonstyle {
	background-color: white;
	color: gray;
}

select#keyWord {
	height: 21px;
}

ul.footul {
	text-align:center;
}
ul.footul li {
	display:inline;
	vertical-align:middle;
}
ul.footul li a {
	display:-moz-inline-stack;	/*FF2*/
	display:inline-block;
	vertical-align:top;
	padding:4px;
	width:15px !important;
	color:#000;
	font:bold 12px tahoma;
	border:1px solid #eee;
	text-align:center;
	text-decoration:none;
	width /**/:26px;	/*IE 5.5*/

}
ul.footul li a.now {
	color:#fff;
	background-color:#f40;
	border:1px solid #f40;
}
ul.footul li a:hover, ul.footul li a:focus {
	color:#fff;
	border:1px solid #f40;
	background-color:#f40;
}

.keyWorddiv{
	display: flex;
    text-align: right;
    flex-direction: row;
    justify-content: flex-end;
}
.searchWord{
	width: 120px;
    border: 1px solid darkgray;
    margin-right: 7px;
}
select#keyWord {
    height: 27px;
    border: 1px solid darkgray;
    margin-right: 7px;
}

<!--
-->
#faq_wrap {
	margin: 10px 0 30px
}

#faq_wrap h2 {
	position: absolute;
	font-size: 0;
	line-height: 0;
	overflow: hidden
}

.faq_admin {
	text-align: right
}

#faq_wrap ol {
	margin: 0;
	padding: 0;
	list-style: none
}

#faq_con {
	border: 1px solid #e9e9e9;
	border-top: 0
}

#faq_con h3 a {
	display: block;
	padding: 10px;
	border-top: 1px solid #e9e9e9;
	background: #f2f5f9;
	text-decoration: none
}

#faq_con #con_inner {
	display: none;
	padding: 10px;
	line-height: 1.8em
}

#faq_con #con_inner2 {
	display: none;
	padding: 10px;
	line-height: 1.8em
}

#faq_con .con_closer {
	margin: 10px 0 0;
	text-align: right
}

#faq_con .closer_btn {
	margin: 0;
	padding: 0;
	border: 0;
	background: transparent
}

#faq_wrap {
	margin: 20px auto 0;
}

#faq_con {
	position: relative;
	border: 0;
	border-top: 1px solid #d9e6ec;
	border-bottom: 1px solid #d9e6ec;
	width: 1000px;
	margin: 0px auto;
	margin-bottom: 50px;
}

#faq_con:after {
	content: "";
	display: block;
	position: absolute;
	bottom: -12px;
	left: 8px;
	width: 100%;
	height: 12px;
	/*background:url("img/bg_list_shadow.png") no-repeat;background-size:100% 12px;*/
}

#faq_con ol li {
	position: relative;
	padding: 0;
	border-top: 1px solid #d9e6ec;
}

#faq_con ol li:first-child {
	border-top: 0;
}

#faq_con h3 a {
	position: relative;
	padding: 10px 12%;
	line-height:15px;
	font-size: 12px;
	font-weight: 500;
	color: #8c9092;
	border: 0;
	background: none;
}

#faq_con h3 a:before {
	content: "Q.";
	display: block;
	position: absolute;
	top: 50%;
	left: 5%;
	margin-top: -9px;
	font-size: 14px;
	color: #cb6c6c;
}

#faq_con h3 a p {
	margin: 0;
	font-size: 14px;
}

#faq_con #con_inner {
	padding: 30px 0;
	border-top: 1px solid #d9e6ec;
	background: #f6f7f7;
}

#faq_con #con_inner p {
	position: relative;
	margin: 0;
	padding: 0 12%;
	font-size: 14px;
	color: #8c9092;
}

#faq_con #con_inner p:before {
	content: "A.";
	display: block;
	position: absolute;
	top: 50%;
	left: 5%;
	margin-top: -14px;
	font-size: 14px;
	color: #6cabcb;
}

#faq_con #con_inner2 {
	padding: 30px 0;
	border-top: 1px solid #d9e6ec;
	background: #f6f7f7;
}

#faq_con #con_inner2 p {
	position: relative;
	margin: 0;
	padding: 0 12%;
	font-size: 14px;
	color: #8c9092;
}

#faq_con #con_inner2 p:before {
	content: "A.";
	display: block;
	position: absolute;
	top: 50%;
	left: 5%;
	margin-top: -14px;
	font-size: 14px;
	color: #6cabcb;
}

#faq_sch {
	margin-top: 20px;
	padding-bottom: 20px;
}

#faq_sch form {
	padding: 20px 0;
	overflow: hidden; /*background:#d1d6da;*/
}

#faq_sch legend {
	display: none;
}

#faq_sch form span {
	float: right;
	margin-right: 20px;
}

#container>.faq_admin {
	display: none;
}

#container_title {
	display: none;
}
</style>
</head>
<%
int totalCnt = qdao.getTotalCnt(); //게시물수
int listSize = 10; // 보여줄 게시글 수
int pageSize = 5; // 보여줄 페이지 수
String cp_s = request.getParameter("cp");
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

String keyWord = request.getParameter("keyWord");
System.out.println(keyWord+"ss");
String searchWord = request.getParameter("searchWord");
%>
<script>
	function doDisplay() {
		var con = document.getElementById("con_inner");
		if (con.style.display == 'block') {
			con.style.display = 'none'
		} else {
			con.style.display = 'block'
		}
	}
	function doDisplay2() {
		var con = document.getElementById("con_inner2");
		if (con.style.display == 'block') {
			con.style.display = 'none'
		} else {
			con.style.display = 'block'
		}
	}
</script>
<body>
	<%@ include file="/ykheader.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->
	<h2 style="text-align:center;">자주하시는 질문 목록</h2>
	<br>
	<section>
		<article>
			<div id="faq_wrap" class="faq_1 container">
				<section id="faq_con">
					<ol>
						<li>
							<h3>
								<a href="javascript:doDisplay();">
								<p>입실과 퇴실시간은 어떻게 되나요 ?</p></a>
							</h3>
							<div id="con_inner" style="display: none;">
								<p>입실은 오후 3시 이후이고, 퇴실은 다음날 정오 12시까지입니다.
								입실과 퇴실시간을 정한 이유는 펜션내,외부를 청소하여 오시는 분께 청결한 보금자리를 준비하기 위한 시간이 필요해서입니다.
								일찍 입실을 원하시는 분은 당일 오전에 전화 <br>문의주세요.
								전날 비어있는 객실인 경우에 한해 가능할 수도 있습니다.
								</p>
							</div>
						</li>
						<li>
							<h3>
								<a href="javascript:doDisplay2();"><p>조식은 어떻게 이용하나요 ?</p></a>
							</h3>
							<div id="con_inner2" style="display: none;">
								<p>YK HOTEL의 조식은 레스토랑에서 현장 결제 후 이용 가능합니다.
								<br><br>
								*이용시간
								<br>
								-주중(월~금) 06:30AM ~ 09:00AM
								<br>
								-주말(토, 일) 및 공휴일 06:30AM ~ 10:00AM
								<br><br>
								*이용요금 (VAT포함, 주중 주말 가격 동일)
								<br><br>
								- 소아36개월 미만 무료
								<br>
								- 36개월~만7세 6,600원
								<br>
								- 성인8세이상 12,000원
								</p>
							</div>
						</li>
					</ol>
				</section>
			</div>
			<h2 style="text-align: center;">
				Q&A<br>묻고 답하기
			</h2>
			<div id="tablediv">
				<form name="applyform" action="qnaList.jsp">
				<table>
					<thead style="align: center;">
							<td colspan="6">
							<span id="searchdiv">
									<div class="keyWorddiv">
										<select name="keyWord" id="keyWord">
											<option value="qna_subject">제목</option>
											<option value="qna_content">내용</option>
											<option value="qna_id">작성자</option>
										</select> <input type="text" name="searchWord" required="required" class="searchWord">
										<input type="submit" value="검색" class="buttonstyle">
									</div>
							</span>
							<td>
						<tr>
						</tr>
						<tr>
							<th class="qnaidx">번호</th>
							<th class="qnasubject">제목</th>
							<th class="qnawrite">작성자</th>
							<th class="qnadate">등록일</th>
							<th class="qnaread">조회수</th>
						</tr>
					</thead>
					<tbody>
						<%
						ArrayList<QnaDTO> arr2 = qdao.qnaNoticeList();
						
						
						if (arr2 == null || arr2.size() == 0) {//yk_qna에 등록된 데이터가 없을때 뜨는 메세지
						} else {//yk_qna에 저장되어 있는 데이터들을 뽑기 위함
							for (int i = 0; i < arr2.size(); i++) {
								if (arr2.get(i).getQna_ref() > 9990) {
						%>
						<tr>
							<td align="center"><%=arr2.get(i).getQna_idx()%></td>
							<td>
								<%
									if (arr2.get(i).getQna_ref() > 9990) {
								%> <a
								href="qnaContent.jsp?qna_idx=<%=arr2.get(i).getQna_idx()%>"><span>[공지사항]</span><%=arr2.get(i).getQna_subject()%></a>
								<%
									}
								%>
							</td>
							<td align="center"><%=arr2.get(i).getQna_id()%></td>
							<td align="center"><%=arr2.get(i).getQna_writedate()%></td>
							<td align="center"><%=arr2.get(i).getQna_readnum()%></td>
						</tr>
						<%
							}
						}
						}
						%>
						<!-- Q&A목록 게시판 yk_qna가 가진 게시글 목록관련(게시글번호,제목,작성자,등록일,조회수) -->
						<%

							ArrayList<QnaDTO> arr = qdao.qnaList(cp, listSize, keyWord, searchWord);
						
						if (arr == null || arr.size() == 0) {//yk_qna에 등록된 데이터가 없을때 뜨는 메세지
						%>
						<tr>
							<td colspan="5" align="center">등록된 게시글이 없습니다.</td>
						</tr>
						<%
							} else {//yk_qna에 저장되어 있는 데이터들을 뽑기 위함
						for (int i = 0; i < arr.size(); i++) {
							if (arr.get(i).getQna_ref() < 9989) {
						%>
						<tr>
							<td align="center"><%=arr.get(i).getQna_idx()%></td>
							<td>
								<%
									for (int j = 0; j < arr.get(i).getQna_lev(); j++) {
										%>
										&nbsp;&nbsp;
										<%

								}
								//답변쓰기를 했을때 생기는 공백부분
								if(arr.get(i).getQna_lev()>0){
									%>
								<input type="image" src="../img/borderlightbrown.png" style="pointer-events: none;">	
									<%
								}
								
								%> <a href="qnaContent.jsp?qna_idx=<%=arr.get(i).getQna_idx()%>"><%=arr.get(i).getQna_subject()%></a>
							</td>
							<td align="center"><%=arr.get(i).getQna_id()%></td>
							<td align="center"><%=arr.get(i).getQna_writedate()%></td>
							<td align="center"><%=arr.get(i).getQna_readnum()%></td>
						</tr>
						<%
							}
						}
						}
						%>
						<tr class="trnbsp">
						</tr>
						<tr>
							<td colspan="5" align="right">
								<%
									if (session.getAttribute("master") == null) {
									String MasterId = (String) session.getAttribute("master");
									if (MasterId == null) {
										MasterId = "";
									}
								} else {
									if (session.getAttribute("master").equals(1)) {
								%> <a href="qnaMasterWrite.jsp" class="buttonstyle">공지사항 쓰기</a> <%
								 	} else if (session.getAttribute("id") != null) {
								%> <a href="qnaWrite.jsp" class="awrite">글쓰기</a> <%
								 	}
								 }
								%>
							</td>
						</tr>
						<tr>
					</tbody>
					<tfoot>
						<!-- Q&A목록 게시판 페이징 관련  & 글쓰기 영역 -->
						<tr>
							<td colspan="5" align="center">
								<ul class="footul">
								<%if( keyWord==null){
									if (userGroup != 0  ) {
										
								%> <li><a
								href="qnaList.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a></li>
								<%
									}
								%> <%
								 	for (int i = (userGroup * pageSize) + 1; i <= (userGroup * pageSize) + pageSize; i++) {
								 %> &nbsp;&nbsp;<li><a href="qnaList.jsp?cp=<%=i%>"><%=i%></a></li>&nbsp;&nbsp;<%
								 	if (i == totalPage) {
								 	break;
								 }
								 }
								 %> <%
								 	if (userGroup != ((totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0))) {
								 %> <li><a href="qnaList.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>">&gt;&gt;</a></li>
								<%
									}
								}
								%>
								</ul>
							</td>
						</tr>
					</tfoot>
				</table>
				</form>
			</div>
		</article>
	</section>
	<div style="background-color: white;">
		<br><br><br><br>
	</div>	
	<%@ include file="/ykfooter.jsp"%>
</body>
</html>