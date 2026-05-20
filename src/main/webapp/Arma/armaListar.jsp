<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Arma" %>
<%
    boolean esMaster = session.getAttribute("esMaster") != null && (boolean) session.getAttribute("esMaster");
    List<Arma> lista = (List<Arma>) request.getAttribute("listaArmas");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Armería del Reino</title>
    <style>
        body { background-color: #121212; color: #e0e0e0; font-family: 'Segoe UI', sans-serif; margin: 0; padding: 20px; }
        .container { max-width: 1100px; margin: 30px auto; background-color: #1c1c1c; border: 1px solid #333; border-radius: 8px; padding: 25px; box-shadow: 0 4px 15px rgba(0,0,0,0.5); }
        .header-section { display: flex; justify-content: space-between; align-items: center; border-bottom: 2px solid #b71c1c; padding-bottom: 15px; margin-bottom: 20px; }
        h2 { color: #e53935; margin: 0; text-transform: uppercase; letter-spacing: 1px; }
        .btn { padding: 10px 16px; border-radius: 4px; font-weight: bold; text-decoration: none; text-transform: uppercase; font-size: 0.85rem; display: inline-block; transition: all 0.3s; }
        .btn-add { background-color: #b71c1c; color: white; }
        .btn-add:hover { background-color: #d32f2f; }
        .btn-back { background-color: #424242; color: white; }
        .btn-back:hover { background-color: #616161; }
        .btn-edit { background-color: #0d47a1; color: white; padding: 5px 10px; font-size: 0.75rem; margin-right: 5px; }
        .btn-edit:hover { background-color: #1565c0; }
        .btn-delete { background-color: #b71c1c; color: white; padding: 5px 10px; font-size: 0.75rem; }
        .btn-delete:hover { background-color: #d32f2f; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; background-color: #222; }
        th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #333; }
        th { background-color: #171717; color: #e53935; text-transform: uppercase; font-size: 0.9rem; letter-spacing: 0.5px; }
        tr:hover { background-color: #2a2a2a; }
        .propiedades { font-size: 0.85rem; color: #b0bec5; font-style: italic; }
        .badge-partida { background-color: #37474f; color: #eceff1; padding: 3px 6px; border-radius: 3px; font-size: 0.8rem; }
        .restricted { color: #757575; font-style: italic; font-size: 0.85rem; }
    </style>
</head>
<body>

<div class="container">
    <div class="header-section">
        <h2>🗡️ Arsenal de Armas Disponibles</h2>
        <div>
            <a href="index.jsp" class="btn btn-back">Volver al Panel</a>
            <% if (esMaster) { %>
                <a href="armaInsertar.jsp" class="btn btn-add">Añadir Arma</a>
            <% } %>
        </div>
    </div>

    <table>
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Tipo Daño</th>
                <th>Dado</th>
                <th>Precio</th>
                <th>Peso</th>
                <th>Propiedades Especiales</th>
                <th>Campaña</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <% if (lista != null && !lista.isEmpty()) { 
                for (Arma a : lista) { %>
                <tr>
                    <strong><td><%= a.getNombre() %></td></strong>
                    <td><%= a.getTipoDano() %></td>
                    <td><span style="color: #ff8a80; font-weight: bold;"><%= a.getDado() %></span></td>
                    <td><%= a.getPrecio() %></td>
                    <td><%= a.getPeso() %> kg</td>
                    <td class="propiedades"><%= a.getPropiedades() != null ? a.getPropiedades() : "-" %></td>
                    <td><span class="badge-partida"><%= a.getNomPartida() %></span></td>
                    <td>
                        <% if (esMaster) { %>
                            <a href="modificarArmas?IDArma=<%= a.getId() %>" class="btn btn-edit">Editar</a>
                            <a href="eliminarArma?IDArma=<%= a.getId() %>" class="btn btn-delete" onclick="return confirm('¿Seguro que quieres destruir este ítem del inventario?');">Borrar</a>
                        <% } else { %>
                            <span class="restricted">Solo DM</span>
                        <% } %>
                    </td>
                </tr>
            <% } 
            } else { %>
                <tr>
                    <td colspan="8" style="text-align: center; color: #757575;">El cofre está vacío. No hay armas registradas en el reino.</td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

</body>
</html>