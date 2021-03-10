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
    		String emailCode = request.getParameter("code");
      		String sql = "SELECT mem_email FROM pj_member WHERE mem_emailHash=?";
			try {
				conn = Dbconn.getConnection();
				pstmt  = conn.prepareStatement(sql);
				pstmt.setString(1, emailCode);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					try {
						sql = "UPDATE pj_member SET mem_emailcheck = 'yes' WHERE mem_emailHash = ?";
						conn = Dbconn.getConnection();
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, emailCode);
						pstmt.executeUpdate();
						if(pstmt.executeUpdate() != 0) {
							System.out.println("이메일 인증 성공!");
						}else{
							System.out.println("이메일 인증 실패!");
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}finally {
						try {	
							if(pstmt != null) {pstmt.close();}
							if(conn != null) {conn.close();}
						}catch(SQLException e) {
							throw new RuntimeException(e.getMessage());
						}
					}
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
			%>
			<script>
				alert("이메일 주소 인증이 실패했습니다.");
				location.href="./MainPage.jsp";
			</script>
			<% 
				}
				} catch (SQLException e) {
					e.printStackTrace();
				}
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
