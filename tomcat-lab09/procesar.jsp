<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
    private String escapeHtml(String value) {
        if (value == null) return "";
        return value.replace("&", "&amp;")
                    .replace("<", "&lt;")
                    .replace(">", "&gt;")
                    .replace("\"", "&quot;")
                    .replace("'", "&#39;");
    }
%>
<%
    boolean esPost = "POST".equalsIgnoreCase(request.getMethod());
    String[] errores = new String[0];
    String nombre = "";
    String correo = "";
    String mensaje = "";
    boolean esValido = false;

    if (!esPost) {
        response.setHeader("Allow", "POST");
        response.setStatus(405);
    } else {
        request.setCharacterEncoding("UTF-8");
        String nombreRecibido = request.getParameter("nombre");
        String correoRecibido = request.getParameter("correo");
        String mensajeRecibido = request.getParameter("mensaje");

        nombre = nombreRecibido == null ? "" : nombreRecibido.trim();
        correo = correoRecibido == null ? "" : correoRecibido.trim();
        mensaje = mensajeRecibido == null ? "" : mensajeRecibido.trim();

        java.util.List<String> listaErrores = new java.util.ArrayList<String>();
        if (nombre.isEmpty()) {
            listaErrores.add("El nombre es obligatorio.");
        } else if (nombre.length() > 80) {
            listaErrores.add("El nombre no puede superar los 80 caracteres.");
        }
        if (correo.isEmpty() || !correo.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
            listaErrores.add("Debe ingresar un correo electrónico válido.");
        } else if (correo.length() > 120) {
            listaErrores.add("El correo electrónico es demasiado largo.");
        }
        if (mensaje.isEmpty()) {
            listaErrores.add("El mensaje es obligatorio.");
        } else if (mensaje.length() > 1000) {
            listaErrores.add("El mensaje no puede superar los 1000 caracteres.");
        }

        errores = listaErrores.toArray(new String[0]);
        esValido = errores.length == 0;
        if (esValido) {
            session.setAttribute("nombre_usuario", nombre);
            response.setStatus(200);
        } else {
            response.setStatus(422);
        }
    }
%>
<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex">
    <title><%= esValido ? "Formulario procesado" : "Resultado del formulario" %> | Laboratorio 09 JSP</title>
    <style>
        :root { --ink:#172033; --surface:#fff; --border:#d8e0eb; --primary:#1d4ed8; --success:#087443; --danger:#b42318; }
        * { box-sizing:border-box; } body { min-height:100vh; margin:0; display:grid; place-items:center; padding:2rem 1rem; font-family:Arial,sans-serif; color:var(--ink); background:linear-gradient(135deg,#e0edff,#f1f5f9); }
        main { width:min(100%,680px); padding:clamp(1.5rem,5vw,3rem); background:var(--surface); border:1px solid var(--border); border-radius:20px; box-shadow:0 18px 45px rgba(23,32,51,.12); }
        h1 { margin-top:1.25rem; } p,li { line-height:1.6; } .notice { padding:1rem 1.1rem; border-radius:9px; } .success { color:var(--success); background:#e9f9ef; } .error { color:var(--danger); background:#fff0ef; } ul { margin-bottom:0; padding-left:1.25rem; }
        dl { display:grid; grid-template-columns:max-content 1fr; gap:.75rem 1rem; margin:1.5rem 0; } dt { font-weight:700; } dd { margin:0; overflow-wrap:anywhere; } .message { white-space:pre-wrap; }
        a { display:inline-block; padding:.85rem 1.25rem; border-radius:9px; color:#fff; background:var(--primary); text-decoration:none; font-weight:700; }
    </style>
</head>
<body>
    <main>
        <% if (!esPost) { %>
            <div class="notice error"><strong>Método no permitido.</strong> Utilice el formulario para enviar una solicitud POST.</div>
        <% } else if (esValido) { %>
            <div class="notice success"><strong>Formulario enviado correctamente.</strong> Se guardó tu nombre en la sesión actual.</div>
            <h1>Datos procesados</h1>
            <dl>
                <dt>Nombre</dt><dd><%= escapeHtml(nombre) %></dd>
                <dt>Correo electrónico</dt><dd><%= escapeHtml(correo) %></dd>
                <dt>Mensaje</dt><dd class="message"><%= escapeHtml(mensaje) %></dd>
            </dl>
        <% } else { %>
            <div class="notice error">
                <strong>No se pudo procesar el formulario.</strong>
                <ul>
                    <% for (String error : errores) { %><li><%= escapeHtml(error) %></li><% } %>
                </ul>
            </div>
            <h1>Revise los datos ingresados</h1>
            <p>Regrese al formulario, corrija los campos indicados y vuelva a enviarlo.</p>
        <% } %>
        <a href="index.jsp">Volver al formulario</a>
    </main>
</body>
</html>
