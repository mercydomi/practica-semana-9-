<?php
declare(strict_types=1);

/** Configuración común de la aplicación de la Semana 09. */
const APP_NAME = 'Laboratorio 09 - PHP';
const MAX_NAME_LENGTH = 80;
const MAX_EMAIL_LENGTH = 120;
const MAX_MESSAGE_LENGTH = 1000;

/* Este archivo se incluye antes de generar cualquier salida HTML. */
if (session_status() === PHP_SESSION_NONE) {
    session_set_cookie_params([
        'httponly' => true,
        'samesite' => 'Lax',
    ]);
    session_start();
}
