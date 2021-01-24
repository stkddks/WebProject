package kr.or.kh.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kh.or.kh.board.BoardDTO;

public class MemberDAO {
	private MemberDTO memberDTO;
	private ArrayList<MemberDTO> memberList;
	private Connection conn;
	private PreparedStatement pstmt;
	private String sql;
	private ResultSet rs;
	int cnt;

	public MemberDAO() {
		memberDTO = new MemberDTO();
		memberList = new ArrayList<MemberDTO>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws SQLException {
		conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123", "bbr123", "alstjr95!");
		// Connection conn =
		// DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123",
		// "alstjr95!");
		return conn;
	}
//   public Connection getConnection() throws SQLException{
//      conn = DriverManager.getConnection("jdbc:mysql://underdogb.cafe24.com:3306/underdogb?characterEncoding=utf8", "underdogb", "khacademy1!");
//      //Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/underdogb?characterEncoding=utf8", "underdogb", "khacademy1!"); //cafe24 배포 이후 
//      return conn;
//   }

	public int memberRegister(MemberDTO memberDTO) throws SQLException {
		conn = getConnection();
		sql = "insert into MemberA(id,pw,addr,tel) values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberDTO.getId());
		pstmt.setString(2, memberDTO.getPw());
		pstmt.setString(3, memberDTO.getAddr());
		pstmt.setString(4, memberDTO.getTel());
		cnt = pstmt.executeUpdate();
		return cnt;
	}

	public ArrayList<MemberDTO> memberList() throws SQLException {
		conn = getConnection();
		sql = "select id, pw, addr, tel from MemberA";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		memberList = new ArrayList<MemberDTO>();
		while (rs.next()) {
			memberDTO = new MemberDTO();
			memberDTO.setId(rs.getString("id"));
			memberDTO.setPw(rs.getString("pw"));
			memberDTO.setAddr(rs.getString("addr"));
			memberDTO.setTel(rs.getString("tel"));
			memberList.add(memberDTO);
		}
		return memberList;
	}

	public int memberBye(String deleteId) throws SQLException {
		conn = getConnection();
		sql = "delete from MemberA where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, deleteId);
		cnt = pstmt.executeUpdate();
		return cnt;
	}

	public MemberDTO memberLogin(String id, String pw) throws SQLException {
		conn = getConnection();
		sql = "select id, pw from MemberA where id=? and pw=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			memberDTO.setId(rs.getString("id"));
			memberDTO.setPw(rs.getString("pw"));
		}
		return memberDTO;
	}

	public MemberDTO memberIdSearch(String searchAddr, String searchTel) throws SQLException {
		conn = getConnection();
		sql = "select * from MemberA where addr=? and tel=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchAddr);
		pstmt.setString(2, searchTel);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			memberDTO.setId(rs.getString("id"));
			memberDTO.setPw(rs.getString("pw"));
			memberDTO.setAddr(rs.getString("addr"));
			memberDTO.setTel(rs.getString("tel"));
		}
		return memberDTO;
	}

	public MemberDTO memberSearch(String searchId) throws SQLException {
		conn = getConnection();
		sql = "select * from MemberA where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchId);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			memberDTO.setId(rs.getString("id"));
			memberDTO.setPw(rs.getString("pw"));
			memberDTO.setAddr(rs.getString("addr"));
			memberDTO.setTel(rs.getString("tel"));
		}
		return memberDTO;

	}

	public int memberUpdateFinal(String searchId, MemberDTO memberDTO) throws SQLException {
		conn = getConnection();
		sql = "update MemberA set id=?, pw=?, addr=?, tel=? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberDTO.getId());
		pstmt.setString(2, memberDTO.getPw());
		pstmt.setString(3, memberDTO.getAddr());
		pstmt.setString(4, memberDTO.getTel());
		pstmt.setString(5, searchId);
		cnt = pstmt.executeUpdate();

		return cnt;
	}
}
