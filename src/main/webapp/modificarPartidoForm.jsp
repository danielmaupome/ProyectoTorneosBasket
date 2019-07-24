<%-- 
    Document   : modificarPartidoForm
    Created on : 25/06/2019, 03:26:33 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.model.MbdCanchas"%>
<%@page import="mx.com.develop.objects.Cancha"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdPartido = request.getParameter("idPartido");
    int idPartido = Integer.parseInt(pIdPartido);

    Partido partido = new MbdPartidos().buscaPartido(idPartido);
    ArrayList<Equipo> listaEquipos = new MbdEquipos().traerTodosLosEquipos();
    ArrayList<Cancha> listaCanchas = new MbdCanchas().traerCanchas();
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Modificar Partido - TODO</title>
        <%@ include file="menu.jsp" %>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="modificarPartidoDo.jsp?idPartido=<%=partido.getIdPartido()%>" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="equipoLocal">Equipo Local</label>
                        <select class="form-control" id="equipoLocal" name="equipoLocal">
                            <%for (Equipo equipo : listaEquipos) {%>
                            <option value="<%=equipo.getIdEquipo()%>" <%if (equipo.getIdEquipo() == partido.getEquipoLocal()) {%>selected<%}%>><%=equipo.getNombre()%></option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="marcadorLocal">Marcador Local:</label>
                        <input type="text" class="form-control" id="marcadorLocal" name="marcadorLocal" placeholder="Marcador Local" value="<%=partido.getMarcadorLocal()%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="equipoVisitante">Equipo Visitante</label>
                        <select class="form-control" id="equipoVisitante" name="equipoVisitante">
                            <%for (Equipo equipo : listaEquipos) {%>
                            <option value="<%=equipo.getIdEquipo()%>" <%if (equipo.getIdEquipo() == partido.getEquipoVisitante()) {%>selected<%}%>><%=equipo.getNombre()%></option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="marcadorLocal">Marcador Visitante:</label>
                        <input type="text" class="form-control" id="marcadorVisitante" name="marcadorVisitante" placeholder="Marcador Visitante" value="<%=partido.getMarcadorVisitante()%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="estatus">Estatus</label>
                        <select class="form-control" id="estatus" name="estatus">
                            <option value="1" <%if (partido.getEstatus() == 1) {%>selected<%}%>>Pendiente</option>
                            <option value="2" <%if (partido.getEstatus() == 2) {%>selected<%}%>>Jugado</option>
                            <option value="3" <%if (partido.getEstatus() == 3) {%>selected<%}%>>Default Local</option>
                            <option value="4" <%if (partido.getEstatus() == 4) {%>selected<%}%>>Default Visitante</option>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="fecha">Fecha:</label>
                        <input type="datetime-local" class="form-control" id="fecha" name="fecha" placeholder="Fecha" value="<%=formatoFecha.format(partido.getFecha())%>">
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
                <button type="submit" class="btn btn-danger btn-lg">Guardar</button>
            </form>
        </div>
        <%@ include file="base.jsp" %>
</html>
