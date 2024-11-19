-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2024 a las 03:27:55
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

--
-- Volcado de datos para la tabla `accesos`
--

INSERT INTO `accesos` (`id_accesos`, `id_rol`, `cod_modulos`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id_departamento`, `nombre_departamentos`, `telefono_departamentos`) VALUES
(1, 'Recursos Humanos', '555-1234'),
(2, 'Desarrollo', '555-5678'),
(3, 'Ventas', '555-8765');

--
-- Volcado de datos para la tabla `dptos_empleados`
--

INSERT INTO `dptos_empleados` (`id_dptos_empleados`, `id_empleado`, `id_departamento`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre_empleados`, `direccion_empleados`, `telefono_empleados`, `correo_empleados`, `f_inicio_contrato`, `salario_empleados`, `rut`, `contrasena`, `fecha_nacimiento`, `id_tipo`, `id_rol`) VALUES
(1, 'Ana Torres', 'SERRANO 101', '555-0001', 'ana.torres@ecotech.com', '2023-01-10', 550.00, '12345678-9', 'passA123', '1990-05-15', 1, 1),
(2, 'Luis Martínez', 'LYNCH 202', '555-0002', 'luis.martinez@ecotech.com', '2023-02-20', 600.00, '98765432-1', 'passL456', '1993-03-22', 2, 2),
(3, 'Sofía Pérez', 'LOS CAMPEROS 303', '555-0003', 'sofia.perez@ecotech.com', '2023-03-15', 560.00, '11223344-5', 'passS789', '1992-12-30', 3, 3);

--
-- Volcado de datos para la tabla `informe`
--

INSERT INTO `informe` (`id_informe`, `nombre_informe`, `fecha_creacion`, `ubicacion`, `id_empleado`, `id_proyectos`, `id_departamento`, `id_registro`) VALUES
(1, 'Informe de Progreso EcoApp', '2024-02-21', 'Oficina Central', 1, 1, 1, 1),
(2, 'Informe de Evaluación GreenTech', '2024-03-06', 'Oficina Central', 2, 2, 2, 2),
(3, 'Informe de Investigación BioProducts', '2024-05-04', 'Oficina Central', 3, 3, 3, 3);

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`cod_modulos`, `nombre_modulos`) VALUES
(1, 'Gestión de Empleados'),
(2, 'Gestión de Proyectos'),
(3, 'Control de Accesos');

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id_proyectos`, `nombre_proyectos`, `descripcion_proyectos`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 'Proyecto EcoApp', 'Desarrollo de una aplicación para la gestión de recursos sostenibles.', '2024-01-15', '2024-12-15'),
(2, 'Proyecto GreenTech', 'Implementación de tecnologías de energía renovable.', '2024-02-01', '2024-11-30'),
(3, 'Proyecto BioProducts', 'Creación de productos biodegradables innovadores.', '2024-03-01', '2024-10-30');

--
-- Volcado de datos para la tabla `proyecto_empleados`
--

INSERT INTO `proyecto_empleados` (`id_asociacion`, `id_proyecto`, `id_empleado`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

--
-- Volcado de datos para la tabla `registro_tiempos`
--

INSERT INTO `registro_tiempos` (`id_registro`, `fecha`, `descripcion_tareas`, `observacion`, `id_asociacion`, `cantidad_horas`) VALUES
(1, '2024-02-20', 'Desarrollo de la interfaz de usuario de EcoApp.', 'Se completó la fase inicial.', 1, 8.00),
(2, '2024-03-05', 'Revisión de tecnologías utilizadas en GreenTech.', 'Se hicieron ajustes según requerimientos del cliente.', 2, 5.00),
(3, '2024-05-03', 'Investigación sobre productos biodegradables.', 'Se recopilaron datos relevantes para BioProducts.', 3, 6.00);

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`, `permisos`) VALUES
(1, 'Administrador', 'Control total del sistema.'),
(2, 'Gerente', 'Supervisión y gestión de proyectos.'),
(3, 'Empleado', 'Acceso básico para gestionar tareas.');

--
-- Volcado de datos para la tabla `tipo_empleados`
--

INSERT INTO `tipo_empleados` (`id_tipo`, `nombre_tipo`, `detalle`) VALUES
(1, 'Full-Time', 'Empleados que trabajan tiempo completo.'),
(2, 'Part-Time', 'Empleados que trabajan medio tiempo.'),
(3, 'Temporal', 'Empleados contratados por un periodo específico.');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
