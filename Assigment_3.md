# Assignment 3 – Aplicación Rails: Crear, Editar y Eliminar

**Fecha de entrega:** Tuesday, October 28 20:00

---

## Introducción

El objetivo de esta tercera tarea es construir sobre la aplicación Rails existente implementando interacciones completas basadas en formularios para todos los modelos principales. Esto incluye:

-   desarrollar todos los formularios de creación y edición (interfaces CRUD),
-   añadir validaciones del lado del cliente y del servidor,
-   asegurar que la aplicación ofrezca una experiencia fluida, usable y accesible para los usuarios.

También refinarás la interfaz de usuario para soportar entradas de usuarios de forma efectiva, mejorar mecanismos de retroalimentación para errores de validación, y reforzar las mejores prácticas en usabilidad e integridad de datos.

---

## Qué entregar

### Implementación de formularios

-   Implementa la funcionalidad completa **CRUD** (create, read, update, delete) para los modelos clave de tu aplicación.
-   Desarrolla todos los formularios de Rails usando _form helpers_ y estilo con **Bootstrap**.
-   Los formularios deben ser accesibles desde rutas de navegación claras en la interfaz principal.

### Validaciones

-   Agrega validaciones de Active Record en tus modelos para asegurar la integridad de datos (por ejemplo: presencia, unicidad, formato).
-   Incorpora mensajes de error amigables para el usuario que se muestren en las vistas de los formularios cuando fallen las validaciones.
-   Asegúrate de tener validación del lado del cliente usando atributos HTML5 o JavaScript cuando sea apropiado.

### Usabilidad

-   Todos los formularios deben incluir **etiquetas**, **placeholders** y controles de formulario adecuados (campos de texto, desplegables, casillas de verificación, etc.).
-   Asegúrate de que los formularios ofrezcan buena experiencia de usuario manejando casos límite (p. ej. campos requeridos, mensajes de error, tipos de datos incorrectos).
-   Usa componentes de **Bootstrap** para mejorar la interfaz y mantener consistencia en todas las vistas.

---

## Criterios de Evaluación

Tu entrega será evaluada según los siguientes criterios:

-   **60 %** — Todos los formularios están implementados y funcionando completamente.
-   **25 %** — Las validaciones están aplicadas correctamente tanto a nivel de modelo como de vista.
-   **15 %** — Usabilidad de los formularios, estilo y feedback al usuario.
-   **10 %** — Se preserva la funcionalidad de la Tarea 2 y sigue operativa.

---

## Entrega y Calificación

-   Las entregas deben realizarse mediante el mismo repositorio de GitHub usado para las Tareas 1 y 2.
-   Solo se considerarán los _commits_ realizados hasta la fecha límite para la evaluación.
-   Tu repositorio debe incluir:

    -   El código Rails actualizado con formularios y validaciones implementadas.
    -   Cualquier documentación actualizada si cambiaste rutas o vistas de forma significativa.
