<%-- 
    Document   : agregarCategoriaForm
    Created on : 18/07/2019, 05:18:50 PM
    Author     : Fermin Mireles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="menu.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Categoria</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="agregarCategoriaDo.jsp" method="POST">
                <h2>Agregar Categoria</h2>
                <div class="form-row">
                    <div class="form-group col-lg-6">
                        <label for="descripcion">Nombre:</label>
                        <input type="text" class="form-control" id="descripcion" name="descripcion" placeholder="descripcion">
                    </div>
                </div>
                <button type="submit" class="btn btn-danger btn-lg">Guardar</button>
            </form>
        </div>
    </body>
    <%@include file="base.jsp" %>
</html>
