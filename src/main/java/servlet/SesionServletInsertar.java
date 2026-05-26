package servlet;

import java.io.IOException;
import java.sql.Date;
import dao.SesionDAO;
import model.Sesion;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/insertarSesion")
public class SesionServletInsertar extends HttpServlet {
    private SesionDAO sesionDAO;

    @Override
    public void init() { 
        sesionDAO = new SesionDAO(); 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            int numSesion = Integer.parseInt(request.getParameter("NumSesion"));
            String nombre = request.getParameter("NombreSesion");
            int cantidad = Integer.parseInt(request.getParameter("CantParticipantes"));
            Date fecha = Date.valueOf(request.getParameter("Fecha")); 
            double duracion = Double.parseDouble(request.getParameter("Duracion"));
            String nomPartida = request.getParameter("NomPartida");
            
            Sesion nuevaSesion = new Sesion(numSesion, nombre, cantidad, fecha, duracion, nomPartida);
            
            if (sesionDAO.insertarSesion(nuevaSesion)) {
                response.sendRedirect("listarSesiones");
            } else {
                request.setAttribute("mensaje", "Error al crear la sesión de partida. Verifique si la mesa existe.");
                request.setAttribute("tipo", "error");
                request.getRequestDispatcher("sesionInsertar.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Datos inválidos o error en el formato del formulario.");
            request.setAttribute("tipo", "error");
            request.getRequestDispatcher("sesionInsertar.jsp").forward(request, response);
        }
    }
}