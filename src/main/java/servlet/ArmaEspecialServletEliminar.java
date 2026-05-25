package servlet;

import dao.ArmaEspecialDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/eliminarArmaEspecial")
public class ArmaEspecialServletEliminar extends HttpServlet {
    private ArmaEspecialDAO armaEspecialDAO;

    @Override
    public void init() throws ServletException {
        armaEspecialDAO = new ArmaEspecialDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("IDArma"));
            armaEspecialDAO.eliminarArmaEspecial(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("listarArmasEspeciales");
    }
}