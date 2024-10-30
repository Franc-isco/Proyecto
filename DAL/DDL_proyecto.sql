-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2024 a las 03:26:15
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
-- Estructura de tabla para la tabla `accesos`
--

CREATE TABLE IF NOT EXISTS `accesos` (
  `id_accesos` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `cod_modulos` int(11) NOT NULL,
  PRIMARY KEY (`id_accesos`),
  KEY `id_rol` (`id_rol`),
  KEY `cod_modulos` (`cod_modulos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE IF NOT EXISTS `departamentos` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_departamentos` varchar(255) NOT NULL,
  `telefono_departamentos` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dptos_empleados`
--

CREATE TABLE IF NOT EXISTS `dptos_empleados` (
  `id_dptos_empleados` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  PRIMARY KEY (`id_dptos_empleados`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_departamento` (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE IF NOT EXISTS `empleados` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empleados` varchar(255) NOT NULL,
  `direccion_empleados` varchar(255) DEFAULT NULL,
  `telefono_empleados` varchar(15) DEFAULT NULL,
  `correo_empleados` varchar(255) NOT NULL,
  `f_inicio_contrato` date NOT NULL,
  `salario_empleados` decimal(10,2) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_tipo` (`id_tipo`),
  KEY `id_rol` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informe`
--

CREATE TABLE IF NOT EXISTS `informe` (
  `id_informe` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_informe` varchar(255) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `ubicacion` varchar(255) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_proyectos` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_registro` int(11) NOT NULL,
  PRIMARY KEY (`id_informe`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_proyectos` (`id_proyectos`),
  KEY `id_departamento` (`id_departamento`),
  KEY `id_registro` (`id_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE IF NOT EXISTS `modulos` (
  `cod_modulos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_modulos` varchar(255) NOT NULL,
  PRIMARY KEY (`cod_modulos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE IF NOT EXISTS `proyectos` (
  `id_proyectos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_proyectos` varchar(255) NOT NULL,
  `descripcion_proyectos` text DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`id_proyectos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_empleados`
--

CREATE TABLE IF NOT EXISTS `proyecto_empleados` (
  `id_asociacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_proyecto` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  PRIMARY KEY (`id_asociacion`),
  KEY `id_proyecto` (`id_proyecto`),
  KEY `id_empleado` (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_tiempos`
--

CREATE TABLE IF NOT EXISTS `registro_tiempos` (
  `id_registro` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `descripcion_tareas` text DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  `id_asociacion` int(11) NOT NULL,
  `cantidad_horas` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `id_asociacion` (`id_asociacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(255) NOT NULL,
  `permisos` text DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleados`
--

CREATE TABLE IF NOT EXISTS `tipo_empleados` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(255) NOT NULL,
  `detalle` text DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD CONSTRAINT `accesos_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  ADD CONSTRAINT `accesos_ibfk_2` FOREIGN KEY (`cod_modulos`) REFERENCES `modulos` (`cod_modulos`);

--
-- Filtros para la tabla `dptos_empleados`
--
ALTER TABLE `dptos_empleados`
  ADD CONSTRAINT `dptos_empleados_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `dptos_empleados_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_empleados` (`id_tipo`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `informe`
--
ALTER TABLE `informe`
  ADD CONSTRAINT `informe_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `informe_ibfk_2` FOREIGN KEY (`id_proyectos`) REFERENCES `proyectos` (`id_proyectos`),
  ADD CONSTRAINT `informe_ibfk_3` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`),
  ADD CONSTRAINT `informe_ibfk_4` FOREIGN KEY (`id_registro`) REFERENCES `registro_tiempos` (`id_registro`);

--
-- Filtros para la tabla `proyecto_empleados`
--
ALTER TABLE `proyecto_empleados`
  ADD CONSTRAINT `proyecto_empleados_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id_proyectos`),
  ADD CONSTRAINT `proyecto_empleados_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `registro_tiempos`
--
ALTER TABLE `registro_tiempos`
  ADD CONSTRAINT `registro_tiempos_ibfk_1` FOREIGN KEY (`id_asociacion`) REFERENCES `proyecto_empleados` (`id_asociacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
