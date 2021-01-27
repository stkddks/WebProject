package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class BoardDAO implements BoardInterfaceDAO{
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

	@Override
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

	@Override
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
	
	@Override
	public int totalCount() {
		int count = 0;
		try {
			conn = getConnection();
			sql = "select count(num) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
//			finally {
//			closeAll(rs, pstmt, con);
//		}
		return count;
	}
	
	@Override
	public PageTo page(int curPage) {
		PageTo pageTo = new PageTo();
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			conn = getConnection();
			sql="select * from BoardA order by no asc";
//			sql = "select * from (select rownum rnum, num, author, title, "
//					+ "content, to_char (writeday,'yyyy/MM/DD')writeday, readCnt, repRoot, "
//					+ "repStep, repIndent from (select * from board order by repRoot "
//					+ "desc,repStep asc)) where rnum>=? and rnum<=? ";
			// from 테이블명 을 쓰면 relation도 가져온다.
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
					// TYPE_SCROLL_INSENSITIVE 는 가능하나, 변경된 사항은 적용되지 않음
					// 양방향 스크롤시 업데이티 반영안함
					// CONCUR_READ_ONLY 는 커서릐 위치에서 정보 업데이트불가, ResultSet의 변경이 불가능

//			int startRow = (curPage - 1) * perPage + 1;
//			int endRow = curPage * perPage;
//			pstmt.setInt(1, startRow);
//			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			boardList=new ArrayList<BoardDTO>();
			int perPage=pageTo.getPerPage();
			int skip = (curPage-1)*perPage;
			
			if(skip>0){
				rs.absolute(skip);
				//ResultSet의 absolute메소드를 이용하여 해당페이지의 Cursor의 위치로 이동한다.
			}
			
			for (int i = 0; i < perPage && rs.next(); i++){
//			while (rs.next()) {
//				int no = rs.getInt("no");
//				String title = rs.getString("title");
//				String content = rs.getString("content");
//				String author = rs.getString("author");
//				String nal = rs.getString("nal");
//				int readCount =rs.getInt("readcount");
				boardDTO=new BoardDTO();
				boardDTO.setNo(rs.getInt("no"));
		    	boardDTO.setTitle(rs.getString("title"));
		    	boardDTO.setContent(rs.getString("content"));
		    	boardDTO.setAuthor(rs.getString("author"));
		    	boardDTO.setNal(rs.getString("nal"));
		    	boardDTO.setReadcount(Integer.parseInt(rs.getString("readcount")));
		    	boardList.add(boardDTO);
				list.add(boardDTO);
			}
			int totalCount = totalCount();
			pageTo.setList(list);
			pageTo.setCurPage(curPage);
			pageTo.setTotalCount(totalCount);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
//		finally {
//			closeAll(rs, pstmt, conn);
//		}
		return pageTo;
	}
	
	@Override
	public int boardDelete(int no) throws SQLException {
		conn = getConnection();
		sql = "delete from BoardA where no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		cnt = pstmt.executeUpdate();
		return cnt;

	}

	@Override
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

	@Override
	public void boardReadcount(BoardDTO boardDTO) throws SQLException {
		conn = getConnection();
		sql = "update BoardA set readcount=? where no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, boardDTO.getReadcount() + 1);
		pstmt.setInt(2, boardDTO.getNo());
		cnt = pstmt.executeUpdate();
	}

	@Override
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
