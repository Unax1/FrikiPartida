<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.ArmaEspecial" %>
<%
    boolean esMaster = session.getAttribute("esMaster") != null && (boolean) session.getAttribute("esMaster");
    List<ArmaEspecial> listaArmas = (List<ArmaEspecial>) request.getAttribute("listaArmasEspeciales");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FrikiPartida - Armas Especiales</title>
    <style>
        body { 
            background-color: #050505; 
            color: #f0f0f0; 
            font-family: 'Roboto', sans-serif; 
            margin: 0; 
            padding: 20px; 
        }
        .container { 
            max-width: 1250px; 
            margin: 30px auto; 
            background-color: #0f0f0f; 
            border: 2px solid #4d0000; 
            border-radius: 8px; 
            padding: 25px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.9); 
        }
        h1, h2, p { text-align: center; margin: 5px 0; }
        h1 { font-family: 'Cinzel', serif; color: #ffffff; letter-spacing: 2px; text-shadow: 0 0 10px #4d0000; }
        h2 { color: #ff0000; text-transform: uppercase; letter-spacing: 1px; font-size: 1.4rem; margin-bottom: 20px; }
        
        table { border-collapse: collapse; width: 100%; margin: 20px auto; background-color: #0f0f0f; }
        th, td { border: 1px solid #333; padding: 12px 10px; text-align: center; }
        th { background-color: #1a0000; color: #ff0000; text-transform: uppercase; font-size: 0.9rem; border-bottom: 2px solid #990000; }
        tr:hover { background-color: #151515; }
        tr:nth-child(even) { background-color: #0a0a0a; }
        
        .columna-efecto {
            max-width: 130px;
            text-align: left;
        }

        .efecto-recortado {
            display: block;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            cursor: pointer;
            color: #b2ff59;
            font-style: italic;
            transition: all 0.2s ease;
        }
        
        .efecto-recortado:hover {
            color: #ff0000;
            text-shadow: 0 0 5px rgba(255,0,0,0.5);
        }

        .efecto-expandido {
            white-space: normal;
            overflow: visible;
            display: block;
            background-color: #1a0000;
            border: 1px solid #ff0000;
            padding: 8px;
            border-radius: 4px;
            color: #fff;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0,0,0,0.9);
        }

        .btn { padding: 6px 10px; border: none; cursor: pointer; border-radius: 4px; font-size: 12px; text-decoration: none; display: inline-block; font-weight: bold; text-transform: uppercase; }
        .btn-modificar { background-color: #1565c0; color: white; margin-right: 5px; }
        .btn-borrar { background-color: #4d0000; color: #ff0000; border: 1px solid #990000; }
        .btn-insertar { background-color: #990000; color: white; padding: 12px 25px; font-size: 15px; }
        .btn-volver { background-color: #1a0000; color: #b0b0b0; border: 1px solid #4d0000; margin-left: 10px; padding: 12px 25px; }
        .acciones { text-align: center; margin-top: 30px; }
        .badge-partida { background-color: #1a0000; color: #ff0000; padding: 4px 8px; border: 1px solid #4d0000; border-radius: 4px; }
        .badge-rareza { background-color: #2a0033; color: #d500f9; padding: 4px 8px; border: 1px solid #aa00ff; border-radius: 4px; font-weight: bold; }
        .bonificador { color: #00e676; font-weight: bold; font-size: 1.1rem; }
        .restricted { color: #555; font-style: italic; font-size: 0.85rem; }
    </style>
</head>
<body>
<div class="container">
    <h1>Armería del Reino</h1>
    <h2>Artefactos y Armas Especiales</h2>

    <% if (listaArmas != null && !listaArmas.isEmpty()) { %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Rareza</th>
                    <th>Bono</th>
                    <th style="width: 150px;">Efecto Mágico</th> <th>Daño</th>
                    <th>Dado</th>
                    <th>Precio</th>
                    <th>Peso</th>
                    <th>Propiedades</th>
                    <th>Campaña</th>
                    <th>Gestión</th>
                </tr>
            </thead>
            <tbody>
                <% for (ArmaEspecial arma : listaArmas) { %>
                    <tr>
                        <td><%= arma.getId() %></td>
                        <td style="font-weight: bold; color: #fff;"><%= arma.getNombre() %></td>
                        <td><span class="badge-rareza"><%= arma.getRareza() %></span></td>
                        <td><span class="bonificador">+<%= arma.getBonificador() %></span></td>
                        
                        <td class="columna-efecto">
                            <span class="efecto-recortado" onclick="conmutarTexto(this)" title="Haz clic para expandir o colapsar">
                                <%= arma.getEfectoMagico() %>
                            </span>
                        </td>
                        
                        <td><%= arma.getTipoDano() %></td>
                        <td style="color: #ff1744; font-weight: bold;"><%= arma.getDado() %></td>
                        <td><%= arma.getPrecio() %></td>
                        <td><%= arma.getPeso() %> kg</td>
                        <td style="font-size: 0.85rem; color: #aaa;"><%= arma.getPropiedades() %></td>
                        <td><span class="badge-partida"><%= arma.getNomPartida() %></span></td>
                        <td>
                            <% if (esMaster) { %>
                                <a class="btn btn-modificar" href="modificarArmaEspecial?IDArma=<%= arma.getId() %>">Modificar</a>
                                <a class="btn btn-borrar" href="eliminarArmaEspecial?IDArma=<%= arma.getId() %>"
                                   onclick="return confirm('¿Deseas destruir este artefacto mágico?');">Destruir</a>
                            <% } else { %>
                                <span class="restricted">Solo DM</span>
                            <% } %>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } else { %>
        <p style="background: #0a0a0a; border: 1px solid #333; padding: 20px; border-radius: 4px; color: #888;">
            No hay artefactos especiales guardados en las bóvedas en este momento.
        </p>
    <% } %>

    <div class="acciones">
        <% if (esMaster) { %>
            <a class="btn btn-insertar" href="armaEspecialInsertar.jsp">Forjar Arma Especial</a>
        <% } %>
        <a class="btn btn-volver" href="index.jsp">Volver al Panel</a>
    </div>
</div>

<script type="text/javascript">
function conmutarTexto(elemento) {
    if (elemento.classList.contains('efecto-recortado')) {
        elemento.classList.remove('efecto-recortado');
        elemento.classList.add('efecto-expandido');
    } else {
        elemento.classList.remove('efecto-expandido');
        elemento.classList.add('efecto-recortado');
    }
}
</script>
</body>
</html>