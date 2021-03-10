package com.main.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBconn {
	//
	Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
    //
	
	
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			String url = "jdbc:mysql://127.0.0.1:3306/webdev";
			String uid = "root";
			String upw = "sksl8866955";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, uid, upw);
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

public void close() {
	
	try {
		if(pstmt != null) pstmt.close(); 
		if(conn != null)conn.close();
		if (rs != null) rs.close();
	}catch(Exception e) { e.printStackTrace(); }
}//db_close
	
public static void close(Connection conn, PreparedStatement pstmt) {
	try {
		if(pstmt != null) { pstmt.close(); }
		if(conn != null) { conn.close(); }
	}catch(Exception e) { e.printStackTrace(); }
}
public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
	try {
		if(rs != null) { rs.close(); }
		close(conn, pstmt);
	}catch(Exception e) { e.printStackTrace(); }
}
}