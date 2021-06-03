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
<body>
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
					<td><input type = "submit" value ="확인"></td>
					<td><input type = "reset" value = "다시작성"></td>
				</tr>	
				</table>
			</form>
		</article>
	</section>
</body>
</html>