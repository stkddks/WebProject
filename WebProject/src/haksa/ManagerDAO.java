
package haksa;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ManagerDAO extends HaksaDAO{
   
    
    public ManagerDAO() throws ClassNotFoundException {
    }

    
    //실행 메소드를 따로 만들어준다
    public int managerExecuter() throws SQLException{
		cnt=pstmt.executeUpdate();	
		return cnt;
	}
    public ResultSet managerExecuter(ResultSet rs) throws SQLException{
    	rs=pstmt.executeQuery();
    	return rs;
    }
    //실행메소드 2개!
    // 이게 오버로드다! 함수의 이름은 똑같되 파라미터를 다르게 주는것!
    
    public int managerRegisterSql(ManagerDTO managerDTO) throws SQLException {
    	conn = getConnection();
    	sql = "insert into ManagerA (age,name,dept) values(?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, managerDTO.getAge());
        pstmt.setString(2, managerDTO.getName());
        pstmt.setString(3, managerDTO.getDept());
        cnt = managerExecuter();
        return cnt;
    }
    
    public ResultSet managerListSql() throws SQLException{
    	conn = getConnection();
    	sql = "select * from ManagerA";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		rs = managerExecuter(rs);
		return rs;
    }
    public int managerDeleteSql(String deleteName) throws SQLException{
    	conn = getConnection();
    	sql = "delete from ManagerA where name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, deleteName);
		cnt = managerExecuter();
    	return cnt;
    }
    public ResultSet managerSearchSql(String searchName) throws SQLException{
    	conn = getConnection();
    	String sql="select * from ManagerA where name=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, searchName);
    	rs = managerExecuter(rs);
    	return rs;
    }

    public int managerUpdateSql(String updatehName, ManagerDTO managerDTO) throws SQLException{
    	conn = getConnection();
    	String sql = "update ManagerA set name=?, age=?, dept=? where name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, managerDTO.getName());
		pstmt.setString(2, managerDTO.getAge());
		pstmt.setString(3, managerDTO.getDept());
		pstmt.setString(4, updatehName);
		cnt = managerExecuter();
    	return cnt;
    }
}






