package servlet;

import java.io.IOException;
import dao.PersonajeDAO;
import model.Personaje;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/insertarPersonaje")
public class PersonajeServletInsertar extends HttpServlet {
    private PersonajeDAO personajeDAO;

    @Override
    public void init() { 
        personajeDAO = new PersonajeDAO(); 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            String nomPersonaje = request.getParameter("NomPersonaje");
            String nomJugador = request.getParameter("NomJugador");
            int nivel = Integer.parseInt(request.getParameter("Nivel"));
            String nomPartida = request.getParameter("NomPartida");
            
            Personaje nuevoPJ = new Personaje(0, nomPersonaje, nomJugador, nivel, nomPartida);
            
            if (personajeDAO.insertarPersonaje(nuevoPJ)) {
                response.sendRedirect("listarPersonajes");
            } else {
                request.setAttribute("mensaje", "Error al crear la ficha de personaje.");
                request.getRequestDispatcher("personajeInsertar.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("personajeInsertar.jsp").forward(request, response);
        }
    }
}