/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.develop.filter;

import java.io.IOException;
import java.util.LinkedList;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 *
 * @author RGC
 */
public class LoginFilter implements Filter {

    private static final Logger logger = Logger.getLogger(LoginFilter.class.getName());

    private LinkedList<String> excludePath;

    public LoginFilter() {
        excludePath = new LinkedList<>();
    }

    @Override
    public void init(FilterConfig fc) throws ServletException {
        excludePath.add("acceso.jsp");

        for (String path : excludePath) {
            logger.info(String.format("Exclude %s", path));
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain fc) throws IOException, ServletException {
//        HttpServletRequest httpRequest = (HttpServletRequest) request;
//        HttpSession session = httpRequest.getSession(false);
//        String path = httpRequest.getRequestURI();
//
//        if (path.contains("/")) {
//            path = path.substring(path.lastIndexOf("/") + 1, path.length());
//        }
//
//        if (excludePath.contains(path)) {
//            fc.doFilter(request, response);
//            logger.info(String.format("doFilter(%s) ignore", path));
//        } else {
//            if (session == null || session.getAttribute("nickname") == null) {
//                logger.info(String.format("doFilter(%s) to login.jsp", path));
//                RequestDispatcher rd = request.getRequestDispatcher("acceso.jsp");
//                request.setAttribute("warningMessage", "No esta iniciada la session");
//                rd.forward(request, response);
//            } else {
                fc.doFilter(request, response);
//            }
//        }

    }

    @Override
    public void destroy() {

    }

}
