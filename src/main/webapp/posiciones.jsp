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
    ArrayList<Equipo> listaEquipos = new MbdEquipos().obtenerEquiposConPuntos();
    listaEquipos.sort(Equipo.getComparatorPorPuntos());//Se requiere un comparator
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Lista de partidos</title>
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
                            <tr>
                                <th scope="col">Equipo</th>
                                <th scope="col">P.F.</th>
                                <th scope="col">P.C.</th>
                                <th scope="col">Dif</th>
                                <th scope="col">Default</th>
                                <th scope="col">Puntos</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (Equipo equipo : listaEquipos) {
                            %>
                            <tr>
                                <th scope="row"><%=equipo.getNombre()%></th>
                                <td><%=equipo.getPuntosAFavor()%></td>
                                <td><%=equipo.getPuntosEnContra()%></td>
                                <td><%=equipo.getPuntosAFavor()-equipo.getPuntosEnContra()%></td>
                                <td><%=equipo.getPerdidosPorDefault()%></td>
                                <td><%=equipo.getPuntos()%></td>
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
