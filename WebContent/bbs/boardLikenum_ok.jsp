<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="bdao" class="bbs.BbsDAO" scope="session"></jsp:useBean>
    
    <%
    /*게시글 글번호 가져와서 좋아요1씩올려줌*/
    String idx_s=request.getParameter("idx");
    Integer idx=Integer.parseInt(idx_s);
    
    int result=bdao.bbsLikePlus(idx);
    System.out.println("조아요"+result);
    if(result>0){
    	%>
    	<script>
    	window.alert('따뜻한 좋아요 감사합니다!');
    	location.href='/semi/bbs/boardContent.jsp?idx=<%=idx%>';
    	
    	</script>
    	<%
    }else{
    	%>
    	<script>
   
    	location.href='/semi/bbs/boardContent.jsp?idx=<%=idx%>';
    	
    	</script>
    	<%
    	
    }
    
    
    %>