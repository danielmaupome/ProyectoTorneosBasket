package mx.com.develop.model;

import java.sql.*;
import java.util.*;
import javax.naming.NamingException;
import mx.com.develop.objects.Bitacora;


public class MbdBitacora extends Mbd implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    public MbdBitacora() {
        super();
    }

    public boolean insertaBitacora(Bitacora bitacora) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("YYYY-MM-dd kk:mm:ss");
            ps = conn.prepareStatement("INSERT INTO bitacora (idUsuario, url,fecha) VALUES(?,?,?)");
            ps.setInt(1, bitacora.getIdUsuario());
            ps.setString(2, bitacora.getUrl());
            ps.setObject(3, sdf.format(bitacora.getFecha()));
            exito = ps.execute();;
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }
//Este metodo es para llevar todas las urls eistentes de la tabla bitacora y mostrarlas en el select del form

    public ArrayList<Bitacora> traerUrls() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Bitacora> bitacoras = new ArrayList<Bitacora>();

        try {
            System.out.println("select url from bitacora group by 1");
            ps = conn.prepareStatement("select url from bitacora group by 1");
            rst = ps.executeQuery();
            while (rst.next()) {
                Bitacora bitacora = new Bitacora();
                bitacora.setUrl(rst.getString(1));
                bitacoras.add(bitacora);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return bitacoras;
    }

    //Lo primordial de este metodo es llevar las fechas pero tambien se llevan los demas datos por si se llegan a ocupar
    public ArrayList<Bitacora> traerUrlsPorUsuario(int idUsuario, String url) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Bitacora> bitacorasUsuario = new ArrayList<Bitacora>();

        try {
            //Mostrará todos los urls con sus datos
            System.out.println("select url from bitacora where idUsuario = ? group by 1");
            ps = conn.prepareStatement("select idUsuario,url,fecha  from bitacora where idUsuario = ? and url=?");
            ps.setInt(1, idUsuario);
            ps.setString(2, url);
            rst = ps.executeQuery();
            while (rst.next()) {
                Bitacora bitacoraU = new Bitacora();
                bitacoraU.setIdUsuario(rst.getInt(1));
                bitacoraU.setUrl(rst.getString(2));
                bitacoraU.setFecha(new java.util.Date(rst.getTimestamp(3).getTime()));                                
                bitacorasUsuario.add(bitacoraU);
            }

        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return bitacorasUsuario;
    }
//Este metodo lleva las el idUsuario, url y vistas para mostrar en el form

    public String[] contadorUrlsPorUsuario(int idUsuario, String url) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        String[] vistas = new String[3];

        try {
            //Mostrará todos los urls con sus datos
            System.out.println("select url from bitacora where idUsuario = ? group by 1");
            ps = conn.prepareStatement("select idUsuario,url,count(url) from bitacora where idUsuario = ? and url=?");
            ps.setInt(1, idUsuario);
            ps.setString(2, url);
            rst = ps.executeQuery();
            while (rst.next()) {
                vistas[0] = "" + rst.getInt(1);//idUsuario
                vistas[1] = "" + rst.getString(2);//url
                vistas[2] = "" + rst.getInt(3);//contador
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return vistas;
    }

}
