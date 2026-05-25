<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FrikiPartida - Tu Forja de Aventuras</title>
    <style type="text/css">

		:root {
		    --color-negro-fondo: #050505;
		    --color-negro-tarjeta: #0f0f0f;
		    --color-rojo-oscuro: #4d0000;
		    --color-rojo-vivo: #990000;
		    --color-rojo-neon: #ff0000;     
		    --color-texto: #f0f0f0;
		    --fuente-titulos: 'Cinzel', serif;
		    --fuente-texto: 'Roboto', sans-serif;
		}
		
		body {
		    margin: 0;
		    padding: 0;
		    background-color: var(--color-negro-fondo);
		    color: var(--color-texto);
		    font-family: var(--fuente-texto);
		    overflow-x: hidden;
		}
		
		.navbar {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    padding: 15px 50px;
		    background-color: var(--color-negro-tarjeta);
		    border-bottom: 3px solid var(--color-rojo-vivo);
		    position: sticky;
		    top: 0;
		    z-index: 1000;
		    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.9);
		}
		
		.logo span {
		    font-family: var(--fuente-titulos);
		    font-size: 1.6rem;
		    font-weight: 900;
		    color: var(--color-rojo-neon);
		    text-shadow: 2px 2px 4px #000;
		    letter-spacing: 1px;
		}
		
		.nav-links {
		    list-style: none;
		    display: flex;
		    align-items: center;
		    margin: 0;
		    padding: 0;
		}
		
		.nav-links li {
		    margin-left: 25px;
		    position: relative;
		}
		
		.nav-links a {
		    text-decoration: none;
		    color: var(--color-texto);
		    font-weight: 500;
		    transition: color 0.3s;
		    font-family: var(--fuente-texto);
		}
		
		.nav-links a:hover, .nav-links a.active {
		    color: var(--color-rojo-neon);
		}
		
		.dropdown-master:hover .dropdown-menu,
		.dropdown-usuario:hover .dropdown-menu {
		    display: block;
		}
		
		.gm-link {
		    color: var(--color-rojo-neon) !important;
		    font-weight: bold !important;
		}

		.user-link {
		    font-weight: bold !important;
		}
		
		.dropdown-menu {
		    display: none;
		    position: absolute;
		    top: 100%;
		    left: 0;
		    background-color: var(--color-negro-fondo);
		    border: 2px solid var(--color-rojo-vivo);
		    list-style: none;
		    padding: 10px 0;
		    min-width: 180px;
		    box-shadow: 0 8px 16px #000;
		    border-radius: 4px;
		}
		
		.dropdown-menu li {
		    margin: 0;
		}
		
		.dropdown-menu a {
		    display: block;
		    padding: 10px 15px;
		    font-size: 0.9rem;
		}
		
		.dropdown-menu a:hover {
		    background-color: var(--color-rojo-oscuro);
		    color: white;
		}
		
		.btn-login {
		    border: 2px solid var(--color-rojo-vivo);
		    padding: 8px 16px;
		    border-radius: 4px;
		    background: linear-gradient(to right, transparent 50%, var(--color-rojo-oscuro) 50%);
		    background-size: 200% 100%;
		    transition: all 0.4s ease;
		}
		
		.btn-login:hover {
		    background-position: -100% 0;
		    color: white !important;
		    box-shadow: 0 0 10px var(--color-rojo-neon);
		}

		.btn-logout {
		    border: 2px solid var(--color-rojo-oscuro);
		    color: var(--color-rojo-neon) !important;
            padding: 8px 16px;
		    border-radius: 4px;
            text-decoration: none;
            font-weight: bold;
		}
		
		.hero {
		    position: relative;
		    height: 70vh;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    text-align: center;
		    background: url('https://images.unsplash.com/photo-1519074069444-1ba4fff16d16?q=80&w=1920') no-repeat center center/cover;
		    border-bottom: 2px solid var(--color-rojo-oscuro);
		}
		
		.hero-overlay {
		    position: absolute;
		    top: 0; left: 0; width: 100%; height: 100%;
		    background: linear-gradient(to bottom, rgba(5,5,5,0.6), var(--color-negro-fondo));
		}
		
		.hero-content {
		    position: relative;
		    z-index: 2;
		    max-width: 800px;
		    padding: 0 20px;
		}
		
		.hero-content h1 {
		    font-family: var(--fuente-titulos);
		    font-size: 4rem;
		    font-weight: 900;
		    color: white;
		    margin: 0 0 10px 0;
		    letter-spacing: 4px;
		    text-shadow: 0 0 20px var(--color-rojo-oscuro), 3px 3px 0px #000;
		}
		
		.subtitle {
		    font-size: 1.3rem;
		    color: #b0b0b0;
		    margin-bottom: 30px;
		}
		
		.hero-buttons .btn-primary {
		    display: inline-block;
		    padding: 12px 30px;
		    background-color: var(--color-rojo-vivo);
		    color: white;
		    text-decoration: none;
		    font-weight: bold;
		    border-radius: 4px;
		    margin-right: 15px;
		    font-family: var(--fuente-titulos);
		    box-shadow: 0 4px 15px rgba(153, 0, 0, 0.6);
		    transition: transform 0.2s, box-shadow 0.2s;
		}
		
		.hero-buttons .btn-primary:hover {
		    transform: translateY(-2px);
		    box-shadow: 0 6px 20px var(--color-rojo-neon);
		}
		
		.hero-buttons .btn-secondary {
		    display: inline-block;
		    padding: 12px 30px;
		    border: 2px solid var(--color-texto);
		    color: var(--color-texto);
		    text-decoration: none;
		    font-weight: bold;
		    border-radius: 4px;
		    font-family: var(--fuente-titulos);
		    transition: all 0.3s;
		}
		
		.hero-buttons .btn-secondary:hover {
		    border-color: var(--color-rojo-neon);
		    color: var(--color-rojo-neon);
		    background-color: rgba(255, 0, 0, 0.05);
		}
		
		.info-section {
		    padding: 60px 20px;
		}
		
		.info-container {
		    max-width: 1100px;
		    margin: 0 auto;
		    display: flex;
		    gap: 30px;
		}
		
		.card {
		    flex: 1;
		    padding: 40px;
		    border-radius: 8px;
		    box-shadow: 0 10px 30px rgba(0,0,0,0.7);
		    border: 2px solid var(--color-rojo-oscuro);
		}
		
		.card h2 {
		    font-family: var(--fuente-titulos);
		    font-size: 1.8rem;
		    margin-top: 0;
		    border-bottom: 2px solid var(--color-rojo-vivo);
		    padding-bottom: 10px;
		}
		
		.bg-dark {
		    background-color: var(--color-negro-tarjeta);
		}
		
		.bg-dark h2 { color: white; }
		
		.bg-red {
		    background: linear-gradient(135deg, #1f0000 0%, var(--color-negro-tarjeta) 100%);
		}
		
		.bg-red h2 { color: var(--color-rojo-neon); }
		
		.card p {
		    line-height: 1.6;
		    color: #cccccc;
		}
		
		.error-banner {
		    background-color: rgba(77, 0, 0, 0.4);
		    border: 2px solid var(--color-rojo-neon);
		    color: white;
		    padding: 15px;
		    text-align: center;
		    font-weight: bold;
		}

		footer {
		    text-align: center;
		    padding: 30px;
		    background-color: var(--color-negro-tarjeta);
		    border-top: 2px solid var(--color-rojo-oscuro);
		    color: #666;
		    font-size: 0.9rem;
		}
    </style>
</head>
<body>

    <%
        Boolean esMaster = (Boolean) session.getAttribute("esMaster");
        String nombreDM = (String) session.getAttribute("usuario");
        boolean esDM = (esMaster != null && esMaster);
    %>

    <% if (request.getAttribute("mensaje") != null) { %>
        <div class="error-banner">
            <%= request.getAttribute("mensaje") %>
        </div>
    <% } %>

    <header class="navbar">
        <div class="logo">
            <span>FrikiPartida</span>
        </div>
        <nav>
            <ul class="nav-links">
                <li><a href="index.jsp" class="active">Inicio</a></li>
                
                <li class="dropdown-usuario">
                    <a href="#" class="user-link">Panel Usuario</a>
                    <ul class="dropdown-menu">
                        <li><a href="listarPersonajes">Mis Personajes</a></li>
                        <li><a href="listarPartidas">Ver Mesas</a></li>
                        <li><a href="listarArmas">Armería Común</a></li>
                        <li><a href="listarArmasEspeciales">Bóveda Mágica</a></li> <li><a href="listarSesiones">Diario de Sesiones</a></li>
                    </ul>
                </li>
                
                <% if (esDM) { %>
                    <li class="dropdown-master">
                        <a href="#" class="gm-link">Panel DM (<%= nombreDM %>)</a>
                        <ul class="dropdown-menu">
                            <li><a href="listarPartidas">Gestionar Partidas</a></li>
                            <li><a href="partidaInsertar.jsp">Crear Partida</a></li>
                            <li><a href="listarArmas">Gestionar Armas</a></li>
                            <li><a href="armaInsertar.jsp">Forjar Armas</a></li>
                            <li><a href="listarArmasEspeciales">Gestionar Artefactos</a></li> <li><a href="armaEspecialInsertar.jsp">Infundir Magia</a></li> <li><a href="listarSesiones">Gestionar Sesiones</a></li>
                            <li><a href="sesionInsertar.jsp">Planificar Sesión</a></li>
                        </ul>
                    </li>
                    <li><a href="logout" class="btn-logout">Abandonar Grupo</a></li>
                <% } else { %>
                    <li><a href="login.jsp" class="btn-login">Login Master</a></li>
                <% } %>
            </ul>
        </nav>
    </header>

    <section class="hero">
        <div class="hero-overlay"></div>
        <div class="hero-content">
            <% if (esDM) { %>
                <h1>MÁSTER DE LA TORRE</h1>
                <p class="subtitle">Bienvenido de nuevo, <%= nombreDM %>. Las crónicas del reino obedecen a tu control.</p>
            <% } else { %>
                <h1>FORJA TU DESTINO</h1>
                <p class="subtitle">Gestiona tus campañas, personajes y artefactos legendarios en un solo lugar.</p>
            <% } %>

            <div class="hero-buttons">
                <% if (esDM) { %>
                    <a href="armaEspecialInsertar.jsp" class="btn-primary">Forjar Artefacto</a> <a href="listarArmasEspeciales" class="btn-secondary">Bóveda Legendaria</a> <% } else { %>
                    <a href="personajeInsertar.jsp" class="btn-primary">Crear Personaje</a>
                    <a href="listarArmasEspeciales" class="btn-secondary">Ver Bóveda Mágica</a> <% } %>
            </div>
        </div>
    </section>

    <main class="info-section">
        <div class="info-container">
            <div class="card bg-dark">
                <h2>¿Qué es ser aventurero?</h2>
                <p>Adéntrate en las campañas activas de tu Dungeon Master, crea personajes y deja volar tu imaginación, desde un hechicero estratega hasta un bárbaro loco, tu destino solo depende de ti, y de tus dados, claro...</p>
            </div>
            
            <div class="card bg-red">
                <h2>¿Qué es ser Dungeon Master?</h2>
                <p>¿Te gusta recibir insultos por parte de tus jugadores? ¿Frustrarles los sueños, hacer que los cumplan, envolverlos en situaciones desde la absurdez hasta la epicidad? Este es tu sitio. El DM (Dungeon Master) es el encargado de planificar la historia que los demás disfrutarán, tiene control sobre la partida y es el encargado de hacer brillar a sus jugadores. </p>
            </div>
        </div>
    </main>

    <footer>
        <p>&copy; 2026 FrikiPartida. Que tus 20s sean naturales y tus pifias memorables.</p>
    </footer>

</body>
</html>