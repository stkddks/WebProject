package board;

import java.sql.SQLException;
import java.util.ArrayList;

public interface BoardInterfaceDAO {
	public abstract int boardRegister(BoardDTO boardDTO) throws SQLException;
	public abstract ArrayList<BoardDTO> boardList() throws SQLException;
	public abstract int boardDelete(int no) throws SQLException ;
	public abstract BoardDTO boardSearch(String searchTitle) throws SQLException;
	public abstract void boardReadcount(BoardDTO boardDTO) throws SQLException ;
	public abstract int boardUpdateFinal(String searchTitle, BoardDTO boardDTO) throws SQLException;
	public abstract int totalCount();
	public abstract PageTo page(int curPage);
}
