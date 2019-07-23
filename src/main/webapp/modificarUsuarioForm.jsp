<%-- 
    Document   : modificarEquipoForm
    Created on : 25/06/2019, 03:26:33 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.model.MbdUsuarios"%>
<%@page import="mx.com.develop.objects.Usuario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdUsuario = request.getParameter("idUsuario");
    int idUsuario = Integer.parseInt(pIdUsuario);
    
    Usuario usuario = new MbdUsuarios().buscaUsuario(idUsuario);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Modificar Usuario - TODO</title>
        <%@ include file="menu.jsp" %>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="modificarUsuarioDo.jsp?idUsuario=<%=usuario.getIdUsuario()%>" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" value="<%=usuario.getNombre()%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="login">Login:</label>
                        <input type="text" class="form-control" id="login" name="login" placeholder="Login" value="<%=usuario.getLogin()%>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="password">Password:</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" value="<%=usuario.getPassword()%>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="email">Correo:</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Correo" value="<%=usuario.getEmail()%>">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
        </div>
        <%@ include file="base.jsp" %>
</html>
