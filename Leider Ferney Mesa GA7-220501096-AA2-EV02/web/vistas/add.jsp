<%-- 
    Document   : add
    Created on : 24/11/2024, 2:59:25 p. m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/styles.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body class="cssBody">
        <main class="containerDiv">
            <div class="logos">
                <img src="./IMAGENES/cerberus lobo.png" alt="Logo Cerberus"/>
                <img src="./IMAGENES/cerberus nombre.png" alt="Nombre Cerberus"/>
            </div>
            <div class="div-add">
                <var class="var-add">
                    <h1 class="h1-add">Agregar Persona</h1>
                    <form action="Controlador">
                </var > 
                <div class="class-var"> 
                    <var class="var-Doc">
                        <p>Documento:</p>
                        <input type="text" name="txtDni">
                    </var>
                    <var class="var-Nom">
                        <p>Nombres:</p>
                        <input type="text" name="txtNom">
                    </var>
                    <var class="var-Tel">
                        <p>Telefonos:</p>
                        <input type="text" name="txtTelefono"> 
                    </var>
                    <var class="var-Email">
                        <p>Correos Electrónicos:</p>
                        <input type="text" name="txtEmail">
                    </var>
                    <var class="var-Area">
                        <p>Area de Trabajo:</p>
                        <input type="text" name="txtAreaTrabajo">
                    </var>
                    <var class="var-Url">
                        <p>URL Foto Usuario:</p>
                        <input type="text" name="txtFotoUsua">
                    </var>
                    <br>
                    <var class="var-InpAgrerar">
                        <input class="inputAgregar" type="submit" name="accion" value="Agregar" >
                    </var>
                </div>
                </form>
                <var class="botonera">
                    <a href="index.jsp">Volver al Inicio</a>
                    <a href="Controlador?accion=listar">Ir a Lista de Personas</a>
                    <a href="Controlador?accion=Consultar">Ir a Consultar por Cédula</a>
                </var>
            </div>
        </main>
    </body>
</html>
