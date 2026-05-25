package servlet;

import dao.SesionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Sesion;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/modificarSesion")
public class SesionServletModificar extends HttpServlet {
    private SesionDAO sesionDAO;

    @Override
    public void init() throws ServletException { 
        sesionDAO = new SesionDAO(); 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idStr = request.getParameter("id"); 
        String partida = request.getParameter("partida");
        
        try {
            if (idStr != null && partida != null) {
                int id = Integer.parseInt(idStr);
                Sesion sesion = sesionDAO.obtenerSesionPorNumero(id, partida);
                if (sesion != null) {
                    request.setAttribute("sesion", sesion);
                    request.getRequestDispatcher("sesionModificar.jsp").forward(request, response);
                    return;
                }
            }
            response.sendRedirect("listarSesiones");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("listarSesiones");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            int numSesion = Integer.parseInt(request.getParameter("NumSesion"));
            String nombre = request.getParameter("Nombre");
            int cantidad = Integer.parseInt(request.getParameter("Cantidad"));
            Date fecha = Date.valueOf(request.getParameter("Fecha"));
            double duracion = Double.parseDouble(request.getParameter("Duracion"));
            String nomPartida = request.getParameter("NomPartida");
            
            Sesion sesionActualizada = new Sesion(numSesion, nombre, cantidad, fecha, duracion, nomPartida);
            
            if (sesionDAO.actualizarSesion(sesionActualizada)) {
                response.sendRedirect("listarSesiones");
            } else {
                request.setAttribute("sesion", sesionActualizada);
                request.setAttribute("mensaje", "No se pudo actualizar la sesión.");
                request.setAttribute("tipo", "error");
                request.getRequestDispatcher("sesionModificar.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("listarSesiones");
        }
    }
}