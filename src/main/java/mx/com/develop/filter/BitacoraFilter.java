/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.develop.filter;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import mx.com.develop.model.MbdBitacora;
import mx.com.develop.objects.Bitacora;
import mx.com.develop.objects.Usuario;

/**
 *
 * @author Cesar
 */
public class BitacoraFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        if(httpRequest!=null){
            HttpSession session = httpRequest.getSession();
            if(session!=null){
                Usuario usuario = (Usuario) session.getAttribute("usuarioEnSesion");
                if(usuario!=null){
                    Timestamp fecha = new Timestamp(System.currentTimeMillis());
                    Bitacora bitacora = new Bitacora();
                    bitacora.setIdUsuario(usuario.getIdUsuario());
                    bitacora.setURL(httpRequest.getRequestURI());
                    bitacora.setFecha(fecha);
                    try {
                        boolean exito = new MbdBitacora().insertaBitacora(bitacora);
                    } catch (SQLException ex) {
                        Logger.getLogger(BitacoraFilter.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (NamingException ex) {
                        Logger.getLogger(BitacoraFilter.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
    
}
