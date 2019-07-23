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
    Usuario usuario = new MbdUsuarios().buscaUsuario(idUsuario);
    
    new MbdUsuarios().eliminaUsuario(idUsuario);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Se ha eliminado un usuario</title>
        <%@ include file="menu.jsp" %>
        <div class="jumbotron">
            <h1>Se ha eliminado un usuario</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=usuario.getNombre()%></p>
            <p><b>Login:</b> <%=usuario.getLogin()%></p>
            <p><b>Correo:</b> <%=usuario.getEmail()%></p>
            <p><a class="btn btn-primary btn-lg" href="usuarios.jsp" role="button">Regresar</a></p>
        </div>
        <%@ include file="base.jsp" %>
</html>
