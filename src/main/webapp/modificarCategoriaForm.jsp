<%-- 
    Document   : modificarCategoriaForm
    Created on : 17/07/2019, 08:50:10 PM
    Author     : Fermin Mireles
--%>

<%@page import="mx.com.develop.model.MbdCategorias"%>
<%@page import="mx.com.develop.objects.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String pIdCategoria = request.getParameter("idCategoria");
    int idCategoria = Integer.parseInt(pIdCategoria);
    Categoria categoria = new MbdCategorias().buscaCategoria(idCategoria);
%>
<!DOCTYPE html>
<html>
    <%@ include file="menu.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Categoria ToDo</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="modificarCategoriaDo.jsp?idCategoria=<%=categoria.getIdcategoria()%>" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="descripcion">Descripcion:</label>
                        <input type="text" class="form-control" id="descripcion" name="descripcion" placeholder="descripcion" value="<%=categoria.getDescripcion()%>">
                    </div>
                </div>
                <button type="submit" class="btn btn-danger btn-lg">Guardar</button>
            </form>
        </div>
    </body>
    <%@ include file="base.jsp" %>
</html>
