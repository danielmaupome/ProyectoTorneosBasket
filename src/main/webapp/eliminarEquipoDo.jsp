<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>
<%@page import="java.util.List"%>
<%@page import="mx.com.develop.model.MbdJugador"%>
<%@page import="mx.com.develop.objects.Jugador"%>
<%@page import="mx.com.develop.model.MbdPartido"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String PidEquipo = request.getParameter("idEquipo");
    int idEquipo = Integer.parseInt(PidEquipo);
    int idEquipoV = idEquipo;
    int jugadores = 0;
    int partidosL = 0;
    int partidosV = 0;
    boolean exito = true;
    List<Partido> listaPartidos = new MbdPartido().traerTodosLosPartidos();
    for (Partido partido : listaPartidos) {
        if (idEquipo == partido.getEquipoLocal()) {
            partidosL++;
        }
        if (idEquipo == partido.getEquipoVisitante()) {
            partidosV++;
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Se ha eliminado un equipo</title>
        <jsp:include page="headers.jsp"/>
    </head>
    <body>
            <body>
        <%@ include file="Menu.jsp" %>
        <%            ArrayList<Jugador> listaJugadores = new MbdJugador().traerTodosLosJugador();
            for (Jugador jugador : listaJugadores) {
                if (idEquipo == jugador.getIdJugador()) {
                    jugadores++;
                }
            }
            if (jugadores == 0 && partidosV == 0 && partidosL == 0) {
                Equipo equipo = new MbdEquipo().buscaEquipo(idEquipo);
                new MbdEquipo().eliminaEquipo(idEquipo);
        %>
        <div class="jumbotron">
            <h1>Se ha eliminado un equipo</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=equipo.getNombre()%></p>
            <p><b>Logotipo:</b> <%=equipo.getLogotipo()%></p>
            <p><b>Correo Primario:</b> <%=equipo.getColorPrimario()%></p>
            <p><b>Correo Secundario:</b> <%=equipo.getColorPrimario()%></p>
            <p><a class="btn btn-primary btn-lg" href="equipo.jsp" role="button">Regresar</a></p>
        </div>

        <%} else {%>
        <div class="jumbotron">
            <h1>No se puede eliminar este equipo</h1>
            <p><b>Tiene :</b> <%=jugadores%><b> jugadores</b> </p>
            <p><b>Tiene :</b> <%=partidosL%><b> partidos de local</b></p>
            <p><b>Tiene :</b> <%=partidosV%><b> partidos de visitante</b></p>
            <p><a class="btn btn-primary btn-lg" href="equipo.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
    </body>
</html>
