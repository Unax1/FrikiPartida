<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FrikiPartida - ¿Qué es este Reino?</title>
    <style>
        body { 
            background-color: #050505; 
            color: #f0f0f0; 
            font-family: 'Roboto', sans-serif; 
            margin: 0; 
            padding: 20px; 
        }
        .container { 
            max-width: 900px; 
            margin: 30px auto; 
            background-color: #0f0f0f; 
            border: 2px solid #4d0000; 
            border-radius: 8px; 
            padding: 30px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.9); 
        }
        h1, h2 { 
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
            font-size: 1.3rem; 
            margin-bottom: 25px; 
        }
        .intro-text {
            font-size: 1.1rem;
            line-height: 1.7;
            color: #eee;
            text-align: center;
            margin-bottom: 30px;
            font-style: italic;
        }
        .caracteristicas {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 20px;
            margin: 30px 0;
        }
        .bloque-rol {
            background-color: #121212;
            border: 1px solid #333;
            border-radius: 6px;
            padding: 20px;
            position: relative;
        }
        .bloque-rol::before {
            content: "⚔";
            position: absolute;
            top: 15px;
            right: 20px;
            color: #4d0000;
            font-size: 1.5rem;
        }
        .bloque-rol h3 {
            color: #ff8a80;
            margin: 0 0 10px 0;
            text-transform: uppercase;
            font-size: 1.05rem;
            letter-spacing: 0.5px;
        }
        .bloque-rol p {
            margin: 0;
            line-height: 1.6;
            color: #b0b0b0;
            font-size: 0.95rem;
        }
        .nota-master {
            background: linear-gradient(135deg, #1a0000 0%, #0a0a0a 100%);
            border: 1px dashed #990000;
            padding: 20px;
            border-radius: 6px;
            margin: 30px 0;
            text-align: center;
        }
        .nota-master h4 {
            margin: 0 0 8px 0;
            color: #ff0000;
            text-transform: uppercase;
            font-size: 0.9rem;
        }
        .nota-master p {
            margin: 0;
            font-size: 0.9rem;
            color: #ccc;
        }
        .btn { 
            padding: 10px 20px; 
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
        .btn-obsidiana { 
            background-color: #151515; 
            color: #b0b0b0; 
            border: 1px solid #444; 
        }
        .btn-obsidiana:hover { 
            background-color: #ffffff; 
            color: #000000; 
            border-color: #ffffff; 
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.4); 
        }
        .acciones { 
            text-align: center; 
            margin-top: 20px; 
        }
    </style>
</head>
<body>
<div class="container">
    <h1>FrikiPartida</h1>
    <h2>El Forjador de Historias</h2>

    <div class="intro-text">
        "Toda gran campaña de rol merece quedar inmortalizada. FrikiPartida es el grimorio digital donde los dados dejan de rodar y las leyendas se registran."
    </div>

    <h2 style="font-size: 1.1rem; text-align: left; border-bottom: 1px solid #333; padding-bottom: 5px;">¿Qué puedes hacer en esta plataforma?</h2>
    
    <div class="caracteristicas">
        <div class="bloque-rol">
            <h3>Diario de Sesiones</h3>
            <p>Registra las crónicas de cada sesión jugada. Lleva el control exacto de las horas que tus jugadores han pasado explorando mazmorras, la fecha de los encuentros y la cantidad de jugadores que asistieron.</p>
        </div>
        
        <div class="bloque-rol">
            <h3>Control de Campañas y Mesas</h3>
            <p>Gestiona los diferentes grupos de juego que tienes activos. Monitorea el estado actual de las mesas de campaña, su nivel de dificultad y el recuento automático de sesiones acumuladas.</p>
        </div>

        <div class="bloque-rol">
            <h3>Censo de Aventureros</h3>
            <p>Mantén un listado actualizado de los héroes que caminan por el reino. Registra sus nombres, quién los controla en la mesa y el nivel actual de su ficha para evitar sorpresas en el próximo combate.</p>
        </div>

        <div class="bloque-rol">
            <h3>El Arsenal y las Bóvedas Mágicas</h3>
            <p>Consulta la base de datos de equipo disponible. Desde armas comunes y mundanas con sus pesos y costes comerciales, hasta los artefactos especiales de gran rareza imbuidos con devastadores efectos mágicos.</p>
        </div>
    </div>

    <div class="nota-master">
        <h4>Privilegios del Dungeon Master (DM)</h4>
        <p>Los jugadores comunes pueden consultar los registros y la armería del reino para planificar sus estrategias. Sin embargo, solo aquellos usuarios con el rango de <strong>Master</strong> tienen el poder absoluto de alterar el tejido de la realidad: crear nuevos ítems, desterrar personajes, forjar armas mágicas o modificar las crónicas pasadas.</p>
    </div>

    <div class="acciones">
        <a class="btn btn-obsidiana" href="index.jsp">Volver al Menú Principal</a>
    </div>
</div>
</body>
</html>