package dangn.town.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBconn {
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			String url = "jdbc:mysql://127.0.0.1:3306/webdev";
			String uid = "id";
			String upw = "pw";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, uid, upw);
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
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
