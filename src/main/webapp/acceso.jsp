<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.model.MbdUsuarios"%>
<%@page import="mx.com.develop.objects.Usuario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String login = request.getParameter("login");
    String password = request.getParameter("password");
    
    Usuario usuario = new MbdUsuarios().buscaUsuario(login, password);
    if(usuario!=null){
        session.setAttribute("usuarioEnSesion", usuario);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bienvenido TODO</title>
        <%@ include file="menu.jsp" %>
        <h1>Bienvenido <%=usuario.getNombre()%>!</h1>
        <%@ include file="base.jsp" %>
</html>
