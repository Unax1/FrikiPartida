<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Personaje" %>
<%
    boolean esMaster = session.getAttribute("esMaster") != null && (boolean) session.getAttribute("esMaster");
    List<Personaje> listaPersonajes = (List<Personaje>) request.getAttribute("listaPersonajes");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Taberna de Aventureros - Personajes</title>
    <style>
        body { 
            background-color: #121212; 
            color: #e0e0e0; 
            font-family: 'Segoe UI', sans-serif; 
            margin: 0; 
            padding: 20px; 
        }
        .container { 
            max-width: 1100px; 
            margin: 30px auto; 
            background-color: #1c1c1c; 
            border: 2px solid #b71c1c; 
            border-radius: 8px; 
            padding: 25px; 
            box-shadow: 0 4px 15px rgba(0,0,0,0.5); 
        }
        h1, h2, p { 
            text-align: center; 
            margin: 5px 0; 
        }
        h1 { 
            color: #ffffff; 
        }
        h2 { 
            color: #e53935; 
            text-transform: uppercase; 
            letter-spacing: 1px; 
            font-size: 1.4rem; 
            margin-bottom: 20px; 
        }
        
        table { 
            border-collapse: collapse; 
            width: 100%; 
            margin: 20px auto; 
            background-color: #222; 
        }
        th, td { 
            border: 1px solid #333; 
            padding: 12px 15px; 
            text-align: center; 
        }
        th { 
            background-color: #171717; 
            color: #e53935; 
            text-transform: uppercase; 
            font-size: 0.9rem; 
            letter-spacing: 0.5px; 
        }
        tr:hover { 
            background-color: #2a2a2a; 
        }
        
        .btn { 
            padding: 8px 15px; 
            border: none; 
            cursor: pointer; 
            border-radius: 4px; 
            font-size: 13px; 
            text-decoration: none; 
            display: inline-block; 
            font-weight: bold; 
            text-transform: uppercase; 
            transition: background 0.3s, transform 0.1s; 
        }
        .btn:active {
            transform: scale(0.98);
        }
        .btn-modificar { 
            background-color: #0d47a1; 
            color: white; 
            margin-right: 5px; 
        }
        .btn-modificar:hover { 
            background-color: #1565c0; 
        }
        .btn-borrar { 
            background-color: #b71c1c; 
            color: white; 
        }
        .btn-borrar:hover { 
            background-color: #d32f2f; 
        }
        .btn-insertar { 
            background-color: #b71c1c; 
            color: white; 
            padding: 12px 25px; 
            font-size: 15px; 
        }
        .btn-insertar:hover { 
            background-color: #d32f2f; 
        }
        .btn-volver {
            background-color: #424242; 
            color: white; 
            margin-left: 10px;
            padding: 12px 25px;
            font-size: 15px;
        }
        .btn-volver:hover {
            background-color: #616161;
        }
        
        .acciones { 
            text-align: center; 
            margin: 30px 0 10px 0; 
        }
        .mensaje-exito { 
            color: #4caf50; 
            font-weight: bold; 
        }
        .mensaje-error { 
            color: #ff8a80; 
            font-weight: bold; 
        }
        .badge-partida { 
            background-color: #37474f; 
            color: #eceff1; 
            padding: 4px 8px; 
            border-radius: 4px; 
            font-size: 0.85rem; 
            font-weight: bold;
        }
        .restricted { 
            color: #757575; 
            font-style: italic; 
            font-size: 0.85rem; 
        }
        .taberna-vacia {
            background-color: #222;
            border: 1px solid #333;
            padding: 20px;
            border-radius: 4px;
            color: #b0bec5;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Sistema de Gestión de Personajes</h1>
    <h2>Héroes registrados en el Reino</h2>

    <% if (request.getAttribute("mensaje") != null) { %>
        <p class="<%= "exito".equals(request.getAttribute("tipo")) ? "mensaje-exito" : "mensaje-error" %>">
            <%= request.getAttribute("mensaje") %>
        </p>
    <% } %>

    <% if (listaPersonajes != null && !listaPersonajes.isEmpty()) { %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre del Personaje</th>
                    <th>Jugador</th>
                    <th>Nivel</th>
                    <th>Campaña / Mesa</th>
                    <th>Gestión</th>
                </tr>
            </thead>
            <tbody>
                <% for (Personaje pj : listaPersonajes) { %>
                    <tr>
                        <td><%= pj.getId() %></td>
                        <td style="font-weight: bold; color: #fff;"><%= pj.getNombrePJ() %></td>
                        <td><%= pj.getNombreJugador() %></td>
                        <td style="color: #ff8a80; font-weight: bold;">Nivel <%= pj.getNivel() %></td>
                        <td><span class="badge-partida"><%= pj.getNomPartida() %></span></td>
                        <td>
                            <% if (esMaster) { %>
                                <a class="btn btn-modificar" href="modificarPersonaje?id=<%= pj.getId() %>">Modificar</a>
                                <a class="btn btn-borrar" href="eliminarPersonaje?id=<%= pj.getId() %>"
                                   onclick="return confirm('¿Seguro que deseas desterrar a este héroe del reino? (Se borrará su ficha)');">Borrar</a>
                            <% } else { %>
                                <span class="restricted">Solo DM</span>
                            <% } %>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } else { %>
        <p class="taberna-vacia"><strong>La taberna está vacía. No hay aventureros creados todavía.</strong></p>
    <% } %>

    <div class="acciones">
        <a class="btn btn-insertar" href="personajeInsertar.jsp">Crear Nuevo Personaje</a>
        <a class="btn btn-volver" href="index.jsp">Volver al Menú</a>
    </div>
</div>
</body>
</html>