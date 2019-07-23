<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="mx.com.develop.model.MbdJugadores"%>
<%@page import="mx.com.develop.objects.Jugador"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String nombre = request.getParameter("nombre");
    String direccion = request.getParameter("direccion");
    String foto = request.getParameter("foto");
    String fecha_nacimiento = request.getParameter("fecha_nacimiento");
    String pIdEquipo = request.getParameter("idEquipo");
    int idEquipo = Integer.parseInt(pIdEquipo);
    
    Jugador jugador = new Jugador();
    jugador.setIdEquipo(idEquipo);
    jugador.setNombre(nombre);
    jugador.setDireccion(direccion);
    jugador.setFoto(foto);
    Date dateNacimiento = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_nacimiento);
    jugador.setFechaDeNacimiento(dateNacimiento);

    boolean exito = new MbdJugadores().insertaJugador(jugador);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Se ha agregado un jugador</title>
        <%@ include file="menu.jsp" %>
        <%if(exito){%>
        <div class="jumbotron">
            <h1>Se ha agregado un jugador</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=nombre%></p>
            <p><b>Direccion</b> <%=direccion%></p>
            <p><b>Foto:</b> <%=foto%></p>
            <p><b>Fecha de nacimiento:</b> <%=fecha_nacimiento%></p>
            <p><a class="btn btn-primary btn-lg" href="jugadores.jsp" role="button">Regresar</a></p>
        </div>
        <%}else{%>
        <div class="jumbotron">
            <h1>Ocurrió un error al agregar el jugador</h1>
            <p><a class="btn btn-primary btn-lg" href="jugadores.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
        <%@ include file="base.jsp" %>
</html>