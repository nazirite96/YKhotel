<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*"  %>
    <%@page import="bbs.*"  %>
<jsp:useBean id="bdao" class="bbs.BbsDAO"   scope="session"></jsp:useBean>
    <%
    String tf=request.getParameter("tf");     //검색할 단어
    String sel=request.getParameter("sel");   //제목,내용,작성자   sub,con,writer
    if(tf==null || tf.equals("")){
    	%>
    	<script>
    	location.href='boardList.jsp';
    	</script>
    	<% 
    	return;
    }
    
    
    String cp_s=request.getParameter("cp");
    Integer cp=Integer.parseInt(cp_s);
    String listSize_s=request.getParameter("listSize");
    Integer listSize=Integer.parseInt(listSize_s);

    int totalpageCnt= bdao.getTotalCntfromSearch(sel, tf); //총 페이지갯수
    System.out.println("총페이지"+totalpageCnt);
    System.out.println(sel+"/"+tf+"/");
    
   ArrayList<BbsDTO> arr= bdao.findMatching(cp, listSize, sel, tf);
   if(arr==null || arr.size()==0){
	   %>
	  <script>
	  window.alert('검색하신 정보를 찾을 수 없습니다.');
	  location.href='boardList.jsp';
	  </script>
	   <%
   }else{
	   %>
<script>
 location.href="boardList.jsp?tf=<%=tf%>&sel=<%=sel%>&ttpage=<%=totalpageCnt%>";
</script>
		   <% 
	   
	   
   }
   
    
    
    
    
    %>