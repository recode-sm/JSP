<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="../script/script.js"></script>
<script type="text/javascript">

        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init();

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());

</script>
<style type="text/css">
.dropdown{
  position : relative;
  display : inline-block;
}

.dropdown-content{
  display : none;
  position : absolute;
  z-index : 1; /*다른 요소들보다 앞에 배치*/
}

.dropdown-content a{
  display : block;
}

.dropdown:hover .dropdown-content {
  display: block;
}
.btn {
	height: 30px;
	width: 100px;
	border-radius: 5px;
	border: 1px solid black;
	margin: 1px;
}
.btnl {
	background-color: yellow;
	height: 30px;
	width: 100px;
	border-radius: 5px;
	border: 1px solid black;
	margin: 1px;
}
</style>
</head>
<header>
<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
String kakao=(String)session.getAttribute("kakao");

if(id==null){
	// 세션값 없으면(로그인 안한 상태, 세션값이 null이면)  login  join 
	%>
<div id="login" class="dropdown">
				<span class="dropbtn"><input type="button" value="로그인"  class="btn" onclick="location.href='../member/login.jsp'"></span>
                <span><input type="button" value="회원가입"  class="btn" onclick="location.href='../member/join.jsp'"></span> 
                <div class="dropdown-content">
	              <input type="button" value="로그인"  class="btnl"  onclick="loginWithKakao()">
       			 </div>
                </div>	
	<%
}else if(kakao != "kakao"){
	// 세션값 있으면(로그인 한 상태, 세션값이 null이 아니면)  ...님 logout  update 
	%>
<div id="login" class="dropdown">
		<span class="dropbtn"><input type="button" value="<%=id %> 님"  class="btn" readonly></span> 
		<span><input type="button" value="로그아웃"  class="btn" onclick="location.href='../member/logout.jsp'"></span> 
		<div class="dropdown-content">
			  <input type="button" value="회원정보수정"  class="btn" onclick="location.href='../member/update.jsp'"><br>
			  <input type="button" value="회원정보삭제"  class="btn" onclick="location.href='../member/delete.jsp'">
        </div>
</div>	
	<%
}else if(kakao == "kakao"){
	%>
	<div id="login" class="dropdown">
			<span class="dropbtn"><input type="button" value="<%=id %> 님"  class="btnl" readonly></span> 
			<span><input type="button" value="로그아웃"  class="btnl" onclick="kakaoLogout()"></span> 
	</div>	
		<%
}
%>
           
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">회사소개</a></li>
	<li><a href="#">SOLUTIONS</a></li>
	<li><a href="../center/notice.jsp">게시판</a></li>
	<li><a href="#">CONTACT US</a></li>
</ul>
</nav>
</header>