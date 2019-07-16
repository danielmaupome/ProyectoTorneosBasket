<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Equipo> lista = new MbdEquipo().traerTodosLosEquipos();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de equipos</title>
        <jsp:include page="headers.jsp"/>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Logotipo</th>
                    <th scope="col">Color</th>
                    <th scope="col">Secundario</th>
                </tr>
            </thead>
            <tbody>
                <%for (Equipo equipo : lista) {%>
                <tr>
                    <th scope="row"><%=equipo.getIdEquipo()%></th>
                    <td><%=equipo.getNombre()%></td>
                    <td><img src="../images/<%=equipo.getLogotipo()%>" alt="<%=equipo.getLogotipo()%>" width="50" height="50"></td>
                    <td> <input class="jscolor form-control" value="<%=equipo.getColorPrimario()%>" disabled></td>
                    <td> <input class="jscolor form-control" value="<%=equipo.getColorSecundario()%>" disabled></td>
                    <td><a class="btn btn-primary btn-lg" href="modificarEquipoForm.jsp?idEquipo=<%=equipo.getIdEquipo()%>" role="button">Modificar</a></td>
                    <td><a class="btn btn-primary btn-lg" href="eliminarEquipoDo.jsp?idEquipo=<%=equipo.getIdEquipo()%>" role="button">Eliminar</a></td>
                </tr>
                <%}%>
            </tbody>
            <tfoot>
            <p><a class="btn btn-primary btn-lg" href="agregarEquipoForm.jsp" role="button">Agregar Equipo</a></p>
        </tfoot>
    </table>
</body>
</html>
