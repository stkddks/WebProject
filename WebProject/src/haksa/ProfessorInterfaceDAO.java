package haksa;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface ProfessorInterfaceDAO {
	public abstract int professorRegisterSql(ProfessorDTO professorDTO) throws SQLException;
    public abstract ResultSet professorListSql() throws SQLException;
    public abstract int professorDeleteSql(String deleteName) throws SQLException;
    public abstract ResultSet professorSearchSql(String searchName) throws SQLException;
    public abstract int professorUpdateSql(String updatehName, ProfessorDTO professorDTO) throws SQLException;
}
