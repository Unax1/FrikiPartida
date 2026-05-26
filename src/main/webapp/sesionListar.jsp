<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Sesion" %>
<%
    boolean esMaster = session.getAttribute("esMaster") != null && (boolean) session.getAttribute("esMaster");
    List<Sesion> listaSesiones = (List<Sesion>) request.getAttribute("listaSesiones");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FrikiPartida - Diario de Sesiones</title>
    <style>
        body { 
            background-color: #050505; 
            color: #f0f0f0; 
            font-family: 'Roboto', sans-serif; 
            margin: 0; 
            padding: 20px; 
        }
        .container { 
            max-width: 1100px; 
            margin: 30px auto; 
            background-color: #0f0f0f; 
            border: 2px solid #4d0000; 
            border-radius: 8px; 
            padding: 25px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.9); 
        }
        h1, h2, p { 
            text-align: center; 
            margin: 5px 0; 
        }
        h1 { 
            font-family: 'Cinzel', serif;
            color: #ffffff; 
            letter-spacing: 2px;
            text-shadow: 0 0 10px #4d0000;
        }
        h2 { 
            color: #ff0000; 
            text-transform: uppercase; 
            letter-spacing: 1px; 
            font-size: 1.4rem; 
            margin-bottom: 20px; 
        }
        
        table { 
            border-collapse: collapse; 
            width: 100%; 
            margin: 20px auto; 
            background-color: #0f0f0f; 
        }
        th, td { 
            border: 1px solid #333; 
            padding: 12px 15px; 
            text-align: center; 
        }
        th { 
            background-color: #1a0000; 
            color: #ff0000; 
            text-transform: uppercase; 
            font-size: 0.9rem; 
            letter-spacing: 0.5px; 
            border-bottom: 2px solid #990000;
        }
        tr:hover { 
            background-color: #151515; 
        }
        tr:nth-child(even) {
            background-color: #0a0a0a;
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
            transition: all 0.3s ease; 
        }
        .btn:active {
            transform: scale(0.98);
        }

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
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.4)

        }
        
        .btn-borrar { 
            background-color: #4d0000; 
            color: #ff0000; 
            border: 1px solid #990000;
        }
        .btn-borrar:hover { 
            background-color: #990000; 
            color: white;
            box-shadow: 0 0 8px #ff0000;
        }
        .btn-insertar { 
            background-color: #990000; 
            color: white; 
            padding: 12px 25px; 
            font-size: 15px; 
            box-shadow: 0 4px 15px rgba(153, 0, 0, 0.4);
        }
        .btn-insertar:hover { 
            background-color: #ff0000; 
            box-shadow: 0 0 15px #ff0000;
        }
        .btn-volver {
            background-color: #1a0000; 
            color: #b0b0b0; 
            border: 1px solid #4d0000;
            margin-left: 10px;
            padding: 12px 25px;
            font-size: 15px;
        }
        .btn-volver:hover {
            background-color: #4d0000;
            color: white;
        }
        
        .acciones { 
            text-align: center; 
            margin: 30px 0 10px 0; 
        }
        .mensaje-exito { 
            color: #4caf50; 
            font-weight: bold; 
            text-shadow: 0 0 5px rgba(76, 175, 80, 0.3);
        }
        .mensaje-error { 
            color: #ff0000; 
            font-weight: bold; 
            text-shadow: 0 0 5px rgba(255, 0, 0, 0.3);
        }
        .badge-partida { 
            background-color: #1a0000; 
            color: #ff0000; 
            padding: 4px 8px; 
            border: 1px solid #4d0000;
            border-radius: 4px; 
            font-size: 0.85rem; 
            font-weight: bold;
        }
        .restricted { 
            color: #555555; 
            font-style: italic; 
            font-size: 0.85rem; 
        }
        .taberna-vacia {
            background-color: #0f0f0f;
            border: 1px solid #333;
            padding: 20px;
            border-radius: 4px;
            color: #888;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Sistema de Gestión de Sesiones</h1>
    <h2>Crónicas de las Campañas</h2>

    <% if (request.getAttribute("mensaje") != null) { %>
        <p class="<%= "exito".equals(request.getAttribute("tipo")) ? "mensaje-exito" : "mensaje-error" %>">
            <%= request.getAttribute("mensaje") %>
        </p>
    <% } %>

    <% if (listaSesiones != null && !listaSesiones.isEmpty()) { %>
        <table>
            <thead>
                <tr>
                    <th>Nº de Sesión</th>
                    <th>Nombre de la Sesión</th>
                    <th>Participantes</th>
                    <th>Fecha</th>
                    <th>Duración</th>
                    <th>Campaña / Mesa</th>
                    <th>Gestión</th>
                </tr>
            </thead>
            <tbody>
                <% for (Sesion ses : listaSesiones) { %>
                    <tr>
                        <td><%= ses.getNumSesion() %></td>
                        <td style="font-weight: bold; color: #fff;"><%= ses.getNombre() %></td>
                        <td><%= ses.getCantidad() %></td>
                        <td style="color: #b0b0b0;"><%= ses.getFecha() %></td>
                        <td style="color: #ff0000; font-weight: bold;"><%= ses.getDuracion() %> h</td>
                        <td><span class="badge-partida"><%= ses.getNomPartida() %></span></td>
                        <td>
                            <% if (esMaster) { %>
                                <a class="btn btn-modificar" href="modificarSesion?id=<%= ses.getNumSesion() %>&partida=<%= ses.getNomPartida() %>">Modificar</a>
                                <a class="btn btn-borrar" href="borrarSesion?id=<%= ses.getNumSesion() %>&partida=<%= ses.getNomPartida() %>"
                                   onclick="return confirm('¿Seguro que deseas borrar permanentemente este registro de sesión?');">Borrar</a>
                            <% } else { %>
                                <span class="restricted">Solo DM</span>
                            <% } %>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } else { %>
        <p class="taberna-vacia"><strong>Los libros de crónicas están vacíos. No hay sesiones registradas todavía.</strong></p>
    <% } %>

    <div class="acciones">
        <% if (esMaster) { %>
            <a class="btn btn-insertar" href="sesionInsertar.jsp">Planificar Nueva Sesión</a>
        <% } %>
        <a class="btn btn-volver" href="index.jsp">Volver al Menú Principal</a>
    </div>
</div>
</body>
</html>