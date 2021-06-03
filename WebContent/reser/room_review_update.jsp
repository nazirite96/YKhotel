<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="reserDao" class = "reser.ReserDAO"></jsp:useBean>
<jsp:useBean id="rrdao" class="room.review.RoomReviewDAO"></jsp:useBean>

<!DOCTYPE html>

<%

	String room_review_idx = request.getParameter("room_review_idx");
	
	String content = rrdao.selectRoomReviewidx(room_review_idx);
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function imgCheck(t){
	var img=t.bbs_imgname.value;
    img=img.trim();
    
    if(img.length==0){
    	var result=  window.confirm('사진 추가없이 글을 등록하시겠습니까?');
        if(result==true){
          return true;
        }else{
      	  
      	  return false;  
        }
     }else{
        var imgtp=img.lastIndexOf(".");
        var imgtp2=img.substr(imgtp+1);
        var imgtp2=imgtp2.toLowerCase();
        
        if(imgtp2=="png"||imgtp2=="jpg"||imgtp2=="jpeg"||imgtp2=="gif"){
           return true;
        }else{
           window.alert('사진파일만 업로드 가능합니다.');
           return false;
        }
     }
           return true;
  }
</script>
<style type="text/css">
input{
  background:#686256;
  color:#fff;
  border:none;
  position:relative;
  height: 28px;
  font-size: 15px;
  padding:0 1em;
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
padding: 0px 9px;
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
    padding-top: 13px;
}
.textareas{
	resize: none;
	
}
.textareatd{
	padding-top:18px;
}
</style>
</head>
<body>
<br>

	<section>
		<article>
			<form action="room_review_update_ok.jsp" method="post" enctype="multipart/form-data" onsubmit="return imgCheck(this);">
				<input type = "hidden" name = "room_review_Idx" value = "<%=room_review_idx%>">
				<table>
				<tr>
					<th>별점</th>
					<td>
						<select name = "room_review_starScore">
							<option value="5">*****</option>
							<option value="4">****</option>
							<option value="3">***</option>
							<option value="2">**</option>
							<option value="1">*</option>
						</select>
					</td>
					<th>파일올리기</th>
					<td class="filebox">
					
					<label for = "ex_filename">업로드</label>
					<input type = "file" id="ex_filename" class="upload-hidden" name="room_review_img_s" value = "파일올리기"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3" class="textareatd"><textarea rows="10" cols="50" name = "room_review_content" class="textareas"><%=content %></textarea></td>
				</tr>
				<tr>
					<td colspan = "4" class = "checkre"><input type = "submit" value ="확인">
					
					<input type = "reset" value = "다시작성"></td>
				</tr>	
				</table>
			</form>
		</article>
	</section>
</body>
</html>