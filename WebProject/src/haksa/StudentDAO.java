
package kr.or.kh.haksa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentDAO {
    private String sql;
    private PreparedStatement pstmt;
    private Connection conn;
    private int cnt;
    private ResultSet rs;
    private ArrayList<StudentDTO> studentList;
    
    public StudentDAO() throws ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        studentList = new ArrayList<StudentDTO>(); 
    }

    public Connection getConnection() throws SQLException {
        conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123", "bbr123", "alstjr95!");
        //Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123", "alstjr95!");
        return conn;
    }
    
    //실행 메소드를 따로 만들어준다
    public int studentExecuter() throws SQLException{
		cnt=pstmt.executeUpdate();	
		return cnt;
	}
    public ResultSet studentExecuter(ResultSet rs) throws SQLException{
    	rs=pstmt.executeQuery();
    	return rs;
    }
    //실행메소드 2개!
    // 이게 오버로드다! 함수의 이름은 똑같되 파라미터를 다르게 주는것!
    
    public int studentRegisterSql(StudentDTO studentDTO) throws SQLException {
    	conn = getConnection();
    	sql = "insert into StudentA (age,name,hakbun) values(?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, studentDTO.getAge());
        pstmt.setString(2, studentDTO.getName());
        pstmt.setString(3, studentDTO.getHakbun());
        cnt = studentExecuter();
        return cnt;
    }
    
    public ResultSet studentListSql() throws SQLException{
    	conn = getConnection();
    	sql = "select * from StudentA";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		rs = studentExecuter(rs);
		return rs;
    }
    public int studentDeleteSql(String deleteName) throws SQLException{
    	conn = getConnection();
    	sql = "delete from StudentA where name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, deleteName);
		cnt = studentExecuter();
    	return cnt;
    }
    public ResultSet studentSearchSql(String searchName) throws SQLException{
    	conn = getConnection();
    	String sql="select * from StudentA where name=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, searchName);
    	rs = studentExecuter(rs);
    	return rs;
    }

    public int studentUpdateSql(String updatehName, StudentDTO studentDTO) throws SQLException{
    	conn = getConnection();
    	String sql = "update StudentA set name=?, age=?, hakbun=? where name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, studentDTO.getName());
		pstmt.setString(2, studentDTO.getAge());
		pstmt.setString(3, studentDTO.getHakbun());
		pstmt.setString(4, updatehName);
		cnt = studentExecuter();
    	return cnt;
    }
}






