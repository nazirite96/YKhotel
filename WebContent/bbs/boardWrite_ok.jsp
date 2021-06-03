<%@page import="bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="com.oreilly.servlet.*"%>  <!-- multipartrequest 사용을 위한 임포트 -->
   <%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
   <%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="bbs.*" %>
    
<jsp:useBean id="bdao" class="bbs.BbsDAO" scope="session"></jsp:useBean>


    <%
    
    
    /*게시글 쓰기 처리페이지*/
  System.out.println("이미지업로드처리입장");
//upload폴더에 이미지 넣어야함.

/*파일을 저장할 절대경로 찾기*/
ServletContext context = getServletContext(); //어플리케이션에 대한 정보를 ServletContext 객체가 갖게 됨. 
String saveDir = context.getRealPath("upload"); //절대경로를 가져옴
System.out.println("절대경로 >> " + saveDir);

 
int maxsize=1024*1024*5;  //5mb


BbsDTO dto=new BbsDTO();

try{  //multi 라는 변수명으로 파일생성 객체 만들기
MultipartRequest multi=
new MultipartRequest(request,saveDir,maxsize,"UTF-8",new DefaultFileRenamePolicy());


/*이전페이지값을 request로 받을수없고 muti객체의 메소드로 받아야함.*/
String sub = multi.getParameter("bbs_subject");
String con = multi.getParameter("bbs_content");

/*유저가 업로드한 파일명은 이 세 줄로 추출해낼수있음*/
Enumeration files = multi.getFileNames();
String name1 = (String)files.nextElement();
String name = multi.getFilesystemName(name1);
if(name==null||name.equals("")){   //만약 파일을 올리지않았다면 이름은 nono로 명명한다. (jpg,png확장자안붙으므로 문제날일없음)
	name="nono";
}
/*dto객체에 정보를 넣어준다*/
dto.setBbs_subject(sub);
dto.setBbs_content(con);
dto.setBbs_imgname(name);


System.out.println("업로드완료1");

}catch(Exception e){
	e.getStackTrace();
	%>
	<script>
	window.alert('용량이 부족합니다!');
	</script>
	
	<% 
}
    %> 
  

<% 
String sid=(String)session.getAttribute("id");
int count=bdao.bbsWrite(dto,sid);

if(count>0){
	%>
	<script>
	window.alert('글이 등록되었습니다.');
	location.href='/semi/bbs/boardList.jsp';
	</script>
	
	<%
}else{
	%>
	<script>
	window.alert('글 등록 실패!');
	location.href='/semi/bbs/boardList.jsp';
	</script>
	
	<%
	
}
 %>