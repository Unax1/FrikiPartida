<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Boolean esMaster = (Boolean) session.getAttribute("esMaster");
    if (esMaster == null || !esMaster) {
        request.setAttribute("mensaje", "⚠️ ¡Zona Restringida! Solo los Dungeon Masters pueden iniciar crónicas.");
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insertar Partida - Control de Campañas</title>
    <style>
        body { background-color: #121212; color: #e0e0e0; font-family: 'Segoe UI', sans-serif; margin: 0; padding: 20px; }
        .form-container { max-width: 500px; margin: 40px auto; background-color: #1c1c1c; border: 2px solid #b71c1c; border-radius: 8px; padding: 30px; box-shadow: 0 0 15px rgba(183, 28, 28, 0.3); }
        h1, h2 { text-align: center; margin: 5px 0; }
        h1 { color: #ffffff; font-size: 1.8rem; }
        h2 { color: #e53935; text-transform: uppercase; font-size: 1.2rem; border-bottom: 1px solid #333; padding-bottom: 10px; }
        fieldset { border: 1px solid #424242; border-radius: 4px; padding: 15px; margin-top: 20px; }
        legend { color: #b0bec5; font-weight: bold; padding: 0 10px; }
        label { display: block; color: #b0bec5; margin-bottom: 5px; margin-top: 10px; font-size: 0.9rem; }
        input[type="text"], input[type="number"], select { width: 100%; padding: 10px; background-color: #262626; border: 1px solid #424242; border-radius: 4px; color: white; box-sizing: border-box; }
        input:focus, select:focus { border-color: #e53935; outline: none; }
        .buttons-container { display: flex; gap: 10px; margin-top: 20px; }
        input[type="submit"], input[type="reset"] { flex: 1; padding: 12px; border: none; border-radius: 4px; font-weight: bold; cursor: pointer; text-transform: uppercase; font-size: 0.9rem; }
        input[type="submit"] { background-color: #b71c1c; color: white; }
        input[type="submit"]:hover { background-color: #d32f2f; }
        input[type="reset"] { background-color: #424242; color: white; }
        input[type="reset"]:hover { background-color: #616161; }
        .mensaje-exito { color: #4caf50; text-align: center; font-weight: bold; }
        .mensaje-error { color: #ff8a80; text-align: center; font-weight: bold; }
        .volver { display: block; text-align: center; margin: 20px; color: #b0bec5; text-decoration: none; }
        .volver:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1>Sistema de Gestión de Partidas</h1>
    <h2>Insertar Nueva Partida</h2>

    <% if (request.getAttribute("mensaje") != null) { %>
        <p class="<%= "exito".equals(request.getAttribute("tipo")) ? "mensaje-exito" : "mensaje-error" %>">
            <%= request.getAttribute("mensaje") %>
        </p>
    <% } %>

    <form action="insertarPartida" method="post">
        <fieldset>
            <legend>Datos de la Mesa 🎲</legend>

            <%-- CRUCIAL: Se cambian los 'name' para coincidir con el Servlet y la BD --%>
            <label for="NomPartida">Nombre de la Partida:</label>
            <input type="text" id="NomPartida" name="NomPartida" required maxlength="30" placeholder="Ej: Las Crónicas de Faerûn">

            <label for="DM">Dungeon Master (DM):</label>
            <input type="text" id="DM" name="DM" required maxlength="30" placeholder="Ej: Máster Mercer">

            <label for="Estado">Estado actual:</label>
            <select id="Estado" name="Estado" required>
                <option value="Por empezar">Por empezar</option>
                <option value="En proceso">En proceso</option>
                <option value="Terminada">Terminada</option>
            </select>
            
            <label for="CantSesiones">Cantidad de Sesiones:</label>
            <input type="number" id="CantSesiones" name="CantSesiones" value="0" min="0" required>
            
            <label for="Dificultad">Dificultad de la Campaña:</label>
            <select id="Dificultad" name="Dificultad" required>
                <option value="Facil">Fácil</option>
                <option value="Intermedio" selected>Intermedio</option>
                <option value="Dificil">Difícil</option>
                <option value="Experto">Experto</option>
            </select>
        </fieldset>

        <div class="buttons-container">
            <input type="submit" value="Insertar Partida">
            <input type="reset" value="Limpiar">
        </div>
    </form>

    <a class="volver" href="listarPartidas">← Volver al listado</a>
</body>
</html>