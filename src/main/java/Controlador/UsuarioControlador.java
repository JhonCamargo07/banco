package Controlador;

import ModeloDAO.UsuarioDAO;
import ModeloVO.UsuarioVO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author jhona
 */
@WebServlet(name = "UsuarioControlador", urlPatterns = {"/Usuario"})
public class UsuarioControlador extends HttpServlet {

    // Objetos globales
    private UsuarioDAO usuarioDao = new UsuarioDAO();
    private UsuarioVO usuarioVo = new UsuarioVO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Resivimos los datos del formulario
        String idUsuario = request.getParameter("idUsuario");
        String login = request.getParameter("emailUsuario");
        String password = request.getParameter("passwordUsuario");
        String idRol = request.getParameter("idRolUsuario");
        int opcion = Integer.parseInt(request.getParameter("opcion"));

        switch (opcion) {
            case 1: // Login
                if (password.equals("") || login.equals("")) {
                    this.generarMensaje(request, response,"Datos erroneos", "Ningún campo puede ser nulo, completelos e intente nuevamente");
                } else {
                    this.login(request, response, login, password);
                }
                break;
            case 2: // Salir
                this.logout(request, response);
                break;
            default:
                request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }

    private void login(HttpServletRequest request, HttpServletResponse response, String login, String password) throws IOException, ServletException {
        usuarioVo = usuarioDao.login(login, password);
        if (usuarioVo != null) {
            HttpSession sesion = request.getSession(true);
            sesion.setAttribute("usuario", usuarioVo);
            response.sendRedirect("menu.jsp");
        } else {
            request.setAttribute("login", login);
            request.setAttribute("password", password);
            this.generarMensaje(request, response, "Datos erroneos", "No se encontraron registros con los datos suministrados");
        }

    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "No-cache");
        response.setDateHeader("Expires", 0);

        HttpSession sesion = request.getSession();
        sesion.removeAttribute("usuario");

        sesion.invalidate();

        this.generarMensaje(request, response, "Sesion cerrada", "La sesión se cerró con exito, sigue disfrutando de nuestros servicios");
    }

    private void generarMensaje(HttpServletRequest request, HttpServletResponse response, String titulo, String mensaje) throws ServletException, IOException {
        request.setAttribute("titulo", titulo);
        request.setAttribute("mensaje", mensaje);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
