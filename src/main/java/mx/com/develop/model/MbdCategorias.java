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

            ps = conn.prepareStatement("INSERT INTO categoria (descripcion) VALUES(?)");
            ps.setString(1,cat.getDescripcion());
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

    public ArrayList<Categoria> traerCategorias() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Categoria> categoria = new ArrayList<Categoria>();

        try {

            rst = stmt.executeQuery("SELECT * FROM categoria ORDER BY idCategoria");
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
    
    public Categoria buscaCategoria(int idCategoria) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        Categoria categoria = null;
        try {
            ps = conn.prepareStatement("SELECT * FROM categoria WHERE idCategoria=?");
            ps.setInt(1, idCategoria);
            rst = ps.executeQuery();
            if (rst.next()) {
                categoria = new Categoria();
                categoria.setIdcategoria(rst.getInt(1));
                categoria.setDescripcion(rst.getString(2));
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return categoria;
    }

    public Hashtable getCategorias() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        Hashtable categorias = new Hashtable();

        try {
            rst = stmt.executeQuery("SELECT * FROM categoria ORDER BY idCategoria");
            while (rst.next()) {
                Categoria cat = new Categoria();
                cat.setIdcategoria(rst.getInt(1));
                cat.setDescripcion(rst.getString(2));
                categorias.put(rst.getInt(1), cat);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return categorias;
    }

    public boolean actualizaCategoria(Categoria categoria) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {
            ps=conn.prepareStatement("update categoria set descripcion=? where idCategoria=?");
            ps.setString(1,categoria.getDescripcion());
            ps.setInt(2,categoria.getIdcategoria());
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
    
    public void eliminaCategoria(int idCategoria) throws SQLException,
            NamingException {
        getConexion();
        stmt = conn.createStatement();

        try {
            ps = conn.prepareStatement("DELETE FROM categoria WHERE idCategoria=?");
            ps.setInt(1, idCategoria);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en sql: ");

        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
    }
}
