<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="java.util.Hashtable"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%
    String equipoLocal = request.getParameter("equipoLocal");//Recibe el id
    String equipoVisitante = request.getParameter("equipoVisitante");
    String fecha = request.getParameter("fecha");
    int idEquipoLocal = Integer.parseInt(equipoLocal);
    int idEquipoVisitante = Integer.parseInt(equipoVisitante);
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd'T'kk:mm");
    
    Partido partido = new Partido();
    partido.setEquipoLocal(idEquipoLocal);
    partido.setEquipoVisitante(idEquipoVisitante);
    partido.setEstatus(1);//Donde 1 representa Pendiente de jugar
    partido.setMarcadorLocal(0);//Inicialmente no hay marcador
    partido.setMarcadorVisitante(0);
    partido.setFecha(formatoFecha.parse(fecha));

    boolean exito = new MbdPartidos().insertaPartido(partido);
    
    Hashtable<Integer, Equipo> equipos = new MbdEquipos().getEquipos();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Se ha agregado un partido</title>
        <%@ include file="menu.jsp" %>
        <%if(exito){%>
        <div class="jumbotron">
            <h1>Se ha agregado un partido</h1>
            <p>&nbsp;</p>
            <p><b><%=equipos.get(idEquipoLocal).getNombre()%></b> vs <b><%=equipos.get(idEquipoLocal).getNombre()%></b></p>
            <p><b>Fecha:</b> <%=fecha%></p>
            <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
        </div>
        <%}else{%>
        <div class="jumbotron">
            <h1>Ocurrió un error al agregar el partido</h1>
            <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
        <%@ include file="base.jsp" %>
</html>
