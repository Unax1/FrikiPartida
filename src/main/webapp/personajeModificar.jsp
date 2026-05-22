<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Personaje" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modificar Personaje - Gestión de Campaña</title>
    <style>
        body {
            background-color: #121212;
            color: #e0e0e0;
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 20px;
        }
        h1, h2 {
            text-align: center;
            margin: 5px 0;
        }
        h1 {
            color: #ffffff;
        }
        h2 {
            color: #e53935;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 1.4rem;
            margin-bottom: 20px;
        }
        form {
            max-width: 500px;
            margin: 0 auto;
            background-color: #1c1c1c;
            padding: 25px;
            border: 2px solid #b71c1c;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.5);
        }
        fieldset {
            border: 1px solid #424242;
            border-radius: 4px;
            padding: 15px;
            margin-bottom: 15px;
        }
        legend {
            color: #b0bec5;
            font-weight: bold;
            padding: 0 10px;
        }
        label {
            display: block;
            color: #b0bec5;
            margin-bottom: 5px;
            margin-top: 10px;
            font-size: 0.9rem;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            background-color: #262626;
            border: 1px solid #424242;
            border-radius: 4px;
            color: white;
            box-sizing: border-box;
        }
        input:focus {
            border-color: #e53935;
            outline: none;
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            cursor: pointer;
            background-color: #b71c1c;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
            transition: background 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #d32f2f;
        }
        .mensaje-exito {
            color: #4caf50;
            text-align: center;
            font-weight: bold;
        }
        .mensaje-error {
            color: #ff8a80;
            text-align: center;
            font-weight: bold;
        }
        .volver {
            display: block;
            text-align: center;
            margin: 20px;
            color: #b0bec5;
            text-decoration: none;
        }
        .volver:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Sistema de Gestión de Personajes</h1>
    <h2>Modificar Personaje</h2>

    <% if (request.getAttribute("mensaje") != null) { %>
        <p class="<%= "exito".equals(request.getAttribute("tipo")) ? "mensaje-exito" : "mensaje-error" %>">
            <%= request.getAttribute("mensaje") %>
        </p>
    <% } %>

    <%
        Personaje personaje = (Personaje) request.getAttribute("personaje");
        if (personaje != null) {
    %>

    <form action="modificarPersonaje" method="post">
        <input type="hidden" name="id" value="<%= personaje.getId() %>">

        <fieldset>
            <legend>Datos del Personaje</legend>

            <label for="IDPersonaje">ID del Personaje:</label>
            <input type="number" id="IDPersonaje" name="IDPersonaje" value="<%= personaje.getId() %>" readonly>
		  
            <label for="NomPersonaje">Nombre del Personaje:</label>
            <input type="text" id="NomPersonaje" name="NomPersonaje" value="<%= personaje.getNombrePJ() %>" required maxlength="30">
		
            <label for="NomJugador">Nombre del Jugador:</label>
            <input type="text" id="NomJugador" name="NomJugador" value="<%= personaje.getNombreJugador() %>" required maxlength="30">
		
            <label for="Nivel">Nivel:</label>
            <input type="number" id="Nivel" name="Nivel" value="<%= personaje.getNivel() %>" min="1" max="20" required>
		
            <label for="NomPartida">Mesa / Campaña asignada:</label>
            <input type="text" id="NomPartida" name="NomPartida" value="<%= personaje.getNomPartida() %>" required maxlength="30">
        </fieldset>

        <input type="submit" value="Guardar Cambios">
    </form>

    <% } else { %>
        <p class="mensaje-error">No se encontró el personaje solicitado.</p>
    <% } %>

    <a class="volver" href="listarPersonajes">← Volver al listado</a>
</body>
</html>