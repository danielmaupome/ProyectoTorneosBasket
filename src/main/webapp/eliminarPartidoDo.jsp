<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="java.util.Hashtable"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdPartido = request.getParameter("idPartido");
    int idPartido = Integer.parseInt(pIdPartido);
    Partido partido = new MbdPartidos().buscaPartido(idPartido);
    
    new MbdPartidos().eliminaPartido(idPartido);
    
    Hashtable<Integer, Equipo> equipos = new MbdEquipos().getEquipos();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Se ha eliminado un partido</title>
        <%@ include file="menu.jsp" %>
        <div class="jumbotron">
            <h1>Se ha eliminado un partido</h1>
            <p>&nbsp;</p>
            <p><b><%=equipos.get(partido.getEquipoLocal()).getNombre()%></b> <%=partido.getMarcadorLocal()%> - <%=partido.getMarcadorVisitante()%> <b><%=equipos.get(partido.getEquipoVisitante()).getNombre()%></b></p>
            <p><b>Fecha:</b> <%=partido.getFecha()%></p>
            <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
        </div>
        <%@ include file="base.jsp" %>
</html>
