<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insertar Personaje - Gestión de Campaña</title>
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
        .botones-contenedor {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        input[type="submit"], input[type="reset"] {
            flex: 1;
            padding: 12px;
            cursor: pointer;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
            transition: background 0.3s;
        }
        input[type="submit"] {
            background-color: #b71c1c;
            color: white;
        }
        input[type="submit"]:hover {
            background-color: #d32f2f;
        }
        input[type="reset"] {
            background-color: #424242;
            color: white;
        }
        input[type="reset"]:hover {
            background-color: #616161;
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
    <h2>Insertar Nuevo Personaje</h2>

    <% if (request.getAttribute("mensaje") != null) { %>
        <p class="<%= "exito".equals(request.getAttribute("tipo")) ? "mensaje-exito" : "mensaje-error" %>">
            <%= request.getAttribute("mensaje") %>
        </p>
    <% } %>

    <form action="insertarPersonaje" method="post">
        <fieldset>
            <legend>Datos del Personaje</legend>

            <label for="NomPersonaje">Nombre del Personaje:</label>
            <input type="text" id="NomPersonaje" name="NomPersonaje" required maxlength="30">
		
            <label for="NomJugador">Nombre del Jugador:</label>
            <input type="text" id="NomJugador" name="NomJugador" required maxlength="30">
		
            <label for="Nivel">Nivel:</label>
            <input type="number" id="Nivel" name="Nivel" value="1" min="1" max="20" required>
		
            <label for="NomPartida">Mesa / Campaña asignada:</label>
            <input type="text" id="NomPartida" name="NomPartida" required maxlength="30">
        </fieldset>

        <div class="botones-contenedor">
            <input type="submit" value="Insertar Personaje">
            <input type="reset" value="Limpiar">
        </div>
    </form>

    <a class="volver" href="listarPersonajes">← Volver al listado</a>
</body>
</html>