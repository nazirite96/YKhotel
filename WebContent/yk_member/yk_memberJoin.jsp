<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi/css/ykLayout.css">
<style>
.titlesignup{
text-align: center;
margin-top:70px;
font-size:17px;
color:#454140;
letter-spacing: 10px; 
}

.maininput{
width:340px;
text-align:center;
margin:0px auto;
margin-top:90px;
margin-bottom:60px;
}
.n{
margin-top:15px;
text-align:left;
color: #454140;
}
.n2{
margin-top:5px;
text-align:left;
color: #454140;
}

.tf{
border:1px solid lightgray;
width:230px;
height: 25px;
background-color:WhiteSmoke;
}
.tflong{
border:1px solid lightgray;
width:300px;
height: 25px;
background-color:WhiteSmoke;
}
.addrtf{
border:1px solid lightgray;
width:180px;
height: 25px;
background-color:WhiteSmoke;
}
.tfb{
width:75px;
height:27px;
border:0px;
border-radius:5%;
background-color:#404040;
color:white;
}
.birth{
margin-top:10px;
text-align:left;
}
.birthtf{
width:70px;
height:25px;
}
.eaddr{
margin-top:15px;
width:90px;
height:25px;
}
.resultbt{

margin-top:20px;
text-align: center;
position: relative;
right:20px;


}
.addrbt{

margin-left:20px;
width:100px;
height:27px;
border:0px;
border-radius:5%;
background-color:#a79e84;
color:white;

}
.bt{
border:0px;
width:75px;
height:27px;
border-radius:5%;
background-color:#404040;
color:white;
}
input::placeholder {
  color: lightgray;
  font-style: italic;
  font-size:12px;
}
#pwdtext,#pwdtext1{
text-align:left;
color:#454140;
 font-style: italic;
font-size:12px;
}
</style>
<script type="text/javascript">
/**아이디 중복확인 팝업창으로 넘어가는 퐁숀 / 아이디 옆에 중복확인 버튼을 누르면(onclick) 수행됨*/
function yk_idCheck(){
	
	window.open('/semi/yk_member/yk_idCheck.jsp','yk_idCheck','width=450,height=200,top=100,left=200')
}
/**비밀번호와 비밀번호 확인 텍스트의 값이 같은지 확인하는 퐁숀 / 비밀번호확인란에 작성했을때(onkeyup) 수행됨*/
function pwdcheck(){
	var pwd=document.all.password.value;
	var pwd2=document.all.password2.value;
	
	if(pwd!=""&&pwd2!=""&&pwd==pwd2){
		document.all.pwdtext.textContent='비밀번호가 일치합니다.';
	}else if(pwd!=pwd2){
		document.all.pwdtext.textContent='비밀번호가 일치하지않습니다.';
	}else if(pwd2==""){
		document.all.pwdtext.textContent='';
	}
}

/**셀렉트 옵션이 자동으로 이메일 주소란에 입력되게 하는 뿽션, 직접입력을 선택하면 readonly 풀리면서 직접 입력가능하게 함*/
function emailCheck(emailValue){
	
	var email =  document.all("email") //직접입력 값
	var emailCheck2 = document.all("email2") //Select box 값
	if(emailValue=="notSelected"){
		return;}
	else if(emailValue=="etc"){
		emailCheck2.readOnly=false;
		emailCheck2.value="";
		emailCheck2.focus();
	}else{
		emailCheck2.readOnly=true;
		emailCheck2.value=emailValue;
	}
	
}


</script>
</head>
<body>

<%@include file="../ykheader.jsp" %>

<section>
<img src="/semi/img/g1.jpg"     style="width:100%;">
</section>



<section class="titlesignup">
<article>
<h2>회원가입</h2>
</article>
</section>


<section class="maininput">
<article >
<form name="yk_memberJoin" action="yk_memberJoin_ok.jsp"><!--폼 안에 가입하기 눌렀을 때  -->
<div class="n">아이디</div>
<div class="n2"><input type="text" name="id" class="tf" placeholder="아이디" readonly required="required">&nbsp;<input type="button" value="중복확인"  class="tfb"  onclick="yk_idCheck()"></div>
<div class="n">비밀번호</div>
<div class="n2"><input type="password" name="password" class="tflong" placeholder="비밀번호" required="required"></div>

<div class="n">비밀번호확인</div>
<div class="n2"><input type="password" name="password2" class="tflong" placeholder="비밀번호확인"  onkeyup="pwdcheck();" required="required"></div>
<div id="pwdtext">&nbsp;</div>
<div class="n">이름</div>
<div class="n2"><input type="text" name="name" class="tflong" placeholder="이름" required="required"></div>



<div class="n">성별</div>
<div class="n2"><input type="radio" name="sex" value="남자" checked>남자&nbsp;<input type="radio" name="sex" value="여자">여자</div>

<div class="n">이메일</div>
<div class="n2"><input type="text" name="email" class="addrtf" placeholder="이메일" required="required">&nbsp;&nbsp;@&nbsp;
				<input type="text" name="email2" class="addrtf" placeholder="이메일" required="required" value="" ReadOnly="true">&nbsp;
				
<select class="eaddr"  name="eaddr"   style="width:120px;"     onChange="emailCheck(this.value)"  >

	<option value="notSelected">::선택하세요::</option>
	<option value="etc">직접입력</option>
	<option value="naver.com">naver.com</option>
    <option value="nate.com">nate.com</option>
    <option value="empal.com">empal.com</option>
    <option value="hotmail.com">hotmail.com</option>
    <option value="lycos.co.kr">lycos.co.kr</option>
    <option value="msn.com">msn.com</option>
    <option value="hanmail.net">hanmail.net</option>
    <option value="yahoo.com">yahoo.com</option>
    <option value="korea.com">korea.com</option>
    <option value="kornet.net">kornet.net</option>
    <option value="yahoo.co.kr">yahoo.co.kr</option>
    <option value="kebi.com">kebi.com</option>
    <option value="orgio.net">orgio.net</option>
    <option value="paran.com">paran.com</option>    
    <option value="gmail.com">gmail.com</option>
</select>
</div>





<div class="n">주소</div>
<div class="n"><input type="text" name="addr" class="tflong" placeholder="주소" required="required"></div>

<div class="n">전화번호</div>
<div class="n"><input type="text" name="tel" class="tflong" placeholder="전화번호" required="required"></div>

<div class="resultbt"><input type="submit"  value="가입하기" class="bt">&nbsp;&nbsp;<input type="reset"  value="다시작성" class="bt"></div>


</form>
</article>
</section>



<%@include file="../ykfooter.jsp" %>
</body>
</html>