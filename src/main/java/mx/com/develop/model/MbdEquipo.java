package mx.com.develop.model;

import java.sql.*;
import java.util.*;
import javax.naming.NamingException;
import mx.com.develop.objects.Equipo;

public class MbdEquipo extends Mbd implements java.io.Serializable {

    public final static long serialVersionUID = 3413305874648863689L;

    public MbdEquipo() {
        super();
    }

    public boolean insertaEquipo(Equipo equipo) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            ps = conn.prepareStatement("INSERT INTO equipos(nombre,logotipo,color_primario,color_secundario) VALUES(?,?,?,?)");
            ps.setString(1, equipo.getNombre());
            ps.setString(2, equipo.getLogotipo());
            ps.setString(3, equipo.getColorPrimario());
            ps.setString(4, equipo.getColorSecundario());
            exito = ps.execute();
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

    public boolean actualizarEquipo(Equipo equipo) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {
            ps = conn.prepareStatement("UPDATE equipos SET nombre = ?, logotipo = ?, color_primario = ?, color_secundario = ? WHERE idEquipo = ?");
            ps.setString(1, equipo.getNombre());
            ps.setString(2, equipo.getLogotipo());
            ps.setString(3, equipo.getColorPrimario());
            ps.setString(4, equipo.getColorSecundario());
            ps.setInt(5, equipo.getIdEquipo());
            exito = ps.execute();
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

    public List<Equipo> traerTodosLosEquipos() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Equipo> equipos = new ArrayList<>();

        try {

            rst = stmt.executeQuery("SELECT * FROM equipos ORDER BY nombre");
            while (rst.next()) {
                Equipo equipo = new Equipo();
                equipo.setIdEquipo(rst.getInt(1));
                equipo.setNombre(rst.getString(2));
                equipo.setLogotipo(rst.getString(3));
                equipo.setColorPrimario(rst.getString(4));
                equipo.setColorSecundario(rst.getString(5));
                equipos.add(equipo);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return equipos;
    }
    
     public Equipo buscaEquipo(int idJugador) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        Equipo equipo = new Equipo();

        try {

            ps = conn.prepareStatement("SELECT * FROM equipos WHERE idEquipo = ? ORDER BY nombre");
            ps.setInt(1, idJugador);
            rst = ps.executeQuery();
            if (rst.next()) {
                equipo.setIdEquipo(rst.getInt(1));
                equipo.setNombre(rst.getString(2));
                equipo.setLogotipo(rst.getString(3));
                equipo.setColorPrimario(rst.getString(4));
                equipo.setColorSecundario(rst.getString(5));
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return equipo;
    }

    public boolean eliminaEquipo(int idEquipo) throws SQLException,
            NamingException {
        getConexion();
        stmt = conn.createStatement();

        try {
            ps = conn.prepareStatement("DELETE FROM equipos WHERE idEquipo = ?");
            ps.setInt(1, idEquipo);
            return ps.execute();
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            return false;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
    }

}
