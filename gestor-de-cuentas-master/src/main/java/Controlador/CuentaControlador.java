/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import ModeloDAO.CuentaDAO;
import ModeloDAO.PruebaCuentaDAO;
import ModeloVO.ClienteVO;
import ModeloVO.CuentaVO;
import ModeloVO.UsuarioVO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sena
 */
@WebServlet(name = "CuentaControlador", urlPatterns = {"/Cuenta"})
public class CuentaControlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        //Recoger datos de las vistas
        //Datos cuenta
        String idCuenta = request.getParameter("txtidCuenta");
        String numcuenta = request.getParameter("txtNumeroCuenta");
        String titular = request.getParameter("txtTitular");
        String saldo = request.getParameter("txtSaldo");
        String fechaApertura = request.getParameter("txtFecha");
        String estado = request.getParameter("txtEstado");

        //Datos cliente
        String idcliente = request.getParameter("txtidCliente");
        String cedulaCliente = request.getParameter("txtCedula");
        String telefono = request.getParameter("txtTelefono");
        String idcuenta = request.getParameter("txtIdCuenta");
        String idusuario = request.getParameter("txtIdUsaurio");

        String idUsuario = request.getParameter("txtIdUsuario");
        String login = request.getParameter("txtlogin");
        String password = request.getParameter("txtpassword");
        String idrol = request.getParameter("txtIdRol");

        int opcion = Integer.parseInt(request.getParameter("opcion"));

        //Instanciar clase VO/DAO cuenta
        CuentaVO cuentavo = new CuentaVO(idcuenta, numcuenta, titular, saldo, fechaApertura, estado);

        CuentaDAO cuentadao = new CuentaDAO(cuentavo);

        ClienteVO clienteVO = new ClienteVO(idcliente, cedulaCliente, titular, telefono, idcuenta, idUsuario);
        UsuarioVO usuVO = new UsuarioVO(idUsuario, login, password, idrol);

        //Administrar Operaciones
        switch (opcion) {
            case 1:

                PruebaCuentaDAO pruebadao = new PruebaCuentaDAO();

                //Si cuenta no existe continuamos
                if (!cuentadao.cuentaYaExiste(cuentavo.getNumeroCuenta())) {

                    if (pruebadao.crearCuenta(cuentavo, clienteVO, usuVO)) {

                        request.setAttribute("titulo", "Cuenta Registrada ");
                        request.setAttribute("mensaje", "La cuenta se registro correctamente");

                    } else {
                        request.setAttribute("titulo", "Cuenta no registrada");
                        request.setAttribute("mensaje", "La cuenta no se registro correctamente :(");
                    }

                } else {

                    request.setAttribute("titulo", "Error");
                    request.setAttribute("mensaje", "Esta cuenta ya existe");
                }

                request.getRequestDispatcher("registroCuenta.jsp").forward(request, response);
                break;

            case 2:

                if (cuentadao.update()) {

                    request.setAttribute("mensajeExito", "La cuenta se actualizo ");

                } else {
                    request.setAttribute("mensajeError", "El cuenta no se acualizo");
                }

                request.getRequestDispatcher(".jsp").forward(request, response);
                break;

            case 3:

                cuentavo = cuentadao.consultarCuenta(estado);

                if (cuentavo != null) {

                    request.setAttribute("CuentaConsultada", cuentavo);
                    request.getRequestDispatcher("consultarCuenta.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "No hay cuentas por consultar");
                    request.getRequestDispatcher("consultarCuenta.jsp").forward(request, response);

                }
                break;

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CuentaControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CuentaControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
