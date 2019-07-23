<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.objects.Jugador"%>
<%@page import="mx.com.develop.model.MbdJugadores"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdJugador = request.getParameter("idJugador");
    int idJugador = Integer.parseInt(pIdJugador);
    Jugador jugador = new MbdJugadores().buscaJugador(idJugador);
    
    new MbdJugadores().eliminaJugador(idJugador);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Se ha eliminado un jugador</title>
        <%@ include file="menu.jsp" %>
        <div class="jumbotron">
            <h1>Se ha eliminado un jugador</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=jugador.getNombre()%></p>
            <p><b>Direccion</b> <%=jugador.getDireccion()%></p>
            <p><b>Foto:</b> <%=jugador.getFoto()%></p>
            <p><b>Fecha de nacimiento:</b> <%=jugador.getFechaDeNacimiento()%></p>
            <p><a class="btn btn-primary btn-lg" href="jugadores.jsp" role="button">Regresar</a></p>
        </div>
        <%@ include file="base.jsp" %>
</html>
