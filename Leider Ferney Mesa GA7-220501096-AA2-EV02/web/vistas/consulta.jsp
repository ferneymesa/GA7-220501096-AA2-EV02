<%-- Document : consulta Created on : 24/11/2024, 2:59:34 p. m. Author : Usuario --%>

<%@page import="Modelo.Persona" %>
<%@page import="ModeloDAO.PersonaDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/styles.css" rel="stylesheet" type="text/css"/>
        <title>Consulta de Persona</title>
    </head>

    <body class="cssBody">
        <main class="containerDiv">
            <div class="logos">
                <img src="./IMAGENES/cerberus lobo.png" alt="Logo Cerberus"/>
                <img src="./IMAGENES/cerberus nombre.png" alt="Nombre Cerberus"/>
            </div>
            <h1>Consulta de Persona por Cédula</h1>
            <form class="btn-Buscar" action="Controlador" method="get">
                <label class="labelBuscar" for="txtDni">Ingrese la Cédula:</label>
                <input class="inputText" type="text" name="txtDni" id="txtDni" required>
                <input class="inputBtn" type="submit" name="accion" value="Consultar">
            </form>

            <%
                // Verificar si se ha enviado el DNI para buscar
                String dniBuscado = request.getParameter("txtDni");
                if (dniBuscado != null && !dniBuscado.isEmpty()) {
                    PersonaDAO personaDAO = new PersonaDAO();
                    Persona persona = personaDAO.buscarPorDni(dniBuscado);
                    if (persona != null) {
            %>
            <h2>Resultados de la búsqueda:</h2>
            <table class="tabla" border="1">
                <tr>
                    <th>ID</th>
                    <th>DNI</th>
                    <th>Nombres</th>
                    <th>Teléfono</th>
                    <th>Email</th>
                    <th>Área de Trabajo</th>
                    <th>URL Foto Usuario</th>
                </tr>
                <tr>
                    <td><%= persona.getId()%></td>
                    <td><%= persona.getDni()%></td>
                    <td><%= persona.getNom()%></td>
                    <td><%= persona.getTelefono()%></td>
                    <td><%= persona.getEmail()%></td>
                    <td><%= persona.getAreaTrabajo()%></td>
                    <td><%= persona.getFotoUsua()%></td>
                </tr>
            </table>
            <!-- Mostrar la imagen -->
            <%
                String urlFoto = persona.getFotoUsua(); // Asignar la URL de la foto a la variable
                // Verifica si la URL es null o está vacía
                if (urlFoto == null || urlFoto.isEmpty()) {
            %>
            <var class="contenedor-ImgNull">
                <img class="foto-ImgNull" src="./IMAGENES/5087579.png" alt="imagen foto no disponible" style="max-width: 150px; max-height: 150px;"/>
                <p class="texto-ImgNull">No hay foto disponible.</p>
            </var>
            <%
            } else {
            %>
            <img src="<%= urlFoto%>" alt="Foto de Usuario" style="max-width: 200px; max-height: 200px;" />
            <%
                }
            } else {
            %>
            <p>No se encontraron resultados para el DNI: <%= dniBuscado%>.</p>
            <%
                    }
                }
            %>
            <div class="botonera">   
                <a href="index.jsp">Volver al Inicio</a>
                <a href="Controlador?accion=listar">Ir a Lista de Personas</a>
                <a href="Controlador?accion=add">Ir a Agregar Nuevo</a>
            </div> 
        </main>
    </body>
</html>