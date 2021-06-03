<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
    <%@page import="bbs.*" %>
    <jsp:useBean id="bdao" class="bbs.BbsDAO" scope="session"></jsp:useBean>
    <jsp:useBean id="cdao" class="com.ComDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  type="text/css"  href="/semi/css/ykLayout.css">
<style>

.community a{   /*클릭한곳 색바꾸기*/
color:#bd5734;
font-weight: bold;
}

.imgtab{
width:1000px;
text-align:center;
padding:0;
margin: 0 auto;
border-spacing: 0px;

}
.imgtd{
padding-left: 20px;
}

.imgtd img{
text-align:center;
width:200px;
height: 200px;

}

#frame{
  width:200px;
  height: 200px;
  background:#ffffff;
  box-shadow: 0 1px 10px rgba(0,0,0,0.5);
  position:relative;


}

/*마우스오버하면 + 뜨기*/
.darkness {
  position:absolute;
  top:0;
  left:0;
  width:200px;
  height:200px;
  background:white;  
  opacity:0;
  transition:all .6s linear;
}

/* 추가된 부분 */
.btn-plus {
  position:absolute;
  top:75px;
  left:75px;
  background:#e0876a;
  width:55px;
  height:55px;
  border-radius:50%;
  text-align:center;  
  opacity:0;
  transform:scale(2);
  transition:all .3s linear;
}

/* 추가된 부분 */
.btn-plus span {
  font-size:2.3em;
  color:#ffffff;
  user-select:none;
}

/* 추가된 부분 */
.imga:hover .darkness{
  opacity:0.4;
}

/* 추가된 부분 */
.imga:hover .btn-plus {
  opacity:1;
  transform:scale(1.3);
}


.listtab{
width:1000px;
margin: 0px auto;
border-spacing: 0px;
}


.listtab th{
color:#454140;
height: 36px;
border-top:1px solid lightgray;
border-bottom:1px solid  lightgray;
}
.listtab td{
height: 35px;
}
.td1{
width:7%;
}
.td2{
width:50%;
}
.td3{
width:14%;
}
.td4{
width:8%;
}
.td5{
width:8%;
}
.td6{
width:13%;
}
.page{
margin:0px auto;
text-align: center;
}
@media only screen and (max-width : 1920px) {

.photo {
text-align:left;
margin-left:15%;
height:60px;
}
.photo div{
font-style: italic;
font-size: 19px;
}
.photo hr{
display:block;
width:10%;
border:#bd5734 0 none;
border-top:#bd5734 3px solid;
height:1px;
}

}

@media only screen and (max-width : 1600px) {
.photo {
text-align:left;
margin-left:19%;
height:80px;
}
.photo div{
font-style: italic;
font-size: 19px;
}
.photo hr{
display:block;
width:10%;
border:#bd5734 0 none;
border-top:#bd5734 3px solid;
height:1px;
}

}



.fixedImg{
position: fixed;
width:100%;
z-index:-1;
}
.fixedImg_wrap{
text-align:center;
width:100%;
height:330px;
background-color:rgba(57, 60, 30, 0.65);
position:relative;
z-index:1;
}
.fixedImg_wrap img{
width:60px;
position:relative;
top:70px;
}

.fixedImg_wrap div{
margin:0 auto;
color:white;
position:relative;
}

.play{  font-family:Lucida Bright ;  font-size: 35px; width:250px;top:100px; }
.playtext{font-family:Modern;font-size: 14px; width:180px; top:120px;   }

.introimg_art img{
width:100%;
height: 450px;
}

.writetd{
height:50px;
}
.writetd input{
width: 70px;
height: 25px;
}



</style>

<%
/*글목록 페이징 처리*/
System.out.println("리스트목록");
String searchCnt=request.getParameter("ttpage");
if(searchCnt==null){
	searchCnt="";
}

int totallistCnt=bdao.getTotalcount();

if(!searchCnt.equals("")){
	 totallistCnt=Integer.parseInt(searchCnt);
}

int listSize=7;
int pageSize=3;
String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
Integer cp=Integer.parseInt(cp_s);

int totalpage=(totallistCnt/listSize)+1;
if(totallistCnt%listSize==0)totalpage--;

int groupNum=cp/pageSize;

if(cp%pageSize==0)groupNum--;


%>



<script>
function  finding(){
	
	var tf=document.boardList.listFindtf.value;
	var target = document.getElementById("sbox");
	
	 var sel=target.options[target.selectedIndex].value;  
	 
	 location.href="boardListFind_ok.jsp?tf="+tf+"&sel="+sel+"&cp=<%=cp%>&listSize=<%=listSize%>";

}

</script>


</head>
<body>
<%@include file="/ykheader.jsp" %>
<br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->
<section>
<article class="introimg_art">
<div class="fixedImg">
<img src="../img/3bbb.jpg"  >
</div>
</article>
</section>
<div class="fixedImg_wrap">
<img src="../img/5b.png" >
<div class="play">Play YK Hotel</div>
<div class="playtext">여행스토리를 들려주세요!</div>
</div>

<div style="background-color: white;">
<br><br><br><br>
</div>

	<section style="background-color: white;">
	<article >
	<div class="photo" >
	<div>포토 갤러리</div>
	<hr  align="left">
	</div>
	</article>
	</section>
	
	<section  style="background-color: white;">
		<article >
		<table class="imgtab"> 
		<tr>

<!-- 올라온이미지 리스트 -->
<%
int imgCnt=4;  //5장만 보여줄거임.

ArrayList<BbsDTO> arr=bdao.getbbsImgList(imgCnt);
if(arr==null || arr.size()==0){
	%>
	<tr>
	<td colspan="4">&nbsp;</td>
	</tr>
	<%
}else{
	
	for(int i=0; i<arr.size(); i++){
		String imgpath="\\semi\\upload\\"+arr.get(i).getBbs_imgname();
		%>

		<td class="imgtd">
		 <div id="frame">
		 
		
	
		<a href="boardContent.jsp?idx=<%=arr.get(i).getBbs_idx()%>"  class="imga">
	    
	    <div class="darkness"></div>
	     <div class="btn-plus"><span draggable="false">+</span>
     
	     </div>
		
		
	  
		<img src="<%=imgpath%>" >
		
		
		</a>
       	</div>
		</td>

		<%
		
	}

}
%>

		</tr>
		</table>	
		</article>
	</section>

<div style="background-color: white;">
<br><br><br>
</div>





<section  style="background-color: white;">
<article>
	<form name="boardList" action="boardWrite.jsp">
	<table class="listtab">
	<thead>
		<tr>
			<th class="td1">번호</th>
			<th class="td2">제목</th>
			<th class="td3">아이디</th>
			<th class="td4">추천수</th>
			<th class="td5">조회수</th>
			<th class="td6">작성일</th>
		</tr>
	</thead>

	<tbody>
		<%
		/*기존  글목록 전부  가져와서 출력*/
		ArrayList<BbsDTO> list=bdao.getbbsList(cp, listSize);
		
		
		/*검색해서 들어온건지 판별문*/
		String tf=request.getParameter("tf");		
		String sel=request.getParameter("sel");
		if(tf==null){
			tf="";
			sel="";
		}
		
		/*검색으로 들어왔다면 ArrayList결과를 바꿔줌.*/
		if(sel.equals("bbs_subject") ||    sel.equals("bbs_id") ||  sel.equals("bbs_content")     ){			
			list=bdao.findMatching(cp,40, sel, tf); //걍전체출력....ㅠ.ㅠ
		}
		
		
		
		
		
		if(list==null||list.size()==0){
			%>
			<tr>
			<td colspan="6" align="center">등록된 게시글이 없습니다</td>
			</tr>
			<% 
		}else{
	
		for(int i=0; i<list.size();i++){
			
			//게시글에달린 댓글수
			int comCnt=cdao.getTotalcom(list.get(i).getBbs_idx() );
			
			
			%>
			<tr>
			<td align="center"><%=list.get(i).getBbs_idx() %></td>
			<td >
			<%
							for(int j=0;j<list.get(i).getBbs_lev();j++){
								//들여쓰기
								out.println("&nbsp;&nbsp;&nbsp;&nbsp;");
								
							}							
							%>
			
			<a href="boardContent.jsp?idx=<%=list.get(i).getBbs_idx()%>">
			&nbsp;<%=list.get(i).getBbs_subject()%>(<%= comCnt %>)</a></td>   <!-- 제목옆에 댓글수 표현 -->
			<td align="center"><%=list.get(i).getBbs_id()%></td>
			<td align="center"><%=list.get(i).getBbs_likenum() %></td>
			<td align="center"><%=list.get(i).getBbs_readnum() %></td>
			<td align="center"><%=list.get(i).getBbs_writedate() %></td>
			</tr>
			<% 
		 		 }	
		
		}
		%>	
	</tbody>
	
	
	<tfoot>
	<tr>
	     <td colspan="5"  align="left"    style="height:90px; ">

	    <select id="sbox" style="width:80px; height:25px;">
	    <option value="bbs_subject">제목</option>
	   <option   value="bbs_content">내용</option>
	   <option   value="bbs_id">작성자</option>	   
	    </select>
	    <input type="text" name="listFindtf" style="width:120px; height:20px;">
	     <input type="button" value="검색"   style="width:50px; height:25px;"   onclick="finding();">
	        </td>
		
		<td colspan="1" align="right"  class='writetd'  ><input type="submit" value="글쓰기"></td>
	</tr>
	</tfoot>	
	</table>
	</form>
</article>
</section>


<!-- 페이징  -->
<section  style="background-color: white;">
	<article>
		<div class='page'>
		<%
		if(groupNum!=0){
			%>
			<a href="boardList.jsp?cp=<%=(groupNum-1)*pageSize+pageSize%>">&lt;&lt;</a>
			<% 
		}
		
		%>
		
		
		<%
			for(int i=(groupNum*pageSize)+1;i<=(groupNum*pageSize)+pageSize;i++){
			%>
				<a href="boardList.jsp?cp=<%=i%>">&nbsp;&nbsp;<%=i %>&nbsp;&nbsp;</a>
	 		<% 
	 		       if(i==totalpage){
			     	break;
			       }
	 		
	 		
			}
		
	%>
	
		<%
		if(groupNum!=((totalpage/pageSize)-(totalpage%pageSize==0?1:0))){
			%>
			<a href="boardList.jsp?cp=<%=(groupNum+1)*pageSize+1%>">&gt;&gt;</a>
			<% 
		}
		
		%>
		</div>
	</article>
</section>
<div style="background-color: white;">
<br><br><br><br>
</div>

<%@include file="/ykfooter.jsp" %>
</body>
</html>