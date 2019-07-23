<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="mx.com.develop.objects.Jugador"%>
<%@page import="mx.com.develop.model.MbdJugadores"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdJugador = request.getParameter("idJugador");
    int idJugador = Integer.parseInt(pIdJugador);
    String nombre = request.getParameter("nombre");
    String direccion = request.getParameter("direccion");
    String foto = request.getParameter("foto");
    String fecha_nacimiento = request.getParameter("fecha_nacimiento");
    String pIdEquipo = request.getParameter("idEquipo");
    int idEquipo = Integer.parseInt(pIdEquipo);
    
    Jugador jugador = new Jugador();
    jugador.setIdJugador(idJugador);
    jugador.setIdEquipo(idEquipo);
    jugador.setNombre(nombre);
    jugador.setDireccion(direccion);
    jugador.setFoto(foto);
    Date dateNacimiento = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_nacimiento);
    jugador.setFechaDeNacimiento(dateNacimiento);
    boolean exito = new MbdJugadores().actualizaJugador(jugador);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Se ha modificado un jugador</title>
        <%@ include file="menu.jsp" %>
        <%if(exito){%>
        <div class="jumbotron">
            <h1>Se ha modificado un jugador</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=jugador.getNombre()%></p>
            <p><b>Direccion</b> <%=jugador.getDireccion()%></p>
            <p><b>Foto:</b> <%=jugador.getFoto()%></p>
            <p><b>Fecha de nacimiento:</b> <%=jugador.getFechaDeNacimiento()%></p>
            <p><a class="btn btn-primary btn-lg" href="jugadores.jsp" role="button">Regresar</a></p>
        </div>
        <%}else{%>
        <div class="jumbotron">
            <h1>Ocurrió un error al modificar el jugador</h1>
            <p><a class="btn btn-primary btn-lg" href="jugadores.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
        <%@ include file="base.jsp" %>
</html>
