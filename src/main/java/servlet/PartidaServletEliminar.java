package servlet;

import dao.PartidaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/eliminarPartida")
public class PartidaServletEliminar extends HttpServlet {
    private PartidaDAO partidaDAO;

    @Override
    public void init() throws ServletException {
        partidaDAO = new PartidaDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("IDPartida"));
            partidaDAO.eliminarPartida(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("listarPartidas");
    }
}