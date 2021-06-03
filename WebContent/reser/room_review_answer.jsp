<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
String room_review_roomidx = request.getParameter("room_review_roomidx");
String review_ref = request.getParameter("room_review_ref");
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style type="text/css">
input{
  background:#686256;
  color:#fff;
  border:none;
  position:relative;
  height: 25px;
  font-size: 13px;
  padding:0 8px;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
input:hover{
  background:#fff;
  color:#686256;
}
input:before,input:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #686256;
  transition:400ms ease all;
}
input:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
input:hover:before,input:hover:after{
	width:100%;
	transition:800ms ease all;
}
.filebox label { 
display: inline-block; 
padding: .5em .75em; 
color: #999; 
font-size: inherit; 
line-height: normal; 
vertical-align: middle; 
background-color: #fdfdfd; 
cursor: pointer; border: 1px solid #ebebeb;
border-bottom-color: #e2e2e2; 
border-radius: .25em; 
} 
.filebox input[type="file"] {
 /* 파일 필드 숨기기 */ position: absolute; 
width: 1px;
height: 1px;
padding: 0;
margin: -1px;
overflow: hidden;
clip:rect(0,0,0,0);
border: 0; 
}
.checkre{
    text-align: center;
    padding-top:12px;
}

</style>
<body>
<br>
<section>
		<article>
			<form action="room_review_answer_ok.jsp">
				<input type = "hidden" name = "room_review_roomidx" value = "<%=room_review_roomidx%>">
				<input type = "hidden" name = "room_review_ref" value = "<%=review_ref%>">
				<table>
				<tr>
					
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><textarea rows="10" cols="50" name = "room_review_content"></textarea></td>
				</tr>
				<tr>
					<td colspan="4" class="checkre"><input type = "submit" value ="확인">
					<input type = "reset" value = "다시작성"></td>
				</tr>	
				</table>
			</form>
		</article>
	</section>
</body>
</html>