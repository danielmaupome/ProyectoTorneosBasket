<%-- 
    Document   : agregarEquipoForm
    Created on : 25/06/2019, 03:26:33 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    ArrayList<Equipo> listaEquipos = new MbdEquipos().traerTodosLosEquipos();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Agregar Usuario - TODO</title>
        <%@ include file="menu.jsp" %>
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
                        <label for="foto">Fotografía:</label>
                        <input type="file" class="form-control" id="foto" name="foto" placeholder="Fotografía">
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
                        <label for="idEquipo">Equipo</label>
                        <select class="form-control" id="idEquipo" name="idEquipo">
                            <%for(Equipo equipo : listaEquipos){%>
                            <option value="<%=equipo.getIdEquipo()%>"><%=equipo.getNombre()%></option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
        </div>
        <%@ include file="base.jsp" %>
</html>
