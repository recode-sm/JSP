<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/logout.jsp</title>
</head>
<body>
<%
// 세션내장객체 전체 삭제
session.invalidate();
//"로그아웃" 메시지  main.jsp 이동
response.sendRedirect("../main/main.jsp");
%>

<%

%>
</body>
</html>

