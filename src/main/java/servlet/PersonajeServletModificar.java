package servlet;

import dao.PersonajeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Personaje;
import java.io.IOException;

@WebServlet("/modificarPersonaje")
public class PersonajeServletModificar extends HttpServlet {
    private PersonajeDAO personajeDAO;

    @Override
    public void init() throws ServletException { 
        personajeDAO = new PersonajeDAO(); 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idStr = request.getParameter("id"); 
        
        try {
            if (idStr != null) {
                int id = Integer.parseInt(idStr);
                Personaje personaje = personajeDAO.obtenerPersonajePorID(id);
                if (personaje != null) {
                    request.setAttribute("personaje", personaje);
                    request.getRequestDispatcher("personajeModificar.jsp").forward(request, response);
                    return;
                }
            }
            response.sendRedirect("listarPersonajes");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("listarPersonajes");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
          
            int id = Integer.parseInt(request.getParameter("IDPersonaje"));
            String nomPersonaje = request.getParameter("NomPersonaje");
            String nomJugador = request.getParameter("NomJugador");
            int nivel = Integer.parseInt(request.getParameter("Nivel"));
            String nomPartida = request.getParameter("NomPartida");
            
            Personaje pjActualizado = new Personaje(id, nomPersonaje, nomJugador, nivel, nomPartida);
            
            if (personajeDAO.actualizarPersonaje(pjActualizado)) {
                response.sendRedirect("listarPersonajes");
            } else {
                request.setAttribute("personaje", pjActualizado);
                request.setAttribute("mensaje", "No se pudo actualizar la ficha.");
                request.setAttribute("tipo", "error");
                request.getRequestDispatcher("personajeModificar.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("listarPersonajes");
        }
    }
}