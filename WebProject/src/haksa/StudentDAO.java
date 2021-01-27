package haksa;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentDAO  extends HaksaDAO implements StudentInterfaceDAO{
   // private ArrayList<StudentDTO> studentList;
    
    public StudentDAO() throws ClassNotFoundException {
      
    }
    @Override
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
    @Override
    public ResultSet studentListSql() throws SQLException{
    	conn = getConnection();
    	sql = "select * from StudentA";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		rs = studentExecuter(rs);
		return rs;
    }
    @Override
    public int studentDeleteSql(String deleteName) throws SQLException{
    	conn = getConnection();
    	sql = "delete from StudentA where name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, deleteName);
		cnt = studentExecuter();
    	return cnt;
    }
    @Override
    public ResultSet studentSearchSql(String searchName) throws SQLException{
    	conn = getConnection();
    	String sql="select * from StudentA where name=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, searchName);
    	rs = studentExecuter(rs);
    	return rs;
    }
    @Override
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






