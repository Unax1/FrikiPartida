<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro de Dungeon Master</title>
    <style>
        body { background-color: #121212; color: #e0e0e0; font-family: 'Segoe UI', sans-serif; margin: 0; padding: 20px; }
        h1, h2 { text-align: center; margin: 5px 0; }
        h1 { color: #ffffff; }
        h2 { color: #e53935; text-transform: uppercase; letter-spacing: 1px; font-size: 1.4rem; margin-bottom: 20px; }
        form { max-width: 500px; margin: 0 auto; background-color: #1c1c1c; padding: 25px; border: 2px solid #b71c1c; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.5); }
        fieldset { border: 1px solid #424242; border-radius: 4px; padding: 15px; margin-bottom: 15px; }
        legend { color: #b0bec5; font-weight: bold; padding: 0 10px; }
        label { display: block; color: #b0bec5; margin-bottom: 5px; margin-top: 10px; font-size: 0.9rem; }
        input[type="text"], input[type="password"], input[type="email"] { width: 100%; padding: 10px; background-color: #262626; border: 1px solid #424242; border-radius: 4px; color: white; box-sizing: border-box; }
        input:focus { border-color: #e53935; outline: none; }
        input[type="submit"] { width: 100%; padding: 12px; cursor: pointer; background-color: #b71c1c; color: white; border: none; border-radius: 4px; font-size: 14px; font-weight: bold; text-transform: uppercase; transition: background 0.3s; margin-top: 10px; }
        input[type="submit"]:hover { background-color: #d32f2f; }
        .mensaje-error { color: #ff8a80; text-align: center; font-weight: bold; }
        .volver { display: block; text-align: center; margin: 20px; color: #b0bec5; text-decoration: none; }
        .volver:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1>Sistema de Gestión</h1>
    <h2>Inscribir Nuevo Dungeon Master</h2>

    <% if (request.getAttribute("mensaje") != null) { %>
        <p class="mensaje-error"><%= request.getAttribute("mensaje") %></p>
    <% } %>

    <form action="registroMaster" method="post">
        <fieldset>
            <legend>Credenciales de la Cuenta</legend>

            <label for="Usuario">Nombre de Usuario (Login):</label>
            <input type="text" id="Usuario" name="Usuario" required maxlength="30" placeholder="Ej: MasterGygax">

            <label for="Email">Correo Electrónico:</label>
            <input type="email" id="Email" name="Email" required maxlength="50" placeholder="ejemplo@dominio.com">

            <label for="contrasena">Contraseña de Acceso:</label>
            <input type="password" id="contrasena" name="contrasena" required minlength="4" placeholder="Mínimo 4 caracteres">
        </fieldset>

        <input type="submit" value="Crear Cuenta de Master">
    </form>

    <a class="volver" href="index.jsp">Volver al Inicio</a>
</body>
</html>