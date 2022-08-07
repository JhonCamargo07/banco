<%@page import="java.util.List"%>
<%@page import="ModeloVO.ClienteVO"%>
<%@page import="ModeloDAO.ClienteDAO"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gesitonar clientes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/dca352768f.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <jsp:include page="WEB-INF/paginas/comunes/navbar.jsp" />
        <div class="container">
            <h1>Gesitonar clientes</h1>
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
                    <%
                        ClienteDAO clienteDao = new ClienteDAO();
                        ClienteVO clienteVo = null;

                        List<ClienteVO> clientes = clienteDao.select();

                        for (int i = 0; i < clientes.size(); i++) {
                            clienteVo = clientes.get(i);


                    %>
                    <tr>
                        <td><%= clienteVo.getIdCliente()%></td>
                        <td><%= clienteVo.getNombreCliente()%></td>
                        <td><%= clienteVo.getCedulaCliente()%></td>
                        <td><%= clienteVo.getTelefonoCliente()%></td>
                <form action="${pageContext.request.contextPath}/Cliente" method="POST">
                    <input type="hidden" name="idCliente" value="<%= clienteVo.getIdCliente()%>">
                    <input type="hidden" name="opcion" value="1">

                    <td class="text-center"><button type="submit" class="bg-transparent border-0"><i class="fas fa-edit text-info"></i></button></td>
                </form>
                <td class="text-center"><button type="buttom" class="bg-transparent border-0"><i class="fas fa-trash text-danger"></i></button></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </body>
</html>
<jsp:include page="WEB-INF/paginas/comunes/editarCliente.jsp" />
<jsp:include page="WEB-INF/paginas/comunes/alerta.jsp" />
