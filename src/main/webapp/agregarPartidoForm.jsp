<%-- 
    Document   : AgregarEquipoDo
    Created on : Jun 27, 2019, 4:30:31 PM
    Author     : Luis_Lopez
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@ include file="menu.jsp" %>
<%
    ArrayList<Equipo> equipos = new MbdEquipo().traerTodosLosEquipos();
%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Agregar Partido - TODO</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="agregarPartidoDo.jsp" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="idEquipo1">Equipo:</label>
                        <select class="form-control" id="idEquipo1" name="idEquipo1">
                            <option value="">Seleccione el equipo local</option>
                            <%for(Equipo equipo : equipos){%>
                            <option value="<%=equipo.getIdEquipo()%>" >
                                    <%=equipo.getNombre()%>
                                </option>
                            <%}%>
                          
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="idEquipo2">Equipo:</label>
                        <select class="form-control" id="idEquipo2" name="idEquipo2">
                            <option value="">Seleccione el equipo visitante</option>
                            <%for(Equipo equipo : equipos){%>
                            <option value="<%=equipo.getIdEquipo()%>" >
                                    <%=equipo.getNombre()%>
                                </option>
                            <%}%>
                          
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="fecha">Fecha de juego:</label>
                        <input type="datetime-local" class="form-control" id="fecha" name="fecha" placeholder="Fecha de juego">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="cancha">Cancha:</label>
                        <input type="text" class="form-control" id="cancha" name="cancha" placeholder="Cancha"/>
                    </div>
                </div>         
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
        </div>
    </body>
</html>
<%@ include file="base.jsp" %>