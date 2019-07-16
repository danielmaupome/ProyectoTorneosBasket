<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.objects.Usuario"%>
<%@page import="mx.com.develop.model.MbdUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String login = request.getParameter("login");
    String password = request.getParameter("password");
    Usuario usuario = null;

    if (login != null && password != null && !login.equals("") && !password.equals("")) {
            usuario = new MbdUsuarios().buscaUsuario(login, password);
            
            session.setAttribute("nickname", usuario.getLogin());
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido TODO</title>
        <jsp:include page="headers.jsp"/>
    </head>
    <body>
        <% if (usuario != null) { %>
        <jsp:include page="menu.jsp"/>
        <% } else { %>
        <h1>El usuario no existe</h1>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="acceso.jsp" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="login">Login:</label>
                        <input type="text" class="form-control" id="login" name="login" placeholder="Login">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputPassword4">Password:</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Entrar</button>
            </form>
        </div>
        <% }%>
    </body>
</html>
