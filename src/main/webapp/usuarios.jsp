<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.model.MbdUsuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.objects.Usuario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    ArrayList<Usuario> listaUsuarios = new MbdUsuarios().traerTodosLosUsuarios();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Administración de usuarios</title>
        <%@ include file="menu.jsp" %>
        <h2>Administración de usuarios</h2>
        <table class="table">
            <thead>
                <tr>
                    <th class="col-lg-1 col-md-1 col-xs-1">#</th>
                    <th class="col-lg-1 col-md-1 col-xs-1">Nombre</th>
                    <th class="col-lg-1 col-md-1 col-xs-1">Login</th>
                    <th class="col-lg-1 col-md-1 col-xs-1">Password</th>
                    <th class="col-lg-1 col-md-1 col-xs-1">Correo</th>
                    <th class="col-lg-1 col-md-1 col-xs-1">Modificar</th>
                    <th class="col-lg-1 col-md-1 col-xs-1">Eliminar</th>
                </tr>
            </thead>
            <tbody>
                <%for(Usuario usuario : listaUsuarios){%>
                <tr>
                    <td class="col-lg-1 col-md-1 col-xs-1"><%=usuario.getIdUsuario()%></th>
                    <td class="col-lg-1 col-md-1 col-xs-1"><%=usuario.getNombre()%></td>
                    <td class="col-lg-1 col-md-1 col-xs-1"><%=usuario.getLogin()%></td>
                    <td class="col-lg-1 col-md-1 col-xs-1"><%=usuario.getPassword()%></td>
                    <td class="col-lg-1 col-md-1 col-xs-1"><%=usuario.getEmail()%></td>
                    <td class="col-lg-1 col-md-1 col-xs-1"><a class="btn btn-primary btn-lg" href="modificarUsuarioForm.jsp?idUsuario=<%=usuario.getIdUsuario()%>" role="button">Modificar</a></td>
                    <td class="col-lg-1 col-md-1 col-xs-1"><a class="btn btn-primary btn-lg" href="eliminarUsuarioDo.jsp?idUsuario=<%=usuario.getIdUsuario()%>" role="button">Eliminar</a></td>
                </tr>
                <%}%>
            </tbody>
            <tfoot>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><p><a class="btn btn-primary btn-lg" href="agregarUsuarioForm.jsp" role="button">Agregar</a></p></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </tfoot>
        </table>
        <%@ include file="base.jsp" %>
</html>
