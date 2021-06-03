<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript">


function gogo(){

	window.open('/semi/yk_member/yk_login.jsp','login','width=500,height=280,left=300,top=100');
}
function logout(){
	 var result=window.confirm('로그아웃하시겠습니까?');
	 if(result==true){
        location.href='/semi/yk_member/yk_logout.jsp' ;               		 
	 }
	 	
	 }
</script>
<header>

<section class="allheader">
<div class="smallheader">

<article align="right">
  <ul id="menulogin">
  <%
int master = 0;
Object master_o=session.getAttribute("master");
if(master_o!=null){
	master = (Integer)master_o;
}

%>
    <% 
    String sid=(String)session.getAttribute("id");
    String dbid=(String)session.getAttribute("qna_id");
    
    if (sid==null){
    	%>
		<li class="menulog"><a href="javascript:gogo();" >로그인</a></li>
			<li >|</li>
			<li class="menulog2"><a href="/semi/yk_member/yk_memberJoin.jsp" target="_self">회원가입</a></li>
		<%
    	}else{
    	%>
 <li class="menulog2"  ><%=sid %>님 로그인 중</li>
<li>|</li>
<li class="menulog2" ><a href="/semi/yk_member/yk_myInfo.jsp">내정보보기</a></li>
<li >|</li>
<li class="menulog2" ><a href="javascript:logout();">로그아웃</a></li> 
    	<% 
    }
	%>
</ul>
</article>




<article  class="menu" >
<nav id="topMenu">
<ul class="mainmenu">
<li class="menuli" ><a href="/semi/index.jsp">HOME</a></li>

<li class="menuli room"><a href="/semi/room/roommain.jsp">ROOM</a></li>

<li class="menuli"><a href="/semi/reser/reserStatus.jsp"  class="reser">실시간예약</a>
	<ul class="submenu">
	 <li><a class="submenuLink"  href="/semi/reser/reserStatus.jsp">예약현황</a></li>
	 <li><a class="submenuLink"  href="/semi/reser/reserCheck.jsp">예약확인/취소</a></li>
	</ul>
</li>


<li class="menuli tour"><a  href="/semi/tour/tourMain.jsp"  class="tour2">투어가이드</a>
	<ul class="submenu">
	 <li><a class="submenuLink"  href="/semi/tour/tourMain.jsp">주변여행지</a></li>
	 <li><a class="submenuLink"  href="/semi/tour/listAll.jsp">여행지리뷰보기</a></li>
	</ul>
</li>

<li class="menuli community"><a  href="/semi/bbs/boardList.jsp">커뮤니티</a></li>

<li class="menuli Q&a"><a href="/semi/qna/qnaList.jsp">Q&A</a></li>

<%
if(master==1){
	%>
	<li><a href="/semi/master/masterPage.jsp">관리자페이지</a></li>
	<%
}

%>
</ul>
</nav>
</article>
</div>
</section>


</header>