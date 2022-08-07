<%-- 
    Document   : registroCuenta
    Created on : 5/08/2022, 11:25:15 a. m.
    Author     : Sena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/dca352768f.js" crossorigin="anonymous"></script>
        <title>Registro Cueta</title>
    </head>
    <body>

        <div class="container">
            <div class="col-4">
            <h3>Registro Cuetas</h3>
            <form method="post" action="Cuenta">

                <div class="form-group">
                    <label>Numero Cuenta</label>
                    <input class="form-control" type="text" name="txtNumeroCuenta"><br>
                </div>

                <div class="form-group">
                    <label>Titular</label>
                    <input  class="form-control" type="text" name="txtTitular"><br>
                </div>

                <div class="form-group">
                    <label>Saldo</label>
                    <input  class="form-control" type="text" name="txtSaldo"><br>
                </div>

                <div class="form-group">
                    <label>Fecha Apertura</label>
                    <input  class="form-control" type="date" name="txtFecha"><br>
                </div>

                <div class="form-group">
                    <label>Estado</label>
                    <select  class="form-select" name="txtEstado">
                        <option >Abierta</option>
                        <option>Cerrada</option>
                    </select><br> 

                </div>
                <button  class="btn btn-primary">Registrar</button>
                <input type="hidden" value="1" name="opcion">
            </form><br>


            <%
                if (request.getAttribute("mensajeError") != null) { %>
            <h5 class="mensaje">
                ${mensajeError} 
            </h5> 
            <%} else {%>
            ${mensajeExito}
            <% }%>   
            </div>
        </div>
    </body>
</html>
