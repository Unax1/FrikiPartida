package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Partida;
import java.io.IOException;
import java.util.List;
import dao.PartidaDAO;

@WebServlet("/listarPartidas")
public class PartidaServletListar extends HttpServlet {
    private PartidaDAO partidaDAO;

    @Override
    public void init() throws ServletException {
        partidaDAO = new PartidaDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Partida> lista = partidaDAO.listarPartidas();
        request.setAttribute("listaPartidas", lista);
        request.getRequestDispatcher("partidaListar.jsp").forward(request, response);
    }
}