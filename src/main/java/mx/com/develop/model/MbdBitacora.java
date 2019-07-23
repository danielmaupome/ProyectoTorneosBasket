/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.develop.model;

import java.sql.SQLException;
import javax.naming.NamingException;
import mx.com.develop.objects.Bitacora;
import mx.com.develop.objects.Equipo;

/**
 *
 * @author Cesar
 */
public class MbdBitacora extends Mbd {

    public MbdBitacora() {
        super();
    }

    public boolean insertaBitacora(Bitacora bitacora) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            ps = conn.prepareStatement("INSERT INTO bitacora (idUsuario,url,fecha) VALUES(?,?,?)");
            ps.setInt(1, bitacora.getIdUsuario());
            ps.setString(2, bitacora.getURL());
            ps.setTimestamp(3, bitacora.getFecha());
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
