<%-- 
    Document   : agregarEquipoForm
    Created on : 25/06/2019, 03:26:33 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.model.MbdPartido"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.util.List"%>
<%
    String pIdUsuario = request.getParameter("idPartido");
    int idPartido = Integer.parseInt(pIdUsuario);

    Partido partido = new MbdPartido().buscaPartido(idPartido);
    List<Equipo> equipos = new MbdEquipo().traerTodosLosEquipos();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Partido - TODO</title>
        <jsp:include page="headers.jsp"/>
    </head>
    <body>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="modificarPartidoDo.jsp?idPartido=<%=partido.getIdPartido()%>" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="idEquipo">Equipo Local:</label>
                        <select name="equipo_local">
                            <%
                                for (Equipo equipo : equipos) {
                                    out.print("<option value=\"");
                                    out.print(equipo.getIdEquipo());
                                    if (partido.getEquipoLocal() == equipo.getIdEquipo()) {
                                        out.print("\" selected>");
                                    } else {
                                        out.print("\">");
                                    }
                                    out.print(equipo.getNombre());
                                    out.print("</option>");
                                }
                            %>
                        </select> 
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="idEquipo">Equipo Visitante:</label>
                        <select name="equipo_visitante">
                            <%
                                for (Equipo equipo : equipos) {
                                    out.print("<option value=\"");
                                    out.print(equipo.getIdEquipo());
                                    if (partido.getEquipoVisitante() == equipo.getIdEquipo()) {
                                        out.print("\" selected>");
                                    } else {
                                        out.print("\">");
                                    }
                                    out.print(equipo.getNombre());
                                    out.print("</option>");
                                }
                            %>
                        </select> 
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="login">Marcador Local:</label>
                        <input type="text" class="form-control" id="nombre" name="marcador_local" placeholder="Numero" value="<%= partido.getMarcadorLocal()%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="direccion">Marcado visitante:</label>
                        <input type="text" class="form-control" id="direccion" name="marcador_visitante" placeholder="Numero" value="<%= partido.getMarcadorVisitante()%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="foto">Estado:</label>
                        <select name="estado">
                            <option value="1">Perdido</option>
                            <option value="2">Ganado</option>
                            <option value="3">Jugado</option>
                            <option value="4" selected>No jugado</option>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="fecha_nacimiento">Fecha del partido</label>
                        <input id="dtp1" type="date" class="form-control" data-format="dd/MM/yyyy hh:mm" id="fecha_nacimiento" name="fecha" placeholder="Fecha del partido" value="<%=partido.getFecha()%>">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
        </div>
    </body>
</html>
