package dangn.town.ttown;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dangn.town.ttown.TtownDTO;

import dangn.town.db.DBconn;

public class TtownDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	TtownDTO ttown;
	String sql = "";
	String eamil = "";
	
	public TtownDTO insertFile(TtownDTO ttownDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String[] generatedColumns = {"t_idx"};
		try {
			conn = DBconn.getConnection();
			String sql = "INSERT INTO tb_town (t_Name, t_select1, t_select2, sample6_address, sample6_detailAddress, t_hp, t_web, t_content, t_pic1,t_pic2,t_pic3,t_pic4,t_pic5) VALUES (?, ?, ? ,? ,? ,? ,? ,? ,?, ?, ?,?,?)";
			pstmt = conn.prepareStatement(sql, generatedColumns);
			pstmt.setString(1, ttownDTO.getName());
			pstmt.setString(2, ttownDTO.getSelect1());
			pstmt.setString(3, ttownDTO.getSelect2());
			pstmt.setString(4, ttownDTO.getAddress());
			pstmt.setString(5, ttownDTO.getDetailAddress());
			pstmt.setString(6, ttownDTO.getHp());
			pstmt.setString(7, ttownDTO.getWeb());
			pstmt.setString(8, ttownDTO.getContent());
			pstmt.setString(9, ttownDTO.getPic1());
			pstmt.setString(10, ttownDTO.getPic2());
			pstmt.setString(11, ttownDTO.getPic3());
			pstmt.setString(11, ttownDTO.getPic4());
			pstmt.setString(11, ttownDTO.getPic5());
			int result = pstmt.executeUpdate();
			
			try(ResultSet geneResultKey = pstmt.getGeneratedKeys()){
				if(geneResultKey.next()) {
					ttownDTO.setIdx(geneResultKey.getInt("t_idx"));
				}
			}
			
			if(result >= 1) {
				System.out.println("Insert �꽦怨�!");
				ttownDTO = this.updateFilePath(ttownDTO);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBconn.close(conn, pstmt);
		}
		return ttownDTO;
	}
	
	public TtownDTO updateFilePath(TtownDTO ttownDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBconn.getConnection();
			String sql = "UPDATE t_town SET t_filepath = ? WHERE t_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ttownDTO.getIdx());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBconn.close(conn, pstmt);
		}
		return ttownDTO;
	}
	
	public List<TtownDTO> selectTtown(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TtownDTO> ttownList = new ArrayList<>();
		try {
			conn = DBconn.getConnection();
			String sql = "SELECT * FROM t_town order by t_idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TtownDTO ttown = new TtownDTO();
				ttown.setIdx(rs.getInt("t_idx"));
				ttown.setName(rs.getString("t_name"));
				ttown.setSelect1(rs.getString("t_select1"));
				ttown.setSelect2(rs.getString("t_select2"));
				ttown.setAddress(rs.getString("sample6_address"));
				ttown.setDetailAddress(rs.getString("sample6_detailAddress"));
				ttown.setHp(rs.getString("t_hp"));
				ttown.setWeb(rs.getString("t_web"));
				ttown.setContent(rs.getString("t_content"));
				ttown.setPic1(rs.getString("t_pic1"));
				ttown.setPic2(rs.getString("t_pic2"));
				ttown.setPic3(rs.getString("t_pic3"));
				ttown.setPic4(rs.getString("t_pic4"));
				ttown.setPic5(rs.getString("t_pic5"));
				ttownList.add(ttown);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) { pstmt.close(); }
				if(conn != null) { conn.close(); }
			}catch(SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return ttownList;
	}

	
}
