package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginControlador")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("password");
        String rol = request.getParameter("rol");

        boolean loginValido = false;
        boolean esMaster = false;

        if ("admin".equals(usuario) && "1234".equals(contrasena) && "master".equals(rol)) {
            loginValido = true;
            esMaster = true;
        } else if ("user".equals(usuario) && "1234".equals(contrasena) && "jugador".equals(rol)) {
            loginValido = true;
            esMaster = false;
        }

        if (loginValido) {
            
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            session.setAttribute("esMaster", esMaster);

            response.sendRedirect("index.jsp");
        } else {
           
            request.setAttribute("mensaje", "Credenciales incorrectas o rango equivocado en la mesa.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.sendRedirect("login.jsp");
    }
}