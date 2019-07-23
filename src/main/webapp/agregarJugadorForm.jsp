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
            <form action="agregarJugadorDo.jsp" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="login">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="direccion">Dirección:</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="foto">Fotografia:</label>
                        <input type="file" class="form-control" id="foto" name="foto" 
                        accept="image/png, .jpeg, .jpg, image/gif"placeholder="Fotografia">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="fecha_nacimiento">Fecha de nacimiento:</label>
                        <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" placeholder="Fecha de nacimiento">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="idEquipo">Equipo:</label>
                        <select name="idEquipo">
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
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
        </div>
    </body>
</html>
