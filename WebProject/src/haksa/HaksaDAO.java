package haksa;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public abstract class HaksaDAO {
    protected String sql;
    protected PreparedStatement pstmt;
    protected Connection conn;
    protected int cnt;
    protected ResultSet rs;
    
    public HaksaDAO() throws ClassNotFoundException {		// 상속받을 때 부모가 에러를 던지면 자식도 똑같이 던져야한다. 
        Class.forName("com.mysql.jdbc.Driver");
    }
    public Connection getConnection() throws SQLException {
        conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123", "bbr123", "alstjr95!");
        //conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123", "alstjr95!");
        return conn;
    }

    public int studentExecuter() throws SQLException{		//오버로드니까 따로 상속을 굳이 안해줘도 된다(어차피 오버로드를 쓴 것이니까)
		cnt=pstmt.executeUpdate();	
		return cnt;
	}
    public ResultSet studentExecuter(ResultSet rs) throws SQLException{
    	rs=pstmt.executeQuery();
    	return rs;
    }
    
    public int professorExecuter() throws SQLException{
		cnt=pstmt.executeUpdate();	
		return cnt;
	}
    public ResultSet professorExecuter(ResultSet rs) throws SQLException{
    	rs=pstmt.executeQuery();
    	return rs;
    }
    
    public int managerExecuter() throws SQLException{
  		cnt=pstmt.executeUpdate();	
  		return cnt;
  	}
      public ResultSet managerExecuter(ResultSet rs) throws SQLException{
      	rs=pstmt.executeQuery();
      	return rs;
      }
    

}