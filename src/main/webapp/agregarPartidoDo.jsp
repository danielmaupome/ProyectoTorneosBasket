<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="java.util.List"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mx.com.develop.model.MbdPartido"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String equipoLocal = request.getParameter("equipo_local");
    String equipoVisitante = request.getParameter("equipo_visitante");
    String marcadorLocal = request.getParameter("marcador_local");
    String marcadorVisitante = request.getParameter("marcador_visitante");
    String estado = request.getParameter("estado");
    String fecha = request.getParameter("fecha");

    Partido partido = new Partido();
    partido.setEquipoLocal(Integer.parseInt(equipoLocal));
    partido.setEquipoVisitante(Integer.parseInt(equipoVisitante));
    partido.setMarcadorLocal(Integer.parseInt(marcadorLocal));
    partido.setMarcadorVisitante(Integer.parseInt(marcadorVisitante));
    partido.setEstatus(Integer.parseInt(estado));
    partido.setFecha(sdf.parse(fecha));

    Equipo e1 = new MbdEquipo().buscaEquipo(partido.getEquipoLocal());
    Equipo e2 = new MbdEquipo().buscaEquipo(partido.getEquipoVisitante());
    new MbdPartido().insertaPartido(partido);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Se ha agregado un partido</title>
        <jsp:include page="headers.jsp"/>
    </head>
    <body>
        <div class="jumbotron">
            <h1>Se ha agregado un partido</h1>
            <p>&nbsp;</p>
            <p><b>Equipo local</b> <%=e1.getNombre()%></p>
            <p><b>Equipo visitante</b> <%=e2.getNombre()%></p>
            <p><b>Marcador local</b> <%=partido.getMarcadorLocal()%></p>
            <p><b>Marcador visitante</b> <%=partido.getMarcadorVisitante()%></p>
            <p><b>Estado</b> <%=partido.getEstatus()%></p>
            <p><b>Fecha del partido:</b> <%=partido.getFecha()%></p>
            <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
        </div>
    </body>
</html>