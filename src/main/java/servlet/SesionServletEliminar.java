package servlet;

import dao.SesionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/borrarSesion")
public class SesionServletEliminar extends HttpServlet {
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
                sesionDAO.eliminarSesion(id, partida);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.sendRedirect("listarSesiones");
    }
}