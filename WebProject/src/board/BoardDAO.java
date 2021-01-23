package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class BoardDAO {
	private BoardDTO boardDTO;
	// private BoardDAO boardDAO;
	private ArrayList<BoardDTO> boardList;

	private Connection conn;
	private PreparedStatement pstmt;
	private String sql;
	private int cnt;
	private ResultSet rs;
//    public BoardDAO() throws ClassNotFoundException {
//        Class.forName("com.mysql.jdbc.Driver");
//    }

	public BoardDAO() {
		boardDTO = new BoardDTO();
		boardList = new ArrayList<BoardDTO>();
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

	public void boardClose() {
		try {
			conn.close();
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public int boardRegister(BoardDTO boardDTO) throws SQLException {
		conn = getConnection();
		sql = "insert into BoardA(title,content,author,nal,readcount) values(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, boardDTO.getTitle());
		pstmt.setString(2, boardDTO.getContent());
		pstmt.setString(3, boardDTO.getAuthor());
		pstmt.setString(4, boardDTO.getNal());
		pstmt.setInt(5, boardDTO.getReadcount());
		cnt = pstmt.executeUpdate();
		return cnt;
	}

    public ArrayList<BoardDTO> boardList() throws SQLException{
    	conn=getConnection();
    	sql="select * from BoardA order by no asc";
    	pstmt=conn.prepareStatement(sql);
    	rs=pstmt.executeQuery();
    	boardList=new ArrayList<BoardDTO>();
    	while(rs.next()) {
    		boardDTO=new BoardDTO();
    	boardDTO.setNo(rs.getInt("no"));
    	boardDTO.setTitle(rs.getString("title"));
    	boardDTO.setContent(rs.getString("content"));
    	boardDTO.setAuthor(rs.getString("author"));
    	boardDTO.setNal(rs.getString("nal"));
    	boardDTO.setReadcount(Integer.parseInt(rs.getString("readcount")));
    	boardList.add(boardDTO);
    	}

    	return boardList; //그냥 배열에 담아버려서 리턴으로 돌려주겠다.
    }
	
	
	public int boardDelete(int no) throws SQLException {
		conn = getConnection();
		sql = "delete from BoardA where no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		cnt = pstmt.executeUpdate();
		return cnt;

	}

	public BoardDTO boardSearch(String searchTitle) throws SQLException {
		conn = getConnection();
		sql = "select * from BoardA where title=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchTitle);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			boardDTO.setNo(rs.getInt("no"));
			boardDTO.setTitle(rs.getString("title"));
			boardDTO.setContent(rs.getString("content"));
			boardDTO.setAuthor(rs.getString("author"));
			boardDTO.setNal(rs.getString("nal"));
			boardDTO.setReadcount(rs.getInt("readcount"));
		}
		return boardDTO;

	}

	public void boardReadcount(BoardDTO boardDTO) throws SQLException {
		conn = getConnection();
		sql = "update BoardA set readcount=? where no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, boardDTO.getReadcount() + 1);
		pstmt.setInt(2, boardDTO.getNo());
		cnt = pstmt.executeUpdate();
	}

	public int boardUpdateFinal(String searchTitle, BoardDTO boardDTO) throws SQLException {
		conn = getConnection();
		sql = "update BoardA set title=?, content=?, author=?, nal=?, readcount=? where title=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, boardDTO.getTitle());
		pstmt.setString(2, boardDTO.getContent());
		pstmt.setString(3, boardDTO.getAuthor());
		pstmt.setString(4, boardDTO.getNal());
		pstmt.setInt(5, boardDTO.getReadcount());
		pstmt.setString(6, searchTitle);
		cnt = pstmt.executeUpdate();

		return cnt;
	}

}
