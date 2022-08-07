package Controlador;

import ModeloDAO.ClienteDAO;
import ModeloVO.ClienteVO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author jhona
 */
@WebServlet(name = "ClienteControlador", urlPatterns = {"/Cliente"})
public class ClienteControlador extends HttpServlet {
    
    private ClienteDAO clienteDao = new ClienteDAO();
    private ClienteVO clienteVo = new ClienteVO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idCliente = request.getParameter("idCliente");
        String cedulaCliente = request.getParameter("cedulaCliente");
        String nombreCliente = request.getParameter("nombreCliente");
        String telefonoCliente = request.getParameter("telefonoCliente");
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        
        switch (opcion) {
            case 1: // Consultar
                clienteVo.setIdCliente(idCliente);
                this.consultarCliente(request, response);
                break;
            case 2:
                clienteVo.setIdCliente(idCliente);
                clienteVo.setCedulaCliente(cedulaCliente);
                clienteVo.setNombreCliente(nombreCliente);
                clienteVo.setTelefonoCliente(telefonoCliente);
                this.actualizarCliente(request, response);
                break;
            case 3: // Eliminar
                clienteVo.setIdCliente(idCliente);
                clienteVo.setCedulaCliente(cedulaCliente);
                clienteVo.setNombreCliente(nombreCliente);
                clienteVo.setTelefonoCliente(telefonoCliente);
                this.eliminarCliente(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    
    private void actualizarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        if(clienteDao.update(clienteVo)){
            this.generarMensaje(request, response, "Registro exitoso", "El cliente se registro correctamente");
        }else{
            this.generarMensaje(request, response, "Registro fallido", "No se pudo registrar el cliente, recargue e intente nuevamente");
        }
    }
    
    private void generarMensaje(HttpServletRequest request, HttpServletResponse response, String titulo, String mensaje) throws ServletException, IOException{
        request.setAttribute("titulo", titulo);
        request.setAttribute("mensaje", mensaje);
        request.getRequestDispatcher("cliente.jsp").forward(request, response);
    }

    private void consultarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        clienteVo = clienteDao.selectById(clienteVo.getIdCliente());
        
        if(clienteVo != null){
            request.setAttribute("cliente",clienteVo);
            request.getRequestDispatcher("cliente.jsp").forward(request, response);
        }else{
            this.generarMensaje(request, response, "No se encontro al cliente", "No encontramos a ningun usuario, recargue e intenta nuevamente");
        }
    }

    private void eliminarCliente(HttpServletRequest request, HttpServletResponse response) {
        
    }
}
