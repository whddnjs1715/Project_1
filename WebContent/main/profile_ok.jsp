<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<%
	if (session.getAttribute("email") == null) {
%>
<script>
	alert('로그인 후 이용하세요.');
	location.href = "./login.jsp";
</script>

<%
	}

	request.setCharacterEncoding("UTF-8");

	String userpw = request.getParameter("userpw");
	String username = request.getParameter("username");
	String email = (String) session.getAttribute("email");
	String hp = request.getParameter("hp");
	String ssn1 = request.getParameter("ssn1");
	String ssn2 = request.getParameter("ssn2");
	String zipcode = request.getParameter("zipcode");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address3 = request.getParameter("address3");
	String uploadPath = request.getRealPath("upload");
	String profilePic = request.getParameter("profilePic");
	System.out.println(uploadPath);
	int size = 1024 * 1024 * 10;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "";
	String url = "jdbc:mysql://127.0.0.1:3306/webdev";
	String uid = "root";
	String upw = "sksl8866955";

	try {
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
		userpw = multi.getParameter("userpw");
		profilePic = multi.getFilesystemName("profilePic");
		hp = multi.getParameter("hp");
		zipcode = multi.getParameter("zipcode");
		address1 = multi.getParameter("address1");
		address2 = multi.getParameter("address2");
		address3 = multi.getParameter("address3");

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);

		if (conn != null) {
			sql = "UPDATE pj_member SET mem_userpw=PASSWORD(?), mem_hp=?, mem_profilePic=?, mem_zipcode=?, mem_address1=?, mem_address2=?, mem_address3=? WHERE mem_email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userpw);
			pstmt.setString(2, hp);
			pstmt.setString(3, profilePic);
			pstmt.setString(4, zipcode);
			pstmt.setString(5, address1);
			pstmt.setString(6, address2);
			pstmt.setString(7, address3);
			pstmt.setString(8, email);
			pstmt.executeUpdate();

		}

	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
<script>
	alert('회원정보가 수정되었습니다.');
	location.href = './myPage.jsp';
</script>