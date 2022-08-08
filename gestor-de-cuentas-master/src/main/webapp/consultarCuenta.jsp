<%-- 
    Document   : consultarCuenta
    Created on : 6/08/2022, 09:47:49 PM
    Author     : karen_b
--%>
<%@include file="cache.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.CuentaDAO"%>
<%@page import="ModeloVO.CuentaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/dca352768f.js" crossorigin="anonymous"></script>
        <title>Consultar Cuenta</title>

    </head>
    <body>
        <form method="post" action="Cuenta">
            <center>
                <div class="form-group">
                    <h2>Cuentas</h2><br>
                    <div class="col-2">
                        <select  class="form-select" name="txtEstado" required>
                            <option>Abierta</option>
                            <option>Cerrada</option>
                        </select><br>
                        <button class="btn btn-success">Consultar</button>
                        <input type="hidden" value="3" name="opcion" >
                    </div>
                </div>
        </form><br>

        <%

            if (request.getAttribute("mensajeError") != null) { %>
        <h5>
            ${mensajeError} 
        </h5>

        <%} else {%>
        <h5>
            ${mensajeExito}

        </h5>
        <% }%>
        
        
        

        <%
            if (request.getAttribute("CuentaConsultada") != null) {
                CuentaVO cuentavo = (CuentaVO) request.getAttribute("CuentaConsultada");

        %>

        <div class="container">
            <table class="table table-striped">
                <tr>
                    <th scope="col" >#</th>
                    <th scope="col">NUMERO CUENTA</th>
                    <th scope="col">TITULAR</th>
                    <th scope="col">SALDO</th>
                    <th scope="col">FECHAAPERTURA</th>
                    <th scope="col">ESTADO</th>
                    <th class="text-center" scope="col">EDITAR</th>


                </tr>

                <%                        CuentaDAO cuentadao = new CuentaDAO();
                    ArrayList<CuentaVO> listaCuenta = cuentadao.listarCuenta(cuentavo.getEstado());

                    for (int i = 0; i < listaCuenta.size(); i++) {
                        cuentavo = listaCuenta.get(i);


                %>

                <tr >

                    <td><%=cuentavo.getIdCuenta()%></td>
                    <td><%=cuentavo.getNumeroCuenta()%></td>
                    <td><%=cuentavo.getTitular()%></td>
                    <td><%=cuentavo.getSaldo()%></td>
                    <td><%=cuentavo.getFechaApertura()%></td>
                    <td><%=cuentavo.getEstado()%></td>
                    <td class="text-center"><i class="fas fa-edit text-info"></i></td>
                </tr>
                <%}%>
            </table>


            <%}%>    
        </div>

    </body>
</html>
