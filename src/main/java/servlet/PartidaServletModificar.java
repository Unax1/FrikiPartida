package servlet;

import dao.PartidaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Partida;
import java.io.IOException;

@WebServlet("/modificarPartidas")
public class PartidaServletModificar extends HttpServlet {
    private PartidaDAO partidaDAO;

    @Override
    public void init() { 
        partidaDAO = new PartidaDAO(); 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String idStr = request.getParameter("IDPartida"); 
        try {
            if (idStr != null) {
                int id = Integer.parseInt(idStr);
                Partida partida = partidaDAO.obtenerPartidaPorID(id);
                if (partida != null) {
                    request.setAttribute("partida", partida);
                    request.getRequestDispatcher("partidaModificar.jsp").forward(request, response);
                    return;
                }
            }
            response.sendRedirect("listarPartidas");
        } catch (Exception e) {
            response.sendRedirect("listarPartidas");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            int id = Integer.parseInt(request.getParameter("IDPartida"));
            String nombre = request.getParameter("NomPartida");
            String dm = request.getParameter("DM");
            String estado = request.getParameter("Estado");
            int cantSesiones = Integer.parseInt(request.getParameter("CantSesiones"));
            String dificultad = request.getParameter("Dificultad");
            
            Partida partidaActualizada = new Partida(id, nombre, dm, estado, cantSesiones, dificultad);
            if (partidaDAO.actualizarPartida(partidaActualizada)) {
                response.sendRedirect("listarPartidas");
            } else {
                request.setAttribute("mensaje", "No se pudo actualizar la partida.");
                request.getRequestDispatcher("partidaModificar.jsp").forward(request, response);
            }
        } catch (Exception e) {
            response.sendRedirect("listarPartidas");
        }
    }
}