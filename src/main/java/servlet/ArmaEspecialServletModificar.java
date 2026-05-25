package servlet;

import dao.ArmaEspecialDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.ArmaEspecial;
import java.io.IOException;

@WebServlet("/modificarArmaEspecial")
public class ArmaEspecialServletModificar extends HttpServlet {
    private ArmaEspecialDAO armaEspecialDAO;

    @Override
    public void init() { 
        armaEspecialDAO = new ArmaEspecialDAO(); 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String idStr = request.getParameter("IDArma"); 
        try {
            if (idStr != null) {
                int id = Integer.parseInt(idStr);
                ArmaEspecial arma = armaEspecialDAO.obtenerArmaEspecilPorID(id);
                if (arma != null) {
                    request.setAttribute("armaEspecial", arma);
                    request.getRequestDispatcher("/armaEspecialModificar.jsp").forward(request, response);
                    return;
                }
            }
            response.sendRedirect("listarArmasEspeciales");
        } catch (Exception e) {
            response.sendRedirect("listarArmasEspeciales");
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
            
            String rareza = request.getParameter("Rareza");
            int bonificador = Integer.parseInt(request.getParameter("Bonificador"));
            String efectoMagico = request.getParameter("EfectoMagico");
            
            ArmaEspecial armaActualizada = new ArmaEspecial(id, nombre, tipoDano, dado, precio, peso, propiedades, nomPartida, rareza, bonificador, efectoMagico);
            
            if (armaEspecialDAO.actualizarArmaEspecial(armaActualizada)) {
                response.sendRedirect("listarArmasEspeciales");
            } else {
                request.setAttribute("mensaje", "La magia se resiste: No se pudo alterar el artefacto.");
                request.getRequestDispatcher("/armaEspecialModificar.jsp").forward(request, response);
            }
        } catch (Exception e) {
            response.sendRedirect("listarArmasEspeciales");
        }
    }
}