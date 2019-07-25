package mx.com.develop.model;

import java.rmi.RemoteException;
import java.sql.*;
import java.util.*;
import javax.naming.NamingException;
import mx.com.develop.objects.Jugador;

public class MbdJugadores extends Mbd {

    public MbdJugadores() {
        super();
    }

    public boolean insertaJugador(Jugador jugador) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("YYYY-MM-dd hh:mm:ss");

            ps = conn.prepareStatement("INSERT INTO jugador (nombre,direccion,fecha_nacimiento,foto,idEquipo) VALUES(?,?,?,?,?)");
            ps.setString(1, jugador.getNombre());
            ps.setString(2, jugador.getDireccion());
            ps.setDate(3, new java.sql.Date(jugador.getFechaDeNacimiento().getTime()));
            ps.setString(4, jugador.getFoto());
            ps.setInt(5, jugador.getIdEquipo());
            ps.executeUpdate();
            exito = true;
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
            ps = conn.prepareStatement("SELECT * FROM jugador WHERE idJugador=?");
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

    public ArrayList<Jugador> traerTodosLosJugadores() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Jugador> jugadores = new ArrayList<Jugador>();

        try {

            ps = conn.prepareStatement("SELECT * FROM jugador ORDER BY nombre");
            rst = ps.executeQuery();
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

    public void eliminaJugador(int idJugador) throws SQLException,
            NamingException {
        getConexion();
        stmt = conn.createStatement();

        try {
            ps = conn.prepareStatement("DELETE FROM jugador WHERE idJugador=?");
            ps.setInt(1, idJugador);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error en sql: ");

        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
    }

    public boolean actualizaJugador(Jugador jugador) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");

             ps = conn.prepareStatement("UPDATE jugador SET nombre=? , direccion=? , fecha_nacimiento=? , "
                    + "idEquipo=? , foto=? WHERE idJugador=?");
                ps.setString(1, jugador.getNombre());
                ps.setString(2, jugador.getDireccion());
                ps.setObject(3, jugador.getFechaDeNacimiento());
                ps.setInt(4, jugador.getIdEquipo());
                ps.setString(5, jugador.getFoto());
                ps.setInt(6, jugador.getIdJugador());
                ps.executeUpdate();
            exito = true;
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

}
