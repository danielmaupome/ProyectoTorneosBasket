<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="java.util.List"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mx.com.develop.model.MbdJugador"%>
<%@page import="mx.com.develop.objects.Jugador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String nombre = request.getParameter("nombre");
    String direccion = request.getParameter("direccion");
    String foto = request.getParameter("foto");
    String fechaNacimiento = request.getParameter("fecha_nacimiento");
    Integer idEquipo = Integer.parseInt(request.getParameter("idEquipo"));

    Jugador jugador = new Jugador();
    jugador.setNombre(nombre);
    jugador.setDireccion(direccion);
    jugador.setFoto(foto);
    jugador.setFechaDeNacimiento(sdf.parse(fechaNacimiento));
    jugador.setIdEquipo(idEquipo);

    Equipo equipo = new MbdEquipo().traerEquipo(idEquipo);
    new MbdJugador().insertaJugador(jugador);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Se ha agregado un jugador</title>
        <jsp:include page="headers.jsp"/>
    </head>
    <body>
        <div class="jumbotron">
            <h1>Se ha agregado un jugador</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=nombre%></p>
            <p><b>Direccion</b> <%=direccion%></p>
            <p><b>Foto:</b> <%=foto%></p>
            <p><b>Fecha de nacimiento:</b> <%=fechaNacimiento%></p>
            <p><b>Equipo:</b> <%=equipo.getNombre()%></p>
            <p><a class="btn btn-primary btn-lg" href="jugadores.jsp" role="button">Regresar</a></p>
        </div>
    </body>
</html>