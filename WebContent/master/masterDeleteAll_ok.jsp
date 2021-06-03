<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="madto" class="master.MasterDTO"></jsp:useBean>
<jsp:setProperty property="*" name="madto"/>
<jsp:useBean id="madao" class="master.MasterDAO"></jsp:useBean>
<%
madao.masterDeleteAll(madto);
%>
<script>
location.href='/semi/master/masterPage.jsp';
</script>
