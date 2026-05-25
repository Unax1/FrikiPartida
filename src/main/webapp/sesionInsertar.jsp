<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FrikiPartida - Registrar Nueva Sesión</title>
    <style>
        body {
            background-color: #050505;
            color: #f0f0f0;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 550px;
            margin: 40px auto;
            background-color: #0f0f0f;
            border: 2px solid #4d0000;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.9);
        }
        h1 {
            font-family: 'Cinzel', serif;
            text-align: center;
            color: #ffffff;
            margin: 0 0 5px 0;
            letter-spacing: 2px;
            text-shadow: 0 0 10px #4d0000;
        }
        h2 {
            text-align: center;
            color: #ff0000;
            text-transform: uppercase;
            font-size: 1.2rem;
            margin-bottom: 25px;
            letter-spacing: 1px;
        }
        fieldset {
            border: 1px solid #4d0000;
            border-radius: 6px;
            padding: 20px;
            background-color: #050505;
            margin-bottom: 25px;
        }
        legend {
            color: #ff0000;
            font-weight: bold;
            text-transform: uppercase;
            padding: 0 10px;
            font-size: 0.9rem;
            letter-spacing: 1px;
        }
        label {
            color: #b0b0b0;
            font-weight: bold;
            font-size: 0.9rem;
            display: inline-block;
            margin-bottom: 6px;
        }
        input[type="text"], input[type="number"], input[type="date"] {
            width: 100%;
            padding: 10px;
            background-color: #151515;
            border: 1px solid #333;
            color: #fff;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
            margin-bottom: 18px;
            transition: border 0.3s;
        }
        input[type="text"]:focus, input[type="number"]:focus, input[type="date"]:focus {
            border-color: #ff0000;
            outline: none;
        }
        .form-buttons {
            display: flex;
            gap: 15px;
        }
        input[type="submit"] {
            flex: 2;
            padding: 12px;
            cursor: pointer;
            background-color: #990000;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(153, 0, 0, 0.4);
        }
        input[type="submit"]:hover {
            background-color: #ff0000;
            box-shadow: 0 0 15px #ff0000;
        }
        input[type="reset"] {
            flex: 1;
            padding: 12px;
            cursor: pointer;
            background-color: #333;
            color: #ccc;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
            transition: background 0.3s;
        }
        input[type="reset"]:hover {
            background-color: #444;
            color: #fff;
        }
        .btn-volver {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #888;
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.3s;
        }
        .btn-volver:hover {
            color: #ff0000;
        }
        .mensaje-exito {
            color: #4caf50;
            text-align: center;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .mensaje-error {
            color: #ff0000;
            text-align: center;
            font-weight: bold;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Sistema de Gestión de Sesiones</h1>
    <h2>Planificar Nueva Sesión</h2>

    <% if (request.getAttribute("mensaje") != null) { %>
        <p class="<%= "exito".equals(request.getAttribute("tipo")) ? "mensaje-exito" : "mensaje-error" %>">
            <%= request.getAttribute("mensaje") %>
        </p>
    <% } %>

    <form action="insertarSesion" method="post">
        <fieldset>
            <legend>Datos de la Reunión</legend>

            <label for="NumSesion">Número de sesión:</label>
            <input type="number" id="NumSesion" name="NumSesion" min="1" required>
		
            <label for="NombreSesion">Nombre de la sesión:</label>
            <input type="text" id="NombreSesion" name="NombreSesion" maxlength="40" required placeholder="Ej: Emboscada en el camino">
		
            <label for="CantParticipantes">Cantidad de participantes:</label>
            <input type="number" id="CantParticipantes" name="CantParticipantes" value="4" min="1" max="120" required>
		
            <label for="Fecha">Fecha de encuentro:</label>
            <input type="date" id="Fecha" name="Fecha" required>
            
            <label for="Duracion">Duración estimada (Horas):</label>
            <input type="number" id="Duracion" name="Duracion" min="0" step="0.5" placeholder="Ej: 3.5" required>
            
            <label for="NomPartida">Nombre de la Campaña (Mesa):</label>
            <input type="text" id="NomPartida" name="NomPartida" maxlength="30" required placeholder="Debe coincidir con una mesa existente">
			
        </fieldset>

        <div class="form-buttons">
            <input type="submit" value="Forjar Sesión">
            <input type="reset" value="Limpiar">
        </div>
    </form>

    <a class="btn-volver" href="listarSesiones">← Volver al Diario de Sesiones</a>
</div>
</body>
</html>