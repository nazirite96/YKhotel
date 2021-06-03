<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="bbs.*" %>
    <jsp:useBean id="bdao" class="bbs.BbsDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  type="text/css"  href="/semi/css/ykLayout.css">

<%
String hiddenidx=request.getParameter("idx");  //게시글번호
Integer idx=Integer.parseInt(hiddenidx);

BbsDTO bdto=bdao.bbsContent(idx);
%>


<style>
table{
width:700px;
margin: 0px auto;
border-spacing: 15px;
position:relative;
right:50px;
}
section{
text-align: center;
}

section article h1{
font-size:25px;
margin-bottom:90px;
}

.nametd{
text-align:right;
width:14%;
}

.titletd input{
border:2px solid lightgray;
border-radius:4px;
width:100%;
height: 30px;

}

.contd textarea{
border:2px solid lightgray;
border-radius:4px;
width:100%;
height: 400px;


}



</style>

<script>
/*이미 올려진파일을 초기화해주는 기능*/
  function RemoveFile() {
    location.href="resetFile.jsp?idx=<%=bdto.getBbs_idx()%>&imgname=<%=bdto.getBbs_imgname() %>";
 }
 
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
<%@include file="/ykheader.jsp" %>
<br><br><br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->
<br>
<br>
<br>
<br>
<section>
<article>
<h1>나의 여행 후기</h1>
</article>
<form name="boardUpdate"   action="boardUpdate_ok.jsp"   method="post" enctype="multipart/form-data"   onsubmit="return imgCheck(this);">
<input type="hidden" name="hiddenidx" value="<%=bdto.getBbs_idx() %>">
<input type="hidden" name="hiddenimgname" value="<%=bdto.getBbs_imgname() %>">
<table >
<thead>
<tr>
<td class="nametd">제목</td>
<td colspan="3" align="left" class="titletd">
<input type="text"  name="bbs_subject"  maxlength="50"  value="<%=bdto.getBbs_subject() %>" required="required"></td>
</tr>
<tr>
<td  class="nametd">사진올리기</td>
<td colspan="3" align="left" class="filetd">
<input type="file" name="bbs_imgname"   id="imageFile" accept="image/*" >
<input type = "button" value = "기존파일 초기화하기" onClick = "RemoveFile();">
</td>
</tr>
</thead>

<tbody>
<tr>
<td></td> 
<td colspan="3" class="contd">
<textarea cols="80" rows="20" name="bbs_content" >
<%=bdto.getBbs_content() %>
</textarea>
</td>
</tr>
</tbody>
</table>

<input type="submit" value="글쓰기"><input type="reset" value="다시작성">
</form>
</section>




<%@include file="/ykfooter.jsp" %>
</body>
</html>