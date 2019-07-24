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
    String equipoLocal = request.getParameter("equipoLocal");//Recibe el id
    String equipoVisitante = request.getParameter("equipoVisitante");
    int estatus = Integer.parseInt(request.getParameter("estatus"));
    int marcadorLocal = Integer.parseInt(request.getParameter("marcadorLocal"));
    int marcadorVisitante = Integer.parseInt(request.getParameter("marcadorVisitante"));
    String cancha=request.getParameter("cancha");
    int idCancha = Integer.parseInt(cancha);
    String fecha = request.getParameter("fecha");
    int idEquipoLocal = Integer.parseInt(equipoLocal);
    int idEquipoVisitante = Integer.parseInt(equipoVisitante);
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd'T'kk:mm");
    
    Partido partido = new Partido();
    partido.setIdPartido(idPartido);
    partido.setEquipoLocal(idEquipoLocal);
    partido.setEquipoVisitante(idEquipoVisitante);
    partido.setIdCancha(idCancha);
    partido.setEstatus(estatus);
    partido.setMarcadorLocal(marcadorLocal);
    partido.setMarcadorVisitante(marcadorVisitante);
    partido.setFecha(formatoFecha.parse(fecha));
    boolean exito = new MbdPartidos().actualizaPartido(partido);
    
    Hashtable<Integer, Equipo> equipos = new MbdEquipos().getEquipos();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Se ha modificado un partido</title>
        <%@ include file="menu.jsp" %>
        <%if(exito){%>
        <div class="jumbotron">
            <h1>Se ha modificado un partido</h1>
            <p>&nbsp;</p>
            <p><b><%=equipos.get(idEquipoLocal).getNombre()%></b> <%=marcadorLocal%> - <%=marcadorVisitante%> <b><%=equipos.get(idEquipoVisitante).getNombre()%></b></p>
            <p><b>Fecha:</b> <%=fecha%></p>
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
