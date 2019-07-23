<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdEquipo = request.getParameter("idEquipo");
    int idEquipo = Integer.parseInt(pIdEquipo);
    Equipo equipo = new MbdEquipos().buscaEquipo(idEquipo);
    
    new MbdEquipos().eliminaEquipo(idEquipo);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Se ha eliminado un equipo</title>
        <%@ include file="menu.jsp" %>
        <div class="jumbotron">
            <h1>Se ha eliminado un equipo</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=equipo.getNombre()%></p>
            <p><b>Logotipo:</b> <%=equipo.getLogotipo()%></p>
            <p><b>Color primario:</b> <%=equipo.getColorPrimario()%></p>
            <p><b>Color secundario:</b> <%=equipo.getColorSecundario()%></p>
            <p><a class="btn btn-primary btn-lg" href="equipos.jsp" role="button">Regresar</a></p>
        </div>
        <%@ include file="base.jsp" %>
</html>
