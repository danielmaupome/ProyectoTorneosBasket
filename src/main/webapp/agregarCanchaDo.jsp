<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.objects.Cancha"%>
<%@page import="mx.com.develop.model.MbdCanchas"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String nombre = request.getParameter("descripcion");
    
    Cancha can = new Cancha();
    can.setDescripcion(nombre);
    boolean exito = new MbdCanchas().insertaCancha(can);
%>
<!DOCTYPE html>
<html>
    <%@include file="menu.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Se ha agregado una Cancha</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%if(exito){%>
        <div class="container">
            <h1 style="margin-top:2%;">Se ha agregado una Cancha</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=nombre%></p>
            <p><a class="btn btn-danger btn-lg" href="canchas.jsp" role="button">Regresar</a></p>
        </div>
        <%}else{%>
        <div class="jumbotron">
            <h1>Ocurrió un error al agregar la Cancha</h1>
            <p><a class="btn btn-danger btn-lg" href="canchas.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
    </body>
    <%@include file="base.jsp" %>
</html>
