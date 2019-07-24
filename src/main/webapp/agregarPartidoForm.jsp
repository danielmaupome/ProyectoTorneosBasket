<%-- 
    Document   : agregarPartidoForm
    Created on : 25/06/2019, 03:26:33 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.model.MbdCanchas"%>
<%@page import="mx.com.develop.objects.Cancha"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    ArrayList<Equipo> listaEquipos = new MbdEquipos().traerTodosLosEquipos();
    ArrayList<Cancha> listaCanchas = new MbdCanchas().traerCanchas();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Agregar Usuario - TODO</title>
        <%@ include file="menu.jsp" %>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="agregarPartidoDo.jsp" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="equipoLocal">Equipo Local</label>
                        <select class="form-control" id="equipoLocal" name="equipoLocal">
                            <%for (Equipo equipo : listaEquipos) {%>
                            <option value="<%=equipo.getIdEquipo()%>"><%=equipo.getNombre()%></option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="equipoVisitante">Equipo Visitante</label>
                        <select class="form-control" id="equipoVisitante" name="equipoVisitante">
                            <%for (Equipo equipo : listaEquipos) {%>
                            <option value="<%=equipo.getIdEquipo()%>"><%=equipo.getNombre()%></option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="fecha">Fecha:</label>
                        <input type="datetime-local" class="form-control" id="fecha" name="fecha" placeholder="Fecha:">
                    </div>
                </div>
                        <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="cancha">Cancha:</label>
                        <select class="form-control" id="equipo_visitante" name="cancha">
                            <option value="" >Seleccione una Cancha</option>
                            <%for(Cancha can : listaCanchas){%>
                                <option value="<%=can.getIdCancha()%>" 
                                    > 
                                    <%=can.getDescripcion()%>
                                </option>
                            <%}%> 
                        </select>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
        </div>
        <%@ include file="base.jsp" %>
</html>
