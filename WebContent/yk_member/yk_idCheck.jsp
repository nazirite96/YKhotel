<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
margin:0;
padding:0;
text-align:center;
}
.titleidcheck{
display:table;
width:100%;
 margin: 0px auto;
 padding:0;
height:45px;
color:white;
background-color: #404040;

margin-bottom:50px;
}
.titleidcheck p{
display:table-cell; 
text-align:center; 
vertical-align:middle;   /*이 세 줄로 세로정렬*/

font-size: 14px;
}

.idcDiv span{
font-size: 20px;
font-style: italic;
}

.idctf{
width:170px;
height: 20px;

}

.idctf::placeholder {
  color: lightgray;
  font-style: italic;
  font-size:12px;
}

.idcbt{
width:70px;
height: 24px;
}

</style>
</head>
<body>
<section>	
		<article>
		<form name="yk_idCheck" action="yk_idCheck_ok.jsp"><!-- 이것은 중복확인 하는척하는 껍데기 / 기능구현하는 아이디_ok 페이지로 이동 -->
		
		
		 <div class="titleidcheck">
		 <p>아이디중복검사</p>
		 </div>
		 
			<div class="idcDiv">
			<span>ID&nbsp;</span>
			<input type="text" name="id"   class="idctf" placeholder="아이디">
			<input type="submit" value="중복확인"   class="idcbt">
			</div>
	
	</article>
	</form>
</section>
</body>
</html>