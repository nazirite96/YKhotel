<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ykdto" class="member.YkMemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ykdto"/>
<jsp:useBean id="ykdao" class="member.YkMemberDAO"></jsp:useBean>
<%
int result=ykdao.yk_myUpdate(ykdto);
String msg=result>0?"회원정보수정완료":"회원정보수정실패";
%>
<script>
window.alert('<%=msg%>');
location.href='/semi/yk_member/yk_myInfo.jsp';
</script>

