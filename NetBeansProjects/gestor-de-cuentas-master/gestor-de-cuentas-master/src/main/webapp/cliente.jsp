<%@page import="java.util.List"%>
<%@page import="ModeloVO.ClienteVO"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gesitonar clientes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/dca352768f.js" crossorigin="anonymous"></script>
    </head>
    <body>
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
                        <td class="text-center"><i class="fas fa-edit text-info"></i></td>
                        <td class="text-center"><i class="fas fa-trash text-danger"></i></td>
                    </tr>

                <p></p>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </body>
</html>
