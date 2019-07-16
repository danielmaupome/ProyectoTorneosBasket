<%-- 
    Document   : agregarEquipoForm
    Created on : 25/06/2019, 03:26:33 PM
    Author     : Cesar
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Equipo> equipos = new MbdEquipo().traerTodosLosEquipos();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Usuario - TODO</title>
        <jsp:include page="headers.jsp"/>
    </head>
    <body>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="agregarPartidoDo.jsp" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="idEquipo">Equipo Local:</label>
                        <select class="col-md-2" name="equipo_local">
                            <%
                                for (Equipo equipo : equipos) {
                                    out.print("<option value=\"");
                                    out.print(equipo.getIdEquipo());
                                    out.print("\">");
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
                        <select class="col-md-2" name="equipo_visitante">
                            <%
                                for (Equipo equipo : equipos) {
                                    out.print("<option value=\"");
                                    out.print(equipo.getIdEquipo());
                                    out.print("\">");
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
                        <input type="text" class="form-control" id="nombre" name="marcador_local" placeholder="Numero">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="direccion">Marcado visitante:</label>
                        <input type="text" class="form-control" id="direccion" name="marcador_visitante" placeholder="Numero">
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
                        <input id="dtp1" type="date" class="form-control" data-format="dd/MM/yyyy hh:mm" id="fecha_nacimiento" name="fecha" placeholder="Fecha del partido">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
        </div>

        <script type="text/javascript">
            $(function () {
                $('#dtp1').datetimepicker();
            });
            $('select').select2();
        </script>
    </body>
</html>
