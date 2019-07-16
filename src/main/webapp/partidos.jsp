<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="mx.com.develop.model.MbdPartido"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nombreEquipo;
    List<Partido> lista = new MbdPartido().traerTodosLosPartidos();
    List<Equipo> lista2 = new MbdEquipo().traerTodosLosEquipos();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de partidoes</title>
        <jsp:include page="headers.jsp"/>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Equipo Local</th>
                    <th scope="col">Equipo Visitante</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Marcado local</th>
                    <th scope="col">Marcado visitante</th>
                    <th scope="col">Fecha del partido</th>
                </tr>
            </thead>
            <tbody>
                <%for (Partido partido : lista) {%>
                <tr>
                    <th scope="row"><%=partido.getIdPartido()%></th>
                        <%
                            nombreEquipo = "Error";
                            for (Equipo equipo : lista2) {
                                if (equipo.getIdEquipo() == partido.getEquipoLocal()) {
                                    nombreEquipo = equipo.getNombre();
                                    break;
                                }
                            }
                        %>
                    <td><%=nombreEquipo%></td>
                    <%
                        nombreEquipo = "Error";
                        for (Equipo equipo : lista2) {
                            if (equipo.getIdEquipo() == partido.getEquipoVisitante()) {
                                nombreEquipo = equipo.getNombre();
                                break;
                            }
                        }
                    %>
                    <td><%=nombreEquipo%></td>
                    <%
                        nombreEquipo = "Error";
                        switch (partido.getEstatus()) {
                            case 1:
                                nombreEquipo = "Perdido";
                                break;
                            case 2:
                                nombreEquipo = "Ganado";
                                break;
                            case 3:
                                nombreEquipo = "Jugado";
                                break;
                            case 4:
                                nombreEquipo = "No jugado";
                                break;
                        }
                    %>
                    <td><%=nombreEquipo%></td>
                    <td><%= partido.getMarcadorLocal() %></td>
                    <td><%= partido.getMarcadorVisitante() %></td>
                    <td><%= partido.getFecha()%></td>
                    <td><a class="btn btn-primary btn-lg" href="modificarPartidoForm.jsp?idPartido=<%=partido.getIdPartido()%>" role="button">Modificar</a></td>
                    <td><a class="btn btn-primary btn-lg" href="eliminarPartidoDo.jsp?idPartido=<%=partido.getIdPartido()%>" role="button">Eliminar</a></td>
                </tr>
                <%}%>
            </tbody>
            <tfoot>
            <p><a class="btn btn-primary btn-lg" href="agregarPartidoForm.jsp" role="button">Agregar Partido</a></p>
        </tfoot>
    </table>
</body>
</html>
