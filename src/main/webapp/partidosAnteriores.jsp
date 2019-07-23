<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Hashtable"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    ArrayList<Partido> listaPartidos = new MbdPartidos().obtenerPartidosAnteriores();
    Date fecha = new MbdPartidos().obtenerFechaPartidoAnterior();
    SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat formatoFechaHora = new SimpleDateFormat("HH:mm");

    Hashtable<Integer, Equipo> equipos = new MbdEquipos().getEquipos();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Partidos del día <%=formatoFecha.format(fecha)%></title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm">
                </div>
                <div class="col-sm">

                    <table class="table">
                        <thead>
                            <tr align="center">
                                <th scope="col" colspan="6">Resultados del día: <%=formatoFecha.format(fecha)%></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (Partido partido : listaPartidos) {
                            %>
                            <tr>
                                <th scope="row"><%=formatoFechaHora.format(partido.getFecha())%></th>
                                <td><%=equipos.get(partido.getEquipoLocal()).getNombre()%></td>
                                <td><%=partido.getMarcadorLocal()%></td>
                                <td>-</td>
                                <td><%=partido.getMarcadorVisitante()%></td>
                                <td><%=equipos.get(partido.getEquipoVisitante()).getNombre()%></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm">
                </div>
            </div>
        </div>
    </body>
</html>
