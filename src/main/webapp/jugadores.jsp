<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="mx.com.develop.model.MbdJugador"%>
<%@page import="mx.com.develop.objects.Jugador"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nombreEquipo;
    List<Jugador> lista = new MbdJugador().traerTodosLosJugadores();
    List<Equipo> lista2 = new MbdEquipo().traerTodosLosEquipos();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de jugadores</title>
        <jsp:include page="headers.jsp"/>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Direccion</th>
                    <th scope="col">Foto</th>
                    <th scope="col">Fecha de nacimiento</th>
                    <th scope="col">Equipo</th>
                </tr>
            </thead>
            <tbody>
                <%for (Jugador jugador : lista) {%>
                <tr>
                    <th scope="row"><%=jugador.getIdJugador()%></th>
                    <td><%=jugador.getNombre()%></td>
                    <td><%=jugador.getDireccion()%></td>
                    <td><%=jugador.getFoto()%></td>
                    <td><%=jugador.getFechaDeNacimiento()%></td>
                    <%
                        nombreEquipo = "Error";
                        for (Equipo equipo : lista2) {
                            if (equipo.getIdEquipo() == jugador.getIdEquipo()) {
                                nombreEquipo = equipo.getNombre();
                                break;
                            }
                        }
                    %>
                    <td><%=nombreEquipo%></td>
                    <td><a class="btn btn-primary btn-lg" href="modificarJugadorForm.jsp?idJugador=<%=jugador.getIdJugador()%>" role="button">Modificar</a></td>
                    <td><a class="btn btn-primary btn-lg" href="eliminarJugadorDo.jsp?idJugador=<%=jugador.getIdJugador()%>" role="button">Eliminar</a></td>
                </tr>
                <%}%>
            </tbody>
            <tfoot>
            <p><a class="btn btn-primary btn-lg" href="agregarJugadorForm.jsp" role="button">Agregar Jugador</a></p>
        </tfoot>
    </table>
</body>
</html>
