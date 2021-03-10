<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean class="com.koreait.member.MemberDTO" id="memberDTO" />
<jsp:useBean class="com.koreait.member.MemberDAO" id="memberDAO" />
<jsp:setProperty property="*" name="memberDTO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login_ok</title>
</head>
<body>
<% 
	
		if(memberDAO.login(memberDTO) != null){
			session.setAttribute("email", memberDTO.getEmail());
			session.setAttribute("name", memberDTO.getUsername());
			if(memberDAO.loginEmailCheked(memberDTO) != null){
%>
		<script>
			alert("로그인 되었습니다.");
			location.href="MainPageLogined.jsp"
		</script>
<%
		} else{
%>
		<script>
			alert("아이디 또는 비밀번호를 확인하세요.");
			location.href="MainPage.jsp"
		</script>
<%
		}
	}else{
%>
		<script>
			alert("본인인증을 확인해주세요.");
			location.href="MainPage.jsp"
		</script>
<% 
	}
%>
</body>
</html>