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
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.koreait.db.Dbconn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean class="com.koreait.member.MemberDTO" id="memberDTO" />
<jsp:useBean class="com.koreait.member.MemberDAO" id="memberDAO" />
<jsp:setProperty property="*" name="memberDTO" />
<!DOCTYPE html>

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
      		Connection conn;
  			PreparedStatement pstmt;
  			ResultSet rs;
      		String sql = "";
		  	String code = request.getParameter("code");
		  	String host = "http://localhost:8080/Corrot";
		  	String fromEmail = "sstxz444@gmail.com";
		  	String toEmail = request.getParameter("email");
		  	String subject = "회원가입을 위한 확인메일입니다.";
		  	String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." +
		  		"<a href='" + host + "emailCheck_ok.jsp?code=" + new SHA256().getSHA256(toEmail)+"'>이메일 인증하기</a>";
		  	if(toEmail != null){	
		  		try {
					sql = "UPDATE pj_member SET mem_emailHash = ? where mem_email =?";
					conn = Dbconn.getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, new SHA256().getSHA256(toEmail));
					pstmt.setString(2, toEmail);
					if(pstmt.executeUpdate() != 0) {
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
		  	}else {System.out.println("Hash값 입력 실패");}

		  	Properties properities = new Properties();
		  	properities.put("mail.smtp.user", fromEmail);
		  	properities.put("mail.smtp.host", "smtp.googlemail.com");
		  	properities.put("mail.smtp.port", "465");
		  	properities.put("mail.smtp.starttls.enable", "true");
		  	properities.put("mail.smtp.auth", "true");
		  	properities.put("mail.smtp.debug", "true");
		  	properities.put("mail.smtp.socketFactory.port", "465");
		  	properities.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		  	properities.put("mail.smtp.socketFactory.fallback", "false");
  	 
		  	try{
		  	    Authenticator auth = new Gmail();
		  	    Session ses = Session.getInstance(properities, auth);
		  	    ses.setDebug(true);
		  	    MimeMessage msg = new MimeMessage(ses);
		  	    msg.setSubject(subject);
		  	    Address fromAddr = new InternetAddress(fromEmail);
		  	    msg.setFrom(fromAddr);
		  	    Address toAddr = new InternetAddress(toEmail);
		  	    msg.addRecipient(Message.RecipientType.TO, toAddr);
		  	    msg.setContent(content, "text/html;charset=UTF-8");
		  	    Transport.send(msg);
		  	} catch(Exception e){
		  	    e.printStackTrace();
		  		PrintWriter script = response.getWriter();
		  		script.println("<script>");
		  		script.println("alert('오류가 발생했습니다.');");
		  		script.println("history.back();");
		  		script.println("</script>");
		  		script.close();		
		  	    return;
		  	}
      	%>
        <div class="BigRegisterBox">
          <div class="mideumRegisterBox">
            <div class="registerBox">
              <div class="information">
                <img src="./images/icon.png" alt="icon" class="icon" />
                <br />
                이메일 주소 인증 메일이 전송되었습니다.<br />
                이메일에 들어가셔서 인증해주세요.<br />
              </div>
                <%
				if(memberDAO.join(memberDTO) == 1){
					System.out.println("Db 입력 성공");
				}else{
					System.out.println("Db 입력 실패");
				}
                
                if(toEmail != null){	
    		  		try {
    					sql = "UPDATE pj_member SET mem_emailHash = ? where mem_email =?";
    					conn = Dbconn.getConnection();
    					pstmt = conn.prepareStatement(sql);
    					pstmt.setString(1, new SHA256().getSHA256(toEmail));
    					pstmt.setString(2, toEmail);
    					if(pstmt.executeUpdate() != 0) {
    					}
    				}catch(Exception e) {
    					e.printStackTrace();
    				}
    		  	}else {System.out.println("Hash값 입력 실패");}
				%>
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
