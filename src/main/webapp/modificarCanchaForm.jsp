<%-- 
    Document   : modificarEquipoForm
    Created on : 25/06/2019, 03:26:33 PM
    Author     : Cesar
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mx.com.develop.model.MbdCanchas"%>
<%@page import="mx.com.develop.objects.Cancha"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdCancha = request.getParameter("idCancha");
    int idCancha = Integer.parseInt(pIdCancha);
       
    Cancha can = new MbdCanchas().buscaCancha(idCancha);
%>
<!DOCTYPE html>
<html>
    <%@include file="menu.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Agregar Usuario - TODO</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div id="container" class="container">
            <h2 style="margin-top:3%;">Modificar Cancha</h2>
            <form action="modificarCanchaDo.jsp?idCancha=<%=idCancha%>" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="descripcion">Descripcion: </label>
                        <input type="text" class="form-control" id="nombre" name="descripcion" value="<%=can.getDescripcion()%>">
                    </div>
                </div>
                <button type="submit" class="btn btn-danger btn-lg">Guardar</button>
            </form>
        </div>
    </body>
    <%@include file="base.jsp" %>
</html>
