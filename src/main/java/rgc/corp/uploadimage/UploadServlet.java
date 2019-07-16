/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rgc.corp.uploadimage;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.List;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author RGC
 */
@WebServlet(name = "UploadServlet", urlPatterns = {"/upload.do"})
@MultipartConfig
public class UploadServlet extends HttpServlet {

    public final static long serialVersionUID = 1327114462709798411L;

    private static final Logger logger = Logger.getLogger(UploadServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        File directory = new File("../docroot/images");
        List<Part> fileParts = request.getParts()
                .stream()
                .collect(Collectors.toList());

        if (!directory.exists()) {
            directory.mkdir();
        }
        
        for (Part filePart : fileParts) {
            String name = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            File fileName = new File(directory, name);
            InputStream fileContent = filePart.getInputStream();
            FileOutputStream fos = new FileOutputStream(fileName);
            byte[] bytes = new byte[1024];
            int sumRead = 0;
            int read = 0;

            logger.info(String.format("Saving %s ", name));

            while (read != -1) {
                read = fileContent.read(bytes);
                if (read != -1) {
                    sumRead += read;
                    fos.write(bytes, 0, read);
                }
            }
            fos.close();
            logger.info(String.format("File save: %s in %s", filePart.getSubmittedFileName(), name.toString()));

        }
    }

}
