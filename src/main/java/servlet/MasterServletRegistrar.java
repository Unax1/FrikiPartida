package servlet;

import dao.MasterDAO;
import model.DungeonMaster;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/registroMaster")
public class MasterServletRegistrar extends HttpServlet {
    private MasterDAO masterDAO;

    @Override
    public void init() throws ServletException {
        masterDAO = new MasterDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("registro.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String usuario = request.getParameter("Usuario");
        String email = request.getParameter("Email");
        String contrasena = request.getParameter("contrasena");

        if (usuario == null || email == null || contrasena == null || 
            usuario.isEmpty() || email.isEmpty() || contrasena.isEmpty()) {
            request.setAttribute("mensaje", "Todos los campos son obligatorios para la inscripción.");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
            return;
        }

        DungeonMaster nuevoMaster = new DungeonMaster(usuario, contrasena, email);

        try {
            if (masterDAO.registrarMaster(nuevoMaster)) {
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);
                session.setAttribute("esMaster", true);
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("mensaje", "No se pudo procesar el registro en el sistema.");
                request.getRequestDispatcher("registro.jsp").forward(request, response);
            }
        } catch (java.sql.SQLIntegrityConstraintViolationException e) {
            request.setAttribute("mensaje", "El nombre de usuario o el correo electrónico ya existen.");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error interno al procesar el alta.");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
        }
    }
}