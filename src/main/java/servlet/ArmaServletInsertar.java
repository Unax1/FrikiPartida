package servlet;

import java.io.IOException;
import dao.ArmaDAO;
import model.Arma;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/insertarArma")
public class ArmaServletInsertar extends HttpServlet {
    private ArmaDAO armaDAO;

    @Override
    public void init() { 
        armaDAO = new ArmaDAO(); 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            String nombre = request.getParameter("Nombre");
            String tipoDano = request.getParameter("TipoDano");
            String dado = request.getParameter("DadoDano");
            String precio = request.getParameter("Precio");
            double peso = Double.parseDouble(request.getParameter("Peso"));
            String propiedades = request.getParameter("Propiedades");
            String nomPartida = request.getParameter("NomPartida");
            
            Arma nuevaArma = new Arma(0, nombre, tipoDano, dado, precio, peso, propiedades, nomPartida);
            
            if (armaDAO.insertarArma(nuevaArma)) {
                response.sendRedirect("listarArmas");
            } else {
                request.setAttribute("mensaje", "Error al forjar el arma en la base de datos.");
                // CORREGIDO: Barra / al principio
                request.getRequestDispatcher("/armaInsertar.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // CORREGIDO: Barra / al principio
            request.getRequestDispatcher("/armaInsertar.jsp").forward(request, response);
        }
    }
}