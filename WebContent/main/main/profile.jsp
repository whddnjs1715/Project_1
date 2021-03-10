<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	if (session.getAttribute("email") == null) {
%>
<script>
	alert('로그인 후 이용하세요.');
	location.href = "./login_edit.jsp";
</script>

<%
	}



	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "";
	String url = "jdbc:mariadb://localhost:3306/webdev";
	String uid = "root";
	String upw = "1234";

	String mem_email = (String) session.getAttribute("email");
	String mem_name = "";
	String mem_hp = "";
	String mem_ssn1 = "";
	String mem_ssn2 = "";
	String mem_zipcode = "";
	String mem_address1 = "";
	String mem_address2 = "";
	String mem_address3 = "";
	String mem_profilePic = "";

	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);

		if (conn != null) {
			sql = "SELECT * FROM pj_member WHERE mem_email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				mem_email = rs.getString("mem_email");
				mem_hp = rs.getString("mem_hp");
				mem_ssn1 = rs.getString("mem_ssn1");
				mem_ssn2 = rs.getString("mem_ssn2");
				mem_profilePic = rs.getString("mem_profilePic");
				mem_zipcode = rs.getString("mem_zipcode");
				mem_address1 = rs.getString("mem_address1");
				mem_address2 = rs.getString("mem_address2");
				mem_address3 = rs.getString("mem_address3");
			}

		}

	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>캐럿상점 | 회원가입</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="./js/profile.js"></script>
<link rel="stylesheet" href="./css/headerfooter.css">
<link rel="stylesheet" href="./css/profile.css">
</head>
<body>

	<div id="container">
		<div class="BigRegisterBox">
			<div class="mideumRegisterBox">
				<div class="registerBox">
					<div class="information">수정할 정보를 입력해주세요.</div>
					<div class="formBox">
						<form name="regform" id="regform" method="POST"
							action="profile_ok.jsp" onsubmit="return sendit()"
							enctype="multipart/form-data">

							<div class="passwordBox">
								<input type="password"
									placeholder="비밀번호는 영문,숫자,특수문자를 모두 포함해야합니다." id="userpw"
									name="userpw" class="passwordBoxInbox">
							</div>

							<div class="passwordCheckBox">
								<input type="password" placeholder="비밀번호 확인" id="userpw_re"
									name="userpw_re" class="passwordCheckBoxInbox">
							</div>
							<div class="profileImgBox">
								<p class="numberBoxInbox">현재 프로필사진 : 
								<%
									if (mem_profilePic != null && !mem_profilePic.equals("")) {
										out.print(mem_profilePic);
									}
								%> 
								</p>
								<br>
								<p class="numberBoxInbox">수정할 프로필사진 : 
								<label><input type="file" name="profilePic" value="<%=mem_profilePic%>"></label></p>
							</div>
							<br>
							<div class="numberBox">
								<input type="text" placeholder="우편번호" class="numberBoxInbox2" name="zipcode" id="sample6_postcode" value="<%=mem_zipcode%>"> <input type="button" value="검색" class="nextButton2" onclick="sample6_execDaumPostcode()">
							</div>
							<div class="numberBox">
								<input type="text" placeholder="주소" class="numberBoxInbox" name="address1" id="sample6_address" value="<%=mem_address1%>">
							</div>
							<div class="numberBox">
								<input type="text" placeholder="상세주소" class="numberBoxInbox" name="address2" id="sample6_detailAddress" value="<%=mem_address2%>">
							</div>
							<div class="numberBox">
								<input type="text" placeholder="참고사항" class="numberBoxInbox" name="address3" id="sample6_extraAddress" value="<%=mem_address3%>">
							</div>

							<div class="numberBox">
								<input type="text" value="<%=mem_hp%>" id="hp" name="hp"
									class="numberBoxInbox" placeholder="휴대폰번호를 '-' 포함하여 입력해주세요.">
							</div>

							<input type="submit" class="nextButton" value="수정">
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>


</body>
</html>