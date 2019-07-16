<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mx.com.develop.objects.Jugador"%>
<%@page import="mx.com.develop.model.MbdJugador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String nombre = request.getParameter("nombre");
    String direccion = request.getParameter("direccion");
    String fecha = request.getParameter("fecha_nacimiento");
    String foto = request.getParameter("foto");
    String idJugador = request.getParameter("idJugador");
    String idEquipo = request.getParameter("idEquipo");
    
    Jugador jugador = new Jugador();
    jugador.setNombre(nombre);
    jugador.setDireccion(direccion);
    jugador.setFechaDeNacimiento(sdf.parse(fecha));
    jugador.setFoto(foto);
    jugador.setIdJugador(Integer.parseInt(idJugador));
    
    Equipo equipo = new MbdEquipo().traerEquipo(Integer.parseInt(idEquipo));
    boolean exito = new MbdJugador().actualizarJugador(jugador);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Se ha modificado un jugador</title>
        <jsp:include page="headers.jsp"/>
    </head>
    <body>
        <%if(exito){%>
        <div class="jumbotron">
            <h1>Se ha modificado un usuario</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=nombre%></p>
            <p><b>Direccion:</b> <%=direccion%></p>
            <p><b>Fecha:</b> <%=fecha%></p>
            <p><b>Foto:</b> <%=foto%></p>
            <p><b>Foto:</b> <%=equipo.getNombre()%></p>
            <p><a class="btn btn-primary btn-lg" href="jugadores.jsp" role="button">Regresar</a></p>
        </div>
        <%}else{%>
        <div class="jumbotron">
            <h1>Ocurrió un error al modificar el jugador</h1>
            <p><a class="btn btn-primary btn-lg" href="jugadores.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
    </body>
</html>
