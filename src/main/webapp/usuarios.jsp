<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="java.util.List"%>
<%@page import="mx.com.develop.model.MbdUsuarios"%>
<%@page import="mx.com.develop.objects.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Usuario> listaUsuarios = new MbdUsuarios().traerTodosLosUsuarios();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de usuarios</title>
        <jsp:include page="headers.jsp"/>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Login</th>
                    <th scope="col">Password</th>
                    <th scope="col">Correo</th>
                </tr>
            </thead>
            <tbody>
                <%for(Usuario usuario : listaUsuarios){%>
                <tr>
                    <th scope="row"><%=usuario.getIdUsuario()%></th>
                    <td><%=usuario.getNombre()%></td>
                    <td><%=usuario.getLogin()%></td>
                    <td><%=usuario.getPassword()%></td>
                    <td><%=usuario.getEmail()%></td>
                    <td><a class="btn btn-primary btn-lg" href="modificarUsuarioForm.jsp?idUsuario=<%=usuario.getIdUsuario()%>" role="button">Modificar</a></td>
                    <td><a class="btn btn-primary btn-lg" href="eliminarUsuarioDo.jsp?idUsuario=<%=usuario.getIdUsuario()%>" role="button">Eliminar</a></td>
                </tr>
                <%}%>
            </tbody>
            <tfoot>
                <p><a class="btn btn-primary btn-lg" href="agregarUsuarioForm.jsp" role="button">Agregar Usuario</a></p>
            </tfoot>
        </table>
    </body>
</html>
