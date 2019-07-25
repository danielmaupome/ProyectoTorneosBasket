<%-- 
    Document   : eliminarCategoriaDo
    Created on : 22/07/2019, 05:06:35 PM
    Author     : Fermin Mireles
--%>

<%@page import="mx.com.develop.model.MbdCategorias"%>
<%@page import="mx.com.develop.objects.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pIdCategoria = request.getParameter("idCategoria");
    int idCategoria = Integer.parseInt(pIdCategoria);
    Categoria categoria = new MbdCategorias().buscaCategoria(idCategoria);
    new MbdCategorias().eliminaCategoria(idCategoria);

%>
<!DOCTYPE html>
<html>
    <%@ include file="menu.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categoria eliminada</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="jumbotron">
            <h1>La categoria <%=categoria.getDescripcion()%> ha sido eliminada</h1>
            <p>&nbsp;</p>
            <p><a class="btn btn-danger btn-lg" href="categorias.jsp" role="button">Regresar</a></p>
        </div>
    </body>
<%@ include file="base.jsp" %>
</html>
