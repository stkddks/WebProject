package kr.or.kh.haksa;

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

public class HaksaDAO {
    protected String sql;
    protected PreparedStatement pstmt;
    protected Connection conn;
    protected int cnt;
    protected ResultSet rs;
    
    public HaksaDAO() throws ClassNotFoundException {		// 상속받을 때 부모가 에러를 던지면 자식도 똑같이 던져야한다. 
        Class.forName("com.mysql.jdbc.Driver");
       // studentList = new ArrayList<StudentDTO>(); 
    }
    public Connection getConnection() throws SQLException {
        conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123", "bbr123", "alstjr95!");
        //Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123", "alstjr95!");
        return conn;
    }


}