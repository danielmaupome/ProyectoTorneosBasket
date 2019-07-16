<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.objects.Usuario"%>
<%@page import="mx.com.develop.model.MbdJugador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idJugador = request.getParameter("idJugador");
    
    boolean exito = new MbdJugador().eliminaJugador(Integer.parseInt(idJugador));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Se ha eliminado un jugador</title>
        <jsp:include page="headers.jsp"/>
    </head>
    <body>
        <%if(exito){%>
        <div class="jumbotron">
            <h1>Se ha eliminado un jugador</h1>
            <p><a class="btn btn-primary btn-lg" href="jugadores.jsp" role="button">Regresar</a></p>
        </div>
        <%}else{%>
        <div class="jumbotron">
            <h1>Ocurrió un error al eliminar el jugador</h1>
            <p><a class="btn btn-primary btn-lg" href="jugadores.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
    </body>
</html>
