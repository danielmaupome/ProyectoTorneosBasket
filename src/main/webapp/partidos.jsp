<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.model.MbdCanchas"%>
<%@page import="mx.com.develop.objects.Cancha"%>
<%@page import="java.util.Hashtable"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    ArrayList<Partido> listaPartidos = new MbdPartidos().traerTodosLosPartidos();
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    
    Hashtable<Integer, Equipo> equipos = new MbdEquipos().getEquipos();
    Hashtable<Integer, Cancha> canchas = new MbdCanchas().getCanchas();
    
//String[] estatus = {"","Pendiente","Jugado","Ganó local por default","Ganó visitante por default"};

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Lista de partidos</title>
        <%@ include file="menu.jsp" %>
        <h2 style="margin-top: 2%">Administracion de partidos</h2>
            <table class="table" style="font-size:10px;" scope="row">
                <thead>
                    <tr>
                        <th class="col-lg-2 col-md-2 col-xs-2" scope="col">Fecha del juego</th>
                        <!--<th class="col-lg-1 col-md-1 col-xs-1" scope="col">#</th>-->
                        <th class="col-lg-1 col-md-1 col-xs-1" scope="col">Equipo local</th>
                        <th class="col-lg-1 col-md-1 col-xs-1" scope="col">Marcador Local</th>
                        <th class="col-lg-1 col-md-1 col-xs-1" scope="col">Equipo visitante</th>
                        <th class="col-lg-2 col-md-2 col-xs-2" scope="col">Marcador Visitante</th>  
                        <th class="col-lg-1 col-md-1 col-xs-1" scope="col">Estatus</th>
                        <th class="col-lg-1 col-md-1 col-xs-1" scope="col">Cancha</th>
                        <th class="col-lg-1 col-md-1 col-xs-1" scope="col">Modificar</th>
                        <th class="col-lg-1 col-md-1 col-xs-1" scope="col">Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <%for (Partido partido : listaPartidos) {%>
                    <tr>
                        <td class="col-lg-2 col-md-2 col-xs-2"><%=formatoFecha.format(partido.getFecha()) %></td>
                        <!--<td class="col-lg-1 col-md-1 col-xs-1">partido.getIdPartido()</td>-->
                        <td class="col-lg-1 col-md-1 col-xs-1"><%=equipos.get(partido.getEquipoLocal()).getNombre()%></td>
                        <td class="col-lg-1 col-md-1 col-xs-1"><%=partido.getMarcadorLocal()%></td>
                        <td class="col-lg-1 col-md-1 col-xs-1"><%=equipos.get(partido.getEquipoVisitante()).getNombre()%></td>
                        <td class="col-lg-2 col-md-2 col-xs-2"><%=partido.getMarcadorVisitante()%></td>
                        <td class="col-lg-1 col-md-1 col-xs-1"><%=partido.getEs()%></td>
                        <td class="col-lg-1 col-md-1 col-xs-1"><%=canchas.get(partido.getIdCancha()).getDescripcion()%></td>
                        <td class="col-xs-1"><a class="btn btn-danger btn-lg" href="modificarPartidoForm.jsp?idPartido=<%=partido.getIdPartido()%>" role="button">Modificar</a></td>
                        <td class="col-xs-1"><a class="btn btn-danger btn-lg" href="eliminarPartidoDo.jsp?idPartido=<%=partido.getIdPartido()%>" role="button">Eliminar</a></td>
                    </tr>
                    <%}%>  
                </tbody>
                <tfoot align="center">
                    <tr>
                        <td><p><a class="btn btn-danger btn-lg" href="agregarPartidoForm.jsp" role="button">Agregar partido</a></p></td>
                        <td><p><a class="btn btn-danger btn-lg" href="canchas.jsp" role="button">Administrar Canchas</a></p></td>
                    </tr>
                </tfoot>
            </table>
        <%@ include file="base.jsp" %>
</html>
