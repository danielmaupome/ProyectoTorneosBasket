package mx.com.develop.model;

import java.rmi.RemoteException;
import java.sql.*;
import java.util.*;
import javax.naming.NamingException;
import mx.com.develop.objects.Cancha;

public class MbdCanchas extends Mbd {

    public MbdCanchas() {
        super();
    }

    public boolean insertaCancha(Cancha cat) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            stmt.executeUpdate("INSERT INTO cancha (descripcion) VALUES("
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

    public Cancha buscaCancha(int idCancha) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        Cancha can = null;
        try {
            rst = stmt.executeQuery("SELECT * FROM cancha WHERE idcancha=" + idCancha);
            if (rst.next()) {
                can = new Cancha();
                can.setIdCancha(rst.getInt(1));
                can.setDescripcion(rst.getString(2));
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return can;
    }

   
    public ArrayList<Cancha> traerCanchas() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Cancha> cancha = new ArrayList<Cancha>();

        try {

            rst = stmt.executeQuery("SELECT * FROM cancha ORDER BY idCancha");
            while (rst.next()) {
                Cancha can = new Cancha();
                can.setIdCancha(rst.getInt(1));
                can.setDescripcion(rst.getString(2));
                cancha.add(can);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return cancha;
    }

    public void eliminaCancha(int idCancha) throws SQLException,
            NamingException {
        getConexion();
        stmt = conn.createStatement();

        try {
            stmt.executeUpdate("DELETE FROM cancha WHERE idCancha=" + idCancha);

        } catch (Exception e) {
            System.out.println("Error en sql: ");

        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
    }

    public boolean actualizaCancha(Cancha cancha) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            stmt.executeUpdate("update cancha set "
                    + "descripcion='" + cancha.getDescripcion()+ "'"
                    +"where idCancha=" + cancha.getIdCancha());
            exito = true;
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

    public Hashtable<Integer,Cancha> getCanchas() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        Hashtable<Integer, Cancha> cancha = new Hashtable<>();

        try {

            rst = stmt.executeQuery("SELECT * FROM cancha ORDER BY idCancha");
            while (rst.next()) {
                Cancha can = new Cancha();
                can.setIdCancha(rst.getInt(1));
                can.setDescripcion(rst.getString(2));
                cancha.put(can.getIdCancha(), can);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return cancha;
    }

    
}
