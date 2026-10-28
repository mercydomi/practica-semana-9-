<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Formulario JSP de la práctica Semana 09.">
    <title>Laboratorio 09 | JSP</title>
    <style>
        :root { --ink:#172033; --muted:#5d6678; --surface:#fff; --background:#f1f5f9; --primary:#1d4ed8; --primary-dark:#1e40af; --border:#d8e0eb; }
        * { box-sizing:border-box; }
        body { min-height:100vh; margin:0; display:grid; place-items:center; padding:2rem 1rem; font-family:Arial,sans-serif; color:var(--ink); background:linear-gradient(135deg,#e0edff,var(--background)); }
        main { width:min(100%,680px); padding:clamp(1.5rem,5vw,3rem); background:var(--surface); border:1px solid rgba(216,224,235,.9); border-radius:20px; box-shadow:0 18px 45px rgba(23,32,51,.12); }
        .eyebrow { margin:0 0 .75rem; color:var(--primary); font-size:.8rem; font-weight:700; letter-spacing:.08em; text-transform:uppercase; }
        h1 { margin:0; font-size:clamp(1.8rem,5vw,2.55rem); }
        .intro { margin:.85rem 0 2rem; color:var(--muted); line-height:1.6; }
        form { display:grid; gap:1.25rem; } .field { display:grid; gap:.45rem; } label { font-weight:700; }
        input,textarea { width:100%; padding:.8rem .9rem; border:1px solid var(--border); border-radius:9px; color:var(--ink); font:inherit; }
        textarea { min-height:140px; resize:vertical; } input:focus,textarea:focus { outline:3px solid rgba(29,78,216,.2); border-color:var(--primary); }
        .hint,footer { margin:0; color:var(--muted); font-size:.9rem; } footer { margin-top:2rem; font-size:.85rem; }
        button { justify-self:start; padding:.85rem 1.25rem; border:0; border-radius:9px; color:#fff; background:var(--primary); cursor:pointer; font:inherit; font-weight:700; } button:hover { background:var(--primary-dark); }
    </style>
</head>
<body>
    <main>
        <p class="eyebrow">Aplicación JSP · Semana 09</p>
        <h1>Formulario de contacto</h1>
        <p class="intro">Envía tus datos mediante una solicitud HTTP POST procesada por Apache Tomcat.</p>
        <form action="procesar.jsp" method="post">
            <div class="field">
                <label for="nombre">Nombre</label>
                <input id="nombre" name="nombre" type="text" autocomplete="name" maxlength="80" required>
            </div>
            <div class="field">
                <label for="correo">Correo electrónico</label>
                <input id="correo" name="correo" type="email" autocomplete="email" maxlength="120" required>
            </div>
            <div class="field">
                <label for="mensaje">Mensaje</label>
                <textarea id="mensaje" name="mensaje" maxlength="1000" required></textarea>
                <p class="hint">Máximo 1000 caracteres.</p>
            </div>
            <button type="submit">Enviar formulario</button>
        </form>
        <footer>UNCP · Desarrollo de Aplicaciones Web</footer>
    </main>
</body>
</html>
