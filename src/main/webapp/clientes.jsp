<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="es_CO" />
<%@include file="cache.jsp" %>
<%@include file="validarSesion.jsp" %>
<%@include file="validarRolAdmin.jsp" %>
<%@page import="java.util.List"%>
<%@page import="ModeloVO.ClienteVO"%>
<%@page import="ModeloDAO.ClienteDAO"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gesitonar clientes</title>
        <jsp:include page="WEB-INF/paginas/comunes/head.jsp" />
    </head>
    <body>
        <jsp:include page="WEB-INF/paginas/comunes/navbar.jsp" />
        <div class="container">
            <h3 class="text-center my-3">Gesitonar clientes</h3>

            <div class="float-end">
                <form action="Cliente" method="POST" class="d-flex">
                    <input class="form-control me-2" name="cedulaCliente" type="search" placeholder="Cedula">
                    <input type="hidden" name="opcion" value="3">
                    <button class="btn btn-outline-success" type="submit">Eliminar</button>
                </form>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Cedula</th>
                        <th scope="col">Telefono</th>
                        <th class="text-center" scope="col">Editar</th>
                        <th class="text-center" scope="col">Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <%                        ClienteDAO clienteDao = new ClienteDAO();
                        ClienteVO clienteVo = null;

                        List<ClienteVO> clientes = clienteDao.select();

                        for (int i = 0; i < clientes.size(); i++) {
                            clienteVo = clientes.get(i);


                    %>
                    <tr>
                        <td><%= clienteVo.getIdCliente()%></td>
                        <td><%= clienteVo.getNombreCliente()%></td>
                        <td><fmt:formatNumber value="<%= clienteVo.getCedulaCliente()%>" type="number" /></td>
                        <td><%= clienteVo.getTelefonoCliente()%></td>
                <form action="${pageContext.request.contextPath}/Cliente" method="POST">
                    <input type="hidden" name="idCliente" value="<%= clienteVo.getIdCliente()%>">
                    <input type="hidden" name="opcion" value="1">

                    <td class="text-center"><button type="submit" class="bg-transparent border-0"><i class="fas fa-edit text-info"></i></button></td>
                </form>

                <form action="${pageContext.request.contextPath}/Cliente" method="POST">
                    <input type="hidden" name="idCliente" value="<%= clienteVo.getIdCliente()%>">
                    <input type="hidden" name="cedulaCliente" value="<%= clienteVo.getCedulaCliente()%>">
                    <input type="hidden" name="opcion" value="3">

                    <td class="text-center"><button type="buttom" class="bg-transparent border-0"><%= clienteVo.getNombreCliente() == "Activo" ? "Inactivar" : "Activar"%></button></td>
                </form>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
                     <jsp:include page="WEB-INF/paginas/comunes/footer.jsp" />
    </body>
</html>
<jsp:include page="WEB-INF/paginas/comunes/editarCliente.jsp" />
<jsp:include page="WEB-INF/paginas/comunes/eliminarCliente.jsp" />
<jsp:include page="WEB-INF/paginas/comunes/alerta.jsp" />
