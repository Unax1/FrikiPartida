<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Sesion" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FrikiPartida - Alterar Pergamino de Sesión</title>
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
            margin-bottom: 20px;
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
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            background-color: #151515;
            border: 1px solid #333;
            color: #fff;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
            transition: border 0.3s;
        }
        input[type="text"]:focus, input[type="number"]:focus {
            border-color: #ff0000;
            outline: none;
        }
        .form-buttons {
            display: flex;
            justify-content: space-between;
            gap: 15px;
        }
        input[type="submit"] {
            flex: 1;
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
        .btn-volver {
            flex: 1;
            display: block;
            text-align: center;
            padding: 12px;
            background-color: #1a0000;
            color: #b0b0b0;
            border: 1px solid #4d0000;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
            box-sizing: border-box;
            transition: all 0.3s;
        }
        .btn-volver:hover {
            background-color: #4d0000;
            color: white;
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
    <h2>Modificar Sesión Escrita</h2>

    <% if (request.getAttribute("mensaje") != null) { %>
        <p class="<%= "exito".equals(request.getAttribute("tipo")) ? "mensaje-exito" : "mensaje-error" %>">
            <%= request.getAttribute("mensaje") %>
        </p>
    <% } %>

    <%
        Sesion sesion = (Sesion) request.getAttribute("sesion");
        if (sesion != null) {
    %>
	<form action="modificarSesion" method="post">
	    <input type="hidden" name="NumSesion" value="<%= sesion.getNumSesion() %>">
	
	    <fieldset>
	        <legend>Editar Registro</legend>
	
	        <label for="nombre">Nombre de la sesión:</label>
	        <input type="text" id="nombre" name="nombre" value="<%= sesion.getNombre() %>" required><br><br>
	
	        <label for="cantidad">Cantidad de participantes:</label>
	        <input type="number" id="cantidad" name="cantidad" min="0" max="120" value="<%= sesion.getCantidad() %>" required><br><br>
	
	        <label for="fecha">Fecha de juego:</label>
			<input type="date" id="fecha" name="fecha" value="<%= sesion.getFecha() %>" required><br><br>
	        
	        <label for="duracion">Duración (Horas):</label>
	        <input type="text" id="duracion" name="duracion" value="<%= sesion.getDuracion() %>" required><br><br>
	        
	        <label for="NomPartida">Nombre de la partida (Mesa):</label>
	        <input type="text" id="NomPartida" name="NomPartida" value="<%= sesion.getNomPartida() %>" readonly style="color: #666; background-color: #0a0a0a;">
	    </fieldset>
	
	    <div class="form-buttons">
	        <input type="submit" value="Guardar Cambios">
	        <a class="btn-volver" href="listarSesiones">Cancelar</a>
	    </div>
	</form>
    <% } else { %>
        <p class="mensaje-error">Error crítico: No se encontraron los datos de la sesión solicitada.</p>
        <div class="form-buttons">
            <a class="btn-volver" style="flex: none; margin: 0 auto; min-width: 200px;" href="listarSesiones">← Volver al listado</a>
        </div>
    <% } %>
</div>
</body>
</html>
