package mx.com.develop.model;

import java.sql.*;
import java.text.ParseException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import mx.com.develop.objects.Partido;

public class MbdPartidos extends Mbd {

    public MbdPartidos() {
        super();
    }

    public boolean insertaPartido(Partido partido) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {
            
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("YYYY-MM-dd kk:mm");

            ps = conn.prepareStatement("INSERT INTO partido (equipo_local,equipo_visitante,Estatus,marcador_local,marcador_visitante,idCancha,fecha) VALUES("
                    + "?,?,?,?,?,?,?)");
            ps.setInt(1, partido.getEquipoLocal());
            ps.setInt(2, partido.getEquipoVisitante());
            ps.setString(3, partido.getEstatus());
            ps.setInt(4, partido.getMarcadorLocal());
            ps.setInt(5, partido.getMarcadorVisitante());
            ps.setInt(6, partido.getIdCancha());
            ps.setDate(7, new java.sql.Date(partido.getFecha().getTime()));
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

    public Partido buscaPartido(int idPartido) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        Partido partido = null;
        try {
            ps = conn.prepareStatement("SELECT * FROM partido WHERE idPartido=?");
            ps.setInt(1, idPartido);
            rst = ps.executeQuery();
            if (rst.next()) {
                partido = new Partido();
                partido.setIdPartido(rst.getInt(1));
                partido.setEquipoLocal(rst.getInt(2));
                partido.setEquipoVisitante(rst.getInt(3));
                partido.setEstatus(rst.getString(4));
                partido.setMarcadorLocal(rst.getInt(5));
                partido.setMarcadorVisitante(rst.getInt(6));
                partido.setIdCancha(rst.getInt(7));
                partido.setFecha(new java.util.Date(rst.getTimestamp(8).getTime()));
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return partido;
    }

    public Partido buscaPartido(int equipoLocal, int equipoVisitante) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        Partido partido = null;
        try {
            ps = conn.prepareStatement("SELECT * FROM partido WHERE equipo_local=? AND equipo_visitante=?");
            ps.setInt(1, equipoLocal);
            ps.setInt(2, equipoVisitante);
            rst = ps.executeQuery();
            if (rst.next()) {
                partido = new Partido();
                partido.setIdPartido(rst.getInt(1));
                partido.setEquipoLocal(rst.getInt(2));
                partido.setEquipoVisitante(rst.getInt(3));
                partido.setEstatus(rst.getString(4));
                partido.setMarcadorLocal(rst.getInt(5));
                partido.setMarcadorVisitante(rst.getInt(6));
                partido.setIdCancha(rst.getInt(7));
                partido.setFecha(new java.util.Date(rst.getTimestamp(8).getTime()));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return partido;
    }

    public ArrayList<Partido> traerTodosLosPartidos() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Partido> partidos = new ArrayList<>();

        try {

            ps = conn.prepareStatement("SELECT * FROM partido ORDER BY fecha desc");
            rst = ps.executeQuery();
            while (rst.next()) {
                Partido partido = new Partido();
                partido.setIdPartido(rst.getInt(1));
                partido.setEquipoLocal(rst.getInt(2));
                partido.setEquipoVisitante(rst.getInt(3));
                partido.setEstatus(rst.getString(4));
                partido.setMarcadorLocal(rst.getInt(5));
                partido.setMarcadorVisitante(rst.getInt(6));
                partido.setIdCancha(rst.getInt(7));
                partido.setFecha(new java.util.Date(rst.getTimestamp(8).getTime()));
                partidos.add(partido);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return partidos;
    }

    public void eliminaPartido(int idPartido) throws SQLException,
            NamingException {
        getConexion();
        stmt = conn.createStatement();

        try {
            ps = conn.prepareStatement("DELETE FROM partido WHERE idPartido=?");
            ps.setInt(1, idPartido);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error en sql: ");

        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
    }

    public void eliminaPartido(int equipoLocal, int equipoVisitante) throws SQLException,
            NamingException {
        getConexion();
        stmt = conn.createStatement();

        try {
            ps = conn.prepareStatement("DELETE FROM partido WHERE equipo_local=? AND equipo_visitante=?");
            ps.setInt(1, equipoLocal);
            ps.setInt(2, equipoVisitante);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error en sql: ");

        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
    }

    public boolean actualizaPartido(Partido partido) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {
            
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("YYYY-MM-dd kk:mm");
            
            ps = conn.prepareStatement("update partido set equipo_local=?,equipo_visitante=?,"
                    + "Estatus=?,marcador_local=?,marcador_visitante=?,idCancha=?,fecha=? where idPartido=?");
            ps.setInt(1, partido.getEquipoLocal());
            ps.setInt(2, partido.getEquipoVisitante());
            ps.setString(3, partido.getEstatus());
            ps.setInt(4, partido.getMarcadorLocal());
            ps.setInt(5, partido.getMarcadorVisitante());
            ps.setInt(6, partido.getIdCancha());
            ps.setDate(7, new java.sql.Date(partido.getFecha().getTime()));
            ps.setInt(8, partido.getIdPartido());
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

    public boolean actualizaMarcadorPartido(Partido partido) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {
            ps = conn.prepareStatement("update partido set marcador_local=?,"
                    + "marcador_visitante=?,Estatus=? where idPartido=?");
            ps.setInt(1, partido.getMarcadorLocal());
            ps.setInt(2, partido.getMarcadorVisitante());
            ps.setString(3, partido.getEstatus());
            ps.setInt(4, partido.getIdPartido());
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
    
    public java.util.Date obtenerFechaPartidoSiguiente() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        java.util.Date fechaHoy = new java.util.Date();
        java.util.Date fechaSiguiente = new java.util.Date();

        try {
            ps = conn.prepareStatement("select min(fecha) from partido where fecha>? order by fecha asc;");
            ps.setDate(1, new java.sql.Date(fechaHoy.getTime()));
            rst = ps.executeQuery();
            if(rst.next()){
                fechaSiguiente = rst.getDate(1);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return fechaSiguiente;
    }
    
    public java.util.Date obtenerFechaPartidoAnterior() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        java.util.Date fechaHoy = new java.util.Date();
        java.util.Date fechaSiguiente = new java.util.Date();

        try {
            ps = conn.prepareStatement("select max(fecha) from partido where fecha<? order by fecha asc;");
            ps.setDate(1, new java.sql.Date(fechaHoy.getTime()));
            rst = ps.executeQuery();
            if(rst.next()){
                fechaSiguiente = rst.getDate(1);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return fechaSiguiente;
    }

    public ArrayList<Partido> obtenerPartidosSiguientes() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Partido> partidos = new ArrayList<>();
        java.util.Date fechaHoy = new java.util.Date();
        java.util.Date fechaSiguiente = new java.util.Date();

        try {
            ps = conn.prepareStatement("select min(fecha) from partido where fecha>? order by fecha asc;");
            ps.setDate(1, new java.sql.Date(fechaHoy.getTime()));
            rst = ps.executeQuery();
            if(rst.next()){
                fechaSiguiente = rst.getDate(1);
            }

            java.util.Date dateSiguienteInicioDia = obtenInicioDiaDate(fechaSiguiente);
            java.util.Date dateSiguienteFinDia = obtenFinDiaDate(fechaSiguiente);
            ps = conn.prepareStatement("select * from partido where fecha between ? and ? order by fecha asc;");
            ps.setTimestamp(1, new java.sql.Timestamp(dateSiguienteInicioDia.getTime()));
            ps.setTimestamp(2, new java.sql.Timestamp(dateSiguienteFinDia.getTime()));
            rst = ps.executeQuery();
            while (rst.next()) {
                Partido partido = new Partido();
                partido.setIdPartido(rst.getInt(1));
                partido.setEquipoLocal(rst.getInt(2));
                partido.setEquipoVisitante(rst.getInt(3));
                partido.setEstatus(rst.getString(4));
                partido.setMarcadorLocal(rst.getInt(5));
                partido.setMarcadorVisitante(rst.getInt(6));
                partido.setIdCancha(rst.getInt(7));
                partido.setFecha(new java.util.Date(rst.getTimestamp(8).getTime()));
                partidos.add(partido);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return partidos;
    }

    public ArrayList<Partido> obtenerPartidosAnteriores() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Partido> partidos = new ArrayList<>();
        java.util.Date fechaHoy = new java.util.Date();
        java.util.Date fechaAnterior = new java.util.Date();

        try {
            ps = conn.prepareStatement("select max(fecha) from partido where fecha<? order by fecha asc");
            ps.setDate(1, new java.sql.Date(fechaHoy.getTime()));
            rst = ps.executeQuery();
            if(rst.next()){
                fechaAnterior = rst.getDate(1);
            }

            java.util.Date dateAnteriorInicioDia = obtenInicioDiaDate(fechaAnterior);
            java.util.Date dateAnteriorFinDia =obtenFinDiaDate(fechaAnterior);

            ps = conn.prepareStatement("select * from partido where fecha between ? and ? order by fecha asc;");
            ps.setTimestamp(1, new java.sql.Timestamp(dateAnteriorInicioDia.getTime()));
            ps.setTimestamp(2, new java.sql.Timestamp(dateAnteriorFinDia.getTime()));
            rst = ps.executeQuery();
            while (rst.next()) {
                Partido partido = new Partido();
                partido.setIdPartido(rst.getInt(1));
                partido.setEquipoLocal(rst.getInt(2));
                partido.setEquipoVisitante(rst.getInt(3));
                partido.setEstatus(rst.getString(4));
                partido.setMarcadorLocal(rst.getInt(5));
                partido.setMarcadorVisitante(rst.getInt(6));
                partido.setFecha(new java.util.Date(rst.getTimestamp(7).getTime()));
                partidos.add(partido);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return partidos;
    }

    private String obtenInicioDia(java.util.Date fecha) {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("YYYY-MM-dd kk:mm");
        String fechaInicioDia = sdf.format(fecha);
        fechaInicioDia = fechaInicioDia.substring(0, 11) + "00:00";
        return fechaInicioDia;
    }

    private String obtenFinDia(java.util.Date fecha) {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("YYYY-MM-dd kk:mm:ss");
        String fechaFinDia = sdf.format(fecha);
        fechaFinDia = fechaFinDia.substring(0, 11) + "23:59:59";
        return fechaFinDia;
    }
    
    public java.util.Date obtenInicioDiaDate(java.util.Date fecha) {
        GregorianCalendar gc = new GregorianCalendar(); // Genera y configura el calendario
        gc.setTime(fecha);
        gc.set(GregorianCalendar.HOUR, 0);
        gc.set(GregorianCalendar.MINUTE, 0);
        gc.set(GregorianCalendar.SECOND, 0);
        return gc.getTime();
    }
    
    public java.util.Date obtenFinDiaDate(java.util.Date fecha) {
        GregorianCalendar gc = new GregorianCalendar(); // Genera y configura el calendario
        gc.setTime(fecha);
        gc.set(GregorianCalendar.HOUR, 23);
        gc.set(GregorianCalendar.MINUTE, 59);
        gc.set(GregorianCalendar.SECOND, 59);
        return gc.getTime();
    }

}
