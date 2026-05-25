<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.ArmaEspecial" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FrikiPartida - Alterar Matriz Mágica</title>
    <style>
        body { background-color: #050505; color: #f0f0f0; font-family: 'Roboto', sans-serif; margin: 0; padding: 20px; }
        .container { max-width: 600px; margin: 40px auto; background-color: #0f0f0f; border: 2px solid #4d0000; border-radius: 8px; padding: 30px; box-shadow: 0 10px 30px rgba(0,0,0,0.9); }
        h1 { font-family: 'Cinzel', serif; text-align: center; color: #ffffff; letter-spacing: 2px; text-shadow: 0 0 10px #4d0000; margin: 0 0 5px 0; }
        h2 { text-align: center; color: #ff0000; text-transform: uppercase; font-size: 1.2rem; margin-bottom: 25px; }
        fieldset { border: 1px solid #4d0000; border-radius: 6px; padding: 20px; background-color: #050505; margin-bottom: 20px; }
        legend { color: #ff0000; font-weight: bold; text-transform: uppercase; padding: 0 10px; font-size: 0.9rem; }
        label { color: #b0b0b0; font-weight: bold; font-size: 0.9rem; display: block; margin-bottom: 6px; }
        input[type="text"], input[type="number"], textarea { width: 100%; padding: 10px; background-color: #151515; border: 1px solid #333; color: #fff; border-radius: 4px; box-sizing: border-box; font-size: 14px; margin-bottom: 16px; }
        input:focus, textarea:focus { border-color: #ff0000; outline: none; }
        textarea { height: 80px; resize: none; }
        .form-buttons { display: flex; gap: 15px; }
        input[type="submit"] { flex: 1; padding: 12px; cursor: pointer; background-color: #990000; color: white; border: none; border-radius: 4px; font-size: 14px; font-weight: bold; text-transform: uppercase; }
        input[type="submit"]:hover { background-color: #ff0000; box-shadow: 0 0 15px #ff0000; }
        .btn-volver { flex: 1; display: block; text-align: center; padding: 12px; background-color: #1a0000; color: #b0b0b0; border: 1px solid #4d0000; text-decoration: none; border-radius: 4px; font-size: 14px; font-weight: bold; text-transform: uppercase; box-sizing: border-box; }
        .btn-volver:hover { background-color: #4d0000; color: white; }
        .mensaje-error { color: #ff0000; text-align: center; font-weight: bold; margin-bottom: 15px; }
    </style>
</head>
<body>
<div class="container">
    <h1>Altar de Transmutación</h1>
    <h2>Alterar Estructura del Artefacto</h2>

    <% if (request.getAttribute("mensaje") != null) { %>
        <p class="mensaje-error"><%= request.getAttribute("mensaje") %></p>
    <% } %>

    <%
        ArmaEspecial arma = (ArmaEspecial) request.getAttribute("armaEspecial");
        if (arma != null) {
    %>
        <form action="modificarArmaEspecial" method="post">
            <input type="hidden" name="IDArma" value="<%= arma.getId() %>">

            <fieldset>
                <legend>Núcleo Terrenal (Atributos Base)</legend>

                <label for="Nombre">Nombre Modificado:</label>
                <input type="text" id="Nombre" name="Nombre" value="<%= arma.getNombre() %>" required>

                <label for="TipoDano">Tipo de Daño:</label>
                <input type="text" id="TipoDano" name="TipoDano" value="<%= arma.getTipoDano() %>" required>

                <label for="DadoDano">Fuerza de Impacto (Dado):</label>
                <input type="text" id="DadoDano" name="DadoDano" value="<%= arma.getDado() %>" required>

                <label for="Precio">Valor de Tasación:</label>
                <input type="text" id="Precio" name="Precio" value="<%= arma.getPrecio() %>" required>
                
                <label for="Peso">Peso (kg):</label>
                <input type="number" id="Peso" name="Peso" step="0.1" value="<%= arma.getPeso() %>" required>
                
                <label for="Propiedades">Propiedades Mecánicas:</label>
                <input type="text" id="Propiedades" name="Propiedades" value="<%= arma.getPropiedades() %>">
                
                <label for="NomPartida">Campaña Vinculada:</label>
                <input type="text" id="NomPartida" name="NomPartida" value="<%= arma.getNomPartida() %>" readonly style="color: #666; background-color: #0a0a0a;">
            </fieldset>

            <fieldset>
                <legend>Matriz Astral (Atributos Especiales)</legend>

                <label for="Rareza">Grado de Rareza:</label>
                <input type="text" id="Rareza" name="Rareza" value="<%= arma.getRareza() %>" required>

                <label for="Bonificador">Magnitud del Bonificador:</label>
                <input type="number" id="Bonificador" name="Bonificador" min="0" max="5" value="<%= arma.getBonificador() %>" required>

                <label for="EfectoMagico">Propiedades Místicas Runas:</label>
                <textarea id="EfectoMagico" name="EfectoMagico" required><%= arma.getEfectoMagico() %></textarea>
            </fieldset>

            <div class="form-buttons">
                <input type="submit" value="Re-Forjar Runa">
                <a class="btn-volver" href="listarArmasEspeciales">Volver</a>
            </div>
        </form>
    <% } else { %>
        <p class="mensaje-error">El artefacto mágico se ha desvanecido del plano material. No se pudo cargar.</p>
        <a class="btn-volver" style="max-width: 200px; margin: 0 auto;" href="listarArmasEspeciales">← Regresar</a>
    <% } %>
</div>
</body>
</html>