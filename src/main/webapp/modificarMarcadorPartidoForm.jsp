<%-- 
    Document   : modificarPartidoForm
    Created on : 25/06/2019, 03:26:33 PM
    Author     : Cesar
--%>

<%@page import="java.util.Hashtable"%>
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
    
    Hashtable<Integer, Equipo> equipos = new MbdEquipos().getEquipos();
    Equipo equipoLocal = equipos.get(partido.getEquipoLocal());
    Equipo equipoVisitante = equipos.get(partido.getEquipoVisitante());
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Modificar Partido - TODO</title>
        <%@ include file="menu.jsp" %>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="modificarMarcadorPartidoDo.jsp?idPartido=<%=partido.getIdPartido()%>" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="estatus">Estatus</label>
                        <select class="form-control" id="estatus" name="estatus">
                            <option value="2" selected>Jugado</option>
                            <option value="3">Ganó <%=equipoLocal.getNombre()%> por Default</option>
                            <option value="4">Ganó <%=equipoVisitante.getNombre()%> por Default</option>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="marcadorLocal">Marcador <%=equipoLocal.getNombre()%>:</label>
                        <input type="text" class="form-control" id="marcadorLocal" name="marcadorLocal" placeholder="Marcador Local" value="<%=partido.getMarcadorLocal()%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="marcadorLocal">Marcador <%=equipoVisitante.getNombre()%>:</label>
                        <input type="text" class="form-control" id="marcadorVisitante" name="marcadorVisitante" placeholder="Marcador Visitante" value="<%=partido.getMarcadorVisitante()%>">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
        </div>
        <%@ include file="base.jsp" %>
</html>
