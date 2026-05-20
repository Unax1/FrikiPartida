<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Boolean esMaster = (Boolean) session.getAttribute("esMaster");
    if (esMaster == null || !esMaster) {
        request.setAttribute("mensaje", " ¡Invasión de mazmorra! No tienes permisos para crear armas.");
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forjar Nueva Arma</title>
    <style>
        body { background-color: #121212; color: #e0e0e0; font-family: 'Segoe UI', sans-serif; margin: 0; padding: 20px; }
        .form-container { max-width: 600px; margin: 50px auto; background-color: #1c1c1c; border: 2px solid #b71c1c; border-radius: 8px; padding: 30px; box-shadow: 0 0 15px rgba(183, 28, 28, 0.3); }
        h2 { color: #e53935; text-transform: uppercase; margin-top: 0; border-bottom: 1px solid #333; padding-bottom: 10px; text-align: center; }
        .form-group { margin-bottom: 18px; }
        label { display: block; color: #b0bec5; margin-bottom: 6px; font-size: 0.9rem; }
        input[type="text"], input[type="number"] { width: 100%; padding: 10px; background-color: #262626; border: 1px solid #424242; border-radius: 4px; color: white; box-sizing: border-box; }
        input:focus { border-color: #e53935; outline: none; }
        .row { display: flex; gap: 15px; }
        .row .form-group { flex: 1; }
        .actions { display: flex; justify-content: space-between; margin-top: 25px; }
        .btn { padding: 12px 20px; border: none; border-radius: 4px; font-weight: bold; cursor: pointer; text-transform: uppercase; text-decoration: none; font-size: 0.9rem; }
        .btn-save { background-color: #b71c1c; color: white; }
        .btn-save:hover { background-color: #d32f2f; }
        .btn-cancel { background-color: #424242; color: white; }
        .btn-cancel:hover { background-color: #616161; }
        .alert { background-color: rgba(211, 47, 47, 0.2); border: 1px solid #d32f2f; color: #ff8a80; padding: 10px; border-radius: 4px; margin-bottom: 15px; font-size: 0.9rem; text-align: center; }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Forjar Nueva Arma Forjada</h2>
    
    <% if (request.getAttribute("mensaje") != null) { %>
        <div class="alert"><%= request.getAttribute("mensaje") %></div>
    <% } %>

    <form action="insertarArma" method="POST">
        <div class="form-group">
            <label for="Nombre">Nombre del Arma:</label>
            <input type="text" id="Nombre" name="Nombre" required placeholder="Ej: Espada Larga de Fuego">
        </div>

        <div class="row">
            <div class="form-group">
                <label for="TipoDano">Tipo de Daño:</label>
                <input type="text" id="TipoDano" name="TipoDano" required placeholder="Cortante, Perforante...">
            </div>
            <div class="form-group">
                <label for="DadoDano">Dado de Daño:</label>
                <input type="text" id="DadoDano" name="DadoDano" required placeholder="Ej: 1d8 + 2">
            </div>
        </div>

        <div class="row">
            <div class="form-group">
                <label for="Precio">Precio (Monedas):</label>
                <input type="text" id="Precio" name="Precio" required placeholder="Ej: 15 po">
            </div>
            <div class="form-group">
                <label for="Peso">Peso (kg):</label>
                <input type="number" step="0.1" id="Peso" name="Peso" required placeholder="Ej: 1.5">
            </div>
        </div>

        <div class="form-group">
            <label for="Propiedades">Propiedades / Atributos:</label>
            <input type="text" id="Propiedades" name="Propiedades" placeholder="Ej: Marcial, Versátil (1d10)">
        </div>

        <div class="form-group">
            <label for="NomPartida">Asignar a Campaña (Nombre Partida):</label>
            <input type="text" id="NomPartida" name="NomPartida" required placeholder="Ej: Las Minas de Phandelver">
        </div>

        <div class="actions">
            <a href="listarArmas" class="btn btn-cancel">Cancelar</a>
            <button type="submit" class="btn btn-save">Guardar en Inventario</button>
        </div>
    </form>
</div>

</body>
</html>