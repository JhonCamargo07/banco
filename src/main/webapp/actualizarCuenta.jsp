<%-- 
    Document   : actualizarCuenta
    Created on : 8/08/2022, 02:01:17 AM
    Author     : karen_b
--%>

<%@page import="ModeloVO.CuentaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="WEB-INF/paginas/comunes/head.jsp"/>

        <title>Actualizar Cuenta</title>
    </head>
    <body>
        <jsp:include page="WEB-INF/paginas/comunes/navbar.jsp" />
        <%
            if (request.getAttribute("CuentaActualizada") != null) {
                CuentaVO cuentaVO = (CuentaVO) request.getAttribute("CuentaActualizada");

        %>

        <div class="container">
            <div class="col-4">
                <h3>Actualizar Cuentas</h3>



                <form method="post" action="Cuenta">
                    <div class="form-group">

                        <label># </label><br>
                        <input type="text" class="form-control" name="txtidCuenta"  value="<%=cuentaVO.getIdCuenta()%>" readonly><br>
                    </div>


                    <div class="form-group">
                        <label>Estado</label><br>
                        <select class="form-select"  name="txtEstado" value="<%=cuentaVO.getEstado()%>">
                            <option>Abierta</option>
                            <option>Cerrada</option>
                        </select>

                    </div>
                    <br>
                    <button class="btn btn-success">Actualizar</button>
                    <input type="hidden" value="2" name="opcion">
                </form>

            </div>
        </div>

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

        <%}%>

        <jsp:include page="WEB-INF/paginas/comunes/footer.jsp" />

    </body>
</html>
