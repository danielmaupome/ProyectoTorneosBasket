package mx.com.develop.model;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.naming.NamingException;
import mx.com.develop.objects.Partido;

public class MbdPartido extends Mbd implements java.io.Serializable {

    public final static long serialVersionUID = 3413305874648863689L;
    private final SimpleDateFormat sdf;

    public MbdPartido() {
        super();
        sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    }

    public boolean insertaPartido(Partido equipo) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {
            ps = conn.prepareStatement("INSERT INTO partidos(equipo_local,equipo_visitante,Estatus,marcador_local,marcador_visitante,fecha) VALUES(?,?,?,?,?,?)");
            ps.setInt(1, equipo.getEquipoLocal());
            ps.setInt(2, equipo.getEquipoVisitante());
            ps.setInt(3, equipo.getEstatus());
            ps.setInt(4, equipo.getMarcadorLocal());
            ps.setInt(5, equipo.getMarcadorVisitante() );
            ps.setDate(6, new java.sql.Date(equipo.getFecha().getTime()) );
            exito = ps.execute();
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

    public boolean actualizarPartido(Partido equipo) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {
            ps = conn.prepareStatement("UPDATE partidos SET equipo_local = ?, equipo_visitante = ?, Estatus = ?, marcador_local = ?, marcador_visitante = ?, fecha = ? WHERE idPartido = ?");
            ps.setInt(1, equipo.getEquipoLocal());
            ps.setInt(2, equipo.getEquipoVisitante());
            ps.setInt(3, equipo.getEstatus());
            ps.setInt(4, equipo.getMarcadorLocal());
            ps.setInt(5, equipo.getMarcadorVisitante() );
            ps.setDate(6, new java.sql.Date(equipo.getFecha().getTime()) );
            exito = ps.execute();
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

    public Partido buscaPartido(int idPartido) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        Partido equipo = null;
        try {
            ps = conn.prepareStatement("SELECT idPartido, equipo_local, equipo_visitante, Estatus, marcador_local, marcador_visitante, fecha FROM partidos WHERE idPartido= ?");
            ps.setInt(1, idPartido);
            rst = ps.executeQuery();
            if (rst.next()) {
                equipo = new Partido();
                equipo.setIdPartido(rst.getInt(1));
                equipo.setEquipoLocal(rst.getInt(2));
                equipo.setEquipoVisitante(rst.getInt(3));
                equipo.setEstatus(rst.getInt(4)); // perdido, ganado, jugado, no jugado
                equipo.setMarcadorLocal(rst.getInt(5));
                equipo.setMarcadorVisitante(rst.getInt(6));
                equipo.setFecha(rst.getDate(7));
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return equipo;
    }

    public List<Partido> traerTodosLosPartidos() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Partido> partidos = new ArrayList<>();

        try {

            rst = stmt.executeQuery("SELECT idPartido, equipo_local, equipo_visitante, Estatus, marcador_local, marcador_visitante, fecha FROM partidos ORDER BY idPartido");
            while (rst.next()) {
                Partido equipo = new Partido();
                equipo.setIdPartido(rst.getInt(1));
                equipo.setEquipoLocal(rst.getInt(2));
                equipo.setEquipoVisitante(rst.getInt(3));
                equipo.setEstatus(rst.getInt(4)); // perdido, ganado, jugado, no jugado
                equipo.setMarcadorLocal(rst.getInt(5));
                equipo.setMarcadorVisitante(rst.getInt(6));
                equipo.setFecha(rst.getDate(7));
                partidos.add(equipo);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return partidos;
    }

    public boolean eliminaPartido(int idPartido) throws SQLException,
            NamingException {
        getConexion();
        stmt = conn.createStatement();

        try {
            ps = conn.prepareStatement("DELETE FROM partidos WHERE idPartido = ?");
            ps.setInt(1, idPartido);
            return true;
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            return false;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
    }

}
