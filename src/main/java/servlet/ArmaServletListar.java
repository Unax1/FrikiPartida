package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Arma;
import java.io.IOException;
import java.util.List;
import dao.ArmaDAO;

@WebServlet("/listarArmas")
public class ArmaServletListar extends HttpServlet {
    private ArmaDAO armaDAO;

    @Override
    public void init() throws ServletException {
        armaDAO = new ArmaDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Arma> lista = armaDAO.listarArmas();
        request.setAttribute("listaArmas", lista);
        request.getRequestDispatcher("/armaListar.jsp").forward(request, response);
    }
}