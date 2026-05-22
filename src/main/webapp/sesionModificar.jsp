<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Sesion" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modificar Sesion</title>
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
        input[type="submit"] {
            padding: 8px 20px;
            margin-right: 10px;
            cursor: pointer;
            background-color: #2196F3;
            color: white;
            border: none;
            border-radius: 3px;
            font-size: 14px;
        }
        input[type="submit"]:hover {
            background-color: #1976D2;
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
    <h2>Modificar Sesión</h2>

    <% if (request.getAttribute("mensaje") != null) { %>
        <p class="<%= "exito".equals(request.getAttribute("tipo")) ? "mensaje-exito" : "mensaje-error" %>">
            <%= request.getAttribute("mensaje") %>
        </p>

    <%
        Sesion sesion = (Sesion) request.getAttribute("sesion");

    %>

    <form action="modificarSesion" method="post">
        <input type="hidden" name="NumSesion" value="<%= sesion.getNumSesion() %>">

        <fieldset>
            <legend>Datos</legend>

            <label for="NombeSesion">Nombre de la sesión:</label><br>
            <input type="text" id="nombre" name="nombre" value="<%= sesion.getNombre() %>" required><br><br>

            <label for="CantParticipantes">Cantidad de participantes:</label><br>
            <input type="number" id="cantidad" name="cantidad" min="0" max="120" value="<%= sesion.getCantidad() %>" required><br><br>

            <label for="Fecha">Fecha:</label><br>
            <input type="text" id="fecha" name="fecha" value="<%= sesion.getFecha() %>" required><br><br>
            
			<label for="Duracion">Duración:</label><br>
            <input type="text" id="duracion" name="duracion" value="<%= sesion.getDuracion() %>" required><br><br>
            
            <label for="NomPartida">Nombre de la partida:</label><br>
            <input type="text" id="nomPartida" name="nomPartida" value="<%= sesion.getNomPartida() %>" required><br><br>
        </fieldset>
        <br>

        <input type="submit" value="Guardar Cambios">
    </form>

    <% } else { %>
        <p class="mensaje-error">No se encontró el estudiante solicitado.</p>
    <% } %>

    <a class="volver" href="listarEstudiantes">← Volver al listado</a>
</body>
</html>
