-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2023 a las 19:50:42
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pro_gestarch`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--
-- Creación: 01-07-2023 a las 22:41:51
--

CREATE TABLE `archivos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `fecha_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1,
  `elimina` datetime DEFAULT NULL,
  `id_carpeta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `archivos`
--

INSERT INTO `archivos` (`id`, `nombre`, `tipo`, `fecha_create`, `estado`, `elimina`, `id_carpeta`, `id_usuario`) VALUES
(1, 'descarga (2).jpg', 'image/jpeg', '2023-07-01 23:11:17', 1, NULL, 2, 3),
(2, 'mof-de-una-empresa-2-320.jpg', 'image/jpeg', '2023-07-01 23:11:38', 1, NULL, 3, 3),
(3, '61405687ce39f93149d3b977_como hacer un analisis pestel .jpg', 'image/jpeg', '2023-07-02 03:05:28', 1, NULL, 4, 4),
(4, 'Camera Roll.rar', 'application/octet-stream', '2023-07-02 05:45:15', 1, NULL, 6, 5),
(5, '61405687ce39f93149d3b977_como hacer un analisis pestel .jpg', 'image/jpeg', '2023-07-02 05:45:25', 1, NULL, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carpetas`
--
-- Creación: 01-07-2023 a las 22:41:52
--

CREATE TABLE `carpetas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carpetas`
--

INSERT INTO `carpetas` (`id`, `nombre`, `fecha_create`, `estado`, `id_usuario`) VALUES
(1, 'compartir 1', '2023-07-01 23:10:26', 1, 3),
(2, 'compartir 01', '2023-07-01 23:10:43', 1, 3),
(3, 'compartir 02', '2023-07-01 23:10:54', 1, 3),
(4, 'PRIMERA CARPETA', '2023-07-02 03:05:14', 1, 4),
(5, 'compartidos', '2023-07-02 05:44:54', 1, 5),
(6, 'compartir 2', '2023-07-02 05:45:05', 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_archivos`
--
-- Creación: 01-07-2023 a las 22:41:53
--

CREATE TABLE `detalle_archivos` (
  `id` int(11) NOT NULL,
  `fecha_add` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `correo` varchar(100) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `elimina` datetime DEFAULT NULL,
  `id_archivo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_archivos`
--

INSERT INTO `detalle_archivos` (`id`, `fecha_add`, `correo`, `estado`, `elimina`, `id_archivo`, `id_usuario`) VALUES
(1, '2023-07-01 23:39:07', 'jorge@gmail.com', 2, NULL, 2, 3),
(2, '2023-07-01 23:12:35', 'jorge@gmail.com', 2, NULL, 1, 3),
(3, '2023-07-02 03:06:07', 'brayan@gmail.com', 2, NULL, 3, 4),
(4, '2023-07-02 05:46:03', 'brayan@gmail.com', 1, NULL, 5, 5),
(5, '2023-07-02 05:46:09', 'brayan@gmail.com', 1, NULL, 4, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--
-- Creación: 01-07-2023 a las 22:41:50
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `perfil` varchar(100) DEFAULT NULL,
  `clave` varchar(200) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1,
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `correo`, `telefono`, `direccion`, `perfil`, `clave`, `token`, `fecha`, `estado`, `rol`) VALUES
(1, 'Victor', 'Apaclla', 'apaclla@gmail.com', '992 789 111', 'LA MOLINA', NULL, '$2y$10$yRFoTMK7lmcM6shzUzhx5O6qt2VZV2wRuCaLOOwpwTDmrKfewro/u', NULL, '2023-07-01 22:50:16', 1, 1),
(3, 'brayan', 'garay', 'brayan@gmail.com', '926862971', 'Ate-Vitarte', NULL, '$2y$10$WFlB3nLjwUYMZH21bdgIHOCnJ8bDe6nmaCsDKnx8n0cb4..7HoZc.', NULL, '2023-07-01 22:51:39', 1, 2),
(4, 'Jorge', 'Perez', 'jorge@gmail.com', '989490346', 'Ate-vitarte', NULL, '$2y$10$X34pTf8ffrvktBKRSUBiw.lO29bdKwGSPdRK3.BiC3jP7JuxFzwcW', NULL, '2023-07-01 23:10:10', 1, 2),
(5, 'Victor', 'Hollos', 'hollos@gmail.com', '934476409', 'Ate-vitarte', NULL, '$2y$10$XHYSuZWegBTqvKwAqFhrqOrCcS3ockvNvfHB.fEAVjqGL1SgnCtte', NULL, '2023-07-02 05:43:56', 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_carpeta` (`id_carpeta`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `carpetas`
--
ALTER TABLE `carpetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `detalle_archivos`
--
ALTER TABLE `detalle_archivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_archivo` (`id_archivo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `carpetas`
--
ALTER TABLE `carpetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_archivos`
--
ALTER TABLE `detalle_archivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD CONSTRAINT `archivos_ibfk_1` FOREIGN KEY (`id_carpeta`) REFERENCES `carpetas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `archivos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `carpetas`
--
ALTER TABLE `carpetas`
  ADD CONSTRAINT `carpetas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_archivos`
--
ALTER TABLE `detalle_archivos`
  ADD CONSTRAINT `detalle_archivos_ibfk_1` FOREIGN KEY (`id_archivo`) REFERENCES `archivos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_archivos_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
