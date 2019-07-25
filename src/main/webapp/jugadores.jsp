<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.model.MbdJugadores"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.objects.Jugador"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.io.File"%>
<%@page import="mx.com.develop.tools.ImageTools"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    ArrayList<Jugador> listaJugadores = new MbdJugadores().traerTodosLosJugadores();
    String uploadFolder = ResourceBundle.getBundle("mx.com.develop.properties.rutas").getString("rutaArchivos");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Administración de jugadors</title>
        <%@ include file="menu.jsp" %>
        <h2>Administración de jugadores</h2>
            <table class="table">
            <thead>
                <tr>
                    <th class="col-lg-1 col-md-1 col-xs-1" scope="col">#</th>
                    <th class="col-lg-1 col-md-1 col-xs-1" scope="col">Nombre</th>
                    <th class="col-lg-1 col-md-1 col-xs-1" scope="col">Direccion</th>
                    <th class="col-lg-2 col-md-2 col-xs-2" scope="col">Fecha de Nacimiento</th>
                    <th class="col-lg-3 col-md-3 col-xs-3" scope="col">Foto</th>
                    
                    <th class="col-lg-1 col-md-1 col-xs-1" scope="col">Modificar</th>
                    <th class="col-lg-1 col-md-1 col-xs-1" scope="col">Eliminar</th>
                </tr>
            </thead>
            <tbody>
                <%for(Jugador jugador : listaJugadores){
                File archivoImagen=new File(uploadFolder+jugador.getFoto());
                %>
                <tr>
                    <td  class="col-lg-1 col-md-1 col-xs-1"><%=jugador.getIdJugador()%></td>
                    <td class="col-lg-1 col-md-1 col-xs-1"><%=jugador.getNombre()%></td>
                    <td class="col-lg-1 col-md-1 col-xs-1"><%=jugador.getDireccion()%></td>
                    <td class="col-lg-2 col-md-2 col-xs-2"><%=jugador.getFechaDeNacimiento()%></td>
                    <td class="col-lg-2 col-md-2 col-xs-2"><img style="display:block; width:auto;height:70px;" src="<%=ImageTools.encodeFileToBase64Binary(archivoImagen)%>" /></td>
                    
                    <td ><a class="btn btn-danger btn-lg" href="modificarJugadorForm.jsp?idJugador=<%=jugador.getIdJugador()%>" role="button">Modificar</a></td>
                    <td ><a class="btn btn-danger btn-lg" href="eliminarJugadorDo.jsp?idJugador=<%=jugador.getIdJugador()%>" role="button">Eliminar</a></td>
                </tr>
                <%}%>
            </tbody>
            <tfoot align="center">
                    <tr>
                    <td><p><a class="btn btn-danger btn-lg" href="agregarJugadorForm.jsp" role="button">Agregar</a></p></td>
                </tr>
            </tfoot>
        </table>
        <%@ include file="base.jsp" %>
</html>
