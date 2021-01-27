package haksa;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface StudentInterfaceDAO {
	public abstract int studentRegisterSql(StudentDTO studentDTO) throws SQLException;
    public abstract ResultSet studentListSql() throws SQLException;
    public abstract int studentDeleteSql(String deleteName) throws SQLException;
    public abstract ResultSet studentSearchSql(String searchName) throws SQLException;
    public abstract int studentUpdateSql(String updatehName, StudentDTO studentDTO) throws SQLException;
}
