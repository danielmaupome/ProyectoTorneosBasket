<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="java.util.Hashtable"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdPartido = request.getParameter("idPartido");
    int idPartido = Integer.parseInt(pIdPartido);
    int marcadorLocal = Integer.parseInt(request.getParameter("marcadorLocal"));
    int marcadorVisitante = Integer.parseInt(request.getParameter("marcadorVisitante"));
    int estatus = Integer.parseInt(request.getParameter("estatus"));
    
    Partido partido = new MbdPartidos().buscaPartido(idPartido);
    partido.setIdPartido(idPartido);
    partido.setMarcadorLocal(marcadorLocal);
    partido.setMarcadorVisitante(marcadorVisitante);
    partido.setEstatus(estatus);
    boolean exito = new MbdPartidos().actualizaMarcadorPartido(partido);
    
    Hashtable<Integer, Equipo> equipos = new MbdEquipos().getEquipos();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Se ha modificado un partido</title>
        <%@ include file="menu.jsp" %>
        <%if(exito){%>
        <div class="jumbotron">
            <h1>Se ha agregado marcador al partido</h1>
            <p>&nbsp;</p>
            <p><b><%=equipos.get(partido.getEquipoLocal()).getNombre()%></b> <%=partido.getMarcadorLocal()%> - <%=partido.getMarcadorVisitante()%> <b><%=equipos.get(partido.getEquipoLocal()).getNombre()%></b></p>
            <p><b>Fecha:</b> <%=partido.getFecha()%></p>
            <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
        </div>
        <%}else{%>
        <div class="jumbotron">
            <h1>Ocurrió un error al modificar el partido</h1>
            <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
        <%@ include file="base.jsp" %>
</html>
