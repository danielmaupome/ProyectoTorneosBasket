<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="java.util.Hashtable"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    ArrayList<Partido> listaPartidos = new MbdPartidos().traerTodosLosPartidos();
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    
    Hashtable<Integer, Equipo> equipos = new MbdEquipos().getEquipos();
    
String[] estatus = {"","Pendiente","Jugado","Ganó local por default","Ganó visitante por default"};

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Lista de partidos</title>
        <%@ include file="menu.jsp" %>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Fecha</th>
                    <th scope="col">Equipo Local</th>
                    <th scope="col">Marcador</th>
                    <th scope="col">Equipo Visitante</th>
                    <th scope="col">Marcador</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Modificar</th>
                    <th scope="col">Eliminar</th>
                </tr>
            </thead>
            <tbody>
                <%for(Partido partido : listaPartidos){
                %>
                <tr>
                    <th scope="row"><%=formatoFecha.format(partido.getFecha())%></th>
                    <td><%=equipos.get(partido.getEquipoLocal()).getNombre()%></td>
                    <td><%=partido.getMarcadorLocal()%></td>
                    <td><%=equipos.get(partido.getEquipoVisitante()).getNombre()%></td>
                    <td><%=partido.getMarcadorVisitante()%></td>
                    <td><%=estatus[partido.getEstatus()]%></td>
                    <td>
                        <%if(partido.getMarcadorLocal()==0 && partido.getMarcadorVisitante()==0){%>
                        <a class="btn btn-primary btn-lg" href="modificarMarcadorPartidoForm.jsp?idPartido=<%=partido.getIdPartido()%>" role="button">Marcador</a>
                        <%}%>
                    </td>
                    <td><a class="btn btn-primary btn-lg" href="modificarPartidoForm.jsp?idPartido=<%=partido.getIdPartido()%>" role="button">Modificar</a></td>
                    <td><a class="btn btn-primary btn-lg" href="eliminarPartidoDo.jsp?idPartido=<%=partido.getIdPartido()%>" role="button">Eliminar</a></td>
                </tr>
                <%}%>
            </tbody>
            <tfoot>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><p><a class="btn btn-primary btn-lg" href="agregarPartidoForm.jsp" role="button">Agregar</a></p></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </tfoot>
        </table>
        <%@ include file="base.jsp" %>
</html>
