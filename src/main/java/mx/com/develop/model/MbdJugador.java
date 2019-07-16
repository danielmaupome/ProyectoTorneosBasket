package mx.com.develop.model;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.naming.NamingException;
import mx.com.develop.objects.Jugador;

public class MbdJugador extends Mbd implements java.io.Serializable {

    public final static long serialVersionUID = 977748269724798214L;
    private final SimpleDateFormat sdf;

    public MbdJugador() {
        super();
        sdf = new SimpleDateFormat("yyyy-MM-dd");
    }

    public boolean insertaJugador(Jugador jugador) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {
            ps = conn.prepareStatement("INSERT INTO jugadores VALUES(?,?,?,?,?)");
            ps.setInt(1, jugador.getIdEquipo());
            ps.setString(2, jugador.getNombre());
            ps.setString(3, jugador.getDireccion());
            ps.setDate(4, new java.sql.Date(jugador.getFechaDeNacimiento().getTime()));
            ps.setString(5, jugador.getFoto());
            exito = ps.execute();
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

    public boolean actualizarJugador(Jugador jugador) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {
            ps = conn.prepareStatement("UPDATE jugadores SET idEquipo = ?, nombre = ?, direccion = ?, foto = ?, fecha_nacimiento = ? WHERE idJugador = ?");
            ps.setInt(1, jugador.getIdEquipo());
            ps.setString(2, jugador.getNombre());
            ps.setString(3, jugador.getDireccion());
            ps.setDate(4, new java.sql.Date(jugador.getFechaDeNacimiento().getTime()));
            ps.setString(5, jugador.getFoto());
            exito = ps.execute();
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

    public Jugador buscaJugador(int idJugador) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        Jugador jugador = null;
        try {
            ps = conn.prepareStatement("SELECT * FROM jugadores WHERE idJugador = ?");
            ps.setInt(1, idJugador);
            rst = ps.executeQuery();
            if (rst.next()) {
                jugador = new Jugador();
                jugador.setIdJugador(rst.getInt(1));
                jugador.setIdEquipo(rst.getInt(2));
                jugador.setNombre(rst.getString(3));
                jugador.setDireccion(rst.getString(4));
                jugador.setFechaDeNacimiento(rst.getDate(5));
                jugador.setFoto(rst.getString(6));
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return jugador;
    }

    public List<Jugador> traerTodosLosJugadores() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Jugador> jugadores = new ArrayList<>();

        try {

            rst = stmt.executeQuery("SELECT * FROM jugadores");
            while (rst.next()) {
                Jugador jugador = new Jugador();
                jugador.setIdJugador(rst.getInt(1));
                jugador.setIdEquipo(rst.getInt(2));
                jugador.setNombre(rst.getString(3));
                jugador.setDireccion(rst.getString(4));
                jugador.setFechaDeNacimiento(rst.getDate(5));
                jugador.setFoto(rst.getString(6));
                jugadores.add(jugador);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return jugadores;
    }

    public boolean eliminaJugador(int idJugador) throws SQLException,
            NamingException {
        getConexion();
        stmt = conn.createStatement();

        try {
            ps = conn.prepareStatement("DELETE FROM jugadores WHERE idJugador = ?");
            ps.setInt(1, idJugador);
            return ps.execute();
        } catch (Exception e) {
            System.out.println("Error en sql: ");
            return false;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
    }

}
