
package haksa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProfessorDAO {
    private String sql;
    private PreparedStatement pstmt;
    private Connection conn;
    private int cnt;
    private ResultSet rs;
    private ArrayList<ProfessorDTO> professorList;
    
    public ProfessorDAO() throws ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        professorList = new ArrayList<ProfessorDTO>(); 
    }

    public Connection getConnection() throws SQLException {
        conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123", "bbr123", "alstjr95!");
        //Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123", "alstjr95!");
        return conn;
    }
    
    //실행 메소드를 따로 만들어준다
    public int professorExecuter() throws SQLException{
		cnt=pstmt.executeUpdate();	
		return cnt;
	}
    public ResultSet professorExecuter(ResultSet rs) throws SQLException{
    	rs=pstmt.executeQuery();
    	return rs;
    }
    //실행메소드 2개!
    // 이게 오버로드다! 함수의 이름은 똑같되 파라미터를 다르게 주는것!
    
    public int professorRegisterSql(ProfessorDTO professorDTO) throws SQLException {
    	conn = getConnection();
    	sql = "insert into ProfessorA (age,name,subject) values(?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, professorDTO.getAge());
        pstmt.setString(2, professorDTO.getName());
        pstmt.setString(3, professorDTO.getSubject());
        cnt = professorExecuter();
        return cnt;
    }
    
    public ResultSet professorListSql() throws SQLException{
    	conn = getConnection();
    	sql = "select * from ProfessorA";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		rs = professorExecuter(rs);
		return rs;
    }
    public int professorDeleteSql(String deleteName) throws SQLException{
    	conn = getConnection();
    	sql = "delete from ProfessorA where name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, deleteName);
		cnt = professorExecuter();
    	return cnt;
    }
    public ResultSet professorSearchSql(String searchName) throws SQLException{
    	conn = getConnection();
    	String sql="select * from ProfessorA where name=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, searchName);
    	rs = professorExecuter(rs);
    	return rs;
    }

    public int professorUpdateSql(String updatehName, ProfessorDTO professorDTO) throws SQLException{
    	conn = getConnection();
    	String sql = "update ProfessorA set name=?, age=?, subject=? where name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, professorDTO.getName());
		pstmt.setString(2, professorDTO.getAge());
		pstmt.setString(3, professorDTO.getSubject());
		pstmt.setString(4, updatehName);
		cnt = professorExecuter();
    	return cnt;
    }
}






