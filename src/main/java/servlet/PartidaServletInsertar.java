package servlet;

import java.io.IOException;
import dao.PartidaDAO;
import model.Partida;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/insertarPartida")
public class PartidaServletInsertar extends HttpServlet {
    private PartidaDAO partidaDAO;

    @Override
    public void init() { 
        partidaDAO = new PartidaDAO(); 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            String nombre = request.getParameter("NomPartida");
            String dm = request.getParameter("DM");
            String estado = request.getParameter("Estado");
            int cantSesiones = Integer.parseInt(request.getParameter("CantSesiones"));
            String dificultad = request.getParameter("Dificultad");
            
            Partida nuevaPartida = new Partida(0, nombre, dm, estado, cantSesiones, dificultad);
            
            if (partidaDAO.insertarPartida(nuevaPartida)) {
                response.sendRedirect("listarPartidas");
            } else {
                request.setAttribute("mensaje", "Error al registrar la partida.");
                request.getRequestDispatcher("partidaInsertar.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("partidaInsertar.jsp").forward(request, response);
        }
    }
}
