<%-- 
    Document   : AgregarEquipoDo
    Created on : Jun 27, 2019, 4:30:31 PM
    Author     : Luis_Lopez
--%>

<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="java.util.Hashtable"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ include file="menu.jsp" %>
<%    ArrayList<Partido> listaPartidos = new MbdPartidos().traerTodosLosPartidos();
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    Hashtable<Integer, Equipo> equipo = new MbdEquipo().getEquipos();

    int equipo_local = Integer.parseInt(request.getParameter("idEquipo1"));
    int equipo_visitante = Integer.parseInt(request.getParameter("idEquipo2"));
    String cancha = request.getParameter("cancha");
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'kk:mm");
    java.util.Date fecha = formatter.parse(request.getParameter("fecha"));
    boolean ver = true;
    for (Partido partido : listaPartidos) {

        int a = partido.getEstatus();
        if (a == 1) {
            ver = false;
            if (equipo_local == equipo_visitante) {
                ver = false;

            } else if ((partido.getEquipoLocal() == equipo_local) && (partido.getEquipoVisitante() == equipo_visitante)) {

                //if (partido.getFecha() == fecha) {
                ver = false;
                //  }

            } else {
                ver = true;
            }
        }
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Se ha agregado un partido</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%            if (ver) {
                Partido partido = new Partido();
                partido.setEquipoLocal(equipo_local);
                partido.setEquipoVisitante(equipo_visitante);
                partido.setCancha(cancha);
                partido.setFecha(new Date(fecha.getTime()));
                partido.setEstatus(1);
                boolean exito = new MbdPartidos().insertaPartido(partido);
                if (exito) {
        %>
        <div class="jumbotron">
            <h1>Se ha agregado un partido</h1>
            <p>&nbsp;</p>
            <p><b>Equipo local:</b> <%=equipo_local%></p>
            <p><b>Equipo visitante:</b> <%=equipo_visitante%></p>
            <p><b>Cancha: </b><%=cancha%></p>
            <p><b>Fecha del partido:</b> <%=fecha%></p>
            <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
        </div>
        <%} else {%>
        <div class="jumbotron">
            <h1>Ocurrio un error al agregar el partido</h1>
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
    </body>
</html>
<%@ include file="base.jsp" %>