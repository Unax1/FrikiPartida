<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Partida" %>
<%
    boolean esMaster = session.getAttribute("esMaster") != null && (boolean) session.getAttribute("esMaster");
    List<Partida> listaPartidas = (List<Partida>) request.getAttribute("listaPartidas");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tablón de Anuncios - Partidas</title>
    <style>
        body { background-color: #121212; color: #e0e0e0; font-family: 'Segoe UI', sans-serif; margin: 0; padding: 20px; }
        .container { max-width: 1100px; margin: 30px auto; background-color: #1c1c1c; border: 2px solid #b71c1c; border-radius: 8px; padding: 25px; box-shadow: 0 4px 15px rgba(0,0,0,0.5); }
        h1, h2, p { text-align: center; margin: 5px 0; }
        h1 { color: #ffffff; }
        h2 { color: #e53935; text-transform: uppercase; letter-spacing: 1px; font-size: 1.4rem; margin-bottom: 20px; }
        table { border-collapse: collapse; width: 100%; margin: 20px auto; background-color: #222; }
        th, td { border: 1px solid #333; padding: 12px 15px; text-align: center; }
        th { background-color: #171717; color: #e53935; text-transform: uppercase; font-size: 0.9rem; letter-spacing: 0.5px; }
        tr:hover { background-color: #2a2a2a; }
        .btn { padding: 8px 15px; border: none; cursor: pointer; border-radius: 4px; font-size: 13px; text-decoration: none; display: inline-block; font-weight: bold; text-transform: uppercase; transition: all 0.3s ease; }
        
        /* CAMBIO: Negro Obsidiana aplicado */
        .btn-modificar { 
            background-color: #151515; 
            color: #b0b0b0; 
            border: 1px solid #444; 
            margin-right: 5px; 
        }
        .btn-modificar:hover { 
            background-color: #ffffff; 
            color: #000000; 
            border-color: #ffffff; 
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.4); 
        }
        
        .btn-borrar { background-color: #b71c1c; color: white; }
        .btn-borrar:hover { background-color: #d32f2f; }
        .btn-insertar { background-color: #b71c1c; color: white; padding: 12px 25px; font-size: 15px; }
        .btn-insertar:hover { background-color: #d32f2f; }
        .acciones { text-align: center; margin: 30px 0; }
        .mensaje-exito { color: #4caf50; font-weight: bold; }
        .mensaje-error { color: #ff8a80; font-weight: bold; }
        .badge-info { background-color: #37474f; color: #ffb300; padding: 4px 8px; border-radius: 4px; font-weight: bold; font-size: 0.85rem; }
        .restricted { color: #757575; font-style: italic; font-size: 0.85rem; }
    </style>
</head>
<body>
<div class="container">
    <h1>Sistema de Gestión de Partidas</h1>
    <h2>Listado de Partidas</h2>

    <% if (request.getAttribute("mensaje") != null) { %>
        <p class="<%= "exito".equals(request.getAttribute("tipo")) ? "mensaje-exito" : "mensaje-error" %>">
            <%= request.getAttribute("mensaje") %>
        </p>
    <% } %>

    <% if (listaPartidas != null && !listaPartidas.isEmpty()) { %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre de la Partida</th>
                    <th>Dungeon Master</th>
                    <th>Estado</th>
                    <th>Sesiones</th>
                    <th>Dificultad</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% for (Partida par : listaPartidas) { %>
                    <tr>
                        <td><%= par.getId() %></td>
                        <td style="font-weight: bold; color: #fff;"><%= par.getNombre() %></td>
                        <td><%= par.getDm() %></td>
                        <td><%= par.getEstado() %></td>
                        <td style="color: #ff8a80; font-weight: bold;"><%= par.getCantSesiones() %></td>
                        <td><span class="badge-info"><%= par.getDificultad() %></span></td>
                        <td>
                            <% if (esMaster) { %>
                                <a class="btn btn-modificar" href="modificarPartida?IDPartida=<%= par.getId() %>">Modificar</a>
                                <a class="btn btn-borrar" href="eliminarPartida?IDPartida=<%= par.getId() %>"
                                   onclick="return confirm('¿Está seguro de que desea disolver esta mesa de campaña?');">Borrar</a>
                            <% } else { %>
                                <span class="restricted">Solo DM</span>
                            <% } %>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } else { %>
        <p><strong>No hay partidas registradas en el tablón.</strong></p>
    <% } %>

    <div class="acciones">
        <% if (esMaster) { %>
            <a class="btn btn-insertar" href="partidaInsertar.jsp">Insertar Nueva Partida</a>
        <% } %>
        <a class="btn" href="index.jsp" style="background-color: #424242; color: white; margin-left: 10px;">Volver al Menú</a>
    </div>
</div>
</body>
</html>