package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Personaje;
import java.io.IOException;
import java.util.List;
import dao.PersonajeDAO;

@WebServlet("/listarPersonajes")
public class PersonajeServletListar extends HttpServlet {
    private PersonajeDAO personajeDAO;

    @Override
    public void init() throws ServletException {
        personajeDAO = new PersonajeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Personaje> lista = personajeDAO.listarPersonajes();
        request.setAttribute("listaPersonajes", lista);
        request.getRequestDispatcher("/personajeListar.jsp").forward(request, response);
    }
}