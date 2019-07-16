<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nombre = request.getParameter("nombre");
    String logotipo = request.getParameter("logotipo");
    String colorPrimario = request.getParameter("color_primario");
    String colorSecundario = request.getParameter("color_secundaria");

    Equipo equipo = new Equipo();
    equipo.setNombre(nombre);
    equipo.setLogotipo(logotipo);
    equipo.setColorPrimario(colorPrimario);
    equipo.setColorSecundario(colorSecundario);
     new MbdEquipo().insertaEquipo(equipo);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Se ha agregado un equipo</title>
        <jsp:include page="headers.jsp"/>
    </head>
    <body>
        <div class="jumbotron">
            <h1>Se ha agregado un equipo</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=nombre%></p>
            <p><b>Archivo:</b> <%=logotipo%></p>
            <p><b>Color primario:</b> <%=colorPrimario%></p>
            <p><b>Color secundario:</b> <%=colorSecundario%></p>
            <p><a class="btn btn-primary btn-lg" href="equipos.jsp" role="button">Regresar</a></p>
        </div>
    </body>
</html>
