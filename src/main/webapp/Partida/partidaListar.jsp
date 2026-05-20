<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Partida" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Partidas</title>
    <style>
        table {
            border-collapse: collapse;
            width: 90%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #333;
            padding: 8px 12px;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        h1, h2, p {
            text-align: center;
        }
        .btn {
            padding: 5px 12px;
            margin: 2px;
            border: none;
            cursor: pointer;
            border-radius: 3px;
            font-size: 13px;
            text-decoration: none;
            display: inline-block;
        }
        .btn-modificar {
            background-color: #2196F3;
            color: white;
        }
        .btn-modificar:hover {
            background-color: #1976D2;
        }
        .btn-borrar {
            background-color: #f44336;
            color: white;
        }
        .btn-borrar:hover {
            background-color: #d32f2f;
        }
        .btn-insertar {
            background-color: #4CAF50;
            color: white;
            padding: 10px 25px;
            font-size: 15px;
        }
        .btn-insertar:hover {
            background-color: #388E3C;
        }
        .acciones {
            text-align: center;
            margin: 20px;
        }
        .mensaje-exito {
            color: green;
            text-align: center;
            font-weight: bold;
        }
        .mensaje-error {
            color: red;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Sistema de Gestión de Partidas</h1>
    <h2>Listado de Partidas</h2>

    <% if (request.getAttribute("mensaje") != null) { %>
        <p class="<%= "exito".equals(request.getAttribute("tipo")) ? "mensaje-exito" : "mensaje-error" %>">
            <%= request.getAttribute("mensaje") %>
        </p>
    <% } %>

    <%
        List<Partida> listaPartidas = (List<Partida>) request.getAttribute("listaPartidas");
    %>

    <% if (listaPartidas != null && !listaPartidas.isEmpty()) { %>
        <table>
            <tr>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            <% for (Partida par : listaPartidas) { %>
                <tr>
                    <td><%= par.getId() %></td>
                    <td><%= par.getNombre() %></td>
                    <td><%= par.getDm() %></td>
                    <td><%= par.getEstado() %></td>
                    <td><%= par.getCantSesiones() %></td>
                    <td><%= par.getDificultad() %></td>
                    <td>
                        <a class="btn btn-modificar" href="modificarPartida?id=<%= par.getId() %>">Modificar</a>
                        <a class="btn btn-borrar" href="borrarPartida?id=<%= par.getId() %>"
                           onclick="return confirm('¿Está seguro de que desea borrar este estudiante?');">Borrar</a>
                    </td>
                </tr>
            <% } %>
        </table>
    <% } else { %>
        <p><strong>No hay partidas registradas.</strong></p>
    <% } %>

    <div class="acciones">
        <a class="btn btn-insertar" href="partidaInsertar.jsp">Insertar Nueva Partida</a>
    </div>
</body>
</html>