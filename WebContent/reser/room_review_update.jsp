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
</head>
<body>
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
					<td><input type = "file" name="room_review_img_s" value = "파일올리기" ></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><textarea rows="10" cols="50" name = "room_review_content"><%=content %></textarea></td>
				</tr>
				<tr>
					<td><input type = "submit" value ="확인"></td>
					<td><input type = "reset" value = "다시작성"></td>
				</tr>	
				</table>
			</form>
		</article>
	</section>
</body>
</html>