<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Partida" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modificar Partida - Gestión de Partida</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #121212; 
            color: #e0e0e0;
        }
        h1, h2 {
            text-align: center;
            color: #e53935;
        }
        form {
            max-width: 500px;
            margin: 0 auto;
            background-color: #1c1c1c;
            padding: 20px;
            border: 1px solid #333;
            border-radius: 8px;
        }
        fieldset {
            padding: 15px;
            margin-bottom: 10px;
            border: 1px solid #424242;
            border-radius: 4px;
        }
        legend {
            color: #b0bec5;
            font-weight: bold;
            padding: 0 10px;
        }
        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 15px;
            background-color: #262626;
            border: 1px solid #424242;
            border-radius: 4px;
            color: white;
            box-sizing: border-box;
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
    <h1>Sistema de Gestión de Partidas</h1>
    <h2>Modificar Partida</h2>

    <% if (request.getAttribute("mensaje") != null) { %>
        <p class="<%= "exito".equals(request.getAttribute("tipo")) ? "mensaje-exito" : "mensaje-error" %>">
            <%= request.getAttribute("mensaje") %>
        </p>
    <% } %>

    <%
        Partida partida = (Partida) request.getAttribute("partida");
    
        if (partida != null) {
    %>

    <form action="modificarPartidas" method="post">
        <input type="hidden" name="IDPartida" value="<%= partida.getId() %>">

        <fieldset>
            <legend>Datos de la Campaña 🎲</legend>
		
            <label for="IDPartidaDisplay">ID de la Mesa:</label>
            <input type="number" id="IDPartidaDisplay" value="<%= partida.getId() %>" readonly>
		    
            <label for="NomPartida">Nombre de la Partida:</label>
            <input type="text" id="NomPartida" name="NomPartida" value="<%= partida.getNombre() %>" required maxlength="30">
		
            <label for="DM">Dungeon Master:</label>
            <input type="text" id="DM" name="DM" value="<%= partida.getDm() %>" required maxlength="30">
		
            <label for="CantSesiones">Cantidad de Sesiones Jugadas:</label>
            <input type="number" id="CantSesiones" name="CantSesiones" value="<%= partida.getCantSesiones() %>" min="0">
		
            <label for="Estado">Estado de la Mesa:</label>
            <select id="Estado" name="Estado" required>
                <% 
                    String estadoAct = partida.getEstado() != null ? partida.getEstado() : "Por empezar"; 
                    String[] estados = {"Por empezar", "En proceso", "Terminada"};
                    for(String est : estados) {
                %>
                    <option value="<%= est %>" <%= est.equals(estadoAct) ? "selected" : "" %>><%= est %></option>
                <% } %>
            </select>
		
            <label for="Dificultad">Dificultad del Reto:</label>
            <select id="Dificultad" name="Dificultad" required>
                <% 
                    String difAct = partida.getDificultad() != null ? partida.getDificultad() : "Intermedio"; 
                    String[] dificultades = {"Facil", "Intermedio", "Dificil", "Experto"};
                    for(String dif : dificultades) {
                %>
                    <option value="<%= dif %>" <%= dif.equals(difAct) ? "selected" : "" %>><%= dif %></option>
                <% } %>
            </select>
        </fieldset>

        <input type="submit" value="Guardar Cambios">
    </form>

    <% } else { %>
        <p class="mensaje-error">Error: No se pudo cargar la mesa de juego solicitada.</p>
    <% } %>

    <a class="volver" href="listarPartidas">← Volver al listado</a>
</body>
</html>