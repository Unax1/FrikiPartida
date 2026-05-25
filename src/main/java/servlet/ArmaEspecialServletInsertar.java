package servlet;

import java.io.IOException;
import dao.ArmaEspecialDAO;
import model.ArmaEspecial;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/insertarArmaEspecial")
public class ArmaEspecialServletInsertar extends HttpServlet {
    private ArmaEspecialDAO armaEspecialDAO;

    @Override
    public void init() { 
        armaEspecialDAO = new ArmaEspecialDAO(); 
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
            
            String rareza = request.getParameter("Rareza");
            int bonificador = Integer.parseInt(request.getParameter("Bonificador"));
            String efectoMagico = request.getParameter("EfectoMagico");
            
            ArmaEspecial nuevaArmaEspecial = new ArmaEspecial(0, nombre, tipoDano, dado, precio, peso, propiedades, nomPartida, rareza, bonificador, efectoMagico);
            
            if (armaEspecialDAO.insertarArmaEspecial(nuevaArmaEspecial)) {
                response.sendRedirect("listarArmasEspeciales");
            } else {
                request.setAttribute("mensaje", "Error al forjar el arma especial en los yunques místicos.");
                request.getRequestDispatcher("/armaEspecialInsertar.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/armaEspecialInsertar.jsp").forward(request, response);
        }
    }
}