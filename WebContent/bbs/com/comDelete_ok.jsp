<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.*" %>
<jsp:useBean id="cdao" class="com.ComDAO" scope="session"></jsp:useBean>

 <%
 String sessionId=(String)session.getAttribute("id"); //현재접속자아이디.
 
 
 String com_idx_s=request.getParameter("idx");
 Integer idx=Integer.parseInt(com_idx_s);
 
 String com_ref_s=request.getParameter("ref");
 Integer ref=Integer.parseInt(com_ref_s);
 
 String com_lev_s=request.getParameter("lev");
 Integer lev=Integer.parseInt(com_lev_s);
 
 ComDTO dto=cdao.getComInfo(idx);
 System.out.println(dto.getCom_id());
 
 /*요청자와 작성자가 동일한지 확인*/
 if(!sessionId.equals(dto.getCom_id())){
	 %>
	 <script>
	 window.alert('작성자 본인만 삭제 가능합니다.'); 
	 location.href='/semi/bbs/boardContent.jsp?idx=<%=dto.getCom_bbs_idx()%>';
	</script>
	 <%
	return;
 }
 
 
 /*삭제처리*/
 if(lev==0){   //부모댓글인지 확인후 삭제
	 int result=cdao.comAllDelete(ref);
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

	 
	 
	 
	 
 }else{  //대댓글인지 확인후 삭제
	 
	 int result=cdao.recomDelete(idx);
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

       
 }
 
 %>
