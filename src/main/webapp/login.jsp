<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Frikipartida - Iniciar Sesión</title>
    <style>
        body {
            background-color: #121212;
            background-image: linear-gradient(135px, #1a1a1a 25%, #121212 100%);
            color: #e0e0e0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #1c1c1c;
            border: 2px solid #b71c1c;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(183, 28, 28, 0.4);
            padding: 40px;
            width: 350px;
            text-align: center;
        }

        h1 {
            color: #e53935;
            font-size: 2rem;
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        label {
            display: block;
            color: #b0bec5;
            margin-bottom: 8px;
            font-size: 0.9rem;
        }

        input[type="text"], input[type="password"], select {
            width: 100%;
            padding: 12px;
            background-color: #262626;
            border: 1px solid #424242;
            border-radius: 5px;
            color: #ffffff;
            font-size: 1rem;
            box-sizing: border-box;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="text"]:focus, input[type="password"]:focus, select:focus {
            border-color: #e53935;
            box-shadow: 0 0 8px rgba(229, 57, 53, 0.5);
            outline: none;
        }

        .btn-submit {
            background-color: #b71c1c;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 14px;
            width: 100%;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            text-transform: uppercase;
            transition: background-color 0.3s, transform 0.1s;
            margin-top: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        }

        .btn-submit:hover {
            background-color: #d32f2f;
        }

        .btn-submit:active {
            transform: scale(0.98);
        }

        .error-mensaje {
            background-color: rgba(211, 47, 47, 0.2);
            border: 1px solid #d32f2f;
            color: #ff8a80;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h1>Frikipartida</h1>
        
        <% if (request.getAttribute("mensaje") != null) { %>
            <div class="error-mensaje">
                <%= request.getAttribute("mensaje") %>
            </div>
        <% } %>

        <form action="loginControlador" method="POST">
            <div class="form-group">
                <label for="usuario">Nombre del Aventurero / DM:</label>
                <input type="text" id="usuario" name="usuario" required placeholder="Ej: MasterDelCalabozo">
            </div>
            
            <div class="form-group">
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required placeholder="••••••••">
            </div>

            <div class="form-group">
                <label for="rol">Selecciona tu Rango:</label>
                <select id="rol" name="rol">
                    <option value="jugador">Jugador de la Mesa</option>
                    <option value="master">Dungeon Master (Modo Editor)</option>
                </select>
            </div>
            
            <button type="submit" class="btn-submit">Entrar al Reino</button>
        </form>
    </div>

</body>
</html>