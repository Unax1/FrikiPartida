package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ArmaEspecial;
import java.io.IOException;
import java.util.List;
import dao.ArmaEspecialDAO;

@WebServlet("/listarArmasEspeciales")
public class ArmaEspecialServletListar extends HttpServlet {
    private ArmaEspecialDAO armaEspecialDAO;

    @Override
    public void init() throws ServletException {
        armaEspecialDAO = new ArmaEspecialDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        List<ArmaEspecial> lista = armaEspecialDAO.listarArmasEspeciales();
        request.setAttribute("listaArmasEspeciales", lista);
        
        request.getRequestDispatcher("/armaEspecialListar.jsp").forward(request, response);
    }
}