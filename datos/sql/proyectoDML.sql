-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2024 a las 02:53:51
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
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `rut_cliente`, `correo_contacto`, `telefono_contacto`, `direccion_cliente`, `habilitado`) VALUES
(1, '6006374-5', 'contacto@ecotech.cl', '56995127532', 'Av. Siempre Viva 123', 1),
(2, '9325475-9', 'info@ecotech.cl', '56987654321', 'Calle Falsa 456', 1),
(3, '23225874-8', 'support@ecotech.cl', '56913579246', 'Paseo de la Reforma 789', 1);

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id_departamento`, `nombre_departamento`, `telefono_departamento`, `habilitado`) VALUES
(1, 'Recursos Humanos', '56911111111', 1),
(2, 'Desarrollo', '56922222222', 1),
(3, 'Ventas', '56933333333', 1);

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre_empleado`, `direccion_empleado`, `telefono_empleado`, `correo_empleado`, `fecha_inicio_contrato`, `salario_empleado`, `rut`, `contrasena_empleado`, `fecha_nacimiento`, `id_tipo_empleado`, `id_rol`, `habilitado`) VALUES
(1, 'Juan Pérez', 'Calle 1', '56911111111', 'juan.perez@ecotech.cl', '2024-11-18', 1500, '12345678-9', 'contrasena123', '1990-01-01', 1, 1, 1),
(2, 'María González', 'Calle 2', '56922222222', 'maria.gonzalez@ecotech.cl', '2024-11-18', 1200, '87654321-0', 'contrasena456', '1985-02-02', 2, 2, 1),
(3, 'Carlos López', 'Calle 3', '56933333333', 'carlos.lopez@ecotech.cl', '2024-11-18', 1800, '13579246-8', 'contrasena789', '1980-03-03', 3, 3, 1);

--
-- Volcado de datos para la tabla `informes`
--

INSERT INTO `informes` (`id_informe`, `nombre_informe`, `fecha_creacion`, `ubicacion_informe`, `id_empleado`, `habilitado`) VALUES
(1, 'Informe de Proyectos', '2024-11-18', 'C:/informes/proyectos.pdf', 1, 1),
(2, 'Informe Financiero', '2024-11-18', 'C:/informes/finanzas.pdf', 2, 1),
(3, 'Informe de Recursos Humanos', '2024-11-18', 'C:/informes/rrhh.pdf', 3, 1);

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id_modulo`, `codigo_modulo`, `nombre_modulo`, `descripcion_modulo`, `habilitado`) VALUES
(1, 'MOD001', 'Gestión de Empleados', 'Módulo para la gestión de empleados.', 1),
(2, 'MOD002', 'Gestión de Proyectos', 'Módulo para la gestión de proyectos.', 1),
(3, 'MOD003', 'Informes y Reportes', 'Módulo para la generación de informes.', 1);

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id_proyecto`, `nombre_proyecto`, `descripcion_proyecto`, `fecha_inicio`, `fecha_fin`, `habilitado`, `id_cliente`, `id_departamento`) VALUES
(1, 'Sistema Fotovoltaico', 'Instalación de paneles solares.', '2024-11-18', '0000-00-00', 1, 1, 1),
(2, 'Desarrollo de App', 'Creación de aplicación móvil.', '2024-11-18', '0000-00-00', 1, 2, 2),
(3, 'Mejora de Sistemas', 'Optimización de sistemas existentes.', '2024-11-18', '0000-00-00', 1, 3, 3);

--
-- Volcado de datos para la tabla `proyecto_empleados`
--

INSERT INTO `proyecto_empleados` (`id_empleado_proyecto`, `id_proyecto`, `id_empleado`, `habilitado`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 3, 1);

--
-- Volcado de datos para la tabla `registros_tiempo`
--

INSERT INTO `registros_tiempo` (`id_registro_tiempo`, `fecha_registro`, `tiempo_trabajado`, `tareas_realizadas`, `observaciones`, `id_empleado_proyecto`, `habilitado`) VALUES
(1, '2024-11-18', 4, 'Desarrollo de funciones', 'Desarrollo de nuevas funcionalidades en el proyecto.', 1, 1),
(2, '2024-11-18', 3.5, 'Revisión de código', 'Revisión de código y corrección de errores.', 2, 1),
(3, '2024-11-18', 5, 'Planificación de proyecto', 'Planificación de tareas y asignación de roles.', 3, 1);

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`, `permisos_rol`, `descripcion_rol`, `habilitado`) VALUES
(1, 'Administrador', 'Todas las acciones', 'Acceso completo al sistema.', 1),
(2, 'Usuario', 'Acciones limitadas', 'Acceso a funciones básicas.', 1),
(3, 'Invitado', 'Solo lectura', 'Puede visualizar información pero no realizar cambios.', 1);

--
-- Volcado de datos para la tabla `tipos_empleados`
--

INSERT INTO `tipos_empleados` (`id_tipo_empleado`, `nombre_tipo`, `detalle_tipo`, `habilitado`) VALUES
(1, 'Desarrollador', 'Encargado del desarrollo de software.', 1),
(2, 'Analista', 'Responsable del análisis de requerimientos.', 1),
(3, 'Gerente', 'Supervisa y coordina las operaciones de la empresa.', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
