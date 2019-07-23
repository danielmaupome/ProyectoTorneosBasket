<%-- 
    Document   : acceso
    Created on : 24/06/2019, 04:56:11 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdEquipo = "";
    String nombre = "";
    String logotipo = "";
    String color_primario = "";
    String color_secundario = "";
    
    int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    int MAX_REQUEST_SIZE = 1024 * 1024;
    // Check that we have a file upload request
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (!isMultipart) {
            return;
        }

        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Sets the size threshold beyond which files are written directly to
        // disk.
        factory.setSizeThreshold(MAX_MEMORY_SIZE);

        // Sets the directory used to temporarily store files that are larger
        // than the configured size threshold. We use temporary directory for
        // java
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // constructs the folder where uploaded file will be stored
        String uploadFolder = ResourceBundle.getBundle("mx.com.develop.properties.rutas").getString("rutaArchivos");

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set overall request size constraint
        upload.setSizeMax(MAX_REQUEST_SIZE);

        try {
            // Parse the request
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    String filePath = uploadFolder + fileName;
                    File uploadedFile = new File(filePath);
                    logotipo = fileName;
                    // saves the file to upload directory
                    item.write(uploadedFile);
                }else{
                    if (item.getFieldName().equals("idEquipo")) {
                        pIdEquipo = item.getString();
                    }else if (item.getFieldName().equals("nombre")) {
                        nombre = item.getString();
                    }else if (item.getFieldName().equals("color_primario")) {
                        color_primario = item.getString();
                    }else if (item.getFieldName().equals("color_secundario")) {
                        color_secundario = item.getString();
                    }
                }
            }

        } catch (FileUploadException ex) {
            throw new ServletException(ex);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    
    int idEquipo = Integer.parseInt(pIdEquipo);
    Equipo equipo = new Equipo();
    equipo.setIdEquipo(idEquipo);
    equipo.setNombre(nombre);
    equipo.setLogotipo(logotipo);
    equipo.setColorPrimario(color_primario);
    equipo.setColorSecundario(color_secundario);
    boolean exito = new MbdEquipos().actualizaEquipo(equipo);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Se ha modificado un equipo</title>
        <%@ include file="menu.jsp" %>
        <%if(exito){%>
        <div class="jumbotron">
            <h1>Se ha modificado un equipo</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=nombre%></p>
            <p><b>Logotipo:</b> <%=logotipo%></p>
            <p><b>Color primario:</b> <%=color_primario%></p>
            <p><b>Color secundario:</b> <%=color_secundario%></p>
            <p><a class="btn btn-primary btn-lg" href="equipos.jsp" role="button">Regresar</a></p>
        </div>
        <%}else{%>
        <div class="jumbotron">
            <h1>Ocurrió un error al modificar el equipo</h1>
            <p><a class="btn btn-primary btn-lg" href="equipos.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
        <%@ include file="base.jsp" %>
</html>
