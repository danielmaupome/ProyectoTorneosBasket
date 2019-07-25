package mx.com.develop.model;

import java.rmi.RemoteException;
import java.sql.*;
import java.util.*;
import javax.naming.NamingException;
import mx.com.develop.objects.Equipo;

public class MbdEquipos extends Mbd {

    public MbdEquipos() {
        super();
    }

    public boolean insertaEquipo(Equipo equipo) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            ps = conn.prepareStatement("INSERT INTO equipo (idCategoria,nombre,logotipo,color_primario,color_secundario) VALUES(?,?,?,?,?)");
            ps.setInt(2, equipo.getIdCategoria());
            ps.setString(3, equipo.getNombre());
            ps.setString(4, equipo.getLogotipo());
            ps.setString(5, equipo.getColorPrimario());
            ps.setString(6, equipo.getColorSecundario());
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

    public Equipo buscaEquipo(int idEquipo) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        Equipo equipo = null;
        try {
            ps = conn.prepareStatement("SELECT * FROM equipo WHERE idEquipo=?");
            ps.setInt(1, idEquipo);
            rst = ps.executeQuery();
            if (rst.next()) {
                equipo = new Equipo();
                equipo.setIdEquipo(rst.getInt(1));
                equipo.setIdCategoria(rst.getInt(2));
                equipo.setNombre(rst.getString(3));
                equipo.setLogotipo(rst.getString(4));
                equipo.setColorPrimario(rst.getString(5));
                equipo.setColorSecundario(rst.getString(6));
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return equipo;
    }

    public Equipo buscaEquipo(String logotipo, String color_primario) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        Equipo equipo = null;
        try {
            ps = conn.prepareStatement("SELECT * FROM equipo WHERE logotipo=? AND color_primario=?");
            ps.setString(1, logotipo);
            ps.setString(2, color_primario);
            rst = ps.executeQuery();
            if (rst.next()) {
                equipo = new Equipo();
                equipo.setIdEquipo(rst.getInt(1));
                equipo.setIdCategoria(rst.getInt(2));
                equipo.setNombre(rst.getString(3));
                equipo.setLogotipo(rst.getString(4));
                equipo.setColorPrimario(rst.getString(5));
                equipo.setColorSecundario(rst.getString(6));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return equipo;
    }

    public ArrayList<Equipo> traerTodosLosEquipos() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Equipo> equipos = new ArrayList<Equipo>();

        try {

            ps = conn.prepareStatement("SELECT * FROM equipo ORDER BY nombre");
            rst = ps.executeQuery();
            while (rst.next()) {
                Equipo equipo = new Equipo();
                equipo.setIdEquipo(rst.getInt(1));
                equipo.setIdCategoria(rst.getInt(2));
                equipo.setNombre(rst.getString(3));
                equipo.setLogotipo(rst.getString(4));
                equipo.setColorPrimario(rst.getString(5));
                equipo.setColorSecundario(rst.getString(6));
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

    public void eliminaEquipo(int idEquipo) throws SQLException,
            NamingException {
        getConexion();
        stmt = conn.createStatement();

        try {
            ps = conn.prepareStatement("DELETE FROM equipo WHERE idEquipo=?");
            ps.setInt(1, idEquipo);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en sql: ");

        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
    }

    public boolean actualizaEquipo(Equipo equipo) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            ps = conn.prepareStatement("update equipo set "
                    + "idCategoria=?,nombre=?,logotipo=?,color_primario=?,color_secundario=? where idEquipo=?");
            ps.setInt(1, equipo.getIdCategoria());
            ps.setString(2, equipo.getNombre());
            ps.setString(3, equipo.getLogotipo());
            ps.setString(4, equipo.getColorPrimario());
            ps.setString(5, equipo.getColorSecundario());
            ps.setInt(6, equipo.getIdEquipo());
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

    public Hashtable<Integer, Equipo> getEquipos() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        Hashtable<Integer, Equipo> equipos = new Hashtable<>();

        try {

            ps = conn.prepareStatement("SELECT * FROM equipo ORDER BY nombre");
            rst = ps.executeQuery();
            while (rst.next()) {
                Equipo equipo = new Equipo();
                equipo.setIdEquipo(rst.getInt(1));
                equipo.setIdCategoria(rst.getInt(2));
                equipo.setNombre(rst.getString(3));
                equipo.setLogotipo(rst.getString(4));
                equipo.setColorPrimario(rst.getString(5));
                equipo.setColorSecundario(rst.getString(6));
                equipos.put(equipo.getIdEquipo(), equipo);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return equipos;
    }

    public int obtenerPuntosEquipo(int idEquipo) throws SQLException,
            NamingException {
        int puntos = 0;
        getConexion();

        stmt = conn.createStatement();

        try {
            //Revisando en qué partidos jugados ganó siendo local (Estatus 2 es jugado)
            ps = conn.prepareStatement("SELECT marcador_local,marcador_visitante FROM partido "
                    + "where estatus=2 and equipo_local=?");
            ps.setInt(1, idEquipo);
            rst = ps.executeQuery();
            while (rst.next()) {
                int marcadorLocal = rst.getInt(1);
                int marcadorVisitante = rst.getInt(2);
                if (marcadorLocal > marcadorVisitante) {//Indica que ganó el local
                    puntos += 3;
                } else {
                    puntos += 1;
                }
            }

            //Revisando en qué partidos jugados ganó siendo visitante (Estatus 2 es jugado)
            ps = conn.prepareStatement("SELECT marcador_visitante,marcador_local FROM partido "
                    + "where estatus=2 and equipo_visitante=?");
            ps.setInt(1, idEquipo);
            rst = ps.executeQuery();
            while (rst.next()) {
                int marcadorVisitante = rst.getInt(1);
                int marcadorLocal = rst.getInt(2);
                if (marcadorVisitante > marcadorLocal) {//Indica que ganó el visitante
                    puntos += 3;
                } else {
                    puntos += 1;
                }
            }
            //Revisando en qué partidos jugados ganó siendo local (Estatus 3 es que ganó por default el local)
            ps = conn.prepareStatement("SELECT marcador_local,marcador_visitante FROM partido "
                    + "where estatus=3 and equipo_local=?");
            ps.setInt(1, idEquipo);
            rst = ps.executeQuery();
            while (rst.next()) {
                puntos += 3;
            }

            //Revisando en qué partidos jugados ganó siendo visitante (Estatus 4 es que ganó por default el visitante)
            ps = conn.prepareStatement("SELECT marcador_visitante,marcador_local FROM partido "
                    + "where estatus=4 and equipo_visitante=?");
            ps.setInt(1, idEquipo);
            rst = ps.executeQuery();
            while (rst.next()) {
                puntos += 3;
            }

        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return puntos;
    }

    public ArrayList<Equipo> obtenerEquiposConPuntos() throws SQLException,
            NamingException {
        ArrayList<Equipo> equipos = new ArrayList<Equipo>();
        ArrayList<Equipo> equiposConPuntos = new ArrayList<Equipo>();
        getConexion();

        stmt = conn.createStatement();

        try {
            ps = conn.prepareStatement("SELECT * FROM equipo ORDER BY nombre");
            rst = ps.executeQuery();
            while (rst.next()) {
                Equipo equipo = new Equipo();
                equipo.setIdEquipo(rst.getInt(1));
                equipo.setIdCategoria(rst.getInt(2));
                equipo.setNombre(rst.getString(3));
                equipo.setLogotipo(rst.getString(4));
                equipo.setColorPrimario(rst.getString(5));
                equipo.setColorSecundario(rst.getString(6));
                equipos.add(equipo);
            }

            for (Equipo equipo : equipos) {
                int puntos = 0;
                int puntosAFavor = 0;
                int puntosEnContra = 0;
                int perdidosPorDefault = 0;
                //Revisando en qué partidos jugados ganó siendo local (Estatus 2 es jugado)
                ps = conn.prepareStatement("SELECT marcador_local,marcador_visitante FROM partido "
                        + "where estatus=2 and equipo_local=?");
                ps.setInt(1, equipo.getIdEquipo());
                rst = ps.executeQuery();
                while (rst.next()) {
                    int marcadorLocal = rst.getInt(1);
                    int marcadorVisitante = rst.getInt(2);
                    if (marcadorLocal > marcadorVisitante) {//Indica que ganó el local
                        puntos += 3;
                    } else {
                        puntos += 1;
                    }
                    puntosAFavor+=marcadorLocal;
                    puntosEnContra+=marcadorVisitante;
                }

                //Revisando en qué partidos jugados ganó siendo visitante (Estatus 2 es jugado)
                ps = conn.prepareStatement("SELECT marcador_visitante,marcador_local FROM partido "
                        + "where estatus=2 and equipo_visitante=?");
                ps.setInt(1, equipo.getIdEquipo());
                rst = ps.executeQuery();
                while (rst.next()) {
                    int marcadorVisitante = rst.getInt(1);
                    int marcadorLocal = rst.getInt(2);
                    if (marcadorVisitante > marcadorLocal) {//Indica que ganó el visitante
                        puntos += 3;
                    } else {
                        puntos += 1;
                    }
                    puntosAFavor+=marcadorVisitante;
                    puntosEnContra+=marcadorLocal;
                }
                //Revisando en qué partidos jugados ganó siendo local (Estatus 3 es que ganó por default el local)
                ps = conn.prepareStatement("SELECT marcador_local,marcador_visitante FROM partido "
                        + "where estatus=3 and equipo_local=?");
                ps.setInt(1, equipo.getIdEquipo());
                rst = ps.executeQuery();
                while (rst.next()) {
                    puntos += 3;
                    puntosAFavor+=20;
                }

                //Revisando en qué partidos jugados ganó siendo visitante (Estatus 4 es que ganó por default el visitante)
                ps = conn.prepareStatement("SELECT marcador_visitante,marcador_local FROM partido "
                        + "where estatus=4 and equipo_visitante=?");
                ps.setInt(1, equipo.getIdEquipo());
                rst = ps.executeQuery();
                while (rst.next()) {
                    puntos += 3;
                    puntosAFavor+=20;
                }
                
                //Revisando en qué partidos jugados perdió siendo visitante (Estatus 3 es que ganó por default el local)
                ps = conn.prepareStatement("SELECT marcador_local,marcador_visitante FROM partido "
                        + "where estatus=3 and equipo_visitante=?");
                ps.setInt(1, equipo.getIdEquipo());
                rst = ps.executeQuery();
                while (rst.next()) {
                    perdidosPorDefault += 1;
                    puntosEnContra+=20;
                }

                //Revisando en qué partidos jugados perdió siendo local (Estatus 4 es que ganó por default el visitante)
                ps = conn.prepareStatement("SELECT marcador_visitante,marcador_local FROM partido "
                        + "where estatus=4 and equipo_local=?");
                ps.setInt(1, equipo.getIdEquipo());
                rst = ps.executeQuery();
                while (rst.next()) {
                    perdidosPorDefault += 1;
                    puntosEnContra+=20;
                }
                
                equipo.setPuntosAFavor(puntosAFavor);
                equipo.setPuntosEnContra(puntosEnContra);
                equipo.setPerdidosPorDefault(perdidosPorDefault);
                equipo.setPuntos(puntos);
                equiposConPuntos.add(equipo);
            }//Fin del ciclo de equipos
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return equiposConPuntos;
    }
}
