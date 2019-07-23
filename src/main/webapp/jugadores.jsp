<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="java.util.Hashtable"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="mx.com.develop.model.MbdJugadores"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.objects.Jugador"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    ArrayList<Jugador> listaJugadores = new MbdJugadores().traerTodosLosJugadores();
    Hashtable<Integer, Equipo> equipos = new MbdEquipos().getEquipos();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Administración de jugadors</title>
        <%@ include file="menu.jsp" %>
        <h2>Administración de jugadores</h2>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Equipo</th>
                    <th scope="col">Direccion</th>
                    <th scope="col">Fecha de Nacimiento</th>
                    <th scope="col">Foto</th>
                    <th scope="col">Modificar</th>
                    <th scope="col">Eliminar</th>
                </tr>
            </thead>
            <tbody>
                <%for(Jugador jugador : listaJugadores){%>
                <tr>
                    <th scope="row"><%=jugador.getIdJugador()%></th>
                    <td><%=jugador.getNombre()%></td>
                    <td><%=equipos.get(jugador.getIdEquipo()).getNombre()%></td>
                    <td><%=jugador.getDireccion()%></td>
                    <td><%=jugador.getFechaDeNacimiento()%></td>
                    <td><%=jugador.getFoto()%></td>
                    <td><a class="btn btn-primary btn-lg" href="modificarJugadorForm.jsp?idJugador=<%=jugador.getIdJugador()%>" role="button">Modificar</a></td>
                    <td><a class="btn btn-primary btn-lg" href="eliminarJugadorDo.jsp?idJugador=<%=jugador.getIdJugador()%>" role="button">Eliminar</a></td>
                </tr>
                <%}%>
            </tbody>
            <tfoot>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><p><a class="btn btn-primary btn-lg" href="agregarJugadorForm.jsp" role="button">Agregar</a></p></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </tfoot>
        </table>
        <%@ include file="base.jsp" %>
</html>
