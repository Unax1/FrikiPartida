<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FrikiPartida - El Lore de D&D</title>
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
        .lore-section {
            line-height: 1.7;
            color: #ccc;
            margin-bottom: 30px;
            text-align: justify;
        }
        .lore-section p {
            margin-bottom: 15px;
        }
        .grid-manuales {
            display: flex;
            gap: 20px;
            justify-content: space-between;
            margin: 25px 0;
            flex-wrap: wrap;
        }
        .tarjeta-manual {
            flex: 1;
            min-width: 240px;
            background-color: #151515;
            border: 1px solid #333;
            border-radius: 6px;
            padding: 15px;
            text-align: center;
            transition: border-color 0.3s;
        }
        .tarjeta-manual:hover {
            border-color: #ff0000;
        }
        .tarjeta-manual h3 {
            color: #ff8a80;
            margin-top: 0;
            font-size: 1.1rem;
        }
        .tarjeta-manual p {
            font-size: 0.9rem;
            color: #aaa;
        }
        .enlaces-utiles {
            background-color: #0a0a0a;
            border-left: 4px solid #990000;
            padding: 15px 20px;
            margin: 30px 0;
            border-radius: 0 6px 6px 0;
        }
        .enlaces-utiles h4 {
            margin: 0 0 10px 0;
            color: #fff;
            text-transform: uppercase;
            font-size: 0.95rem;
            letter-spacing: 0.5px;
        }
        .enlaces-utiles ul {
            margin: 0;
            padding-left: 20px;
        }
        .enlaces-utiles li {
            margin-bottom: 8px;
        }
        .enlaces-utiles a {
            color: #b2ff59;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.2s;
        }
        .enlaces-utiles a:hover {
            color: #ff0000;
            text-shadow: 0 0 5px rgba(255,0,0,0.3);
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
        /* Estilo Negro Obsidiana unificado */
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
    <h1>Dungeons & Dragons</h1>
    <h2>Compendio del Aventurero</h2>

    <div class="lore-section">
        <p>
            <strong>Dungeons & Dragons (D&D)</strong> es el juego de rol de fantasía heroica por excelencia. Diseñado originalmente por Gary Gygax y Dave Arneson, el juego permite a los jugadores encarnar a intrépidos héroes (guerreros, magos, pícaros o clérigos) que exploran ruinas antiguas, combaten monstruos letales y desentrañan conspiraciones en mundos mágicos.
        </p>
        <p>
            A través de la narración conjunta, un jugador asume el papel del <strong>Dungeon Master (DM)</strong>, quien actúa como árbitro, arquitecto del mundo y voz del destino, guiando la trama mientras los dados (especialmente el icónico dado de 20 caras o <em>d20</em>) determinan el éxito o el fatídico fracaso de cada hazaña.
        </p>
    </div>

    <h2 style="font-size: 1.1rem; text-align: left; border-bottom: 1px solid #333; padding-bottom: 5px;">Los Tres Pilares Fundamentales</h2>
    <div class="grid-manuales">
        <div class="tarjeta-manual">
            <h3>Manual del Jugador</h3>
            <p>La referencia esencial para todo aventurero. Contiene las reglas de creación de personajes, razas, clases, trasfondos y el grimorio completo de conjuros.</p>
        </div>
        <div class="tarjeta-manual">
            <h3>Guía del Dungeon Master</h3>
            <p>El libro de consulta para tejer mundos. Ofrece herramientas de creación de campañas, trampas, reglas opcionales y los codiciados objetos mágicos.</p>
        </div>
        <div class="tarjeta-manual">
            <h3>Manual de Monstruos</h3>
            <p>Una horda de desafíos listos para saltar a la mesa. Desde el clásico cubilete gelatinoso hasta los temibles y antiguos dragones cromáticos.</p>
        </div>
    </div>

    <div class="enlaces-utiles">
        <h4>Biblioteca del Reino & Enlaces Oficiales</h4>
        <ul>
            <li><a href="https://dnd.wizards.com" target="_blank">Sitio Web Oficial de D&D (Wizards of the Coast)</a> - Anuncios, novedades y recursos oficiales del juego.</li>
            <li><a href="https://www.dndbeyond.com" target="_blank">D&D Beyond</a> - La herramienta digital oficial para gestionar fichas de personajes y acceder a los manuales optimizados.</li>
            <li><a href="https://media.wizards.com/2023/downloads/dnd/SRD_CC_v5.1.pdf" target="_blank">Reglas Básicas Gratuitas (SRD 5.1 PDF)</a> - Documento de Referencia del Sistema bajo Creative Commons para empezar a jugar gratis de inmediato.</li>
        </ul>
    </div>

    <div class="acciones">
        <a class="btn btn-obsidiana" href="index.jsp">Volver al Menú Principal</a>
    </div>
</div>
</body>
</html>