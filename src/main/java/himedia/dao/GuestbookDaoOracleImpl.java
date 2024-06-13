package himedia.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import himedia.vo.GuestbookVo;

public class GuestbookDaoOracleImpl implements GuestbookDao{

	private String dbuser;
	private String dbpass;

	
	//생성자
	public GuestbookDaoOracleImpl(String dbuser, String dbpass) {
		
		this.dbuser = dbuser;
		this.dbpass = dbpass;
	}
	
	// 데이터베이스 접속 정보 -> 컨텍스트 파라미터로부터 받아옴
		// Connection 공통 메서드
		private Connection getConnection() throws SQLException {
			Connection conn = null;

			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
				conn = DriverManager.getConnection(dburl, dbuser, dbpass);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			return conn;
		}

	@Override
	public List<GuestbookVo> getList() {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<GuestbookVo> list = new ArrayList<>();
		
		try {
			//connection
			conn = getConnection();
			//stmt
			stmt = conn.createStatement();
			//query 
			String sql = "SELECT * FROM guestbook ORDER BY reg_date DESC";
			//rs
			rs = stmt.executeQuery(sql);
			//rs-> 자바객체로 전환
			while (rs.next()) {//뒤쪽 레코드를 받아옴
				
				Long no = rs.getLong("no");
				String name = rs.getString("name");
				String password = rs.getString("password");
				String content = rs.getString("content");
				Date regDate = rs.getDate("reg_date");
				
				GuestbookVo vo = new GuestbookVo(no, name, password, content, regDate);
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//자원 해제
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
				
	}

	@Override
	public boolean insert(GuestbookVo vo) {
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int insertedCount = 0;
		
		try {
			//getConnection
			conn = getConnection();
			//sql
			String sql = "INSERT INTO Guestbook (no, name, password, content, reg_date) "+
						"values (seq_guestbook_no.nextval, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			
			//binding data
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getContent());
			
			//확정된 쿼리 수행
			insertedCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return insertedCount == 1;
	}

	@Override
	public boolean delete(Long no) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int deletedCount = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM guestbook WHERE no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, no);
			
			deletedCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return deletedCount == 1;
	}
	
	
	
}
