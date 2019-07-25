<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="java.util.Hashtable"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    ArrayList<Partido> listaPartidos = new MbdPartidos().traerTodosLosPartidos();
    Hashtable<Integer, Equipo> equipo = new MbdEquipos().getEquipos();
    String equipoLocal = request.getParameter("equipoLocal");//Recibe el id
    String equipoVisitante = request.getParameter("equipoVisitante");
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'kk:mm");
    java.util.Date fecha = formatter.parse(request.getParameter("fecha"));
    int idEquipoLocal = Integer.parseInt(equipoLocal);
    int idEquipoVisitante = Integer.parseInt(equipoVisitante);
    String cancha = request.getParameter("cancha");
    int idCancha = Integer.parseInt(cancha);
    

    boolean ver = true;
    for (Partido partido : listaPartidos) {

        int a = partido.getEstatus();
        if (a == 1) {
            ver = false;
            if (idEquipoLocal == idEquipoVisitante) {
                ver = false;

            } else if ((partido.getEquipoLocal() == idEquipoLocal) && (partido.getEquipoVisitante() == idEquipoVisitante)) {

                //if (partido.getFecha() == fecha) {
                ver = false;
                //  }

            } else {
                ver = true;
            }
        }
    }
    Hashtable<Integer, Equipo> equipos = new MbdEquipos().getEquipos();
%>
<!DOCTYPE html>
<html>
    <head>
        <%            if (ver) {
                Partido partido = new Partido();
                partido.setEquipoLocal(idEquipoLocal);
                partido.setEquipoVisitante(idEquipoVisitante);
                partido.setEstatus(1);
                partido.setMarcadorLocal(0);
                partido.setMarcadorVisitante(0);
                partido.setIdCancha(idCancha);
                partido.setFecha(new Date(fecha.getTime()));
                
                boolean exito = new MbdPartidos().insertaPartido(partido);
                if (exito) {
        %>
        <title>Se ha agregado un partido</title>
        <%@ include file="menu.jsp" %>
        <%if (exito) {%>
    <div class="jumbotron">
        <h1>Se ha agregado un partido</h1>
        <p>&nbsp;</p>
        <p><b><%=equipos.get(idEquipoLocal).getNombre()%></b> vs <b><%=equipos.get(idEquipoVisitante).getNombre()%></b></p>
        <p><b>Fecha:</b> <%=fecha%></p>
        <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
    </div>
    <%} else {%>
    <div class="jumbotron">
        <h1>Ocurrió un error al agregar el partido</h1>
        <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
    </div>
    <%}%>
    <%
    } else {
    %>
    <div class="jumbotron">
        <h1>No se puede agregar este partido, verifique los datos.</h1>
        <p><a class="btn btn-primary btn-lg" href="AgregarPartidoForm.jsp" role="button">Regresar</a></p>
    </div>

    <%}%>
    <%@ include file="base.jsp" %>
</html>
