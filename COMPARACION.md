# Comparación entre PHP y JSP

En esta práctica se utilizaron PHP y JSP para procesar formularios desde el servidor. Aunque ambas tecnologías permiten desarrollar aplicaciones web dinámicas, presentan diferencias en su funcionamiento y configuración.

| Característica | PHP | JSP |
| --- | --- | --- |
| Lenguaje | PHP | Java |
| Servidor utilizado | Apache (XAMPP) | Apache Tomcat |
| Ciclo de vida | Interpretación y ejecución de scripts por solicitud | Traducción a servlet, compilación y ejecución |
| Memoria | Principalmente por solicitud | Gestionada por la JVM |
| Sesiones | `$_SESSION` | `session.setAttribute()` |
| Despliegue | Archivos PHP en `htdocs` | Aplicación JSP en `webapps` |
| Escalabilidad | Depende de arquitectura y configuración | Depende de arquitectura y configuración |

Ambas tecnologías permitieron procesar los formularios correctamente. PHP resultó más sencillo de configurar mediante XAMPP, mientras que JSP necesitó configurar Java y Tomcat. Con esta práctica se comprendió mejor cómo funciona el procesamiento de solicitudes web del lado del servidor.
