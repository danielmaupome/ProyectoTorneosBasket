<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.model.MbdCategorias"%>
<%@page import="mx.com.develop.objects.Categoria"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.io.File"%>
<%@page import="mx.com.develop.tools.ImageTools"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    ArrayList<Equipo> listaEquipos = new MbdEquipos().traerTodosLosEquipos();
    Hashtable<Integer, Categoria> categoria = new MbdCategorias().getCategorias();
    String uploadFolder = ResourceBundle.getBundle("mx.com.develop.properties.rutas").getString("rutaArchivos");
%>
<!DOCTYPE html>
<html>
    <%@ include file="menu.jsp" %>
    <head>
        <title>Lista de equipos</title>
         <table class="table" style="font-size:14px; " scope="row">
                <thead>
                    <tr>
                        <th scope ="col" class="col-lg-1 col-md-1 col-xs-1" scope="col">#</th>
                        <th class="col-lg-2 col-md-2 col-xs-2" scope="col">Categoria</th>
                        <th class="col-lg-2 col-md-2 col-xs-2" scope="col">Nombre</th>
                        <th class="col-lg-2 col-md-2 col-xs-2" scope="col">Logotipo</th>
                        <th class="col-lg-2 col-md-2 col-xs-2" scope="col">Color</th>
                    </tr>
                </thead>
                <tbody>
                    <%for (Equipo equipo : listaEquipos) {
                            File archivoImagen = new File(uploadFolder + equipo.getLogotipo());
                    %>
                    <tr>
                        <th class="col-lg-1 col-md-1 col-xs-1" scope="row"><%=equipo.getIdEquipo()%></th>
                        <th class="col-lg-2 col-md-2 col-xs-2" scope="row"><%=categoria.get(equipo.getIdCategoria()).getDescripcion() %></th>
                        <td class="col-lg-2 col-md-2 col-xs-2"><%=equipo.getNombre()%></td>
                        <td class="col-lg-2 col-md-2 col-xs-2"><img style="display:block; width:auto;height:100px;" src="<%=ImageTools.encodeFileToBase64Binary(archivoImagen)%>" /></td>
                        <td class="col-lg-2 col-md-2 col-xs-2"><div style="height:100px; width:100px; overflow:hidden; background-color:<%=equipo.getColorPrimario()%>;">
                                <div style="width:0; height:0; border-top:100px solid <%=equipo.getColorSecundario()%>; border-right:100px solid transparent;"></div>
                            </div>
                        </td>
                        <td class="col-xs-1"><a class="btn btn-danger btn-lg" href="modificarEquipoForm.jsp?idEquipo=<%=equipo.getIdEquipo()%>" role="button">Modificar</a></td>
                        <td class="col-xs-1"><a class="btn btn-danger btn-lg" href="eliminarEquipoDo.jsp?idEquipo=<%=equipo.getIdEquipo()%>" role="button">Eliminar</a></td>
                    </tr>
                    <%}%>
                </tbody>
                <tfoot align="center">
                    <tr>
                        <td><p><a class="btn btn-danger btn-lg" href="agregarEquipoForm.jsp" role="button">Agregar</a></p></td>
                        <td><p><a class="btn btn-danger btn-lg" href="categorias.jsp" role="button">Administrar Categorias</a></p></td>
                    </tr>
                </tfoot>
            </table>
        <%@ include file="base.jsp" %>
</html>
