<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.io.File"%>
<%@page import="mx.com.develop.tools.ImageTools"%>
<%@page import="mx.com.develop.model.MbdCategorias"%>
<%@page import="mx.com.develop.objects.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    ArrayList<Categoria> listaCategorias = new MbdCategorias().traerCategorias();
%>
<!DOCTYPE html>
<html>
    <%@ include file="menu.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Lista de equipos</title>
        <link rel="stylesheet" href="css/style.css">    
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <!--Inicio Tabla-->
        <div class="container">
            <h2 style="margin-top: 3%">Administracion de Categorias</h2>
            <table class="table" style="font-size:14px; " scope="row">
                <thead>
                    <tr>
                        <th scope ="col" class="col-lg-1 col-md-1 col-xs-1" scope="col">#</th>
                        <th class="col-lg-2 col-md-2 col-xs-2" scope="col">Descripcion</th>
                        <th class="col-lg-1 col-md-1 col-xs-1" scope="col">Modificar</th>
                        <th class="col-lg-1 col-md-1 col-xs-1" scope="col">Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <%for (Categoria cat : listaCategorias) {
                    %>
                    <tr>
                        <th class="col-lg-1 col-md-1 col-xs-1" scope="row"><%=cat.getIdcategoria()%></th>
                        <td class="col-lg-2 col-md-2 col-xs-2"><%=cat.getDescripcion()%></td>
                        <td class="col-xs-1"><a class="btn btn-danger btn-lg" href="modificarCategoriaForm.jsp?idCategoria=<%=cat.getIdcategoria()%>" role="button">Modificar</a></td>
                        <td class="col-xs-1"><a class="btn btn-danger btn-lg" href="eliminarCategoriaDo.jsp?idCategoria=<%=cat.getIdcategoria()%>" role="button">Eliminar</a></td>
                    </tr>
                    <%}%>
                </tbody>
                <tfoot align="center">
                    <tr>
                        <td><p><a class="btn btn-danger btn-lg" href="agregarCategoriaForm.jsp" role="button">Agregar Categoria</a></p></td>
                        <td><p><a class="btn btn-danger btn-lg" href="equipos.jsp" role="button">Regresar a Equipos</a></p></td>
                    </tr>
                </tfoot>
            </table>
        </div>
        <!--Fin Tabla-->
        <!-- Scripts -->
        <script src="js/jquery.min.js"></script>
        <script src="js/equipos.js"></script>
        <script src="js/scripts.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.ba-outside-events.min.js"></script>
        <script src="js/tab.js"></script>
        <script src='js/bootstrap-datepicker.js'></script>
        <script src="js/jquery.vide.min.js"></script>
        <script src="twitter/jquery.tweet.min.js" type="text/javascript"></script>
    </body>
    <%@ include file="base.jsp" %>
</html>