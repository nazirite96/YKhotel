<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="madto" class="master.MasterDTO"></jsp:useBean>
<jsp:setProperty property="*" name="madto"/>
<jsp:useBean id="madao" class="master.MasterDAO"></jsp:useBean>
<%
String master_id=request.getParameter("id");
String master_content=request.getParameter("master_content");
int result=madao.easyWrite(madto);
String msg=result>0?"등록완료":"등록실패";
%>
<script>
window.alert('<%=msg%>');
opener.location.reload();
window.self.close();
</script>


