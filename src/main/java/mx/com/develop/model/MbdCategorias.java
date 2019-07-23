package mx.com.develop.model;

import java.rmi.RemoteException;
import java.sql.*;
import java.util.*;
import javax.naming.NamingException;
import mx.com.develop.objects.Categoria;

public class MbdCategorias extends Mbd {

    public MbdCategorias() {
        super();
    }

    public boolean insertaCategoria(Categoria cat) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            stmt.executeUpdate("INSERT INTO categoria (descripcion) VALUES("
                    + "'" + cat.getDescripcion()+ "')");
            exito = true;
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

   /* public Equipo buscaEquipo(int idEquipo) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        Equipo equipo = null;
        try {
            rst = stmt.executeQuery("SELECT * FROM equipo WHERE idEquipo=" + idEquipo);
            if (rst.next()) {
                equipo = new Equipo();
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

    public Equipo buscaEquipo(String logotipo, String color_primario) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        Equipo equipo = null;
        try {
            rst = stmt.executeQuery("SELECT * FROM equipo WHERE logotipo='" + logotipo + "' AND color_primario='" + color_primario + "'");
            if (rst.next()) {
                equipo = new Equipo();
                equipo.setIdEquipo(rst.getInt(1));
                equipo.setNombre(rst.getString(2));
                equipo.setLogotipo(rst.getString(3));
                equipo.setColorPrimario(rst.getString(4));
                equipo.setColorSecundario(rst.getString(5));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return equipo;
    }*/

    public ArrayList<Categoria> traerCategorias() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Categoria> categoria = new ArrayList<Categoria>();

        try {

            rst = stmt.executeQuery("SELECT * FROM categoria ORDER BY descripcion");
            while (rst.next()) {
                Categoria cat = new Categoria();
                cat.setIdcategoria(rst.getInt(1));
                cat.setDescripcion(rst.getString(2));
                categoria.add(cat);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return categoria;
    }

    /*public void eliminaEquipo(int idEquipo) throws SQLException,
            NamingException {
        getConexion();
        stmt = conn.createStatement();

        try {
            stmt.executeUpdate("DELETE FROM equipo WHERE idEquipo=" + idEquipo);

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

            stmt.executeUpdate("update equipo set "
                    + "nombre='" + equipo.getNombre() + "',"
                    + "logotipo='" + equipo.getLogotipo() + "',"
                    + "color_primario='" + equipo.getColorPrimario() + "',"
                    + "color_secundario='" + equipo.getColorSecundario() + "' where idEquipo=" + equipo.getIdEquipo());
            exito = true;
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

    public Hashtable<Integer,Equipo> getEquipos() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        Hashtable<Integer, Equipo> equipos = new Hashtable<>();

        try {

            rst = stmt.executeQuery("SELECT * FROM equipo ORDER BY nombre");
            while (rst.next()) {
                Equipo equipo = new Equipo();
                equipo.setIdEquipo(rst.getInt(1));
                equipo.setNombre(rst.getString(2));
                equipo.setLogotipo(rst.getString(3));
                equipo.setColorPrimario(rst.getString(4));
                equipo.setColorSecundario(rst.getString(5));
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
            rst = stmt.executeQuery("SELECT marcador_local,marcador_visitante FROM partido "
                    + "where estatus=2 and equipo_local=" + idEquipo);
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
            rst = stmt.executeQuery("SELECT marcador_visitante,marcador_local FROM partido "
                    + "where estatus=2 and equipo_visitante=" + idEquipo);
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
            rst = stmt.executeQuery("SELECT marcador_local,marcador_visitante FROM partido "
                    + "where estatus=3 and equipo_local=" + idEquipo);
            while (rst.next()) {
                puntos += 3;
            }

            //Revisando en qué partidos jugados ganó siendo visitante (Estatus 4 es que ganó por default el visitante)
            rst = stmt.executeQuery("SELECT marcador_visitante,marcador_local FROM partido "
                    + "where estatus=4 and equipo_visitante=" + idEquipo);
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
            rst = stmt.executeQuery("SELECT * FROM equipo ORDER BY nombre");
            while (rst.next()) {
                Equipo equipo = new Equipo();
                equipo.setIdEquipo(rst.getInt(1));
                equipo.setNombre(rst.getString(2));
                equipo.setLogotipo(rst.getString(3));
                equipo.setColorPrimario(rst.getString(4));
                equipo.setColorSecundario(rst.getString(5));
                equipos.add(equipo);
            }

            for (Equipo equipo : equipos) {
                int puntos = 0;
                int puntosAFavor = 0;
                int puntosEnContra = 0;
                int perdidosPorDefault = 0;
                //Revisando en qué partidos jugados ganó siendo local (Estatus 2 es jugado)
                rst = stmt.executeQuery("SELECT marcador_local,marcador_visitante FROM partido "
                        + "where estatus=2 and equipo_local=" + equipo.getIdEquipo());
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
                rst = stmt.executeQuery("SELECT marcador_visitante,marcador_local FROM partido "
                        + "where estatus=2 and equipo_visitante=" + equipo.getIdEquipo());
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
                rst = stmt.executeQuery("SELECT marcador_local,marcador_visitante FROM partido "
                        + "where estatus=3 and equipo_local=" + equipo.getIdEquipo());
                while (rst.next()) {
                    puntos += 3;
                    puntosAFavor+=20;
                }

                //Revisando en qué partidos jugados ganó siendo visitante (Estatus 4 es que ganó por default el visitante)
                rst = stmt.executeQuery("SELECT marcador_visitante,marcador_local FROM partido "
                        + "where estatus=4 and equipo_visitante=" + equipo.getIdEquipo());
                while (rst.next()) {
                    puntos += 3;
                    puntosAFavor+=20;
                }
                
                //Revisando en qué partidos jugados perdió siendo visitante (Estatus 3 es que ganó por default el local)
                rst = stmt.executeQuery("SELECT marcador_local,marcador_visitante FROM partido "
                        + "where estatus=3 and equipo_visitante=" + equipo.getIdEquipo());
                while (rst.next()) {
                    perdidosPorDefault += 1;
                    puntosEnContra+=20;
                }

                //Revisando en qué partidos jugados perdió siendo local (Estatus 4 es que ganó por default el visitante)
                rst = stmt.executeQuery("SELECT marcador_visitante,marcador_local FROM partido "
                        + "where estatus=4 and equipo_local=" + equipo.getIdEquipo());
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
    }*/
}
