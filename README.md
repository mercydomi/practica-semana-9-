# Práctica Semana 09 – PHP y JSP

## Descripción

En esta práctica se trabajó con PHP y JSP para comprender cómo funcionan las aplicaciones web del lado del servidor. Se configuraron los servidores Apache y Tomcat, se implementaron formularios y se realizaron pruebas de funcionamiento.

## Herramientas utilizadas

- Visual Studio Code
- PHP 8.2
- XAMPP
- Java JDK 21
- Apache Tomcat 10.1

## Funcionamiento

Se crearon dos formularios: uno en PHP y otro en JSP. Ambos permiten ingresar nombre, correo electrónico y mensaje, validar los datos recibidos y mostrar los resultados. También se utiliza una sesión para guardar el nombre del usuario.

## Ejecución

- PHP: [http://localhost/lab09/](http://localhost/lab09/)
- JSP: [http://localhost:8080/lab09/](http://localhost:8080/lab09/)

## Pruebas realizadas

Se verificó el envío de formularios con datos válidos e inválidos. También se comprobaron las validaciones, el uso de sesiones y las respuestas HTTP: `200` para envíos correctos, `405` para métodos no permitidos y `422` para datos inválidos.
