<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="reserDao" class = "reser.ReserDAO"></jsp:useBean>
<%


%>
<!DOCTYPE html>

<%
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	int date = cal.get(Calendar.DATE);
	String today = year+"-"+month+"-"+date;
	String room_idx_s = request.getParameter("room_idx");
	String room_id = request.getParameter("id");
	//reserCanReview(String id ,String roomidx,String today)
	
	if(!reserDao.reserCanReview(room_id, room_idx_s, today)){
		%>
	<script>
		window.alert('리뷰는 체크아웃 후에 가능하십니다.');
		window.self.close();
	</script>	
		<%
		return;
	}
	
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
			<form action="room_review_ok.jsp" method="post" enctype="multipart/form-data" onsubmit="return imgCheck(this);">
				<input type = "hidden" name = "room_review_roomIdx" value = "<%=room_idx_s%>">
				<input type = "hidden" name = "room_review_id" value = "<%=room_id%>">
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
					<td colspan="3"><textarea rows="10" cols="50" name = "room_review_content"></textarea></td>
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