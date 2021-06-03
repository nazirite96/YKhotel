<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="review.reviewDAO" scope="session"></jsp:useBean>
<jsp:useBean id="tdao" class="tour.tourDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="/semi/css/ykLayout.css">
<script type="text/javascript">
	function imgCheck(t) {
		var subject = t.review_subject.value;
		var img = t.review_imgname.value;
		img = img.trim();
		if (subject == null || subject == "") {
			window.alert('제목을 입력해주세요');
			return false;
		}
		if (img.length == 0) {
			var result=  window.confirm('사진 추가없이 글을 등록하시겠습니까?');
		      if(result==true){
		        return true;
		      }else{
		    	  return false;  
		      }
		} else {
			var imgtp = img.lastIndexOf(".");
			var imgtp2 = img.substr(imgtp + 1);
			var imgtp2 = imgtp2.toLowerCase();
			if (imgtp2 == "png" || imgtp2 == "jpg" || imgtp2 == "jpeg"
					|| imgtp2 == "gif") {
				return true;
			} else {
				window.alert('올바른 파일 형식이 아닙니다.');
				return false;
			}
		}
		return true;
	}
</script>
<style>
section article h1 {
	margin-top:0;
	font-size: 25px;
}
.writetitle {
	text-align: center;
}

.theme {
	text-align: center;
}

.writetable {
	
}

.writetable_t {
		width: 900px;
	margin: 0px auto;
	border-spacing: 15px;
	position: relative;
	right: 50px;
}
.writetable_t textarea{
	border: 1px solid lightgray;
	border-radius: 4px;
	width: 100%;
	height: 500px;
	resize: none;
}

.bt {
	text-align: center;
}

.tourname {
	text-align: center;
}

.tournamet {
	font-weight: bold;
}
.sub{
		border: 1px solid lightgray;
	border-radius: 4px;
	width: 100%;
	height: 35px;
}
.wh{
text-align: left;
	width: 14%;
}
.wh2{
text-align: left;
	width: 14%;
}
.bttd{
text-align: center;
}
</style>
<body>
	<%@include file="/ykheader.jsp"%>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->
	<%
		//관광지 고유값을 받아와서 (어차피 null 일수가 없음)
	int review_ref = Integer.parseInt(request.getParameter("tour_ref"));
	%>
	<%
		if (sid == null) {
	%>
	<script>
			window.alert('로그인 후 이용 가능합니다.');
			location.href = '/semi/tour/tourReview.jsp?tour_ref=<%=review_ref%>';
	</script>
	<%
		return;
	}
	%>

	<section>


		<article>
			<div class="writetitle">
				<%
					//요건 고유값으로 관광지 이름을 불러오고
				String name = tdao.getTourName(review_ref);
				%>
				<h1><%=name%></h1>
			</div>
			<br><br>
		</article>
		<article>
			<div class="writetable">
				<form name="reviewwrite" action="reviewWrite_ok.jsp" method="post"
					enctype="multipart/form-data" onsubmit="return imgCheck(this)">
					<table class="writetable_t">
						<tr>
								<th class="wh2">별점</th>
							<td class="wh2"><select name="review_star">
									<option value="5">★★★★★</option>
									<option value="4">★★★★</option>
									<option value="3">★★★</option>
									<option value="2">★★</option>
									<option value="1">★</option>
							</select>
							<td class="wh2"><input type="file" name="review_imgname" value="">
							<input type="hidden" name="review_id" value="<%=sid%>">
							</td>
								<td></td>
						</tr>
						<tr>
							<th class="wh">제목</th>
							<td colspan="3"><input type="text" name="review_subject" maxlength="50" class="sub" required><input
								type="hidden" name="review_ref" value="<%=review_ref%>"></td>
						</tr>
						<tr>
							

						</tr>
						<tr>
							<td colspan="4"><textarea rows="20" cols="80"
									name="review_content" required></textarea></td>
						</tr>
						<tr>
						<td colspan="4" class="bttd">
						<div class="bt">
						<input type="submit" value="작성">
						<input type="reset" value="초기화">
					</div>
						</td>
						</tr>
					</table>
				</form>
			</div>
			<br><br><br>
		</article>
	</section>
	
<%@include file="/ykfooter.jsp"%>
</body>
</html>