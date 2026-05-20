<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Arma" %>
<%
    Boolean esMaster = (Boolean) session.getAttribute("esMaster");
    if (esMaster == null || !esMaster) {
        response.sendRedirect("index.jsp");
        return;
    }
    Arma arma = (Arma) request.getAttribute("arma");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modificar Estadísticas del Arma</title>
    <style>
        body { background-color: #121212; color: #e0e0e0; font-family: 'Segoe UI', sans-serif; margin: 0; padding: 20px; }
        .form-container { max-width: 600px; margin: 50px auto; background-color: #1c1c1c; border: 2px solid #0d47a1; border-radius: 8px; padding: 30px; box-shadow: 0 0 15px rgba(13, 71, 161, 0.4); }
        h2 { color: #1565c0; text-transform: uppercase; margin-top: 0; border-bottom: 1px solid #333; padding-bottom: 10px; text-align: center; }
        .form-group { margin-bottom: 18px; }
        label { display: block; color: #b0bec5; margin-bottom: 6px; font-size: 0.9rem; }
        input[type="text"], input[type="number"] { width: 100%; padding: 10px; background-color: #262626; border: 1px solid #424242; border-radius: 4px; color: white; box-sizing: border-box; }
        input:focus { border-color: #1565c0; outline: none; }
        .row { display: flex; gap: 15px; }
        .row .form-group { flex: 1; }
        .actions { display: flex; justify-content: space-between; margin-top: 25px; }
        .btn { padding: 12px 20px; border: none; border-radius: 4px; font-weight: bold; cursor: pointer; text-transform: uppercase; text-decoration: none; font-size: 0.9rem; }
        .btn-update { background-color: #0d47a1; color: white; }
        .btn-update:hover { background-color: #1565c0; }
        .btn-cancel { background-color: #424242; color: white; }
        .btn-cancel:hover { background-color: #616161; }
    </style>
</head>
<body>

<div class="form-container">
    <h2>🔮 Alterar Propiedades Mágicas</h2>

    <form action="modificarArmas" method="POST">
        <%-- Input oculto indispensable para conservar la clave primaria al actualizar --%>
        <input type="hidden" name="IDArma" value="<%= arma != null ? arma.getId() : "" %>">

        <div class="form-group">
            <label for="Nombre">Nombre del Arma:</label>
            <input type="text" id="Nombre" name="Nombre" required value="<%= arma != null ? arma.getNombre() : "" %>">
        </div>

        <div class="row">
            <div class="form-group">
                <label for="TipoDano">Tipo de Daño:</label>
                <input type="text" id="TipoDano" name="TipoDano" required value="<%= arma != null ? arma.getTipoDano() : "" %>">
            </div>
            <div class="form-group">
                <label for="DadoDano">Dado de Daño:</label>
                <input type="text" id="DadoDano" name="DadoDano" required value="<%= arma != null ? arma.getDado() : "" %>">
            </div>
        </div>

        <div class="row">
            <div class="form-group">
                <label for="Precio">Precio:</label>
                <input type="text" id="Precio" name="Precio" required value="<%= arma != null ? arma.getPrecio() : "" %>">
            </div>
            <div class="form-group">
                <label for="Peso">Peso (kg):</label>
                <input type="number" step="0.1" id="Peso" name="Peso" required value="<%= arma != null ? arma.getPeso() : "" %>">
            </div>
        </div>

        <div class="form-group">
            <label for="Propiedades">Propiedades:</label>
            <input type="text" id="Propiedades" name="Propiedades" value="<%= arma != null ? arma.getPropiedades() : "" %>">
        </div>

        <div class="form-group">
            <label for="NomPartida">Mesa Asignada (Campaña):</label>
            <input type="text" id="NomPartida" name="NomPartida" required value="<%= arma != null ? arma.getNomPartida() : "" %>">
        </div>

        <div class="actions">
            <a href="listarArmas" class="btn btn-cancel">Descartar</a>
            <button type="submit" class="btn btn-update">Aplicar Hechizo (Guardar)</button>
        </div>
    </form>
</div>

</body>
</html>