<%-- 
    Document   : modificarCategoriaDo
    Created on : 17/07/2019, 09:20:23 PM
    Author     : Fermin Mireles
--%>

<%@page import="mx.com.develop.objects.Categoria"%>
<%@page import="mx.com.develop.model.MbdCategorias"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String pICategoria = request.getParameter("idCategoria");
    int idCategoria = Integer.parseInt(pICategoria);
    String descripcion = request.getParameter("descripcion");
    
    Categoria categoria = new Categoria();
    categoria.setIdcategoria(idCategoria);
    categoria.setDescripcion(descripcion);
    System.out.println(categoria);
    boolean exito = new MbdCategorias().actualizaCategoria(categoria);
%>
<!DOCTYPE html>
<html>
    <%@ include file="menu.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Se ha modificado una categoria</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%if (exito) {%>
        <div class="jumbotron">
            <h1>Se ha modificado una categoria</h1>
            <p>&nbsp;</p>
            <p><b>Descripcion:</b> <%=categoria.getDescripcion()%></p>
            <p><a class="btn btn-danger btn-lg" href="categorias.jsp" role="button">Regresar</a></p>
        </div>
        <%} else {%>
        <div class="jumbotron">
            <h1>Ocurrió un error al modificar el jugador</h1>
            <p><a class="btn btn-danger btn-lg" href="categorias.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
    </body>
    <%@ include file="base.jsp" %>
</html>
