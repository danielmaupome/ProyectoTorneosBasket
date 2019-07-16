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
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="mx.com.develop.model.MbdPartido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Integer idPartido = Integer.parseInt(request.getParameter("idPartido"));
    Integer equipoLocal = Integer.parseInt(request.getParameter("equipo_local"));
    Integer equipoVisitante = Integer.parseInt(request.getParameter("equipo_visitante"));
    Integer estado = Integer.parseInt(request.getParameter("estado"));
    Integer marcadorLocal = Integer.parseInt(request.getParameter("marcador_local"));
    Integer marcadorVisitante = Integer.parseInt(request.getParameter("marcador_visitante"));
    String fecha = request.getParameter("fecha");
    
    Partido partido = new Partido();
    partido.setIdPartido(idPartido);
    partido.setEquipoLocal(equipoLocal);
    partido.setEquipoVisitante(equipoVisitante);
    partido.setEstatus(estado);
    partido.setMarcadorLocal(marcadorLocal);
    partido.setMarcadorVisitante(marcadorVisitante);
    partido.setFecha(sdf.parse(fecha));
    
    Equipo e1 = new MbdEquipo().buscaEquipo(partido.getEquipoLocal());
    Equipo e2 = new MbdEquipo().buscaEquipo(partido.getEquipoVisitante());
    boolean exito = new MbdPartido().actualizarPartido(partido);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Se ha modificado un partido</title>
        <jsp:include page="headers.jsp"/>
    </head>
    <body>
        <%if(exito){%>
        <div class="jumbotron">
            <h1>Se ha modificado un usuario</h1>
            <p>&nbsp;</p>
            <p><b>Equipo Local:</b> <%=e1.getNombre()%></p>
            <p><b>Equipo visitante:</b> <%=e2.getNombre()%></p>
            <p><b>Marcador local:</b> <%=partido.getMarcadorLocal()%></p>
            <p><b>Marcador visitante:</b> <%=partido.getMarcadorVisitante()%></p>
            <p><b>Estado:</b> <%=partido.getEstatus()%></p>
            <p><b>Fecha:</b> <%=partido.getFecha()%></p>
            <p><a class="btn btn-primary btn-lg" href="partidoes.jsp" role="button">Regresar</a></p>
        </div>
        <%}else{%>
        <div class="jumbotron">
            <h1>Ocurrió un error al modificar el partido</h1>
            <p><a class="btn btn-primary btn-lg" href="partidoes.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
    </body>
</html>
