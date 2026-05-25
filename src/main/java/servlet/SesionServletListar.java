package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Sesion;
import java.io.IOException;
import java.util.List;
import dao.SesionDAO;

@WebServlet("/listarSesiones")
public class SesionServletListar extends HttpServlet {
    private SesionDAO sesionDAO;

    @Override
    public void init() throws ServletException {
        sesionDAO = new SesionDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Sesion> lista = sesionDAO.listarSesiones();
        request.setAttribute("listaSesiones", lista);
        request.getRequestDispatcher("/sesionListar.jsp").forward(request, response);
    }
}