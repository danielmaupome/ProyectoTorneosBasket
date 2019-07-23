<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.io.File"%>
<%@page import="mx.com.develop.tools.ImageTools"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    ArrayList<Equipo> listaEquipos = new MbdEquipos().traerTodosLosEquipos();
    String uploadFolder = ResourceBundle.getBundle("mx.com.develop.properties.rutas").getString("rutaArchivos");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Lista de equipos</title>
        <%@ include file="menu.jsp" %>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Logotipo</th>
                    <th scope="col">Color</th>
                </tr>
            </thead>
            <tbody>
                <%for(Equipo equipo : listaEquipos){
                File archivoImagen=new File(uploadFolder+equipo.getLogotipo());
                %>
                <tr>
                    <th scope="row"><%=equipo.getIdEquipo()%></th>
                    <td><%=equipo.getNombre()%></td>
                    <td><img style="display:block; width:auto;height:100px;" src="<%=ImageTools.encodeFileToBase64Binary(archivoImagen)%>" /></td>
                    <td><div style="height:100px; width:100px; overflow:hidden; background-color:<%=equipo.getColorPrimario()%>;">
                            <div style="width:0; height:0; border-top:100px solid <%=equipo.getColorSecundario()%>; border-right:100px solid transparent;"></div>
                        </div>
                    </td>
                    <td><a class="btn btn-primary btn-lg" href="modificarEquipoForm.jsp?idEquipo=<%=equipo.getIdEquipo()%>" role="button">Modificar</a></td>
                    <td><a class="btn btn-primary btn-lg" href="eliminarEquipoDo.jsp?idEquipo=<%=equipo.getIdEquipo()%>" role="button">Eliminar</a></td>
                </tr>
                <%}%>
            </tbody>
            <tfoot>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><p><a class="btn btn-primary btn-lg" href="agregarEquipoForm.jsp" role="button">Agregar</a></p></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </tfoot>
        </table>
        <%@ include file="base.jsp" %>
</html>
