package servlet;

import dao.ArmaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Arma;
import java.io.IOException;

@WebServlet("/modificarArmas")
public class ArmaServletModificar extends HttpServlet {
    private ArmaDAO armaDAO;

    @Override
    public void init() { 
        armaDAO = new ArmaDAO(); 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String idStr = request.getParameter("IDArma"); 
        try {
            if (idStr != null) {
                int id = Integer.parseInt(idStr);
                Arma arma = armaDAO.obtenerArmaPorID(id);
                if (arma != null) {
                    request.setAttribute("arma", arma);
                    // CORREGIDO: Barra / al principio
                    request.getRequestDispatcher("/armaModificar.jsp").forward(request, response);
                    return;
                }
            }
            response.sendRedirect("listarArmas");
        } catch (Exception e) {
            response.sendRedirect("listarArmas");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            int id = Integer.parseInt(request.getParameter("IDArma"));
            String nombre = request.getParameter("Nombre");
            String tipoDano = request.getParameter("TipoDano");
            String dado = request.getParameter("DadoDano");
            String precio = request.getParameter("Precio");
            double peso = Double.parseDouble(request.getParameter("Peso"));
            String propiedades = request.getParameter("Propiedades");
            String nomPartida = request.getParameter("NomPartida");
            
            Arma armaActualizada = new Arma(id, nombre, tipoDano, dado, precio, peso, propiedades, nomPartida);
            if (armaDAO.actualizarArma(armaActualizada)) {
                response.sendRedirect("listarArmas");
            } else {
                request.setAttribute("mensaje", "No se pudo alterar el arma.");
                // CORREGIDO: Barra / al principio
                request.getRequestDispatcher("/armaModificar.jsp").forward(request, response);
            }
        } catch (Exception e) {
            response.sendRedirect("listarArmas");
        }
    }
}