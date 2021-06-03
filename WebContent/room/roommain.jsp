<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  type="text/css"  href="/semi/css/ykLayout.css">
<style>

@media only screen and (max-width : 1920px) {
	
.room a{   /*클릭한메뉴 색바꾸기*/
color:#bd5734;
font-weight: bold;
}
.room a:link{  color:#bd5734; }
.room a:visited{  color:#bd5734; }

.wrap{
width:100%;

}

.wrap img{
width:100%;

position:relative;
z-index:0;
}

.bottomdiv{
margin-top:0px;
}


.mainnameDiv{  
width:600px;
height:100px;
text-align: center;
color:white;
position:relative;
top:-800px;
left:770px;
}


.mainnameDiv span{
font-size:55px;

}
.mainnameDiv h1{
position:relative;
top:-8px;
}
.poin{
filter: drop-shadow(5px 2px 2px #383838); 
transition:all .3s ease;
}
.poin img{
width:80px;
}
.poin1{
margin:0; padding:0;
position:relative;
width:80px; height:100px;
top:-680px;
left:510px;

}
.poin1:hover {top:-710px;}  /*30px더하기*/

.poin2{
margin:0; padding:0;
width:80px; height:100px;
position:relative;
top:-810px;
left:700px;

}
.poin2:hover {top:-840px;}
.poin3{
margin:0; padding:0;
width:80px; height:100px;
position:relative;
top:-860px;
left:870px;

}
.poin3:hover {top:-890px;}
.poin4{
margin:0; padding:0;
width:80px; height:100px;
position:relative;
top:-900px;
left:1150px;

}
.poin4:hover {
top:-930px;
}
.poin1:hover ~ .moon1{top:-1140px;}    /*찾앗다 내가 해냇다 ㅠ.ㅠ 인접선택자! 띄어쓰기중요*/
.poin2:hover ~ .moon2{top:-1190px;}    /*찾앗다 내가 해냇다 ㅠ.ㅠ 인접선택자! 띄어쓰기중요*/
.poin3:hover ~ .galaxy1{top:-1160px;}    /*찾앗다 내가 해냇다 ㅠ.ㅠ 인접선택자! 띄어쓰기중요*/
.poin4:hover ~ .galaxy2{top:-1130px;}    /*찾앗다 내가 해냇다 ㅠ.ㅠ 인접선택자! 띄어쓰기중요*/

.cafe{
width:100px;
height:50px;
color:white;
font-size:20px;
position:relative;
top:-1120px;
left:1480px;
font-style: italic;

}

.roomtext{
color:white;
font-size:18px;
background-color: gray;
font-style: italic;
transition:all .3s ease;
}

.moon1{
width:120px;
text-align:center;
position:relative;
top:-1110px;
left:550px;
}


.moon2{
width:120px;
text-align:center;
position:relative;
top:-1160px;
left:750px;

}
.galaxy1{
width:130px;
text-align:center;
position:relative;
top:-1130px;
left:910px;

}
.galaxy2{
width:130px;
text-align:center;
position:relative;
top:-1100px;
left:1190px;

}
.roomtextDiv{
height:300px;
}
/*전체를 묶는 div*/
.allwrap{
width:100%;
max-height:990px;
}

/* a태그  */
.roomAtag{color:white;}

.roomAtag:link{color:white;}
.roomAtag:visited{color:white;}
.roomAtag:hover{color:white;}

	
}

@media only screen and (max-width : 1280px) {

.room a{   /*클릭한메뉴 색바꾸기*/
color:#bd5734;
font-weight: bold;
}
.room a:link{  color:#bd5734; }
.room a:visited{  color:#bd5734; }

.wrap{
width:100%;
height:654px;
}

.wrap img{
width:100%;
max-width:1280px;
height:654px;
position:relative;
z-index:0;
}

.bottomdiv{
margin-top:0px;
}


.mainnameDiv{  
width:600px;
text-align: center;
color:white;
position:relative;
top:-560px;
left:410px;
}


.mainnameDiv span{
font-size:26px;

}
.mainnameDiv h1{
position:relative;
top:-8px;
}
.poin{
filter: drop-shadow(5px 2px 2px #383838); 
transition:all .3s ease;
}
.poin img{
width:60px;
}
.poin1{
margin:0; padding:0;
position:relative;
width:80px; height:100px;
top:-490px;
left:330px;

}
.poin1:hover {top:-510px;}

.poin2{
margin:0; padding:0;
width:80px; height:100px;
position:relative;
top:-590px;
left:500px;

}
.poin2:hover {top:-610px;}
.poin3{
margin:0; padding:0;
width:80px; height:100px;
position:relative;
top:-660px;
left:650px;

}
.poin3:hover {top:-680px;}
.poin4{
margin:0; padding:0;
width:80px; height:100px;
position:relative;
top:-710px;
left:730px;

}
.poin4:hover {
top:-730px;
}
.poin1:hover ~ .moon1{top:-930px;}    /*찾앗다 내가 해냇다 ㅠ.ㅠ 인접선택자! 띄어쓰기중요*/
.poin2:hover ~ .moon2{top:-950px;}    /*찾앗다 내가 해냇다 ㅠ.ㅠ 인접선택자! 띄어쓰기중요*/
.poin3:hover ~ .galaxy1{top:-937px;}    /*찾앗다 내가 해냇다 ㅠ.ㅠ 인접선택자! 띄어쓰기중요*/
.poin4:hover ~ .galaxy2{top:-907px;}    /*찾앗다 내가 해냇다 ㅠ.ㅠ 인접선택자! 띄어쓰기중요*/

.cafe{
width:100px;
height:50px;
color:white;
font-size:17px;
position:relative;
top:-920px;
left:960px;
font-style: italic;

}

.roomtext{
color:white;
font-size:14px;
background-color: gray;
font-style: italic;
transition:all .3s ease;
}

.moon1{
width:90px;
position:relative;
top:-910px;
left:370px;
}


.moon2{
width:90px;
position:relative;
top:-930px;
left:545px;

}
.galaxy1{
width:99px;
position:relative;
top:-917px;
left:690px;

}
.galaxy2{
width:95px;
position:relative;
top:-887px;
left:770px;

}
.roomtextDiv{
height:300px;
}
/*전체를 묶는 div*/
.allwrap{
width:100%;
height:654px;
}

/* a태그  */
.roomAtag{color:white;}

.roomAtag:link{color:white;}
.roomAtag:visited{color:white;}
.roomAtag:hover{color:white;}


}



</style>

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
 	
<div class="poin1 poin"><a href="showroom.jsp?room_idx=22"  class="roomAtag"><img src="/semi/img/pin.png" ></a></div>
<div class="poin2 poin"><a href="showroom.jsp?room_idx=23"  class="roomAtag"><img src="/semi/img/pin.png" ></a></div>
<div class="poin3 poin"><a href="showroom.jsp?room_idx=24"  class="roomAtag" ><img src="/semi/img/pin.png"  ></a></div>
<div class="poin4 poin"><a href="showroom.jsp?room_idx=25"  class="roomAtag"><img src="/semi/img/pin.png"  ></a></div>


<div class="roomtext moon1" ><a href="showroom.jsp?room_idx=22"  class="roomAtag">&nbsp;Moon 101호&nbsp;</a></div>
<div class="roomtext moon2"><a href="showroom.jsp?room_idx=23"  class="roomAtag">&nbsp;Moon 102호&nbsp;</a></div>
<div class="roomtext galaxy1"><a href="showroom.jsp?room_idx=24"  class="roomAtag">&nbsp; Galaxy 201호&nbsp;</a></div>
<div class="roomtext galaxy2"><a href="showroom.jsp?room_idx=25"  class="roomAtag">&nbsp;Galaxy 202호&nbsp;</a></div>



<div class="cafe">CAFE</div>

</div>


<%@include file="/ykfooter.jsp" %>
</body>
</html>