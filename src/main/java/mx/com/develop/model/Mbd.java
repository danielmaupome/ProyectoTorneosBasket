package mx.com.develop.model;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class Mbd {

    String consultaSQL = null;
    Context ctx = null;
    DataSource ds = null;
    Connection conn = null;

    ResultSet rst = null;
    Statement stmt = null;
    PreparedStatement ps = null;
    CallableStatement ocs = null;

    public void getConexion() throws NamingException, SQLException {
        ctx = new InitialContext();
        ds = (DataSource) ctx.lookup("jdbc/basquetball");
        conn = ds.getConnection();
    }

    public void getConexionMonex() throws NamingException, SQLException {
        ctx = new InitialContext();
        ds = (DataSource) ctx.lookup("dcorp.DSDCorpTransaccional");
        conn = ds.getConnection();
    }

    public void returnConexion(Connection conn, PreparedStatement ps, ResultSet rst, Statement stmt) {
        try {
            if (rst != null) {
                rst.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void returnConexion(Connection conn, PreparedStatement ps, ResultSet rst, Statement stmt, CallableStatement ocs) {
        try {
            if (rst != null) {
                rst.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (ocs != null) {
                ocs.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
