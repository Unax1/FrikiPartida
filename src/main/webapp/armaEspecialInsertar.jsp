<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FrikiPartida - Forjar Arma Especial</title>
    <style>
        body { background-color: #050505; color: #f0f0f0; font-family: 'Roboto', sans-serif; margin: 0; padding: 20px; }
        .container { max-width: 600px; margin: 40px auto; background-color: #0f0f0f; border: 2px solid #4d0000; border-radius: 8px; padding: 30px; box-shadow: 0 10px 30px rgba(0,0,0,0.9); }
        h1 { font-family: 'Cinzel', serif; text-align: center; color: #ffffff; letter-spacing: 2px; text-shadow: 0 0 10px #4d0000; margin: 0 0 5px 0; }
        h2 { text-align: center; color: #ff0000; text-transform: uppercase; font-size: 1.2rem; margin-bottom: 25px; }
        fieldset { border: 1px solid #4d0000; border-radius: 6px; padding: 20px; background-color: #050505; margin-bottom: 25px; }
        legend { color: #ff0000; font-weight: bold; text-transform: uppercase; padding: 0 10px; font-size: 0.9rem; }
        label { color: #b0b0b0; font-weight: bold; font-size: 0.9rem; display: block; margin-bottom: 6px; }
        input[type="text"], input[type="number"], textarea { width: 100%; padding: 10px; background-color: #151515; border: 1px solid #333; color: #fff; border-radius: 4px; box-sizing: border-box; font-size: 14px; margin-bottom: 18px; }
        input:focus, textarea:focus { border-color: #ff0000; outline: none; }
        textarea { height: 80px; resize: none; }
        .form-buttons { display: flex; gap: 15px; }
        input[type="submit"] { flex: 2; padding: 12px; cursor: pointer; background-color: #990000; color: white; border: none; border-radius: 4px; font-size: 14px; font-weight: bold; text-transform: uppercase; box-shadow: 0 4px 15px rgba(153, 0, 0, 0.4); }
        input[type="submit"]:hover { background-color: #ff0000; box-shadow: 0 0 15px #ff0000; }
        input[type="reset"] { flex: 1; padding: 12px; background-color: #333; color: #ccc; border: none; border-radius: 4px; font-weight: bold; text-transform: uppercase; cursor: pointer; }
        .btn-volver { display: block; text-align: center; margin-top: 20px; color: #888; text-decoration: none; font-size: 0.9rem; }
        .btn-volver:hover { color: #ff0000; }
        .mensaje-error { color: #ff0000; text-align: center; font-weight: bold; margin-bottom: 15px; }
    </style>
</head>
<body>
<div class="container">
    <h1>Yunques del Inframundo</h1>
    <h2>Forjar Artefacto Especial</h2>

    <% if (request.getAttribute("mensaje") != null) { %>
        <p class="mensaje-error"><%= request.getAttribute("mensaje") %></p>
    <% } %>

    <form action="insertarArmaEspecial" method="post">
        <fieldset>
            <legend>Propiedades Físicas Base</legend>

            <label for="Nombre">Nombre del Arma:</label>
            <input type="text" id="Nombre" name="Nombre" required placeholder="Ej: Vengadora Sagrada">
		
            <label for="TipoDano">Tipo de Daño:</label>
            <input type="text" id="TipoDano" name="TipoDano" placeholder="Ej: Cortante, Radiante" required>
		
            <label for="DadoDano">Dado de Daño:</label>
            <input type="text" id="DadoDano" name="DadoDano" placeholder="Ej: 2d6, 1d10" required>
		
            <label for="Precio">Precio en mercado:</label>
            <input type="text" id="Precio" name="Precio" placeholder="Ej: 5000 po" required>
            
            <label for="Peso">Peso (kg):</label>
            <input type="number" id="Peso" name="Peso" step="0.1" required>
            
            <label for="Propiedades">Propiedades Mundanas:</label>
            <input type="text" id="Propiedades" name="Propiedades" placeholder="Ej: Pesada, Dos Manos">
            
            <label for="NomPartida">Nombre de la Campaña:</label>
            <input type="text" id="NomPartida" name="NomPartida" required placeholder="Mesa asignada">
        </fieldset>

        <fieldset>
            <legend>Encantamientos Mágicos (Especiales)</legend>

            <label for="Rareza">Rareza del Artefacto:</label>
            <input type="text" id="Rareza" name="Rareza" placeholder="Ej: Legendaria, Muy Rara" required>

            <label for="Bonificador">Bonificador de Ataque/Daño (+):</label>
            <input type="number" id="Bonificador" name="Bonificador" min="0" max="5" value="1" required>

            <label for="EfectoMagico">Efecto Mágico Especial:</label>
            <textarea id="EfectoMagico" name="EfectoMagico" placeholder="Describe los efectos mágicos, conjuros que desata o maldiciones..." required></textarea>
        </fieldset>

        <div class="form-buttons">
            <input type="submit" value="Infundir Magia">
            <input type="reset" value="Deshacer">
        </div>
    </form>

    <a class="btn-volver" href="listarArmasEspeciales">← Cancelar y volver a la armería</a>
</div>
</body>
</html>