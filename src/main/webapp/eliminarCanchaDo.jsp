<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.objects.Cancha"%>
<%@page import="mx.com.develop.model.MbdCanchas"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdCancha = request.getParameter("idCancha");
    int idCancha = Integer.parseInt(pIdCancha);
    Cancha can = new MbdCanchas().buscaCancha(idCancha);
    
    new MbdCanchas().eliminaCancha(idCancha);
%>
<!DOCTYPE html>
<html>
    <%@include file="menu.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Se ha eliminado una Cancha</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h1 style="margin-top: 3%;">Se ha eliminado una Cancha</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=can.getDescripcion()%></p>
            <p><a class="btn btn-danger btn-lg" href="canchas.jsp" role="button">Regresar</a></p>
        </div>
    </body>
    <%@include file="base.jsp" %>
</html>
