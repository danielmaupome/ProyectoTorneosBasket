<%-- 
    Document   : agregarEquipoForm
    Created on : 25/06/2019, 03:26:33 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.model.MbdJugador"%>
<%@page import="mx.com.develop.objects.Jugador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.util.List"%>
<%
    String pIdUsuario = request.getParameter("idJugador");
    int idJugador = Integer.parseInt(pIdUsuario);

    Jugador jugador = new MbdJugador().buscaJugador(idJugador);
    List<Equipo> equipos = new MbdEquipo().traerTodosLosEquipos();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Jugador - TODO</title>
        <jsp:include page="headers.jsp"/>
    </head>
    <body>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="modificarJugadorDo.jsp?idJugador=<%=jugador.getIdJugador()%>" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" value="<%=jugador.getNombre()%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="login">Direccion:</label>
                        <input type="text" class="form-control" id="login" name="direccion" placeholder="Dirección" value="<%=jugador.getDireccion()%>">
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
                        <label for="email">Fecha de nacimiento:</label>
                        <input type="date" class="form-control" id="email" name="fecha_nacimiento" placeholder="Fecha nacimiento" value="<%=jugador.getFechaDeNacimiento()%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="idEquipo">Equipos:</label>
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
