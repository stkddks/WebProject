
package kr.or.kh.haksa;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProfessorDAO extends HaksaDAO implements ProfessorInterfaceDAO{
    public ProfessorDAO() throws ClassNotFoundException {
    }
    @Override
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
    @Override
    public ResultSet professorListSql() throws SQLException{
    	conn = getConnection();
    	sql = "select * from ProfessorA";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		rs = professorExecuter(rs);
		return rs;
    }
    @Override
    public int professorDeleteSql(String deleteName) throws SQLException{
    	conn = getConnection();
    	sql = "delete from ProfessorA where name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, deleteName);
		cnt = professorExecuter();
    	return cnt;
    }
    @Override
    public ResultSet professorSearchSql(String searchName) throws SQLException{
    	conn = getConnection();
    	String sql="select * from ProfessorA where name=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, searchName);
    	rs = professorExecuter(rs);
    	return rs;
    }
    @Override
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






