<%-- 
    Document   : edit
    Created on : 24/11/2024, 2:59:34 p. m.
    Author     : Usuario
--%>

<%@page import="Modelo.Persona"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/newcss.css" rel="stylesheet" type="text/css"/>

        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <%
                PersonaDAO personaDAO = new PersonaDAO();
                int id = Integer.parseInt((String) request.getAttribute("idper"));
                Persona persona = (Persona) personaDAO.list(id);
            %>
            <h1>Modificar Persona</h1>
            <form action="Controlador">
                <input type="hidden" name="txtid" value="<%= persona.getId() %>">
                Documento: <br>
                <input type="text" name="txtDni" value="<%= persona.getDni()%>"><br>
                Nombres: <br>
                <input type="text" name="txtNom" value="<%= persona.getNom()%>"><br>
                Telefonos: <br>
                <input type="text" name="txtTelefono" value="<%= persona.getTelefono()%>"> <br>
                Correos Electrónicos: <br>
                <input type="text" name="txtEmail" value="<%= persona.getEmail()%>"><br>
                Area de Trabajo: <br>
                <input type="text" name="txtAreaTrabajo" value="<%= persona.getAreaTrabajo()%>"><br>
                URL Foto Usuario: <br>
                <input type="text" name="txtFotoUsua" value="<%= persona.getFotoUsua()%>"><br>
                <input type="submit" name="accion" value="Actualizar"><br>  
                <a href="Controlador?accion=listar">Regresar</a>
            </form>

            <a href="index.jsp">Volver al Inicio</a>

        </div>

    </body>
</html>
