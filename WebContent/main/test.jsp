<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.koreait.mail.SHA256"%>
<%@page import="com.koreait.mail.Gmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");

%>
<jsp:useBean class="com.koreait.member.MemberDTO" id="memberDTO" />
<jsp:useBean class="com.koreait.member.MemberDAO" id="memberDAO" />
<jsp:setProperty property="*" name="memberDTO" />
<!DOCTYPE html>
<% 
	memberDTO.setEmail((String)session.getAttribute("email"));
%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>regist_ok</title>
  </head>
  <body>
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>회원가입</title>
        <link rel="stylesheet" href="./css/regist_ok.css" />
      </head>
      <body>
      	<%
			if(memberDAO.emailCheck(memberDTO.getEmail()) == 1){
			System.out.println("Db 업데이트 성공");
		%>
        <div class="BigRegisterBox">
          <div class="mideumRegisterBox">
            <div class="registerBox">
              <div class="information">
                <img src="./images/icon.png" alt="icon" class="icon" />
                <br />
                이메일 주소 인증이 확인되었습니다.<br />
              </div>
         	<%
				}else{
					System.out.println("Db 업데이트 실패");
					
				}
			%>
			<script>
				alert("이메일 주소 인증이 실패했습니다.");
				location.href="./MainPage.jsp";
			</script>
              <div class="formBox">
                <form name="regform" id="regform" method="post" action="MainPage.jsp">

                  <button type="submit" class="nextButton">
                      돌아가기
                  </button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </body>
    </html>
  </body>
</html>
