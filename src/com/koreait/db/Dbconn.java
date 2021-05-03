package com.koreait.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconn {
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			String sql = "";
			String url = "url";
			String uid = "uid";
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
}
