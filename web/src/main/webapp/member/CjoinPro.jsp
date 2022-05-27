<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/joinPro.jsp</title>
</head>
<body>
<%
//post 방식 => request 한글처리
request.setCharacterEncoding("utf-8");
// 폼에서 가져온값 request에 저장 
// "id" "pass" "name" email address phone mobile 파라미터 값 가져오기
String id=request.getParameter("id");
final String kakao = "kakao";


MemberDAO memberDAO=new MemberDAO();
//리턴할형 MemberDTO  userCheck(String id,String pass) 메서드 정의 
//MemberDTO memberDTO =  userCheck(id,pass) 메서드 호출
MemberDTO memberDTO = new MemberDTO();
memberDTO=memberDAO.userCheck(id);



if(memberDTO!=null){
	//아이디 일치
	session.setAttribute("id", id);
	session.setAttribute("kakao", kakao);
	response.sendRedirect("../main/main.jsp");
}else{
	// 아이디 비밀번호 틀림
	
	memberDTO = new MemberDTO();
	memberDTO.setId(id);	
	memberDAO.insertMember(memberDTO);
	out.print(id);
	session.setAttribute("id", id);
	session.setAttribute("kakao", kakao);
	response.sendRedirect("../main/main.jsp");
}



// // login.jsp 이동
// response.sendRedirect("login.jsp");

%>
</body>
</html>