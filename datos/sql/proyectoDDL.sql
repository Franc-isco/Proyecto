-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2024 a las 02:53:32
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `rut_cliente` varchar(12) NOT NULL,
  `correo_contacto` varchar(255) DEFAULT NULL,
  `telefono_contacto` varchar(12) DEFAULT NULL,
  `direccion_cliente` varchar(255) DEFAULT NULL,
  `habilitado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id_departamento` int(11) NOT NULL,
  `nombre_departamento` varchar(255) NOT NULL,
  `telefono_departamento` varchar(12) DEFAULT NULL,
  `habilitado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dptos_empleados`
--

CREATE TABLE `dptos_empleados` (
  `id_dptos_empleados` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `habilitado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre_empleado` varchar(255) NOT NULL,
  `direccion_empleado` varchar(255) DEFAULT NULL,
  `telefono_empleado` varchar(12) DEFAULT NULL,
  `correo_empleado` varchar(255) DEFAULT NULL,
  `fecha_inicio_contrato` date NOT NULL,
  `salario_empleado` float DEFAULT NULL,
  `rut` varchar(12) NOT NULL,
  `contrasena_empleado` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `id_tipo_empleado` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `habilitado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informes`
--

CREATE TABLE `informes` (
  `id_informe` int(11) NOT NULL,
  `nombre_informe` varchar(255) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `ubicacion_informe` varchar(255) DEFAULT NULL,
  `id_empleado` int(11) NOT NULL,
  `habilitado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id_modulo` int(11) NOT NULL,
  `codigo_modulo` varchar(50) NOT NULL,
  `nombre_modulo` varchar(255) NOT NULL,
  `descripcion_modulo` text DEFAULT NULL,
  `habilitado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id_proyecto` int(11) NOT NULL,
  `nombre_proyecto` varchar(255) NOT NULL,
  `descripcion_proyecto` text DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `habilitado` tinyint(4) NOT NULL DEFAULT 1,
  `id_cliente` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_empleados`
--

CREATE TABLE `proyecto_empleados` (
  `id_empleado_proyecto` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `habilitado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros_tiempo`
--

CREATE TABLE `registros_tiempo` (
  `id_registro_tiempo` int(11) NOT NULL,
  `fecha_registro` date NOT NULL,
  `tiempo_trabajado` float NOT NULL,
  `tareas_realizadas` text DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `id_empleado_proyecto` int(11) NOT NULL,
  `habilitado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(255) NOT NULL,
  `permisos_rol` text DEFAULT NULL,
  `descripcion_rol` text DEFAULT NULL,
  `habilitado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_empleados`
--

CREATE TABLE `tipos_empleados` (
  `id_tipo_empleado` int(11) NOT NULL,
  `nombre_tipo` varchar(255) NOT NULL,
  `detalle_tipo` varchar(255) DEFAULT NULL,
  `habilitado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `dptos_empleados`
--
ALTER TABLE `dptos_empleados`
  ADD PRIMARY KEY (`id_dptos_empleados`),
  ADD KEY `FK_departamento_empleado` (`id_departamento`),
  ADD KEY `FK_empleado_dpto` (`id_empleado`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `FK_tipo_empleado` (`id_tipo_empleado`),
  ADD KEY `FK_rol_empleado` (`id_rol`);

--
-- Indices de la tabla `informes`
--
ALTER TABLE `informes`
  ADD PRIMARY KEY (`id_informe`),
  ADD KEY `FK_empleado_informe` (`id_empleado`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id_modulo`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id_proyecto`),
  ADD KEY `FK_cliente_proyecto` (`id_cliente`),
  ADD KEY `FK_departamento_proyecto` (`id_departamento`);

--
-- Indices de la tabla `proyecto_empleados`
--
ALTER TABLE `proyecto_empleados`
  ADD PRIMARY KEY (`id_empleado_proyecto`),
  ADD KEY `FK_proyecto_empleado` (`id_proyecto`),
  ADD KEY `FK_empleados_proyectos` (`id_empleado`);

--
-- Indices de la tabla `registros_tiempo`
--
ALTER TABLE `registros_tiempo`
  ADD PRIMARY KEY (`id_registro_tiempo`),
  ADD KEY `FK_empleado_proyecto` (`id_empleado_proyecto`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tipos_empleados`
--
ALTER TABLE `tipos_empleados`
  ADD PRIMARY KEY (`id_tipo_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dptos_empleados`
--
ALTER TABLE `dptos_empleados`
  MODIFY `id_dptos_empleados` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `informes`
--
ALTER TABLE `informes`
  MODIFY `id_informe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id_modulo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id_proyecto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proyecto_empleados`
--
ALTER TABLE `proyecto_empleados`
  MODIFY `id_empleado_proyecto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registros_tiempo`
--
ALTER TABLE `registros_tiempo`
  MODIFY `id_registro_tiempo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_empleados`
--
ALTER TABLE `tipos_empleados`
  MODIFY `id_tipo_empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dptos_empleados`
--
ALTER TABLE `dptos_empleados`
  ADD CONSTRAINT `FK_departamento_empleado` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`),
  ADD CONSTRAINT `FK_empleado_dpto` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `FK_rol_empleado` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `FK_tipo_empleado` FOREIGN KEY (`id_tipo_empleado`) REFERENCES `tipos_empleados` (`id_tipo_empleado`);

--
-- Filtros para la tabla `informes`
--
ALTER TABLE `informes`
  ADD CONSTRAINT `FK_empleado_informe` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `FK_cliente_proyecto` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `FK_departamento_proyecto` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`);

--
-- Filtros para la tabla `proyecto_empleados`
--
ALTER TABLE `proyecto_empleados`
  ADD CONSTRAINT `FK_empleados_proyectos` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `FK_proyecto_empleado` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id_proyecto`);

--
-- Filtros para la tabla `registros_tiempo`
--
ALTER TABLE `registros_tiempo`
  ADD CONSTRAINT `FK_empleado_proyecto` FOREIGN KEY (`id_empleado_proyecto`) REFERENCES `proyecto_empleados` (`id_empleado_proyecto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
