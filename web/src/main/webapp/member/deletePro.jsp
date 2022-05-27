<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id =request.getParameter("id");
String pass = request.getParameter("pass");
MemberDAO memberDAO = new MemberDAO();

// 리턴할형 MemberDTO  userCheck(String id,String pass) 메서드 정의 
// MemberDTO memberDTO =  userCheck(id,pass) 메서드 호출
MemberDTO memberDTO=memberDAO.userCheck(id, pass);

// if memberDTO null이 아니면 아이디 비밀번호 일치 => 세션값 생성 "id",id main.jsp 이동 
// if memberDTO null이면  "아이디 비밀번호 틀림" 뒤로이동
if(memberDTO!=null){
	%>
	<script type="text/javascript">
	alert("아이디를 삭제합니다.");
	</script>
	<%
	memberDAO.deleteMember(id, pass);
	session.invalidate();
	response.sendRedirect("../main/main.jsp");
}else{
	// 아이디 비밀번호 틀림
	%>
	<script type="text/javascript">
		alert("아이디 비밀번호 틀림");
		history.back();
	</script>
	<%
}
%>

</body>
</html>