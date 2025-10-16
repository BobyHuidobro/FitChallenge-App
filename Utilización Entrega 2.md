# Guía de URLs para Visualización de Entregas

Este documento explica cómo acceder a las vistas principales (índice y detalle) de cada uno de los recursos de la aplicación FitChallenge-App.

## Índice General

---

## 1. Badges (Insignias)
- **Listado (index):**
  - `/badges`
- **Detalle (show):**
  - `/badges/:id` [1-10] => id 
  - De igual forma en index esta el listado donde se puede acceder mas rapido.
  - Ejemplo: `/badges/1`

## 2. Challenges (Desafíos)
- **Listado (index):**
  - `/challenges`
- **Detalle (show):**
  - `/challenges/:id` [1-8] => id
  - De igual forma en index esta el listado donde se puede acceder mas rapido.
  - Ejemplo: `/challenges/1`

## 3. Users (Usuarios)
- **Listado (index):**
  - `/users` No existe, puesto que planteamos la pagina de forma que cada usuario tenga accesos a su perfil y no el de los demas, por lo que no hay index sino un show pensado como si estuviera en la cuenta del user.
- **Detalle (show):**
  - `/users/:id` [1-9] => id
  - Ejemplo: `/users/1`

## 4. Scoring Rules (Reglas de Puntuación)
- **Listado (index):**
  - `/scoring_rules`
- **Detalle (show):**
  - `/scoring_rules/:id`[1-7] => id
  - De igual forma en index esta el listado donde se puede acceder mas rapido.
  - Ejemplo: `/scoring_rules/1`

## 5. Leaderboards (Tablas de Posiciones)
- **Listado (show)**
  - Se tiene un leaderboard por challenge el cual aparece dentro de este.

## 6. Participations (Participaciones)
- **Listado (index):**
  - `participations es una vista parcial que esta en user
  - Ejemplo: `/users/4`

## 7. User Badges (Insignias de Usuario)
- **Listado (index):**
  - `/users/:id/user_badges`
  - Ejemplo: `users/8/user_badges

---

> **Nota:**
> Cambia el `:id` por el identificador correspondiente de cada registro.
> Si alguna ruta no existe, puede ser porque el recurso no está implementado o no tiene controlador/vista asociada.

---

## Acceso rápido
- Para acceder a la app localmente: `http://localhost:3000/`
---

Cualquier duda, revisar el archivo `routes.rb` o `seeds.rb`en los cuales se encuentra la información de la base de datos, para logear en algun usuario y navegar por la navbar la cual lleva a las rutas de manera mas facil.
