
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/styles.css" rel="stylesheet" type="text/css"/>
        <title>CERBERUS</title>
    </head>
    <body class="cssBody">
        <main class="container">
            <div>
                <img class="logoImg" src="./IMAGENES/cerberus.png" alt="logo Cerberus"/>
            </div>
            <div class="textos">
                <a  href="Controlador?accion=listar">
                    <h2 class="title-index">Listar Personas</h2>
                </a> 
                <a  href="Controlador?accion=Consultar">
                    <h2 class="title-buscar">Buscar Persona por Cédula</h2>
                </a>  
            </div>
        </main>
    </body>
</html>
