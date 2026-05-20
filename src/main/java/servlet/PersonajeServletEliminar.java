package servlet;

import dao.PersonajeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/eliminarPersonaje")
public class PersonajeServletEliminar extends HttpServlet {
    private PersonajeDAO personajeDAO;

    @Override
    public void init() throws ServletException {
        personajeDAO = new PersonajeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("IDPersonaje"));
            personajeDAO.eliminarPersonaje(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("listarPersonajes");
    }
}