<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  type="text/css"  href="/semi/css/ykLayout.css">
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
<%

String subject=request.getParameter("subject");
String ref=request.getParameter("ref");
String lev=request.getParameter("lev");
String sunbun=request.getParameter("sunbun");
%>



<body>
<%@include file="/ykheader.jsp" %>
<br><br><br><br><br><br><!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->
<br>
<br>
<br>
<br>
<section>
<article>
<h1>나의 여행 후기(답글)</h1>
</article>
<form name="boardReWrite"   action="boardReWrite_ok.jsp"   method="post" enctype="multipart/form-data"   onsubmit="return imgCheck(this);">
			<input type="hidden" name="bbs_ref" value="<%=ref %>">
			<input type="hidden" name="bbs_lev" value="<%=lev%>">
			<input type="hidden" name="bbs_sunbun" value="<%=sunbun %>">
<table >
<thead>
<tr>
<td class="nametd">제목</td>
<td colspan="3" align="left" class="titletd">
<input type="text"  name="bbs_subject"  required="required"  value="Re:>><%=subject%>">
</td>
</tr>
<tr>
<td class="nametd">사진올리기</td>   <!-- value가  있다면?띄워주고 없으면 미완성-->
<td colspan="3" align="left"  class="filetd">
<input type="file" name="bbs_imgname" id="imageFile" accept="image/*" >
</td>
</tr>
</thead>

<tbody>
<tr>
<td></td> 
<td colspan="3"  class="contd">
<textarea cols="80" rows="20" name="bbs_content" required="required"></textarea>
</td>
</tr>
</tbody>
</table>

<input type="submit" value="답글쓰기"><input type="reset" value="다시작성">
</form>
</section>

<br><br><br>


<%@include file="/ykfooter.jsp" %>
</body>
</html>