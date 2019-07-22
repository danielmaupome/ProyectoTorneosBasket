package mx.com.develop.model;

import java.sql.*;
import java.util.*;
import javax.naming.NamingException;
import mx.com.develop.objects.Usuario;

public class MbdUsuarios extends Mbd implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    public MbdUsuarios() {
        super();
    }

    public boolean insertaUsuario(Usuario usuario) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            ps = conn.prepareStatement("INSERT INTO usuarios(nombre,login,password,email) VALUES(?,?,?,?)");
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getLogin());
            ps.setString(3, usuario.getPassword());
            ps.setString(4, usuario.getEmail());
            exito = ps.execute();
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

    public boolean actualizarUsuario(Usuario usuario) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {
            
            ps = conn.prepareStatement("UPDATE equipos SET nombre = ?, logotipo = ?, color_primario = ?, color_secundario = ? WHERE idEquipo = ?");
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getLogin());
            ps.setString(3, usuario.getPassword());
            ps.setString(4, usuario.getEmail());
            ps.setInt(5, usuario.getIdUsuario());
            exito = ps.execute();
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

    public Usuario buscaUsuario(int idUsuario) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        Usuario usuario = null;
        try {
            ps = conn.prepareStatement("SELECT * FROM usuarios WHERE idUsuario= ?");
            ps.setInt(1, idUsuario);
            rst = ps.executeQuery();
            if (rst.next()) {
                usuario = new Usuario();
                usuario.setIdUsuario(rst.getInt(1));
                usuario.setNombre(rst.getString(2));
                usuario.setLogin(rst.getString(3));
                usuario.setPassword(rst.getString(4));
                usuario.setEmail(rst.getString(5));
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return usuario;
    }

    public Usuario buscaUsuario(String login, String password) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        Usuario usuario = null;
        try {
            ps = conn.prepareStatement("SELECT * FROM usuarios WHERE login= ? AND password= ?");
            ps.setString(1, login);
            ps.setString(2, password);
            rst = ps.executeQuery();
            if (rst.next()) {
                usuario = new Usuario();
                usuario.setIdUsuario(rst.getInt(1));
                usuario.setNombre(rst.getString(2));
                usuario.setLogin(rst.getString(3));
                usuario.setPassword(rst.getString(4));
                usuario.setEmail(rst.getString(5));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return usuario;
    }

    public List<Usuario> traerTodosLosUsuarios() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Usuario> usuarios = new ArrayList<>();

        try {

            rst = stmt.executeQuery("SELECT * FROM usuarios ORDER BY nombre");
            while (rst.next()) {
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rst.getInt(1));
                usuario.setNombre(rst.getString(2));
                usuario.setLogin(rst.getString(3));
                usuario.setPassword(rst.getString(4));
                usuario.setEmail(rst.getString(5));
                usuarios.add(usuario);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return usuarios;
    }

    public boolean eliminaUsuario(int idUsuario) throws SQLException,
            NamingException {
        getConexion();
        stmt = conn.createStatement();

        try {
            ps = conn.prepareStatement("DELETE FROM usuarios WHERE idUsuario = ?");
            ps.setInt(1, idUsuario);
            return ps.execute();
        } catch (Exception e) {
            System.out.println("Error en sql: ");
            return false;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
    }

}
