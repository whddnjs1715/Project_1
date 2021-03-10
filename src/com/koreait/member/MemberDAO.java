package com.koreait.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.koreait.db.Dbconn;
import com.koreait.member.MemberDTO;

import com.main.db.DBconn;
import com.main.fileupload.fileuploadDTO;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	MemberDTO member;
	fileuploadDTO fileupload;
	String sql = "";
	
	public int join(MemberDTO member) {
		try {
			sql = "insert into pj_member(mem_username, mem_userpw, mem_ssn1, mem_ssn2, mem_hp, mem_email, mem_emailHash) values (?, PASSWORD(?), ?, ?, ?, ?, ?)";
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUsername());
			pstmt.setString(2, member.getUserpw());
			pstmt.setString(3, member.getSsn1());
			pstmt.setString(4, member.getSsn2());
			pstmt.setString(5, member.getHp());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getEmailHash());
			
			if(pstmt.executeUpdate() != 0) {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {	
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			}catch(SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return 0;
	}

	public int emailCheck(String email) {
		try {
			sql = "UPDATE pj_member SET mem_emailcheck = 'yes' WHERE mem_emailHash = ?";
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.executeUpdate();
			if(pstmt.executeUpdate() != 0) {
				return 1;
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
		return 0;
	}
	
	public MemberDTO login(MemberDTO member) {
		String sql ="select mem_username from pj_member where mem_email=? and mem_userpw=password(?)";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getUserpw());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member.setUsername(rs.getString("mem_username"));
				return member;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
				if(rs != null) {rs.close();}
			}catch(SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return null;
	}
	
	public MemberDTO loginEmailCheked(MemberDTO member) {
		String sql ="select mem_emailcheck from pj_member where mem_email=? and mem_userpw=password(?)";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getUserpw());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member.setEmailcheck(rs.getString("mem_emailcheck"));
				return member;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
				if(rs != null) {rs.close();}
			}catch(SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return null;
	}
	
	public int emailHash(MemberDTO member) {
		try {
			sql = "UPDATE pj_member SET mem_emailHash = ? where mem_email =?";
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmailHash());
			pstmt.setString(2, member.getEmail());
			if(pstmt.executeUpdate() != 0) {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {	
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			}catch(SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return 0;
	}
	

	
	public MemberDTO setEmailHash(MemberDTO member) {
		String sql = "SELECT mem_emailHash FROM tb_member WHERE mem_email=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member.setEmailHash(rs.getString("mem_emailHash"));
				return member;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) { pstmt.close(); }
				if(conn != null) { conn.close(); }
				if(rs != null) { rs.close(); }
			}catch(SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return null;
	}
	
}
