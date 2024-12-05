<%-- 
    Document   : listar
    Created on : 24/11/2024, 2:59:13 p. m.
    Author     : Usuario
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Persona"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/styles.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body class="cssBody">
        <div class="containerDiv" >
            <div class="logos">
                <img src="./IMAGENES/cerberus lobo.png" alt="Logo Cerberus"/>
                <img src="./IMAGENES/cerberus nombre.png" alt="Nombre Cerberus"/>
            </div>
            <h1>Lista de Personas</h1>
            <table class="tabla" border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>DOCUMENTO</th>
                        <th>NOMBRE</th>
                        <th>TELEFONO</th>
                        <th>CORREO ELECTRONICO</th>
                        <th>AREA DE TRABAJO</th>
                        <th>URL FOTO USUARIO</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <%
                    PersonaDAO dao = new PersonaDAO();
                    List<Persona> list = dao.listar();
                    Iterator<Persona> iter = list.iterator();
                    Persona per = null;
                    while (iter.hasNext()) {
                        per = iter.next();
                %>
                <tbody>
                    <tr>
                        <td><%= per.getId()%></td>
                        <td><%= per.getDni()%></td>
                        <td><%= per.getNom()%></td>
                        <td><%= per.getTelefono()%></td>
                        <td><%= per.getEmail()%></td>
                        <td><%= per.getAreaTrabajo()%></td>
                        <td><%= per.getFotoUsua()%></td>
                        <td>
                            <a href="Controlador?accion=editar&id=<%= per.getId()%>"> Editar </a>
                            <a href="Controlador?accion=eliminar&id=<%= per.getId()%>">Remover</a>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
            <div class="botonera">   
                <a href="Controlador?accion=add">Agregar Nuevo</a>
                <a href="index.jsp">Volver al Inicio</a>
                <a href="Controlador?accion=Consultar">Ir a Consultar por Cédula</a>
            </div> 
        </div>
    </body>
</html>
