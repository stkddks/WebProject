package kr.or.kh.haksa;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface ManagerInterfaceDAO {
	public abstract int managerRegisterSql(ManagerDTO managerDTO) throws SQLException;
    public abstract ResultSet managerListSql() throws SQLException;
    public abstract int managerDeleteSql(String deleteName) throws SQLException;
    public abstract ResultSet managerSearchSql(String searchName) throws SQLException;
    public abstract int managerUpdateSql(String updatehName, ManagerDTO managerDTO) throws SQLException;
}
