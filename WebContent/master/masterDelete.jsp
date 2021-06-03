<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 0;
	padding: 0;
	text-align: center;
}

.titledelete {
	display: table;
	width: 100%;
	margin: 0px auto;
	padding: 0;
	height: 80px;
	color: white;
	background-color: #404040;
	margin-bottom: 50px;
}

.titledelete p {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
	font-size: 25px;
}

.delspan {
	font-size: 20px;
	font-style: italic;
}

.idxtext {
	width: 170px;
	height: 20px;
}

.idxtext::placeholder {
	color: lightgray;
	font-style: italic;
	font-size: 12px;
}

.delbt {
	width: 70px;
	height: 24px;
}
</style>
</head>
<body>
	<section>
		<article>
			<form name="m_deleteone" action="/semi/master/masterDelete_ok.jsp">


				<div class="titledelete">
					<p>한줄메모 삭제하기</p>
				</div>
				<span class="delspan">삭제하실 글의 번호를 입력하세요&nbsp;</span><br>
				<br>
				<div class="mddiv">
					<input type="text" class="idxtext" placeholder="번호" name="idx"
						required="required"> <input type="submit" class="delbt"
						value="삭제하기">
				</div>
			</form>
		</article>
	</section>
</body>
</html>