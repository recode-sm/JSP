<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp5/deletePro.jsp</title>
</head>
<body>
<%
//http가 들고온 요청정보를 서버request에 저장
//request에 저장된 파라미터값 가져오기  num   pass
int num=Integer.parseInt(request.getParameter("num"));
String pass=request.getParameter("pass");
//1단계  JDBC 프로그램 드라이버 로더 
Class.forName("com.mysql.cj.jdbc.Driver");
//2단계  디비연결  DriverManager 디비주소, 디비접속아이디, 디비접속비밀번호 
//      연결정보 저장 => Connection
String dbUrl="jdbc:mysql://localhost:3306/jspdb7?serverTimezone=Asia/Seoul";
String dbUser="root";
String dbPass="1234";
Connection con =DriverManager.getConnection(dbUrl, dbUser, dbPass);
// 3단계 sql 게시판 num=? and pass=? 조회
String sql="select * from board where num=? and pass=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
pstmt.setString(2, pass);
// 4단계 PreparedStatement sql구문 실행, select 결과 저장 => ResultSet
ResultSet rs=pstmt.executeQuery();
// 5단계  ResultSet 저장된 내용을 출력, 저장
// 결과값 행접근 다음행 next() 다음행 => 데이터 있으면 true / 데이터 없으면 false
if(rs.next()){
	// 데이터 있으면 true 글번호 비밀번호 일치 => 삭제작업 => list.jsp 이동
	//삭제작업
	//3단계  연결정보를 이용해서 sql구문 만들기 =>  PreparedStatement
	// 문자열 => sql구문 변경, 실행할수 있는 내장객체 => PreparedStatement
	// delete from 테이블이름 where 조건열=값;
	sql="delete from board where num=?";
	pstmt=con.prepareStatement(sql);
	pstmt.setInt(1, num);
	//4단계   PrepardStatement sql구문 실행 (insert,update,delete)	
	pstmt.executeUpdate();
	// list.jsp 이동
	response.sendRedirect("list.jsp");
}else{
	// 데이터 없으면 false 글번호 비밀번호 틀림 => 비밀번호 틀림 메시지 출력 , 뒤로이동
	%>
	<script type="text/javascript">
		alert("입력하신 정보 틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html>