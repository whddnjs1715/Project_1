<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%	
		
		
	
	   String t_idx = "";
	   String t_name = "";
	   String t_select1 = "";
	   String t_select2 = "";
	   String sample6_address = "";
	   String sample6_detailAddress = "";
	   String t_hp = "";
	   String t_web = "";
	   String t_content = "";
	   String t_pic1 = "";
	   String t_pic2 = "";
	   String t_pic3 = "";
	   String t_pic4 = "";
	   String t_pic5 = "";
	   

	String uploadPath = request.getRealPath("upload");
	   System.out.println(uploadPath);

	   int size = 1024*1024*10;
	   	   
	   try{
	      MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
	      t_idx = multi.getParameter("t_idx");
	      
	      t_name = multi.getParameter("t_name");
	      t_select1 = multi.getParameter("t_select1");
	      t_select2 = multi.getParameter("t_select2");
	      sample6_address = multi.getParameter("sample6_address");
	      sample6_detailAddress = multi.getParameter("sample6_detailAddress");
	      t_hp = multi.getParameter("t_hp");
	      t_web = multi.getParameter("t_web");
	      t_content = multi.getParameter("t_content");	      
	      t_pic1 = multi.getFilesystemName("t_pic1");
	      t_pic2 = multi.getFilesystemName("t_pic2");   
	      t_pic3 = multi.getFilesystemName("t_pic3");
	      t_pic4 = multi.getFilesystemName("t_pic4");  
	      t_pic5 = multi.getFilesystemName("t_pic5");  
	      
	   
	      
	     
	      
	   }catch(Exception e){
	      e.printStackTrace();
	   }
	   System.out.println(t_name);
	   System.out.println(t_select1);
	   System.out.println(t_select2);
	   System.out.println(sample6_address);   
	   System.out.println(sample6_detailAddress);
	   System.out.println(t_hp);
	   System.out.println(t_web);
	   System.out.println(t_content);
	   System.out.println(t_pic1);
	   System.out.println(t_pic2);
	   System.out.println(t_pic3);
	   System.out.println(t_pic4);
	   System.out.println(t_pic5);
	
	String sql = "";
	String url = "jdbc:mysql://127.0.0.1:3306/webdev";
	String uid = "root";
	String upw = "sksl8866955";
	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		System.out.println("db연결 성공!");
		if(conn != null){
			sql = "INSERT INTO t_town (t_idx, t_name, t_select1, t_select2, sample6_address, sample6_detailAddress, t_hp, t_web, t_content, t_pic1, t_pic2, t_pic3, t_pic4, t_pic5) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t_idx);
			pstmt.setString(2, t_name);
			pstmt.setString(3, t_select1);
			pstmt.setString(4, t_select2);
			pstmt.setString(5, sample6_address);
			pstmt.setString(6, sample6_detailAddress);
			pstmt.setString(7, t_hp);
			pstmt.setString(8, t_web);
			pstmt.setString(9, t_content);	
			pstmt.setString(10, t_pic1);
			pstmt.setString(11, t_pic2);
			pstmt.setString(12, t_pic3);
			pstmt.setString(13, t_pic4);
			pstmt.setString(14, t_pic5);
			pstmt.executeUpdate();
		}
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(SQLException e){
		e.printStackTrace();
	}
%>

<script>
	alert('업체등록이 완료되었습니다.');
	location.href='./maintown.jsp';
</script>