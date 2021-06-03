<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="cdto" class="com.ComDTO"></jsp:useBean>
<jsp:useBean id="cdao" class="com.ComDAO"></jsp:useBean>
<jsp:setProperty property="*" name="cdto" />
<%
String bbs_idx_s=request.getParameter("hiddenbbsidx");   //어느 게시글의 댓글인지 확인
Integer bbs_idx=Integer.parseInt(bbs_idx_s);
cdto.setCom_bbs_idx(bbs_idx);
String sid=(String)session.getAttribute("id");
cdto.setCom_id(sid); //나중에 로그인기능구현후 수정


String recontent=request.getParameter("com_recontent");  //대댓글내용
String com_ref=request.getParameter("hiddenref");  //대댓글부모 ref
if(com_ref==null){ //null오류방지
	com_ref="1";
}
Integer ref=Integer.parseInt(com_ref);



if(recontent!=null && cdto.getCom_content()==null){  //대댓글쓰는곳만 글이 있다면 대댓글이 써짐

	
	cdto.setCom_content(recontent);
   System.out.println("부모댓글참조번호"+ref);
	cdto.setCom_ref(ref); //댓글의참조번호알아야함/
	
	if(recontent.equals("")){  //대댓글암것도 안쓰고 등록하면경고창
		%>
		<script type="text/javascript">
		window.alert('내용을 입력해주세요');
		location.href=document.referrer;
		</script>
		<%
		return;
	}
	
	
	int result=cdao.comReWrite(cdto);

  	if(result>0){
		%>
		<script type="text/javascript">
		location.href=document.referrer;
		</script>
		<%
		}else{
		%>
		<script type="text/javascript">
		window.alert('실패');
		location.href=document.referrer;
		</script>
		<%
     	}	
}else if(recontent==null&&cdto.getCom_content()!=null){    //원본입력창 글이 써짐
	

	
	
int result=cdao.comWrite(cdto);

  	if(result>0){
		%>
		<script type="text/javascript">
		location.href=document.referrer;
		</script>
		<%
		}else{
		%>
		<script type="text/javascript">
		window.alert('실패');
		location.href=document.referrer;
		</script>
		<%
     	}	
	
}else{   //원본입력창에 아무것도안쓰면이렇게
	%>
	<script type="text/javascript">
	window.alert('내용을 입력해주세요');
	location.href=document.referrer;
	</script>
	<%
	
	
}


%>