<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insertar Sesion</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1, h2 {
            text-align: center;
        }
        form {
            max-width: 500px;
            margin: 0 auto;
        }
        fieldset {
            padding: 15px;
            margin-bottom: 10px;
        }
        input[type="submit"], input[type="reset"] {
            padding: 8px 20px;
            margin-right: 10px;
            cursor: pointer;
        }
        .mensaje-exito {
            color: green;
            text-align: center;
            font-weight: bold;
        }
        .mensaje-error {
            color: red;
            text-align: center;
            font-weight: bold;
        }
        .volver {
            display: block;
            text-align: center;
            margin: 20px;
        }
    </style>
</head>
<body>
    <h1>Sistema de Gestión de Sesiones</h1>
    <h2>Insertar Nueva Sesión</h2>

    <% if (request.getAttribute("mensaje") != null) { %>
        <p class="<%= "exito".equals(request.getAttribute("tipo")) ? "mensaje-exito" : "mensaje-error" %>">
            <%= request.getAttribute("mensaje") %>
        </p>
    <% } %>

    <form action="insertarSesion" method="post">
        <fieldset>
            <legend>Datos</legend>

            <label for="NumSesion">Numero de sesión:</label>
            <input type="text" id="NomPersonaje" name="NomPersonaje" required maxlength="30">
		
            <label for="NombreSesion">Nombre de la sesión:</label>
            <input type="text" id="NombreSesion" name="NombreSesion" maxlength="30">
		
            <label for="CantParticipantes">Cantidad de participantes:</label>
            <input type="number" id="CantParticipantes" name="CantParticipantes" value="1" min="1" max="20" required>
		
            <label for="Fecha">Fecha</label>
            <input type="date" id="Fecha" name="Fecha" required>
            
            <label for="Duracion">Duración:</label>
            <input type="number" id="Duracion" name="Duracion">
            
			<label for="NombreSesion">Nombre de la sesión:</label>
            <input type="text" id="NombreSesion" name="NombreSesion" maxlength="30">
			
        </fieldset>

        <br>

        <input type="submit" value="Insertar Sesion">
        <input type="reset" value="Limpiar">
    </form>

    <a class="volver" href="listarSesiones">← Volver al listado</a>
</body>
</html>