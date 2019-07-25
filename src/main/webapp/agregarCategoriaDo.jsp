<%-- 
    Document   : agregarCategoriaDo
    Created on : 18/07/2019, 05:40:09 PM
    Author     : Fermin Mireles
--%>

<%@page import="mx.com.develop.model.MbdCategorias"%>
<%@page import="mx.com.develop.objects.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String descripcion = request.getParameter("descripcion");

    Categoria categoria = new Categoria();
    categoria.setDescripcion(descripcion);

    boolean exito = new MbdCategorias().insertaCategoria(categoria);
%>
<!DOCTYPE html>
<html>
    <%@ include file="menu.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Se ha agregado una categoria</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%if(exito){%>
        <div class="jumbotron">
            <h1>Se ha agregado una categoria</h1>
            <p>&nbsp;</p>
            <p><b>Descripcion:</b> <%=descripcion%></p>
            <p><a class="btn btn-danger btn-lg" href="categorias.jsp" role="button">Regresar</a></p>
        </div>
        <%}else{%>
        <div class="jumbotron">
            <h1>Ocurrió un error al agregar el equipo</h1>
            <p><a class="btn btn-danger btn-lg" href="categorias.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
    </body>
    <%@ include file="base.jsp" %>
</html>
