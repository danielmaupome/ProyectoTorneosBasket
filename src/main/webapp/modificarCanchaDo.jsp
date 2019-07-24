<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="mx.com.develop.objects.Cancha"%>
<%@page import="mx.com.develop.model.MbdCanchas"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdCancha = request.getParameter("idCancha");
    int idCancha = Integer.parseInt(pIdCancha);
    String nombre = request.getParameter("descripcion");

    
    Cancha can = new Cancha();
    can.setIdCancha(idCancha);
    can.setDescripcion(nombre);
    boolean exito = new MbdCanchas().actualizaCancha(can);
%>
<!DOCTYPE html>
<html>
    <%@include file="menu.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Se ha modificado una Cancha</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%if(exito){%>
        <div class="container">
            <h1 style="margin-top: 3%;">Se ha modificado una Cancha</h1>
            <p>&nbsp;</p>
            <p><b>Id Cancha:</b> <%=can.getIdCancha()%></p>
            <p><b>Nombre:</b> <%=can.getDescripcion()%></p>
            <p><a class="btn btn-danger btn-lg" href="canchas.jsp" role="button">Regresar</a></p>
        </div>
        <%}else{%>
        <div class="jumbotron">
            <h1>Ocurrió un error al modificar la Cancha</h1>
            <p><a class="btn btn-danger btn-lg" href="canchas.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
    </body>
    <%@include file="base.jsp" %>
</html>
