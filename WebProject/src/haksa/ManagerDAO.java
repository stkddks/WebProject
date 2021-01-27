
package kr.or.kh.haksa;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ManagerDAO extends HaksaDAO implements ManagerInterfaceDAO{
   
    
    public ManagerDAO() throws ClassNotFoundException {
    }

    @Override
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
    @Override
    public ResultSet managerListSql() throws SQLException{
    	conn = getConnection();
    	sql = "select * from ManagerA";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		rs = managerExecuter(rs);
		return rs;
    }
    @Override
    public int managerDeleteSql(String deleteName) throws SQLException{
    	conn = getConnection();
    	sql = "delete from ManagerA where name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, deleteName);
		cnt = managerExecuter();
    	return cnt;
    }
    @Override
    public ResultSet managerSearchSql(String searchName) throws SQLException{
    	conn = getConnection();
    	String sql="select * from ManagerA where name=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, searchName);
    	rs = managerExecuter(rs);
    	return rs;
    }
    @Override
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






