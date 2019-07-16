<%-- 
    Document   : agregarEquipoForm
    Created on : 25/06/2019, 03:26:33 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="mx.com.develop.model.MbdUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Integer idEquipo = Integer.parseInt(request.getParameter("idEquipo"));

    Equipo equipo = new MbdEquipo().buscaEquipo(idEquipo);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Usuario - TODO</title>
        <jsp:include page="headers.jsp"/>
        <script src="jscolor.js"></script>
    </head>
    <body>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="modificarEquipoDo.jsp?idEquipo=<%=equipo.getIdEquipo()%>" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nombre">Nombre: </label>
                        <input type="text" class="form-control" id="nombre" name="nombre" value="<%=equipo.getNombre()%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Logotipo:</label>
                            <div class="col-md-12 col-sm-12 col-xs-12 dropzone">

                            </div>                        
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="password">Color Primario: </label>
                        <input class="jscolor form-control" id="password" name="color_primario" value="<%=equipo.getColorPrimario()%>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="email">Color Secundario: </label>
                        <input class="jscolor form-control" id="email" name="color_secundario" value="<%=equipo.getColorSecundario()%>">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
        </div>
    </body>
    <script>
        $(".dropzone").dropzone({
            url: 'upload.do',
            paramName: 'logo',
            maxFilesize: 5,
            maxFiles: 1,
            dictDefaultMessage: 'Arrastre los archivos o de clic',
            addRemoveLinks: true,
            dictResponseError: 'Server not Configured',
            acceptedFiles: ".png,.jpg,.gif,.bmp,.jpeg",
            init: function () {
                var dropzone = this;
                var pn = dropzone.options.paramName;
                dropzone.options.addRemoveLinks = true;
                dropzone.options.dictRemoveFile = "Eliminar";
                dropzone.options.dictResponseError = "No se pudo subir";

                dropzone.on("addedfile", function (file) {
                    console.log('new file added ', file.upload.filename);
                    $("input[name='logotipo']").remove();
                    $('<input>').attr({
                        type: 'hidden',
                        value: file.upload.filename,
                        name: 'logotipo'
                    }).appendTo('form');
                    $('.dz-progress').hide();
                    $('.dz-size').hide();
                    $('.dz-error-mark').hide();
                });

            }
        });

    </script>
</html>
