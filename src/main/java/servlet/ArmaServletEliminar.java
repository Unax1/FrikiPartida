package servlet;

import dao.ArmaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/eliminarArma")
public class ArmaServletEliminar extends HttpServlet {
    private ArmaDAO armaDAO;

    @Override
    public void init() throws ServletException {
        armaDAO = new ArmaDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("IDArma"));
            armaDAO.eliminarArma(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("listarArmas");
    }
}