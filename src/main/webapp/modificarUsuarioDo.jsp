<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.objects.Usuario"%>
<%@page import="mx.com.develop.model.MbdUsuarios"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdUsuario = request.getParameter("idUsuario");
    int idUsuario = Integer.parseInt(pIdUsuario);
    String nombre = request.getParameter("nombre");
    String login = request.getParameter("login");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    
    Usuario usuario = new Usuario();
    usuario.setIdUsuario(idUsuario);
    usuario.setNombre(nombre);
    usuario.setLogin(login);
    usuario.setPassword(password);
    usuario.setEmail(email);
    boolean exito = new MbdUsuarios().actualizaUsuario(usuario);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Se ha modificado un usuario</title>
        <%@ include file="menu.jsp" %>
        <%if(exito){%>
        <div class="jumbotron">
            <h1>Se ha modificado un usuario</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=nombre%></p>
            <p><b>Login:</b> <%=login%></p>
            <p><b>Correo:</b> <%=email%></p>
            <p><a class="btn btn-primary btn-lg" href="usuarios.jsp" role="button">Regresar</a></p>
        </div>
        <%}else{%>
        <div class="jumbotron">
            <h1>Ocurrió un error al modificar el usuario</h1>
            <p><a class="btn btn-primary btn-lg" href="usuarios.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
        <%@ include file="base.jsp" %>
</html>
