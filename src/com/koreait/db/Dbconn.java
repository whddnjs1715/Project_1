package com.koreait.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconn {
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			String sql = "";
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
}
