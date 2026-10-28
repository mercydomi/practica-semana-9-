<?php
declare(strict_types=1);

require_once __DIR__ . '/config.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Allow: POST');
    http_response_code(405);
    exit('Método no permitido. Utilice el formulario para enviar una solicitud POST.');
}

/** Escapa texto para incluirlo de forma segura en una página HTML. */
function escapeHtml(string $value): string
{
    return htmlspecialchars($value, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
}

/* filter_input evita leer directamente valores de $_POST. */
$nombreInput = filter_input(INPUT_POST, 'nombre', FILTER_UNSAFE_RAW, FILTER_REQUIRE_SCALAR);
$correoInput = filter_input(INPUT_POST, 'correo', FILTER_VALIDATE_EMAIL, FILTER_REQUIRE_SCALAR);
$mensajeInput = filter_input(INPUT_POST, 'mensaje', FILTER_UNSAFE_RAW, FILTER_REQUIRE_SCALAR);

$nombre = is_string($nombreInput) ? trim($nombreInput) : '';
$correo = is_string($correoInput) ? trim($correoInput) : '';
$mensaje = is_string($mensajeInput) ? trim($mensajeInput) : '';
$errores = [];

if ($nombre === '') {
    $errores[] = 'El nombre es obligatorio.';
} elseif (mb_strlen($nombre) > MAX_NAME_LENGTH) {
    $errores[] = 'El nombre no puede superar los ' . MAX_NAME_LENGTH . ' caracteres.';
}

if ($correo === '') {
    $errores[] = 'Debe ingresar un correo electrónico válido.';
} elseif (mb_strlen($correo) > MAX_EMAIL_LENGTH) {
    $errores[] = 'El correo electrónico es demasiado largo.';
}

if ($mensaje === '') {
    $errores[] = 'El mensaje es obligatorio.';
} elseif (mb_strlen($mensaje) > MAX_MESSAGE_LENGTH) {
    $errores[] = 'El mensaje no puede superar los ' . MAX_MESSAGE_LENGTH . ' caracteres.';
}

$esValido = $errores === [];
if ($esValido) {
    $_SESSION['nombre_usuario'] = $nombre;
    http_response_code(200);
} else {
    http_response_code(422);
}
?><!doctype html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex">
    <title><?= $esValido ? 'Formulario procesado' : 'Corrija el formulario' ?> | <?= escapeHtml(APP_NAME) ?></title>
    <style>
        :root { --ink:#172033; --surface:#fff; --border:#d8e0eb; --primary:#1d4ed8; --success:#087443; --danger:#b42318; }
        * { box-sizing:border-box; }
        body { min-height:100vh; margin:0; display:grid; place-items:center; padding:2rem 1rem; font-family:Arial,sans-serif; color:var(--ink); background:linear-gradient(135deg,#e0edff,#f1f5f9); }
        main { width:min(100%,680px); padding:clamp(1.5rem,5vw,3rem); background:var(--surface); border:1px solid var(--border); border-radius:20px; box-shadow:0 18px 45px rgba(23,32,51,.12); }
        h1 { margin-top:1.25rem; } p,li { line-height:1.6; } .notice { padding:1rem 1.1rem; border-radius:9px; } .success { color:var(--success); background:#e9f9ef; } .error { color:var(--danger); background:#fff0ef; } ul { margin-bottom:0; padding-left:1.25rem; }
        dl { display:grid; grid-template-columns:max-content 1fr; gap:.75rem 1rem; margin:1.5rem 0; } dt { font-weight:700; } dd { margin:0; overflow-wrap:anywhere; }
        .message { white-space:pre-wrap; } a { display:inline-block; padding:.85rem 1.25rem; border-radius:9px; color:#fff; background:var(--primary); text-decoration:none; font-weight:700; }
    </style>
</head>
<body>
    <main>
        <?php if ($esValido): ?>
            <div class="notice success"><strong>Formulario enviado correctamente.</strong> Se guardó tu nombre en la sesión actual.</div>
            <h1>Datos procesados</h1>
            <dl>
                <dt>Nombre</dt><dd><?= escapeHtml($nombre) ?></dd>
                <dt>Correo electrónico</dt><dd><?= escapeHtml($correo) ?></dd>
                <dt>Mensaje</dt><dd class="message"><?= escapeHtml($mensaje) ?></dd>
            </dl>
        <?php else: ?>
            <div class="notice error">
                <strong>No se pudo procesar el formulario.</strong>
                <ul>
                    <?php foreach ($errores as $error): ?>
                        <li><?= escapeHtml($error) ?></li>
                    <?php endforeach; ?>
                </ul>
            </div>
            <h1>Revise los datos ingresados</h1>
            <p>Regrese al formulario, corrija los campos indicados y vuelva a enviarlo.</p>
        <?php endif; ?>
        <a href="index.html">Volver al formulario</a>
    </main>
</body>
</html>
