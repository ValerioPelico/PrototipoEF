-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2020 a las 04:45:35
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_clc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion`
--

CREATE TABLE `aplicacion` (
  `pk_id_aplicacion` int(10) NOT NULL,
  `fk_id_modulo` int(10) NOT NULL,
  `nombre_aplicacion` varchar(40) NOT NULL,
  `descripcion_aplicacion` varchar(45) NOT NULL,
  `estado_aplicacion` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `aplicacion`
--

INSERT INTO `aplicacion` (`pk_id_aplicacion`, `fk_id_modulo`, `nombre_aplicacion`, `descripcion_aplicacion`, `estado_aplicacion`) VALUES
(1, 1, 'Login', 'Ventana de Ingreso', 1),
(2, 1, 'Mantenimiento Usuario', 'Mantenimientos de usuario', 1),
(3, 1, 'Mantenimiento Aplicacion', 'ABC de las Aplicaciones', 1),
(4, 1, 'Mantenimiento Perfil', 'ABC de perfiles', 1),
(5, 1, 'Asignacion de Aplicaciones a Perfil', 'Asignacion Aplicacion y perfil', 1),
(6, 1, 'Asignacaion de Aplicaciones', 'Asignacion especificas a un usuario', 1),
(7, 1, 'Consulta Aplicacion', 'Mantenimiento de Aplicaciones', 1),
(8, 1, 'Agregar Modulo', 'Mantenimientos de Modulos', 1),
(9, 1, 'Consultar Perfil', 'Consultas de perfiles disponibles', 1),
(10, 1, 'Permisos', 'Asignar permisos a perfiles y aplicaciones', 1),
(11, 1, 'Bitacora', 'Guarda todos los movimientos', 1),
(4701, 8, 'Factura', 'registra las ventas realizadas', 1),
(4702, 8, 'Cotizacion', 'registra las cotizaciones de los clientes', 1),
(5001, 8, 'Clientes', 'mantenimiento clientes', 1),
(5101, 8, 'Control de empleado ventas', 'registra el control de un empleado', 1),
(5201, 8, 'Pedidos especiales', 'registra los pedidos especiales', 1),
(5300, 8, 'Existencias', 'Muestra las diferentes existencias en bodegas', 1),
(5301, 8, 'Cuentas por cobrar', 'lleva el control de ventas al credito', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion_perfil`
--

CREATE TABLE `aplicacion_perfil` (
  `pk_id_aplicacion_perfil` int(10) NOT NULL,
  `fk_idaplicacion_aplicacion_perfil` int(10) DEFAULT NULL,
  `fk_idperfil_aplicacion_perfil` int(10) DEFAULT NULL,
  `fk_idpermiso_aplicacion_perfil` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `aplicacion_perfil`
--

INSERT INTO `aplicacion_perfil` (`pk_id_aplicacion_perfil`, `fk_idaplicacion_aplicacion_perfil`, `fk_idperfil_aplicacion_perfil`, `fk_idpermiso_aplicacion_perfil`) VALUES
(1, 1, 1, 1),
(2, 4, 1, 2),
(3, 5, 1, 3),
(4, 2, 1, 4),
(5, 3, 1, 5),
(6, 6, 1, 6),
(7, 8, 1, 7),
(8, 2, 3, 8),
(9, 3, 3, 9),
(10, 4, 3, 11),
(11, 2, 4, 12),
(12, 8, 4, 13),
(13, 8, 5, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion_usuario`
--

CREATE TABLE `aplicacion_usuario` (
  `pk_id_aplicacion_usuario` int(10) NOT NULL,
  `fk_idlogin_aplicacion_usuario` int(10) DEFAULT NULL,
  `fk_idaplicacion_aplicacion_usuario` int(10) DEFAULT NULL,
  `fk_idpermiso_aplicacion_usuario` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `aplicacion_usuario`
--

INSERT INTO `aplicacion_usuario` (`pk_id_aplicacion_usuario`, `fk_idlogin_aplicacion_usuario`, `fk_idaplicacion_aplicacion_usuario`, `fk_idpermiso_aplicacion_usuario`) VALUES
(1, 1, 4, 1),
(2, 1, 5, 2),
(3, 1, 6, 3),
(4, 3, 8, 10),
(5, 4, 6, 14),
(6, 5, 5, 16),
(7, 5, 2, 17),
(8, 4, 12, 1),
(13, 4, 5001, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ascenso`
--

CREATE TABLE `ascenso` (
  `pk_id_ascenso` int(11) NOT NULL,
  `fk_id_empleado_ascenso` int(11) DEFAULT NULL,
  `fecha_ascenso` varchar(10) DEFAULT NULL,
  `fk_puesto_anterior_ascenso` int(11) NOT NULL,
  `fk_departamento_anterior_ascenso` int(11) DEFAULT NULL,
  `salario_anterior_ascenso` double DEFAULT NULL,
  `fk_puesto_nuevo_ascenso` int(11) DEFAULT NULL,
  `fk_departamento_nuevo_ascenso` int(11) DEFAULT NULL,
  `salario_nuevo_ascenso` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `baja`
--

CREATE TABLE `baja` (
  `pk_id_baja` int(11) NOT NULL,
  `fk_id_empleado_baja` int(11) DEFAULT NULL,
  `fk_id_tipo_baja` int(11) DEFAULT NULL,
  `prestaciones_baja` double DEFAULT NULL,
  `tiempo_laborado_baja` int(11) DEFAULT NULL,
  `fecha_despido_baja` varchar(10) DEFAULT NULL,
  `causa_bajas` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `balance_detalle`
--

CREATE TABLE `balance_detalle` (
  `pk_id_balance_encabezado` int(11) NOT NULL,
  `pk_id_cuenta_contable` int(11) NOT NULL,
  `debe_balance_detalle` double DEFAULT NULL,
  `haber_balance_detalle` double DEFAULT NULL,
  `deudor_balance_detalle` double DEFAULT NULL,
  `acreedor_balance_detalle` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `balance_encabezado`
--

CREATE TABLE `balance_encabezado` (
  `pk_id_balance_encabezado` int(11) NOT NULL,
  `descripcion_balance_encabezado` varchar(75) DEFAULT NULL,
  `fecha_creacion_balance_encabezado` datetime DEFAULT NULL,
  `total_debe_haber_balance_encabezado` double DEFAULT NULL,
  `total_deudor_acreedor_balance_encabezado` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE `banco` (
  `pk_id_banco` int(11) NOT NULL,
  `nombre_banco` varchar(50) DEFAULT NULL,
  `estado_banco` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `pk_id_bitacora` int(10) NOT NULL,
  `fk_idusuario_bitacora` int(10) DEFAULT NULL,
  `fk_idaplicacion_bitacora` int(10) DEFAULT NULL,
  `fechahora_bitacora` varchar(50) DEFAULT NULL,
  `direccionhost_bitacora` varchar(20) DEFAULT NULL,
  `nombrehost_bitacora` varchar(20) DEFAULT NULL,
  `accion_bitacora` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`pk_id_bitacora`, `fk_idusuario_bitacora`, `fk_idaplicacion_bitacora`, `fechahora_bitacora`, `direccionhost_bitacora`, `nombrehost_bitacora`, `accion_bitacora`) VALUES
(1, 4, 1, '07/11/2020 16:04:41', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(3, 4, 1, '07/11/2020 17:16:55', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(4, 4, 1, '07/11/2020 17:21:51', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo erroneo'),
(5, 4, 1, '07/11/2020 17:21:51', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(6, 4, 1, '07/11/2020 17:21:51', '192.168.2.12', 'LAPTOP-4DMS63H8', ' INSERT INTO clientes VALUES ( 4,  45781256,  8/8/2020 8:14:20,  Jose,  Mota,  32659887,  1,  jose@gmail.com,  89 av 5-96 zona 1) '),
(7, 4, 1, '07/11/2020 17:50:18', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(9, 4, 1, '07/11/2020 17:52:08', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(10, 4, 1, '07/11/2020 17:55:57', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(11, 4, 1, '07/11/2020 17:57:00', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(12, 4, 1, '07/11/2020 17:57:29', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(13, 4, 1, '07/11/2020 17:58:14', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(14, 4, 1, '07/11/2020 18:36:28', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(15, 4, 1, '07/11/2020 18:39:47', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(16, 4, 1, '07/11/2020 18:42:25', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(17, 4, 1, '07/11/2020 19:27:38', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(18, 4, 1, '07/11/2020 19:28:56', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(19, 4, 1, '07/11/2020 19:30:23', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(20, 4, 1, '07/11/2020 19:35:38', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(21, 4, 1, '07/11/2020 19:38:08', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(22, 4, 1, '07/11/2020 19:44:21', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(23, 4, 1, '07/11/2020 19:47:02', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(24, 4, 1, '07/11/2020 19:49:53', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(25, 4, 1, '07/11/2020 19:52:41', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(26, 4, 1, '07/11/2020 19:54:09', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(27, 4, 1, '07/11/2020 19:55:41', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(28, 4, 1, '07/11/2020 20:32:37', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(29, 4, 1, '07/11/2020 21:09:27', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(30, 4, 1, '07/11/2020 21:11:14', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(31, 4, 1, '07/11/2020 21:14:22', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(32, 4, 1, '07/11/2020 21:16:02', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(33, 4, 1, '07/11/2020 21:17:59', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(34, 4, 1, '07/11/2020 21:29:27', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(35, 4, 1, '08/11/2020 16:20:58', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(36, 4, 1, '08/11/2020 16:27:58', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(37, 4, 1, '08/11/2020 16:29:21', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(38, 4, 1, '08/11/2020 16:32:26', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(39, 4, 1, '08/11/2020 17:36:38', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(40, 4, 1, '08/11/2020 17:47:37', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(41, 4, 1, '08/11/2020 17:52:35', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(42, 4, 1, '08/11/2020 17:56:46', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(43, 4, 1, '08/11/2020 17:57:56', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(44, 4, 1, '08/11/2020 18:05:19', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(45, 4, 1, '08/11/2020 18:39:10', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo erroneo'),
(46, 4, 1, '08/11/2020 18:39:10', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(47, 4, 1, '08/11/2020 18:40:50', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(48, 4, 1, '08/11/2020 18:46:53', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(49, 4, 1, '08/11/2020 18:47:44', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(50, 4, 1, '08/11/2020 19:00:16', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(51, 4, 1, '08/11/2020 19:03:41', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(52, 4, 1, '08/11/2020 19:08:03', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(53, 4, 1, '08/11/2020 19:09:36', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(54, 4, 1, '08/11/2020 19:13:50', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(55, 4, 1, '08/11/2020 19:39:54', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(56, 4, 1, '08/11/2020 19:44:44', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(57, 4, 1, '08/11/2020 19:45:58', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(58, 4, 1, '08/11/2020 19:47:34', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(59, 4, 1, '08/11/2020 19:49:23', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(60, 4, 1, '08/11/2020 19:51:36', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(61, 4, 1, '08/11/2020 20:28:57', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(62, 4, 1, '08/11/2020 20:28:57', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Salir de la aplicacion'),
(63, 4, 1, '08/11/2020 20:45:53', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(64, 4, 1, '08/11/2020 21:11:50', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(65, 4, 1, '08/11/2020 21:22:22', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(66, 4, 1, '08/11/2020 21:42:04', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(67, 4, 1, '08/11/2020 21:43:49', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(68, 4, 1, '08/11/2020 21:46:16', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(69, 4, 1, '08/11/2020 21:46:16', '192.168.2.12', 'LAPTOP-4DMS63H8', ' INSERT INTO clientes VALUES ( 4,  123456,  2020/6/6,  Jose,  Mota,  12345678,  1,  jose@gmail.com,  52 av 50-5 zona 5) '),
(70, 4, 1, '08/11/2020 21:46:16', '192.168.2.12', 'LAPTOP-4DMS63H8', ' INSERT INTO clientes VALUES ( 4,  124578,  2020/5/5,  Jose,  Mota,  12457889,  1,  jose@gmail.com,  52 av 50-5 zona 5) '),
(71, 4, 1, '08/11/2020 21:46:16', '192.168.2.12', 'LAPTOP-4DMS63H8', ' INSERT INTO clientes VALUES ( 4,  1245487,  2020/8/8,  jose,  mota,  12457889,  1,  jose@gmail.com,  52 av 50-5 zona 5) '),
(72, 4, 1, '08/11/2020 21:51:58', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(73, 4, 1, '08/11/2020 21:51:58', '192.168.2.12', 'LAPTOP-4DMS63H8', ' INSERT INTO clientes VALUES ( 4,  124578,  2020/8/8,  jose,  mota,  12457889,  1,  jose@gmail.com,  52) '),
(74, 4, 1, '08/11/2020 21:51:58', '192.168.2.12', 'LAPTOP-4DMS63H8', 'UPDATE clientes SET   nit_cliente =  23568978,  fecha =  2020-11-07 15:57:56,  nombre_cliente =  Dairyn,  apellido_cliente =  Lopez,  telefono =  32659878,  estado =  1,  correo_cliente =  dai@gmail.com,  direccion_cliente =  52 av 80-8 zona 9  WHERE'),
(75, 4, 1, '08/11/2020 21:51:58', '192.168.2.12', 'LAPTOP-4DMS63H8', ' INSERT INTO clientes VALUES ( 5,  32659887,  2020/9/9,  jose,  mota,  32659887,  1,  jos@gmail.com,  52 av 50-5 zona 5) '),
(76, 4, 1, '08/11/2020 21:51:58', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Cancelar'),
(77, 4, 1, '08/11/2020 21:51:58', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Cancelar'),
(78, 4, 1, '08/11/2020 21:51:58', '192.168.2.12', 'LAPTOP-4DMS63H8', 'UPDATE clientes SET   nit_cliente =  124578,  fecha =  2020/8/8,  nombre_cliente =  jose,  apellido_cliente =  mota,  telefono =  12457889,  estado =  1,  correo_cliente =  jose@gmail.com,  direccion_cliente =  52 av 50-5 zona 5  WHERE pk_id_cliente '),
(79, 4, 1, '08/11/2020 21:58:28', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(80, 4, 1, '08/11/2020 21:59:29', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(81, 4, 1, '08/11/2020 22:01:16', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(82, 4, 1, '08/11/2020 22:02:09', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(83, 4, 1, '08/11/2020 22:02:09', '192.168.2.12', 'LAPTOP-4DMS63H8', ' INSERT INTO clientes VALUES ( 5,  326598874,  2020/6/8,  Alejandra,  Reyna,  87542154,  1,  alre@gmail.com,  52av90-9) '),
(84, 4, 1, '08/11/2020 22:02:09', '192.168.2.12', 'LAPTOP-4DMS63H8', ' INSERT INTO clientes VALUES ( 5,  98653221,  2020/8/7,  Alejandra,  Reyna,  32659887,  1,  alre@gmail.com,  52) '),
(85, 4, 1, '09/11/2020 12:02:51', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(86, 4, 1, '09/11/2020 12:04:01', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(87, 4, 1, '09/11/2020 12:33:25', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(88, 4, 1, '09/11/2020 12:51:34', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(89, 4, 1, '09/11/2020 13:41:25', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(90, 4, 1, '09/11/2020 13:45:21', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(91, 4, 1, '09/11/2020 13:48:58', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(92, 4, 1, '09/11/2020 13:50:47', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(93, 4, 1, '09/11/2020 13:57:07', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(94, 4, 1, '09/11/2020 13:58:35', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(95, 4, 1, '09/11/2020 14:25:04', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(96, 4, 1, '09/11/2020 14:27:49', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(97, 4, 1, '09/11/2020 14:30:26', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(98, 4, 1, '09/11/2020 14:32:31', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(99, 4, 1, '09/11/2020 14:34:48', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(100, 4, 1, '09/11/2020 14:36:24', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(101, 4, 1, '09/11/2020 14:39:05', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(102, 4, 1, '09/11/2020 14:46:23', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(103, 4, 1, '09/11/2020 14:46:53', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(104, 4, 1, '09/11/2020 14:50:19', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(105, 4, 1, '09/11/2020 14:53:39', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(106, 4, 1, '09/11/2020 14:56:37', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(107, 4, 1, '09/11/2020 15:51:32', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(108, 4, 1, '09/11/2020 15:53:46', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(109, 4, 1, '09/11/2020 15:57:07', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(110, 4, 1, '09/11/2020 15:59:39', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(111, 4, 1, '09/11/2020 16:01:44', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(112, 4, 1, '09/11/2020 16:03:05', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(113, 4, 1, '09/11/2020 16:05:55', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo erroneo'),
(114, 4, 1, '09/11/2020 16:05:55', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(115, 4, 1, '09/11/2020 17:41:23', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(116, 4, 1, '09/11/2020 17:46:35', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(117, 4, 1, '09/11/2020 17:48:31', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(118, 4, 1, '09/11/2020 17:55:23', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(119, 4, 1, '09/11/2020 18:01:15', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(120, 4, 1, '09/11/2020 18:02:32', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(121, 4, 1, '09/11/2020 18:04:08', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(122, 4, 1, '09/11/2020 18:10:39', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(123, 4, 1, '09/11/2020 18:16:57', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(124, 4, 1, '09/11/2020 18:21:52', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(125, 4, 1, '09/11/2020 18:24:32', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(126, 4, 1, '09/11/2020 18:27:47', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(127, 4, 1, '09/11/2020 18:36:45', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(128, 4, 1, '09/11/2020 18:38:55', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(129, 4, 1, '09/11/2020 19:58:28', '192.168.2.12', 'LAPTOP-4DMS63H8', 'Logeo Exitoso'),
(130, 4, 1, '09-11-2020 20:57:25', '192.168.1.52', 'LAPTOP-OHKC0OF1', 'Logeo Exitoso'),
(131, 4, 1, '09-11-2020 21:12:40', '192.168.1.52', 'LAPTOP-OHKC0OF1', 'Logeo Exitoso'),
(132, 4, 1, '09-11-2020 21:21:21', '192.168.1.52', 'LAPTOP-OHKC0OF1', 'Logeo Exitoso'),
(133, 4, 1, '09-11-2020 22:02:33', '192.168.1.52', 'LAPTOP-OHKC0OF1', 'Logeo Exitoso'),
(134, 4, 1, '09-11-2020 22:02:33', '192.168.1.52', 'LAPTOP-OHKC0OF1', ' INSERT INTO clientes VALUES ( 6,  1234567,  16-03-1998,  Lanzeloth,  López,  45478965,  1,  pe@gmail.com,  22) '),
(135, 4, 1, '09-11-2020 22:02:33', '192.168.1.52', 'LAPTOP-OHKC0OF1', 'UPDATE clientes SET   nit_cliente =  1234567,  fecha =  16-03-1998,  nombre_cliente =  Alirio,  apellido_cliente =  López,  telefono =  45478965,  estado =  1,  correo_cliente =  pe@gmail.com,  direccion_cliente =  22 calle zona 5  WHERE pk_id_client'),
(136, 4, 1, '09-11-2020 22:02:33', '192.168.1.52', 'LAPTOP-OHKC0OF1', 'Formulario de ayuda'),
(137, 4, 1, '09/11/2020 23:05:58', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(138, 4, 1, '09/11/2020 23:10:19', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(139, 4, 1, '09/11/2020 23:22:40', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(140, 4, 1, '09/11/2020 23:32:24', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(141, 4, 1, '09/11/2020 23:49:23', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(142, 4, 1, '10/11/2020 00:30:14', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(143, 4, 1, '10/11/2020 00:34:14', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(144, 4, 1, '10/11/2020 00:37:40', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(145, 4, 1, '10/11/2020 00:37:40', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', ' INSERT INTO clientes VALUES ( 7,  1234,  12/12/1997,  Hugo,  Sanchez,  42345678,  1,  hola@gmail.com,  12) '),
(146, 4, 1, '10/11/2020 00:37:40', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'UPDATE clientes SET   nit_cliente =  1234,  fecha =  12/12/1997,  nombre_cliente =  Hugo,  apellido_cliente =  Sanchez,  telefono =  42345678,  estado =  1,  correo_cliente =  hola@gmail.com,  direccion_cliente =  12-15  WHERE pk_id_cliente = 7; '),
(147, 4, 1, '10/11/2020 00:37:40', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Eliminacion de Datos'),
(148, 4, 1, '10/11/2020 00:37:40', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'UPDATE clientes SET estado=0 WHERE pk_id_cliente= 7 '),
(149, 4, 1, '10/11/2020 00:37:40', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Salir de la aplicacion'),
(150, 4, 1, '10/11/2020 00:49:39', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(151, 4, 1, '10/11/2020 00:59:34', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(152, 4, 1, '10/11/2020 01:02:03', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(153, 4, 1, '10/11/2020 01:05:16', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(154, 4, 1, '10/11/2020 01:09:17', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo erroneo'),
(155, 4, 1, '10/11/2020 01:09:17', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(156, 4, 1, '10/11/2020 01:15:03', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(157, 4, 1, '10/11/2020 01:38:03', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(158, 4, 1, '10/11/2020 01:42:30', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(159, 4, 1, '10/11/2020 01:49:24', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(160, 4, 1, '10/11/2020 01:53:40', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(161, 4, 1, '10/11/2020 02:58:14', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(162, 4, 1, '10/11/2020 07:26:32', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(163, 4, 1, '10/11/2020 07:26:32', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', ' INSERT INTO clientes VALUES ( 8,  8877,  12/01/1998,  hugo,  solis,  34545676,  1,  sollis@gmail.com,  12-12) '),
(164, 4, 1, '10/11/2020 07:45:27', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(165, 4, 1, '10/11/2020 07:54:09', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(166, 4, 1, '10/11/2020 08:05:48', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(167, 4, 1, '10/11/2020 08:08:55', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(168, 4, 1, '10/11/2020 15:01:02', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(169, 4, 1, '10/11/2020 15:12:57', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(170, 4, 1, '10/11/2020 15:23:07', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(171, 4, 1, '10/11/2020 16:34:05', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(172, 4, 1, '10/11/2020 16:43:20', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(173, 4, 1, '10/11/2020 16:45:05', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(174, 4, 1, '10/11/2020 16:48:44', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(175, 4, 1, '10/11/2020 16:48:44', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(176, 4, 1, '10/11/2020 16:48:44', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(177, 4, 1, '10/11/2020 16:48:44', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(178, 4, 1, '10/11/2020 16:48:44', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(179, 4, 1, '10/11/2020 16:48:44', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(180, 4, 1, '10/11/2020 16:48:44', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(181, 4, 1, '10/11/2020 16:48:44', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(182, 4, 1, '10/11/2020 16:55:57', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(183, 4, 1, '10/11/2020 16:55:57', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(184, 4, 1, '10/11/2020 16:55:57', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(185, 4, 1, '10/11/2020 16:55:57', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(186, 4, 1, '10/11/2020 16:57:36', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(187, 4, 1, '10/11/2020 16:57:36', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(188, 4, 1, '10/11/2020 16:57:36', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(189, 4, 1, '10/11/2020 16:57:36', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(190, 4, 1, '10/11/2020 16:57:36', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(191, 4, 1, '10/11/2020 16:57:36', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Salir de la aplicacion'),
(192, 4, 1, '10/11/2020 17:00:05', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(193, 4, 1, '10/11/2020 17:00:05', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(194, 4, 1, '10/11/2020 17:00:05', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(195, 4, 1, '10/11/2020 17:00:05', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(196, 4, 1, '10/11/2020 17:00:05', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(197, 4, 1, '10/11/2020 17:00:05', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(198, 4, 1, '10/11/2020 17:01:56', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(199, 4, 1, '10/11/2020 17:01:56', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(200, 4, 1, '10/11/2020 17:04:22', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(201, 4, 1, '10/11/2020 17:04:22', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(202, 4, 1, '10/11/2020 17:04:22', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(203, 4, 1, '10/11/2020 17:06:03', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(204, 4, 1, '10/11/2020 17:06:03', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(205, 4, 1, '10/11/2020 17:06:03', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(206, 4, 1, '10/11/2020 17:08:45', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(207, 4, 1, '10/11/2020 17:08:45', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(208, 4, 1, '10/11/2020 17:08:45', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(209, 4, 1, '10/11/2020 17:12:36', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(210, 4, 1, '10/11/2020 17:12:36', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(211, 4, 1, '10/11/2020 17:14:00', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(212, 4, 1, '10/11/2020 17:27:25', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(213, 4, 1, '10/11/2020 17:27:25', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Formulario de ayuda'),
(214, 4, 1, '10/11/2020 17:32:46', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(215, 4, 1, '10/11/2020 17:33:46', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(216, 4, 1, '10/11/2020 17:37:58', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(217, 4, 1, '10/11/2020 18:38:21', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(218, 4, 1, '10/11/2020 18:40:11', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(219, 4, 1, '10/11/2020 19:10:17', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(220, 4, 1, '10/11/2020 19:13:20', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(221, 4, 1, '10/11/2020 19:16:21', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(222, 4, 1, '10/11/2020 19:18:52', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(223, 4, 1, '10/11/2020 19:24:34', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(224, 4, 1, '10/11/2020 19:28:19', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(225, 4, 1, '10/11/2020 19:30:48', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(226, 4, 1, '10/11/2020 19:32:24', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(227, 4, 1, '10/11/2020 19:36:29', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(228, 4, 1, '10/11/2020 19:36:29', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(229, 4, 1, '10/11/2020 19:40:38', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(230, 4, 5001, '10/11/2020 19:40:38', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', ' INSERT INTO clientes VALUES ( 9,  2345,  12/10/1998,  Carlos ,  Perez,  34232343,  1,  perez@gmail.com,  12-12) '),
(231, 4, 5001, '10/11/2020 19:40:38', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'UPDATE clientes SET   nit_cliente =  2345,  fecha =  12/10/1998,  nombre_cliente =  Carlos ,  apellido_cliente =  Perez,  telefono =  2345654,  estado =  1,  correo_cliente =  perez@gmail.com,  direccion_cliente =  0  WHERE pk_id_cliente = 9; '),
(232, 4, 1, '10/11/2020 20:03:57', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo Exitoso'),
(233, 0, 1, '10/11/2020 21:04:47', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo erroneo'),
(234, 0, 1, '10/11/2020 21:04:47', 'fd94:b19:c38b:7900:f', 'DESKTOP-M5QVEQ7', 'Logeo erroneo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega`
--

CREATE TABLE `bodega` (
  `pk_id_bodega` int(10) NOT NULL,
  `fk_id_municipio` int(10) NOT NULL,
  `descripcion_bodega` varchar(45) NOT NULL,
  `dimensiones_bodega` double(5,2) NOT NULL,
  `direccion_bodega` varchar(45) NOT NULL,
  `telefono_bodega` int(8) NOT NULL,
  `estado_bodega` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bodega`
--

INSERT INTO `bodega` (`pk_id_bodega`, `fk_id_municipio`, `descripcion_bodega`, `dimensiones_bodega`, `direccion_bodega`, `telefono_bodega`, `estado_bodega`) VALUES
(1, 1, 'ninguna', 3.00, 'ninguna', 4545, 1),
(2, 2, 'ninguna', 2.00, 'ninguna', 34543232, 1),
(3, 1, 'ninguna', 3.00, 'ninguna', 4545, 1),
(4, 2, 'ninguna', 2.00, 'ninguna', 34543232, 1),
(5, 1, 'ninguna', 3.00, 'ninguna', 4545, 1),
(6, 2, 'ninguna', 2.00, 'ninguna', 34543232, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacitacion`
--

CREATE TABLE `capacitacion` (
  `pk_id_capacitacion` int(11) NOT NULL,
  `fk_id_encabezado_capacitacion` int(11) DEFAULT NULL,
  `fk_id_empleado_capacitacion` int(11) DEFAULT NULL,
  `resultado_capacitacion` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `pk_id_categoria_producto` int(10) NOT NULL,
  `nombre_categoria_producto` varchar(35) NOT NULL,
  `descripcion_categoria_producto` varchar(60) NOT NULL,
  `estado_categoria_producto` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`pk_id_categoria_producto`, `nombre_categoria_producto`, `descripcion_categoria_producto`, `estado_categoria_producto`) VALUES
(1, 'Ortopedicas', 'ola', 1),
(2, 'normales', 'alo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `pk_id_cliente` int(11) NOT NULL,
  `nit_cliente` varchar(45) DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `nombre_cliente` varchar(45) DEFAULT NULL,
  `apellido_cliente` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `correo_cliente` varchar(45) DEFAULT NULL,
  `direccion_cliente` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`pk_id_cliente`, `nit_cliente`, `fecha`, `nombre_cliente`, `apellido_cliente`, `telefono`, `estado`, `correo_cliente`, `direccion_cliente`) VALUES
(1, '23568978', '2020-11-07 15:57:56', 'Dairyn', 'Lopez', '32659878', '1', 'dai@gmail.com', '52 av 80-8 zona 9'),
(2, '78451278', '2020-11-05 15:57:56', 'Valerio', 'Pelico', '12457889', '1', 'val@gmail.com', '52 av 60-6 zona 6'),
(3, '1245785', '2020-11-04 15:59:37', 'Diego', 'Sosa', '65988754', '1', 'dieg@gmail.com', '52 90-9 zona 9'),
(4, '124578', '2020-08-08 00:00:00', 'jose', 'mota', '12457889', '1', 'jose@gmail.com', '52 av 50-5 zona 5'),
(5, '98653221', '2020/8/7', 'Alejandra', 'Reyna', '32659887', '1', 'alre@gmail.com', '52'),
(6, '1234567', '16-03-1998', 'Alirio', 'López', '45478965', '1', 'pe@gmail.com', '22 calle zona 5'),
(7, '1234', '12/12/1997', 'Hugo', 'Sanchez', '42345678', '0', 'hola@gmail.com', '12-15'),
(8, '8877', '12/01/1998', 'hugo', 'solis', '34545676', '1', 'sollis@gmail.com', '0'),
(9, '2345', '12/10/1998', 'Carlos ', 'Perez', '2345654', '1', 'perez@gmail.com', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competencia_desarrollo`
--

CREATE TABLE `competencia_desarrollo` (
  `pk_id_competencia_desarrollo` int(11) NOT NULL,
  `fk_id_encabezado_competencia` int(11) NOT NULL,
  `fk_id_tipo_competencia_desarrollo` int(11) DEFAULT NULL,
  `resultado_competencia_desarrollo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_detalle`
--

CREATE TABLE `compra_detalle` (
  `fk_id_compra_encabezado` int(10) NOT NULL,
  `cod_linea_compra_detalle` int(10) NOT NULL,
  `fk_id_producto` int(10) NOT NULL,
  `cantidad_compra_detalle` int(10) NOT NULL,
  `precio_unitario_compra_detalle` double(8,2) NOT NULL,
  `subtotal_compra_detalle` double(12,2) NOT NULL,
  `estado_compra_detalle` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_encabezado`
--

CREATE TABLE `compra_encabezado` (
  `pk_id_compra_encabezado` int(10) NOT NULL,
  `fk_id_proveedor` int(10) NOT NULL,
  `estado_proceso_encabezado_compra` int(1) NOT NULL,
  `fec_compra_encabezado_compra` datetime NOT NULL,
  `total_compra_encabezado_compra` double(12,2) NOT NULL,
  `estado_encabezado_compra` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consulta_inteligente`
--

CREATE TABLE `consulta_inteligente` (
  `pk_id_consulta_inteligente` int(11) NOT NULL,
  `nombre_consulta_inteligente` varchar(100) DEFAULT NULL,
  `contenido_consulta_inteligente` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_asistencia`
--

CREATE TABLE `control_asistencia` (
  `pk_id_control_asistencia` int(11) NOT NULL,
  `fk_id_control_asistencia_empleado` int(11) DEFAULT NULL,
  `fk_id_control_asistencia_encabezado_nomina` int(11) DEFAULT NULL,
  `dias_laborados` int(11) DEFAULT NULL,
  `dias_ausente_justificados` int(11) DEFAULT NULL,
  `dias_ausente_injustificados` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_calidad`
--

CREATE TABLE `control_calidad` (
  `pk_id_control_calidad` int(10) NOT NULL,
  `fk_id_pedido_encabezado_control_calidad` int(11) NOT NULL,
  `fk_id_empleado_control_calidad` int(10) NOT NULL,
  `resultado_control_calidad` varchar(45) DEFAULT NULL,
  `estado_control_calidad` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_empleado`
--

CREATE TABLE `control_empleado` (
  `pk_id_control` int(11) NOT NULL,
  `horas_extras_de_trabajo` varchar(45) DEFAULT NULL,
  `comisiones_ventas` varchar(45) DEFAULT NULL,
  `fk_id_venta` int(11) NOT NULL,
  `fk_id_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `control_empleado`
--

INSERT INTO `control_empleado` (`pk_id_control`, `horas_extras_de_trabajo`, `comisiones_ventas`, `fk_id_venta`, `fk_id_empleado`) VALUES
(1, '7', '150', 1, 1),
(2, '200', '150', 1, 1),
(3, '100', '418800', 2, 4),
(4, '10', '35400', 1, 1),
(5, '10', '30000', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_horas`
--

CREATE TABLE `control_horas` (
  `pk_id_control_horas` int(11) NOT NULL,
  `fk_id_control_horas_empleado` int(11) DEFAULT NULL,
  `fk_id_control_horas_encabezado_nomina` int(11) DEFAULT NULL,
  `horas_hordinarias` double DEFAULT NULL,
  `horas_extra` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_producto`
--

CREATE TABLE `control_producto` (
  `pk_id_control_producto` int(10) NOT NULL,
  `fk_id_pedido_encabezado_control_producto` int(10) DEFAULT NULL,
  `fk_id_estado_produccion_control_producto` int(10) DEFAULT NULL,
  `resultado_control_producto` varchar(45) DEFAULT NULL,
  `estado_control_producto` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correo_proveedor`
--

CREATE TABLE `correo_proveedor` (
  `pk_id_correo_proveedor` int(10) NOT NULL,
  `fk_id_proveedor` int(10) NOT NULL,
  `correo_correo_proveedor` varchar(50) NOT NULL,
  `estado_correo_proveedor` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE `cotizacion` (
  `pk_id_cotizacion` int(11) NOT NULL,
  `fk_id_cliente` int(11) NOT NULL,
  `fecha_cotizacion` date DEFAULT NULL,
  `total_cotizacion` double(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cotizacion`
--

INSERT INTO `cotizacion` (`pk_id_cotizacion`, `fk_id_cliente`, `fecha_cotizacion`, `total_cotizacion`) VALUES
(1, 2, '2020-11-09', 940.00),
(2, 2, '2020-11-09', 136000.00),
(5, 3, '2020-11-09', 45000.00),
(6, 2, '2020-11-10', 190000.00),
(7, 2, '2020-11-10', 120000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta_bancaria`
--

CREATE TABLE `cuenta_bancaria` (
  `pk_id_numero_cuenta_bancaria` int(11) NOT NULL,
  `fk_id_banco` int(11) NOT NULL,
  `fk_id_propietario` int(11) NOT NULL,
  `fk_id_tipo_moneda` int(11) NOT NULL,
  `saldo_cuenta_bancaria` double DEFAULT NULL,
  `fecha_apertura_cuenta_bancaria` datetime DEFAULT NULL,
  `estado_apertura_cuenta_bancaria` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta_contable`
--

CREATE TABLE `cuenta_contable` (
  `pk_id_cuenta_contable` int(11) NOT NULL,
  `nombre_cuenta_contable` varchar(75) DEFAULT NULL,
  `nivel_cuenta_contable` int(11) DEFAULT NULL,
  `fk_cuenta_padre_cuenta_contable` int(11) DEFAULT NULL,
  `saldo_anterior_cuenta_contable` double DEFAULT NULL,
  `saldo_actual_cuenta_contable` double DEFAULT NULL,
  `cargo_mes_cuenta_contable` double DEFAULT NULL,
  `abono_mes_cuenta_contable` double DEFAULT NULL,
  `cargo_acumulado_cuenta_contable` double DEFAULT NULL,
  `abono_acumulado_cuenta_contable` double DEFAULT NULL,
  `estado_cuenta_contable` tinyint(4) DEFAULT NULL,
  `fk_id_tipo_cuenta_contable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `pk_id_curso` int(11) NOT NULL,
  `nombre_curso` varchar(45) DEFAULT NULL,
  `fk_id_empleado_curso` int(11) DEFAULT NULL,
  `detalle_curso` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deduccion`
--

CREATE TABLE `deduccion` (
  `pk_id_deduccion` int(11) NOT NULL,
  `nombre_deduccion` varchar(45) DEFAULT NULL,
  `monto_deduccion` double DEFAULT NULL,
  `descripcion_deduccion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `pk_id_departamento` int(10) NOT NULL,
  `nombre_departamento` varchar(30) NOT NULL,
  `descripcion_departamento` varchar(45) NOT NULL,
  `estado_departamento` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`pk_id_departamento`, `nombre_departamento`, `descripcion_departamento`, `estado_departamento`) VALUES
(1, 'Quetzaltenango', 'hola', 1),
(2, 'Guatemala', 'ola', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento_empresarial`
--

CREATE TABLE `departamento_empresarial` (
  `pk_id__departamento_empresarial` int(11) NOT NULL,
  `nombre_departamento_empresarial` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamento_empresarial`
--

INSERT INTO `departamento_empresarial` (`pk_id__departamento_empresarial`, `nombre_departamento_empresarial`) VALUES
(1, 'Administracion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_venta_empleado`
--

CREATE TABLE `detalles_venta_empleado` (
  `fk_id_venta` int(11) NOT NULL,
  `fk_id_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_bitacora`
--

CREATE TABLE `detalle_bitacora` (
  `pk_id_detalle_bitacora` int(10) NOT NULL,
  `fk_idbitacora_detalle_bitacora` int(10) DEFAULT NULL,
  `querryantigua_detalle_bitacora` varchar(50) DEFAULT NULL,
  `querrynueva_detalle_bitacora` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_cotizacion`
--

CREATE TABLE `detalle_cotizacion` (
  `fk_id_cotizacion` int(11) NOT NULL,
  `cod_linea` int(11) NOT NULL,
  `fk_id_producto` int(11) NOT NULL,
  `cantidad_producto` int(11) DEFAULT NULL,
  `precio_producto` float DEFAULT NULL,
  `subtotal_producto` float DEFAULT NULL,
  `descuento_producto` float DEFAULT NULL,
  `subtotal_descuento` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_cotizacion`
--

INSERT INTO `detalle_cotizacion` (`fk_id_cotizacion`, `cod_linea`, `fk_id_producto`, `cantidad_producto`, `precio_producto`, `subtotal_producto`, `descuento_producto`, `subtotal_descuento`) VALUES
(1, 1, 2, 2, 200, 0, 400, 400),
(1, 2, 2, 3, 200, 0.1, 600, 540),
(2, 1, 2, 500, 200, 0, 100000, 100000),
(2, 2, 1, 400, 100, 0.1, 40000, 36000),
(5, 1, 1, 500, 100, 0.1, 50000, 45000),
(6, 1, 3, 50, 2000, 0.1, 100000, 90000),
(6, 2, 3, 50, 2000, 0, 100000, 100000),
(7, 1, 2, 600, 200, 0, 120000, 120000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `fk_id_factura` int(11) NOT NULL,
  `cod_linea` int(11) NOT NULL,
  `fk_id_producto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `sub_total_descuento` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`fk_id_factura`, `cod_linea`, `fk_id_producto`, `cantidad`, `descuento`, `subtotal`, `sub_total_descuento`) VALUES
(1, 1, 2, 500, 0, 100000, 100000),
(1, 2, 1, 200, 0.1, 20000, 18000),
(2, 1, 2, 100, 0.5, 20000, 10000),
(3, 1, 2, 500, 0, 100000, 100000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_hora_empleado`
--

CREATE TABLE `detalle_hora_empleado` (
  `pk_id_detalle_hora_empleado` int(10) NOT NULL,
  `fk_id_hora_empleado_detalle` int(10) DEFAULT NULL,
  `descripcion_detalle_hora_empleado` varchar(250) DEFAULT NULL,
  `tiempo_detalle_hora_empleado` double DEFAULT NULL,
  `estado_detalle_hora_empleado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_nomina`
--

CREATE TABLE `detalle_nomina` (
  `pk_id_detalle_nomina` int(11) NOT NULL,
  `fk_id_encabezado_detalle_nomina` int(11) DEFAULT NULL,
  `fk_id_empleado_detalle_nomina` int(11) DEFAULT NULL,
  `fk_id_percepciones_detalle_nomina` int(11) DEFAULT NULL,
  `fk_id_deducciones_detalle_nomina` int(11) DEFAULT NULL,
  `salario_base_detalle_nomina` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_receta`
--

CREATE TABLE `detalle_receta` (
  `pk_id_detalle_detalle_receta` int(10) NOT NULL,
  `fk_id_receta_encabezado_detalle` int(10) DEFAULT NULL,
  `fk_id_estado_produccion_detalle_receta` int(10) DEFAULT NULL,
  `fk_id_producto_detalle_receta` int(10) DEFAULT NULL,
  `cantidad_detalle_receta` double DEFAULT NULL,
  `costo_unitario_detalle_receta` double DEFAULT NULL,
  `estado_detalle_receta` tinyint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `pk_id_direccion` int(11) NOT NULL,
  `departamento_direccion` varchar(45) DEFAULT NULL,
  `zona_direccion` varchar(7) DEFAULT NULL,
  `municipio_direccion` varchar(100) DEFAULT NULL,
  `residencia_direccion` varchar(45) DEFAULT NULL,
  `fk_empleado_direccion` int(11) DEFAULT NULL,
  `fk_reclutamiento_direccion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `pk_id_empleado` int(11) NOT NULL,
  `nombre1_empleado` varchar(45) DEFAULT NULL,
  `nombre2_empleado` varchar(45) DEFAULT NULL,
  `apellido1_empleado` varchar(45) DEFAULT NULL,
  `apellido2_empleado` varchar(45) DEFAULT NULL,
  `fecha_nacimiento_empleado` varchar(10) DEFAULT NULL,
  `dpi_empleado` int(11) DEFAULT NULL,
  `fk_id_genero_empleado` int(11) DEFAULT NULL,
  `fk_id_estado_civil_empleado` int(11) DEFAULT NULL,
  `email_empleado` varchar(125) DEFAULT NULL,
  `telefono_empleado` int(11) DEFAULT NULL,
  `numero_iggs_empleado` int(11) DEFAULT NULL,
  `fk_id_licencia_conducir_empleado` int(11) DEFAULT NULL,
  `fk_id_puesto_empleado` int(11) DEFAULT NULL,
  `cuenta_bancaria_empleado` int(11) DEFAULT NULL,
  `fk_id_departamento_empresarial_empleado` int(11) DEFAULT NULL,
  `estado_empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`pk_id_empleado`, `nombre1_empleado`, `nombre2_empleado`, `apellido1_empleado`, `apellido2_empleado`, `fecha_nacimiento_empleado`, `dpi_empleado`, `fk_id_genero_empleado`, `fk_id_estado_civil_empleado`, `email_empleado`, `telefono_empleado`, `numero_iggs_empleado`, `fk_id_licencia_conducir_empleado`, `fk_id_puesto_empleado`, `cuenta_bancaria_empleado`, `fk_id_departamento_empresarial_empleado`, `estado_empleado`) VALUES
(1, 'Jose', 'Adolfo', 'Mota ', 'Morales', '5-12-2020', 12457889, 1, 2, 'jose@gmail.com', 12457889, 124578, 1, 1, 124578, 1, 1),
(2, 'Madelyn', 'Alejandra', 'Reyna', 'Morales', '8/8/1999', 12457889, 2, 1, 'alre@gmail.com', 12457889, 125487, 1, 1, 124578, 1, 1),
(3, 'Francisco', 'Alejandro', 'Ramirez', 'Cetino', '5-6-2000', 12457889, 1, 2, 'fran@gmail.com', 12457889, 326598, 1, 1, 235689, 1, 1),
(4, 'Maria', 'Jose', 'Suchite', 'Morales', '8-4-2000', 32659887, 2, 1, 'lolo@gmail.com', 23568987, 124578, 1, 1, 326598, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encabezado_capacitacion`
--

CREATE TABLE `encabezado_capacitacion` (
  `pk_id_encabezado_capacitacion` int(11) NOT NULL,
  `fecha_inicio_encabezado_capacitacion` varchar(10) DEFAULT NULL,
  `fecha_fin_encabezado_capacitacion` varchar(10) DEFAULT NULL,
  `fk_id_curso_encabezado_capacitacion` int(11) DEFAULT NULL,
  `horas_encabezado_capacitacion` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encabezado_competencia`
--

CREATE TABLE `encabezado_competencia` (
  `pk_id_encabezado_competencia` int(11) NOT NULL,
  `fk_id_empleado_encabezado_competencia` int(11) DEFAULT NULL,
  `fecha_inicio_encabezado_competencia` varchar(10) DEFAULT NULL,
  `fecha_fin_encabezado_competencia` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encabezado_nomina`
--

CREATE TABLE `encabezado_nomina` (
  `pk_id_encabezado_nomina` int(11) NOT NULL,
  `nombre_encabezado_nomina` varchar(45) DEFAULT NULL,
  `fecha_inicio_encabezado_nomina` varchar(10) DEFAULT NULL,
  `fecha_fin_encabezado_nomina` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encargado_bodega`
--

CREATE TABLE `encargado_bodega` (
  `pk_id_encargado_bodega` int(10) NOT NULL,
  `fk_id_empleado` int(10) NOT NULL,
  `fk_id_bodega` int(10) NOT NULL,
  `estado_encargado_bodega` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrevista`
--

CREATE TABLE `entrevista` (
  `pk_id_entrevista` int(11) NOT NULL,
  `fk_id_empleado_entrevista` int(11) DEFAULT NULL,
  `fk_id_reclutamiento_entrevista` int(11) DEFAULT NULL,
  `fk_id_tipo_entrevista` int(11) DEFAULT NULL,
  `resultado_entrevista` int(11) DEFAULT NULL,
  `comentarios_entrevistador_entrevista` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_civil`
--

CREATE TABLE `estado_civil` (
  `pk_id_estado_civil` int(11) NOT NULL,
  `nombre_estado_civil` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado_civil`
--

INSERT INTO `estado_civil` (`pk_id_estado_civil`, `nombre_estado_civil`) VALUES
(1, 'casado'),
(2, 'Soltero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_produccion`
--

CREATE TABLE `estado_produccion` (
  `pk_id_estado_produccion` int(10) NOT NULL,
  `nombre_estado_produccion` varchar(45) DEFAULT NULL,
  `duracion_estado_produccion` varchar(45) DEFAULT NULL,
  `estado_estado_produccion` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `existencia`
--

CREATE TABLE `existencia` (
  `pk_id_existencia` int(10) NOT NULL,
  `fk_id_bodega` int(10) NOT NULL,
  `fk_id_producto` int(10) NOT NULL,
  `cantidad_existencia` int(10) NOT NULL,
  `estado_existencia` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `existencia`
--

INSERT INTO `existencia` (`pk_id_existencia`, `fk_id_bodega`, `fk_id_producto`, `cantidad_existencia`, `estado_existencia`) VALUES
(1, 1, 1, 500, 1),
(2, 2, 2, 1000, 1),
(3, 3, 1, 700, 1),
(4, 4, 2, 900, 1),
(5, 4, 3, 600, 1),
(6, 5, 4, 400, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabrica`
--

CREATE TABLE `fabrica` (
  `pk_id_fabrica` int(10) NOT NULL,
  `fk_id_municipio` int(10) NOT NULL,
  `dimensiones_fabrica` double(5,2) NOT NULL,
  `direccion_fabrica` varchar(45) NOT NULL,
  `telefono_fabrica` int(8) NOT NULL,
  `descripcion_fabrica` varchar(45) NOT NULL,
  `estado_fabrica` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fabrica`
--

INSERT INTO `fabrica` (`pk_id_fabrica`, `fk_id_municipio`, `dimensiones_fabrica`, `direccion_fabrica`, `telefono_fabrica`, `descripcion_fabrica`, `estado_fabrica`) VALUES
(1, 1, 10.00, '52 av 50-5 zona 5', 12457889, 'Roosvelt', 1),
(2, 2, 45.00, '65 av 60-6 zona 6', 32659887, 'Zona 9', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `pk_id_factura` int(11) NOT NULL,
  `fk_id_empleado` int(11) NOT NULL,
  `fk_id_cliente` int(11) NOT NULL,
  `fk_id_tipo_venta` int(11) NOT NULL,
  `fecha_factura` datetime DEFAULT NULL,
  `total_factura` double(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`pk_id_factura`, `fk_id_empleado`, `fk_id_cliente`, `fk_id_tipo_venta`, `fecha_factura`, `total_factura`) VALUES
(1, 1, 1, 1, '2020-11-10 15:28:40', 118000.00),
(2, 3, 2, 1, '2020-11-10 15:30:13', 10000.00),
(3, 3, 1, 1, '2020-11-10 19:48:34', 100000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `falta`
--

CREATE TABLE `falta` (
  `pk_id_falta` int(11) NOT NULL,
  `nombre_falta` varchar(45) DEFAULT NULL,
  `descripción_falta` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `falta_empleado`
--

CREATE TABLE `falta_empleado` (
  `pk_id_falta_empleado` int(11) NOT NULL,
  `fk_id_empleado_falta_empleado` int(11) DEFAULT NULL,
  `fk_id_tipo_falta_empleado` int(11) DEFAULT NULL,
  `fecha_falta_empleado` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formacion_academica`
--

CREATE TABLE `formacion_academica` (
  `pk_id_formacion_academica` int(11) NOT NULL,
  `nombre_formacion_academica` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `pk_id_genero` int(11) NOT NULL,
  `nombre_genero` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`pk_id_genero`, `nombre_genero`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `pk_id_horario` int(11) NOT NULL,
  `nombre_horario` varchar(45) DEFAULT NULL,
  `descripcion_horario` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`pk_id_horario`, `nombre_horario`, `descripcion_horario`) VALUES
(1, 'matutino', '8 horas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hora_empleado`
--

CREATE TABLE `hora_empleado` (
  `pk_id_hora_empleado` int(10) NOT NULL,
  `fk_id_empleado_hora_empleado` int(10) DEFAULT NULL,
  `fk_id_pedido_encabezado_hora_empleado` int(11) DEFAULT NULL,
  `fecha_hora_empleado` date DEFAULT NULL,
  `estado_hora_empleado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `pk_id_inventario` int(10) NOT NULL,
  `fk_id_producto` int(10) NOT NULL,
  `cantidad_inventario` int(10) NOT NULL,
  `estado_inventario` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencia_conduccion`
--

CREATE TABLE `licencia_conduccion` (
  `pk_id_licencia_conduccion` int(11) NOT NULL,
  `tipo_licencia_conduccion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `licencia_conduccion`
--

INSERT INTO `licencia_conduccion` (`pk_id_licencia_conduccion`, `tipo_licencia_conduccion`) VALUES
(1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea_producto`
--

CREATE TABLE `linea_producto` (
  `pk_id_linea_producto` int(10) NOT NULL,
  `nombre_linea_producto` varchar(25) NOT NULL,
  `descripcion_linea_producto` varchar(50) NOT NULL,
  `estado_linea_producto` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `linea_producto`
--

INSERT INTO `linea_producto` (`pk_id_linea_producto`, `nombre_linea_producto`, `descripcion_linea_producto`, `estado_linea_producto`) VALUES
(1, 'facenco', 'hola facenco', 1),
(2, 'Oveja', 'ola oveja', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `pk_id_login` int(10) NOT NULL,
  `usuario_login` varchar(45) DEFAULT NULL,
  `contraseña_login` varchar(45) DEFAULT NULL,
  `nombreCompleto_login` varchar(100) DEFAULT NULL,
  `estado_login` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`pk_id_login`, `usuario_login`, `contraseña_login`, `nombreCompleto_login`, `estado_login`) VALUES
(1, 'sistema', 'bi0PL96rbxVRPKJQsLJJAg==', 'Usuario de prueba', 1),
(2, 'bjsican', '0FOYy5u5h0djKjzCYqfvkg==', 'Billy Sican', 1),
(3, 'bmaza', 'xTfsC3/XR/CVyDvNr1Fs+g==', 'Bryan Mazariegos', 1),
(4, 'jsican', 'jsican', 'Jeshua Sican', 1),
(5, 'jmorataya', '123', 'Julio Morataya', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `pk_id_marca` int(10) NOT NULL,
  `descripcion_marca` varchar(45) NOT NULL,
  `estado_marca` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_prima`
--

CREATE TABLE `materia_prima` (
  `pk_id_materia_prima` int(11) NOT NULL,
  `fk_id_producto_materia_prima` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `estado_materia_prima` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `pk_id_modulo` int(10) NOT NULL,
  `nombre_modulo` varchar(30) NOT NULL,
  `descripcion_modulo` varchar(50) NOT NULL,
  `estado_modulo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`pk_id_modulo`, `nombre_modulo`, `descripcion_modulo`, `estado_modulo`) VALUES
(1, 'Seguridad', 'Aplicaciones de seguridad', 1),
(2, 'Consultas', 'Consultas Inteligentes', 1),
(3, 'Reporteador', 'Aplicaciones de Reporteador', 1),
(4, 'HRM', 'Aplicaciones de Recursos Humanos', 1),
(5, 'FRM', 'Aplicaciones de Finanzas', 1),
(6, 'SCM', 'Aplicaciones Control de Inventario', 1),
(7, 'MRP', 'Aplicaciones de Produccion', 1),
(8, 'CRM', 'Aplicaciones de Ventas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_cuenta_por_cobrar`
--

CREATE TABLE `movimiento_cuenta_por_cobrar` (
  `pk_id_movimiento_cuenta` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `fk_id_tipo_cuenta` int(11) NOT NULL,
  `fk_id_cliente` int(11) NOT NULL,
  `fk_id_factura` int(11) NOT NULL,
  `saldo_cuenta` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movimiento_cuenta_por_cobrar`
--

INSERT INTO `movimiento_cuenta_por_cobrar` (`pk_id_movimiento_cuenta`, `fecha`, `fk_id_tipo_cuenta`, `fk_id_cliente`, `fk_id_factura`, `saldo_cuenta`) VALUES
(7, '2020-11-10 17:33:58', 1, 2, 2, 5000),
(8, '2020-11-10 19:52:21', 1, 2, 2, 5000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_inventario`
--

CREATE TABLE `movimiento_inventario` (
  `pk_id_movimiento_inventario` int(10) NOT NULL,
  `fecha_movimiento_inventario` datetime NOT NULL,
  `fk_id_tipo_movimiento` int(10) NOT NULL,
  `fk_id_ruta` int(10) NOT NULL,
  `fk_id_vehiculo` int(10) NOT NULL,
  `documento_asociado_movimiento_inventario` int(10) NOT NULL,
  `descripcion_movimiento_inventario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_inventario_detalle`
--

CREATE TABLE `movimiento_inventario_detalle` (
  `pk_id_movimiento_inventario_detalle` int(10) NOT NULL,
  `fk_id_movimiento_inventario` int(10) NOT NULL,
  `fk_id_producto` int(10) NOT NULL,
  `cantidad_inventario_detalle` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `pk_id_municipio` int(10) NOT NULL,
  `fk_id_departamento` int(10) NOT NULL,
  `nombre_municipio` varchar(30) NOT NULL,
  `descripcion_municipio` varchar(45) NOT NULL,
  `estado_municipio` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`pk_id_municipio`, `fk_id_departamento`, `nombre_municipio`, `descripcion_municipio`, `estado_municipio`) VALUES
(1, 2, 'Santa Catarina Pinula', 'lolo', 1),
(2, 1, 'Cantel', 'nose', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_compra`
--

CREATE TABLE `orden_compra` (
  `pk_id_orden_compra` int(10) NOT NULL,
  `fk_id_producto_orden_compra` int(11) DEFAULT NULL,
  `fecha_envio_orden_compra` date DEFAULT NULL,
  `cantidad_orden_compra` int(11) DEFAULT NULL,
  `estado_orden_compra` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `pk_id_pais` int(10) NOT NULL,
  `nombre_pais` varchar(40) NOT NULL,
  `capital_pais` varchar(40) NOT NULL,
  `estado_pais` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalle`
--

CREATE TABLE `pedido_detalle` (
  `fk_id_pedido_encabezado` int(10) NOT NULL,
  `cod_linea_pedido_detalle` int(10) NOT NULL,
  `fk_id_producto` int(10) NOT NULL,
  `cantidad_pedido_detalle` int(10) NOT NULL,
  `precio_unitario_pedido_detalle` double(8,2) NOT NULL,
  `subtotal_pedido_detalle` double(12,2) NOT NULL,
  `estado_pedido_detalle` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido_detalle`
--

INSERT INTO `pedido_detalle` (`fk_id_pedido_encabezado`, `cod_linea_pedido_detalle`, `fk_id_producto`, `cantidad_pedido_detalle`, `precio_unitario_pedido_detalle`, `subtotal_pedido_detalle`, `estado_pedido_detalle`) VALUES
(1, 10, 1, 25, 30.00, 750.00, 1),
(17, 1, 1, 8, 2.60, 20.80, 1),
(19, 1, 1, 2, 2.30, 4.60, 1),
(20, 1, 2, 3, 2.60, 7.80, 1),
(21, 1, 2, 3, 2.30, 6.90, 1),
(22, 1, 1, 8, 2.60, 20.80, 1),
(23, 1, 1, 5, 9.30, 46.50, 1),
(24, 1, 1, 5, 9.30, 46.50, 1),
(25, 1, 1, 8, 2.30, 18.40, 1),
(26, 1, 2, 5, 6.30, 31.50, 1),
(28, 1, 1, 6, 16.30, 97.80, 1),
(29, 1, 1, 2, 100.00, 200.00, 1),
(30, 1, 1, 40, 200.00, 8000.00, 1),
(31, 1, 3, 300, 400.00, 120000.00, 1),
(32, 1, 1, 500, 900.00, 450000.00, 1),
(33, 1, 1, 500, 200.00, 100000.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_encabezado`
--

CREATE TABLE `pedido_encabezado` (
  `pk_id_pedido_encabezado` int(10) NOT NULL,
  `fk_id_fabrica` int(10) NOT NULL,
  `estado_proceso_pedido_encabezado` int(1) NOT NULL,
  `fec_pedido_pedido_encabezado` varchar(45) NOT NULL,
  `total_pedido_encabezado` double(12,2) NOT NULL,
  `estado_pedido_encabezado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido_encabezado`
--

INSERT INTO `pedido_encabezado` (`pk_id_pedido_encabezado`, `fk_id_fabrica`, `estado_proceso_pedido_encabezado`, `fec_pedido_pedido_encabezado`, `total_pedido_encabezado`, `estado_pedido_encabezado`) VALUES
(1, 1, 1, '2020-08-06 16:46:10', 30.00, 1),
(2, 2, 1, '2020-11-04 16:47:03', 45.00, 1),
(5, 1, 1, '0000-00-00 00:00:00', 5.00, 1),
(11, 1, 1, '0000-00-00 00:00:00', 49.50, 1),
(12, 1, 1, '0000-00-00 00:00:00', 19.60, 1),
(13, 1, 1, '0000-00-00 00:00:00', 8.30, 1),
(14, 1, 1, '2020/06/09 16:06', 49.60, 1),
(15, 1, 1, '2020/42/09 17:42', 63.00, 1),
(16, 1, 1, '2020/47/09 17:47', 78.90, 1),
(17, 1, 1, '2020/49/09 17:49', 44.80, 1),
(18, 1, 1, '2020/49/09 17:49', 18.40, 1),
(19, 1, 1, '2020/51/09 17:51', 4.60, 1),
(20, 1, 1, '2020/55/09 17:55', 39.00, 1),
(21, 1, 1, '2020/01/09 18:01', 14.90, 1),
(22, 1, 1, '2020/03/09 18:03', 56.80, 1),
(23, 1, 1, '2020/17/09 18:17', 73.50, 1),
(24, 1, 1, '2020/22/09 18:22', 139.50, 1),
(25, 1, 1, '2020/25/09 18:25', 50.50, 1),
(26, 1, 1, '2020/28/09 18:28', 236.10, 1),
(27, 1, 1, '2020/37/09 18:37', 193.50, 1),
(28, 1, 1, '2020/39/09 18:39', 556.80, 1),
(29, 1, 1, '2020-09-09 22:09', 200.00, 1),
(30, 2, 1, '2020/15/09 23:15', 18000.00, 1),
(31, 2, 1, '2020/41/10 00:41', 150000.00, 1),
(32, 1, 1, '2020/29/10 07:29', 450000.00, 1),
(33, 1, 1, '2020/48/10 19:48', 100000.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `percepcion`
--

CREATE TABLE `percepcion` (
  `pk_id_percepcion` int(11) NOT NULL,
  `nombre_percepcion` varchar(45) DEFAULT NULL,
  `monto_percepcion` double DEFAULT NULL,
  `descripcion_percepcion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `pk_id_perfil` int(10) NOT NULL,
  `nombre_perfil` varchar(50) DEFAULT NULL,
  `descripcion_perfil` varchar(100) DEFAULT NULL,
  `estado_perfil` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`pk_id_perfil`, `nombre_perfil`, `descripcion_perfil`, `estado_perfil`) VALUES
(1, 'Admin', 'Administracion del programa', 1),
(2, 'Sistema', 'Administrador del sistema', 1),
(3, 'Digitador', 'Digitador para Cuentas', 1),
(4, 'Consultor', 'Unicamente consultas ', 1),
(5, 'Reportes', 'Ingreso y consultas de reportes', 1),
(6, 'Pruebas', 'pruebas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_usuario`
--

CREATE TABLE `perfil_usuario` (
  `pk_id_perfil_usuario` int(10) NOT NULL,
  `fk_idusuario_perfil_usuario` int(10) DEFAULT NULL,
  `fk_idperfil_perfil_usuario` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `perfil_usuario`
--

INSERT INTO `perfil_usuario` (`pk_id_perfil_usuario`, `fk_idusuario_perfil_usuario`, `fk_idperfil_perfil_usuario`) VALUES
(1, 1, 1),
(2, 3, 3),
(4, 4, 1),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `pk_id_permiso` int(10) NOT NULL,
  `insertar_permiso` tinyint(1) DEFAULT NULL,
  `modificar_permiso` tinyint(1) DEFAULT NULL,
  `eliminar_permiso` tinyint(1) DEFAULT NULL,
  `consultar_permiso` tinyint(1) DEFAULT NULL,
  `imprimir_permiso` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`pk_id_permiso`, `insertar_permiso`, `modificar_permiso`, `eliminar_permiso`, `consultar_permiso`, `imprimir_permiso`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 1, 0, 0, 1, 1),
(3, 1, 1, 1, 0, 0),
(4, 1, 1, 1, 1, 1),
(5, 1, 1, 1, 1, 1),
(6, 1, 1, 1, 1, 1),
(7, 1, 1, 1, 1, 1),
(8, 1, 0, 1, 0, 0),
(9, 1, 1, 0, 0, 0),
(10, 1, 1, 0, 0, 0),
(11, 1, 1, 1, 1, 1),
(12, 0, 0, 0, 1, 0),
(13, 0, 0, 0, 1, 0),
(14, 0, 0, 0, 0, 0),
(15, 1, 0, 0, 1, 0),
(16, 0, 0, 0, 0, 0),
(17, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peticion_poliza`
--

CREATE TABLE `peticion_poliza` (
  `pk_id_peticion_poliza` int(11) NOT NULL,
  `concepto_peticion_poliza` varchar(30) DEFAULT NULL,
  `fecha_peticion_poliza` datetime DEFAULT NULL,
  `descripcion_peticion_poliza` varchar(100) DEFAULT NULL,
  `monto_peticion_poliza` double DEFAULT NULL,
  `fk_pk_poliza_encabezado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poliza_detalle`
--

CREATE TABLE `poliza_detalle` (
  `pk_poliza_encabezado` int(11) NOT NULL,
  `pk_id_cuenta_contable` int(11) NOT NULL,
  `monto_poliza_detalle` double DEFAULT NULL,
  `debe_poliza_detalle` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poliza_encabezado`
--

CREATE TABLE `poliza_encabezado` (
  `pk_poliza_encabezado` int(11) NOT NULL,
  `fecha_poliza_encabezado` datetime DEFAULT NULL,
  `descripcion_poliza_encabezado` varchar(75) DEFAULT NULL,
  `estado_poliza_encabezado` tinyint(4) DEFAULT NULL,
  `total_poliza_encabezado` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `pk_id_producto` int(10) NOT NULL,
  `fk_id_linea_producto` int(10) NOT NULL,
  `fk_id_categoria_producto` int(10) NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `precio_producto` double(12,2) NOT NULL,
  `medida_producto` double(5,2) NOT NULL,
  `descripcion_producto` varchar(45) NOT NULL,
  `estado_producto` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`pk_id_producto`, `fk_id_linea_producto`, `fk_id_categoria_producto`, `nombre_producto`, `precio_producto`, `medida_producto`, `descripcion_producto`, `estado_producto`) VALUES
(1, 1, 1, 'Cama Imperial', 100.00, 10.00, 'lolo', 1),
(2, 2, 2, 'Cama Matrimonial', 200.00, 11.00, 'lalo', 1),
(3, 1, 1, 'Cama King', 2000.00, 2.00, 'ninguna', 1),
(4, 1, 1, 'Colchon Grande', 400.00, 2.50, 'no sirven', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_terminado`
--

CREATE TABLE `producto_terminado` (
  `pk_id_producto_terminado` int(10) NOT NULL,
  `fk_id_producto_producto_terminado` int(10) DEFAULT NULL,
  `cantidad_producto_terminado` int(11) DEFAULT NULL,
  `estado_producto_terminado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `pk_id_propietario` int(11) NOT NULL,
  `nombre_propietario` varchar(45) DEFAULT NULL,
  `descripcion_propietario` varchar(75) DEFAULT NULL,
  `estado_propietario` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `pk_id_proveedor` int(10) NOT NULL,
  `fk_id_pais` int(10) NOT NULL,
  `razon_social_proveedor` varchar(45) NOT NULL,
  `representante_legal_proveedor` varchar(45) NOT NULL,
  `nit_proveedor` varchar(20) NOT NULL,
  `estado_proveedor` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

CREATE TABLE `puesto` (
  `pk_id_puesto` int(11) NOT NULL,
  `nombre_puesto` varchar(45) DEFAULT NULL,
  `salario_puesto` double DEFAULT NULL,
  `fk_id_horario_puesto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `puesto`
--

INSERT INTO `puesto` (`pk_id_puesto`, `nombre_puesto`, `salario_puesto`, `fk_id_horario_puesto`) VALUES
(1, 'Vendedor', 1000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas_encabezado`
--

CREATE TABLE `recetas_encabezado` (
  `pk_id_receta_encabezado` int(10) NOT NULL,
  `descripcion_receta_encabezado` varchar(100) DEFAULT NULL,
  `fk_id_producto_receta_encabezado` int(10) DEFAULT NULL,
  `estado_encabezado_receta` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclutamiento`
--

CREATE TABLE `reclutamiento` (
  `pk_id_reclutamiento` int(11) NOT NULL,
  `fk_id_nivel_estudio_reclutamiento` int(11) DEFAULT NULL,
  `nombre1_reclutamiento` varchar(45) DEFAULT NULL,
  `nombre2_reclutamiento` varchar(45) DEFAULT NULL,
  `apellido1_reclutamiento` varchar(45) DEFAULT NULL,
  `apellido2_reclutamiento` varchar(45) DEFAULT NULL,
  `fecha_nacimiento_reclutamiento` varchar(10) DEFAULT NULL,
  `dpi_reclutamiento` int(11) DEFAULT NULL,
  `fk_id_genero_reclutamiento` int(11) DEFAULT NULL,
  `fk_id_estado_civil_reclutamiento` int(11) DEFAULT NULL,
  `email_reclutamiento` varchar(125) DEFAULT NULL,
  `telefono_reclutamiento` int(11) DEFAULT NULL,
  `numero_igss_reclutamiento` int(11) DEFAULT NULL,
  `fk_id_licencia_conducir_reclutamiento` int(11) DEFAULT NULL,
  `fk_id_puesto_reclutamiento` int(11) DEFAULT NULL,
  `estado_reclutado_entrevista` int(11) DEFAULT NULL,
  `nombre_profesion` varchar(125) DEFAULT NULL,
  `fk_id_departamento_empresarial_reclutamiento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `pk_id_reporte` int(10) NOT NULL,
  `nombre_reporte` varchar(40) NOT NULL,
  `ruta_reporte` varchar(100) NOT NULL,
  `estado_reporte` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reporte`
--

INSERT INTO `reporte` (`pk_id_reporte`, `nombre_reporte`, `ruta_reporte`, `estado_reporte`) VALUES
(1, 'Reporte Cliente', 'rptClientes.rpt', 1),
(3, 'Cuentas por cobrar', 'rptCuentasPorCobrar.rpt', 1),
(4, 'Reporte Pedidos', 'rptPedidos.rpt', 1),
(5, 'Reporte Cotizacion', 'rtpCotizacion.rpt', 1),
(6, 'Reportes existencias', 'rtpExistencia.rpt', 1),
(7, 'Reportes facturas', 'rtpFacturas.rpt', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_aplicativo`
--

CREATE TABLE `reporte_aplicativo` (
  `fk_id_reporte` int(10) NOT NULL,
  `fk_id_aplicacion` int(10) NOT NULL,
  `fk_id_modulo` int(10) NOT NULL,
  `estado_reporte_aplicativo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reporte_aplicativo`
--

INSERT INTO `reporte_aplicativo` (`fk_id_reporte`, `fk_id_aplicacion`, `fk_id_modulo`, `estado_reporte_aplicativo`) VALUES
(1, 5001, 8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_modulo`
--

CREATE TABLE `reporte_modulo` (
  `fk_id_reporte` int(10) NOT NULL,
  `fk_id_modulo` int(10) NOT NULL,
  `estado_reporte_modulo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reporte_modulo`
--

INSERT INTO `reporte_modulo` (`fk_id_reporte`, `fk_id_modulo`, `estado_reporte_modulo`) VALUES
(1, 8, 1),
(3, 8, 1),
(4, 8, 1),
(5, 8, 1),
(6, 8, 1),
(7, 8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `pk_id_ruta` int(10) NOT NULL,
  `origen_ruta` varchar(40) NOT NULL,
  `destino_ruta` varchar(40) NOT NULL,
  `descripcion_ruta` varchar(45) NOT NULL,
  `estado_ruta` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saldo_historico`
--

CREATE TABLE `saldo_historico` (
  `pk_id_cuenta_contable` int(11) NOT NULL,
  `pk_fecha_saldo_historico` datetime NOT NULL,
  `monto_saldo_historico` double DEFAULT NULL,
  `cargo_saldo_hostorico` double DEFAULT NULL,
  `abono_saldo_historico` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_proveedor`
--

CREATE TABLE `telefono_proveedor` (
  `pk_id_telefono_proveedor` int(10) NOT NULL,
  `fk_id_proveedor` int(10) NOT NULL,
  `telefono_telefono_proveedor` varchar(20) NOT NULL,
  `estado_telefono_proveedor` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_baja`
--

CREATE TABLE `tipo_baja` (
  `pk_id_tipo_baja` int(11) NOT NULL,
  `nombre_tipo_baja` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_competencia`
--

CREATE TABLE `tipo_competencia` (
  `pk_id_tipo_competencia` int(11) NOT NULL,
  `nombre_competencia` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cuenta_contable`
--

CREATE TABLE `tipo_cuenta_contable` (
  `pk_id_tipo_cuenta_contable` int(11) NOT NULL,
  `nombre_tipo_cuenta_contable` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cuenta_por_cobrar`
--

CREATE TABLE `tipo_cuenta_por_cobrar` (
  `pk_id_tipo_cuenta` int(11) NOT NULL,
  `nombre_cuenta` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_cuenta_por_cobrar`
--

INSERT INTO `tipo_cuenta_por_cobrar` (`pk_id_tipo_cuenta`, `nombre_cuenta`) VALUES
(1, 'Recibo'),
(2, 'Comprobante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_entrevista`
--

CREATE TABLE `tipo_entrevista` (
  `pk_id_tipo_entrevista` int(11) NOT NULL,
  `nombre_tipo_entrevista` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_moneda`
--

CREATE TABLE `tipo_moneda` (
  `pk_id_tipo_moneda` int(11) NOT NULL,
  `moneda_tipo_moneda` varchar(45) DEFAULT NULL,
  `simbolo_tipo_moneda` varchar(2) DEFAULT NULL,
  `descripcion_tipo_moneda` varchar(75) DEFAULT NULL,
  `estado_tipo_moneda` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_movimiento`
--

CREATE TABLE `tipo_movimiento` (
  `pk_id_tipo_movimiento` int(10) NOT NULL,
  `nombre_tipo_movimiento` varchar(45) NOT NULL,
  `signo_tipo_movimiento` varchar(1) DEFAULT NULL,
  `estado_tipo_movimiento` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_transaccion`
--

CREATE TABLE `tipo_transaccion` (
  `pk_id_tipo_transaccion` int(11) NOT NULL,
  `nombre_tipo_transaccion` varchar(45) DEFAULT NULL,
  `descripcion_tipo_transaccion` varchar(75) DEFAULT NULL,
  `estado_tipo_transaccion` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_venta`
--

CREATE TABLE `tipo_venta` (
  `pk_id_tipo_venta` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_venta`
--

INSERT INTO `tipo_venta` (`pk_id_tipo_venta`, `nombre`) VALUES
(1, 'Credito'),
(2, 'Contado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion`
--

CREATE TABLE `transaccion` (
  `pk_id_transaccion` int(11) NOT NULL,
  `fk_id_numero_cuenta_bancaria` int(11) NOT NULL,
  `fecha_transaccion` datetime DEFAULT NULL,
  `fk_id_tipo_transaccion` int(11) NOT NULL,
  `fk_id_tipo_moneda` int(11) NOT NULL,
  `monto_transaccion` double DEFAULT NULL,
  `descripcion_transaccion` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `pk_id_vehiculo` int(10) NOT NULL,
  `fk_id_marca` int(10) NOT NULL,
  `placa_vehiculo` varchar(45) NOT NULL,
  `modelo_vehiculo` varchar(45) NOT NULL,
  `color_vehiculo` varchar(45) NOT NULL,
  `anio_vehiculo` varchar(45) NOT NULL,
  `tipo_combustible_vehiculo` varchar(45) NOT NULL,
  `estado_vehiculo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD PRIMARY KEY (`pk_id_aplicacion`),
  ADD KEY `pk_id_aplicacion` (`pk_id_aplicacion`),
  ADD KEY `fk_aplicacion_modulo` (`fk_id_modulo`);

--
-- Indices de la tabla `aplicacion_perfil`
--
ALTER TABLE `aplicacion_perfil`
  ADD PRIMARY KEY (`pk_id_aplicacion_perfil`),
  ADD KEY `fk_aplicacionperfil_aplicacion` (`fk_idaplicacion_aplicacion_perfil`),
  ADD KEY `fk_aplicacionperfil_perfil` (`fk_idperfil_aplicacion_perfil`),
  ADD KEY `fk_aplicacionperfil_permiso` (`fk_idpermiso_aplicacion_perfil`);

--
-- Indices de la tabla `aplicacion_usuario`
--
ALTER TABLE `aplicacion_usuario`
  ADD PRIMARY KEY (`pk_id_aplicacion_usuario`),
  ADD KEY `fk_aplicacionusuario_login` (`fk_idlogin_aplicacion_usuario`),
  ADD KEY `fk_aplicacionusuario_aplicacion` (`fk_idaplicacion_aplicacion_usuario`),
  ADD KEY `fk_aplicacionusuario_permiso` (`fk_idpermiso_aplicacion_usuario`);

--
-- Indices de la tabla `ascenso`
--
ALTER TABLE `ascenso`
  ADD PRIMARY KEY (`pk_id_ascenso`),
  ADD KEY `fk_ascenso_empleado` (`fk_id_empleado_ascenso`),
  ADD KEY `fk_ascenso_puesto_anterior` (`fk_puesto_anterior_ascenso`),
  ADD KEY `fk_ascenso_depto_anterior` (`fk_departamento_anterior_ascenso`),
  ADD KEY `fk_ascenso_puesto_nuevo` (`fk_puesto_nuevo_ascenso`),
  ADD KEY `fk_ascenso_depto_nuevo` (`fk_departamento_nuevo_ascenso`);

--
-- Indices de la tabla `baja`
--
ALTER TABLE `baja`
  ADD PRIMARY KEY (`pk_id_baja`),
  ADD KEY `fk_bajas_empleado` (`fk_id_empleado_baja`),
  ADD KEY `fk_tipo_bajas` (`fk_id_tipo_baja`);

--
-- Indices de la tabla `balance_detalle`
--
ALTER TABLE `balance_detalle`
  ADD PRIMARY KEY (`pk_id_balance_encabezado`),
  ADD KEY `fk_balance_detalle_cuenta` (`pk_id_cuenta_contable`);

--
-- Indices de la tabla `balance_encabezado`
--
ALTER TABLE `balance_encabezado`
  ADD PRIMARY KEY (`pk_id_balance_encabezado`);

--
-- Indices de la tabla `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`pk_id_banco`);

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`pk_id_bitacora`),
  ADD KEY `fk_login_bitacora` (`fk_idusuario_bitacora`),
  ADD KEY `fk_aplicacion_bitacora` (`fk_idaplicacion_bitacora`);

--
-- Indices de la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD PRIMARY KEY (`pk_id_bodega`),
  ADD KEY `pk_id_bodega` (`pk_id_bodega`),
  ADD KEY `fk_bodega_municipio` (`fk_id_municipio`);

--
-- Indices de la tabla `capacitacion`
--
ALTER TABLE `capacitacion`
  ADD PRIMARY KEY (`pk_id_capacitacion`),
  ADD KEY `fk_encabezado_capacitacion` (`fk_id_encabezado_capacitacion`),
  ADD KEY `fk_empleado_capacitacion` (`fk_id_empleado_capacitacion`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`pk_id_categoria_producto`),
  ADD KEY `pk_id_categoria_producto` (`pk_id_categoria_producto`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`pk_id_cliente`);

--
-- Indices de la tabla `competencia_desarrollo`
--
ALTER TABLE `competencia_desarrollo`
  ADD PRIMARY KEY (`pk_id_competencia_desarrollo`),
  ADD KEY `fk_encabezado_competencia` (`fk_id_encabezado_competencia`),
  ADD KEY `fk_tipo_competencia_desarrollo` (`fk_id_tipo_competencia_desarrollo`);

--
-- Indices de la tabla `compra_detalle`
--
ALTER TABLE `compra_detalle`
  ADD PRIMARY KEY (`fk_id_compra_encabezado`,`cod_linea_compra_detalle`),
  ADD KEY `fk_id_compra_encabezado` (`fk_id_compra_encabezado`,`cod_linea_compra_detalle`),
  ADD KEY `fk_compra_producto` (`fk_id_producto`);

--
-- Indices de la tabla `compra_encabezado`
--
ALTER TABLE `compra_encabezado`
  ADD PRIMARY KEY (`pk_id_compra_encabezado`),
  ADD KEY `pk_id_compra_encabezado` (`pk_id_compra_encabezado`),
  ADD KEY `fk_compra_proveedor` (`fk_id_proveedor`);

--
-- Indices de la tabla `consulta_inteligente`
--
ALTER TABLE `consulta_inteligente`
  ADD PRIMARY KEY (`pk_id_consulta_inteligente`);

--
-- Indices de la tabla `control_asistencia`
--
ALTER TABLE `control_asistencia`
  ADD PRIMARY KEY (`pk_id_control_asistencia`),
  ADD KEY `fk_control_asistencia_empleado` (`fk_id_control_asistencia_empleado`),
  ADD KEY `fk_control_asistencia_encabezado_nomina` (`fk_id_control_asistencia_encabezado_nomina`);

--
-- Indices de la tabla `control_calidad`
--
ALTER TABLE `control_calidad`
  ADD PRIMARY KEY (`pk_id_control_calidad`),
  ADD KEY `fk_CONTROL_CALIDAD_PEDIDO_ENCABEZADO` (`fk_id_pedido_encabezado_control_calidad`);

--
-- Indices de la tabla `control_empleado`
--
ALTER TABLE `control_empleado`
  ADD PRIMARY KEY (`pk_id_control`),
  ADD KEY `fk_CONTROL_EMPLEADO_EMPLEADOS HRM1_idx` (`fk_id_empleado`);

--
-- Indices de la tabla `control_horas`
--
ALTER TABLE `control_horas`
  ADD PRIMARY KEY (`pk_id_control_horas`),
  ADD KEY `fk_control_horas_empleado` (`fk_id_control_horas_empleado`),
  ADD KEY `fk_control_horas_encabezado_nomina` (`fk_id_control_horas_encabezado_nomina`);

--
-- Indices de la tabla `control_producto`
--
ALTER TABLE `control_producto`
  ADD PRIMARY KEY (`pk_id_control_producto`),
  ADD KEY `fk_CONTROL_PRODUCTO_ORDEN_PRODUCCION1` (`fk_id_pedido_encabezado_control_producto`),
  ADD KEY `fk_CONTROL_PRODUCTO_ESTADO_PRODUCCION` (`fk_id_estado_produccion_control_producto`);

--
-- Indices de la tabla `correo_proveedor`
--
ALTER TABLE `correo_proveedor`
  ADD PRIMARY KEY (`pk_id_correo_proveedor`),
  ADD KEY `pk_id_correo_proveedor` (`pk_id_correo_proveedor`),
  ADD KEY `fk_proveedor_correo` (`fk_id_proveedor`);

--
-- Indices de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`pk_id_cotizacion`),
  ADD KEY `fk_COTIZACION_CLIENTES1_idx` (`fk_id_cliente`);

--
-- Indices de la tabla `cuenta_bancaria`
--
ALTER TABLE `cuenta_bancaria`
  ADD PRIMARY KEY (`pk_id_numero_cuenta_bancaria`),
  ADD KEY `fk_cuenta_bancaria_banco` (`fk_id_banco`),
  ADD KEY `fk_cuenta_bancaria_propietario` (`fk_id_propietario`),
  ADD KEY `fk_cuenta_bancaria_tipomoneda` (`fk_id_tipo_moneda`);

--
-- Indices de la tabla `cuenta_contable`
--
ALTER TABLE `cuenta_contable`
  ADD PRIMARY KEY (`pk_id_cuenta_contable`),
  ADD KEY `fk_cuenta_padre_cuenta_hijo` (`fk_cuenta_padre_cuenta_contable`),
  ADD KEY `fk_tipo_cuenta_cuenta_contable` (`fk_id_tipo_cuenta_contable`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`pk_id_curso`),
  ADD KEY `fk_empleado_curso` (`fk_id_empleado_curso`);

--
-- Indices de la tabla `deduccion`
--
ALTER TABLE `deduccion`
  ADD PRIMARY KEY (`pk_id_deduccion`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`pk_id_departamento`),
  ADD KEY `pk_id_departamento` (`pk_id_departamento`);

--
-- Indices de la tabla `departamento_empresarial`
--
ALTER TABLE `departamento_empresarial`
  ADD PRIMARY KEY (`pk_id__departamento_empresarial`);

--
-- Indices de la tabla `detalles_venta_empleado`
--
ALTER TABLE `detalles_venta_empleado`
  ADD PRIMARY KEY (`fk_id_venta`,`fk_id_empleado`),
  ADD KEY `fk_VENTAS_has_EMPLEADOS HRM_EMPLEADOS HRM1_idx` (`fk_id_empleado`);

--
-- Indices de la tabla `detalle_bitacora`
--
ALTER TABLE `detalle_bitacora`
  ADD PRIMARY KEY (`pk_id_detalle_bitacora`),
  ADD KEY `fk_bitacora_detallebitacora` (`fk_idbitacora_detalle_bitacora`);

--
-- Indices de la tabla `detalle_cotizacion`
--
ALTER TABLE `detalle_cotizacion`
  ADD PRIMARY KEY (`fk_id_cotizacion`,`cod_linea`),
  ADD KEY `fk_COTIZACION_has_PRODUCTO_SCM_PRODUCTO_SCM1_idx` (`fk_id_producto`),
  ADD KEY `fk_COTIZACION_has_PRODUCTO_SCM_COTIZACION1_idx` (`fk_id_cotizacion`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`fk_id_factura`,`cod_linea`),
  ADD KEY `fk_VENTAS_has_FACTURAS_FACTURAS1_idx` (`fk_id_factura`),
  ADD KEY `fk_DETALLE_FACTURA_PRODUCTO_SCM1_idx` (`fk_id_producto`);

--
-- Indices de la tabla `detalle_hora_empleado`
--
ALTER TABLE `detalle_hora_empleado`
  ADD PRIMARY KEY (`pk_id_detalle_hora_empleado`),
  ADD KEY `fk_HORA_EMPLEADO_DETALLE_HORA_EMPLEADO` (`fk_id_hora_empleado_detalle`);

--
-- Indices de la tabla `detalle_nomina`
--
ALTER TABLE `detalle_nomina`
  ADD PRIMARY KEY (`pk_id_detalle_nomina`),
  ADD KEY `fk_encabezado_detalle_nomina` (`fk_id_encabezado_detalle_nomina`),
  ADD KEY `fk_emplado_detalle_nomina` (`fk_id_empleado_detalle_nomina`),
  ADD KEY `fk_percepcion_detalle_nomina` (`fk_id_percepciones_detalle_nomina`),
  ADD KEY `fk_deduccion_detalle_nomina` (`fk_id_deducciones_detalle_nomina`);

--
-- Indices de la tabla `detalle_receta`
--
ALTER TABLE `detalle_receta`
  ADD PRIMARY KEY (`pk_id_detalle_detalle_receta`),
  ADD KEY `fk_detalle_receta_encabezado` (`fk_id_receta_encabezado_detalle`),
  ADD KEY `fk_estado_produccion_detalle` (`fk_id_estado_produccion_detalle_receta`),
  ADD KEY `fk_producto_detalle` (`fk_id_producto_detalle_receta`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`pk_id_direccion`),
  ADD KEY `fk_empleado_direccion` (`fk_empleado_direccion`),
  ADD KEY `fk_reclutamiento_direccion` (`fk_reclutamiento_direccion`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`pk_id_empleado`),
  ADD KEY `fk_genero_empleado1` (`fk_id_genero_empleado`),
  ADD KEY `fk_estado_civil_empleado` (`fk_id_estado_civil_empleado`),
  ADD KEY `fk_licencia_conducir_empleado` (`fk_id_licencia_conducir_empleado`),
  ADD KEY `fk_puesto_empleado` (`fk_id_puesto_empleado`),
  ADD KEY `fk_departamento_empresarial_empleado` (`fk_id_departamento_empresarial_empleado`);

--
-- Indices de la tabla `encabezado_capacitacion`
--
ALTER TABLE `encabezado_capacitacion`
  ADD PRIMARY KEY (`pk_id_encabezado_capacitacion`),
  ADD KEY `fk_curso_encabezado_capacitacion` (`fk_id_curso_encabezado_capacitacion`);

--
-- Indices de la tabla `encabezado_competencia`
--
ALTER TABLE `encabezado_competencia`
  ADD PRIMARY KEY (`pk_id_encabezado_competencia`),
  ADD KEY `fk_empleado_encabezado_competencia` (`fk_id_empleado_encabezado_competencia`);

--
-- Indices de la tabla `encabezado_nomina`
--
ALTER TABLE `encabezado_nomina`
  ADD PRIMARY KEY (`pk_id_encabezado_nomina`);

--
-- Indices de la tabla `encargado_bodega`
--
ALTER TABLE `encargado_bodega`
  ADD PRIMARY KEY (`pk_id_encargado_bodega`),
  ADD KEY `pk_id_encargado_bodega` (`pk_id_encargado_bodega`),
  ADD KEY `fk_empleado_bodega` (`fk_id_bodega`),
  ADD KEY `fk_empleado_encargado` (`fk_id_empleado`);

--
-- Indices de la tabla `entrevista`
--
ALTER TABLE `entrevista`
  ADD PRIMARY KEY (`pk_id_entrevista`),
  ADD KEY `fk_empleado_entrevista` (`fk_id_empleado_entrevista`),
  ADD KEY `fk_reclutamiento_entrevista` (`fk_id_reclutamiento_entrevista`),
  ADD KEY `fk_tipo_entrevista` (`fk_id_tipo_entrevista`);

--
-- Indices de la tabla `estado_civil`
--
ALTER TABLE `estado_civil`
  ADD PRIMARY KEY (`pk_id_estado_civil`);

--
-- Indices de la tabla `estado_produccion`
--
ALTER TABLE `estado_produccion`
  ADD PRIMARY KEY (`pk_id_estado_produccion`);

--
-- Indices de la tabla `existencia`
--
ALTER TABLE `existencia`
  ADD PRIMARY KEY (`pk_id_existencia`),
  ADD KEY `pk_id_existencia` (`pk_id_existencia`),
  ADD KEY `fk_inventario_producto` (`fk_id_producto`),
  ADD KEY `fk_inventario_bodega` (`fk_id_bodega`);

--
-- Indices de la tabla `fabrica`
--
ALTER TABLE `fabrica`
  ADD PRIMARY KEY (`pk_id_fabrica`),
  ADD KEY `pk_id_fabrica` (`pk_id_fabrica`),
  ADD KEY `fk_fabrica_municipio` (`fk_id_municipio`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`pk_id_factura`),
  ADD KEY `fk_FACTURAS_TIPO_VENTA1_idx` (`fk_id_tipo_venta`),
  ADD KEY `fk_FACTURAS_CLIENTES1_idx` (`fk_id_cliente`),
  ADD KEY `fk_FACTURAS_EMPLEADOS HRM1_idx` (`fk_id_empleado`);

--
-- Indices de la tabla `falta`
--
ALTER TABLE `falta`
  ADD PRIMARY KEY (`pk_id_falta`);

--
-- Indices de la tabla `falta_empleado`
--
ALTER TABLE `falta_empleado`
  ADD KEY `fk_empleado_falta` (`fk_id_empleado_falta_empleado`),
  ADD KEY `fk_tipo_falta` (`fk_id_tipo_falta_empleado`);

--
-- Indices de la tabla `formacion_academica`
--
ALTER TABLE `formacion_academica`
  ADD PRIMARY KEY (`pk_id_formacion_academica`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`pk_id_genero`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`pk_id_horario`);

--
-- Indices de la tabla `hora_empleado`
--
ALTER TABLE `hora_empleado`
  ADD PRIMARY KEY (`pk_id_hora_empleado`),
  ADD KEY `fk_HORA_EMPLEADO_ORDEN_PRODUCCION1` (`fk_id_pedido_encabezado_hora_empleado`),
  ADD KEY `fk_HORAEMPLEADO_EMPLEADO` (`fk_id_empleado_hora_empleado`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`pk_id_inventario`),
  ADD KEY `pk_id_inventario` (`pk_id_inventario`),
  ADD KEY `fk_total_inventario` (`fk_id_producto`);

--
-- Indices de la tabla `licencia_conduccion`
--
ALTER TABLE `licencia_conduccion`
  ADD PRIMARY KEY (`pk_id_licencia_conduccion`);

--
-- Indices de la tabla `linea_producto`
--
ALTER TABLE `linea_producto`
  ADD PRIMARY KEY (`pk_id_linea_producto`),
  ADD KEY `pk_id_linea_producto` (`pk_id_linea_producto`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`pk_id_login`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`pk_id_marca`),
  ADD KEY `pk_id_marca` (`pk_id_marca`);

--
-- Indices de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD PRIMARY KEY (`pk_id_materia_prima`),
  ADD KEY `fk_materia_prima_producto` (`fk_id_producto_materia_prima`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`pk_id_modulo`),
  ADD KEY `pk_id_modulo` (`pk_id_modulo`);

--
-- Indices de la tabla `movimiento_cuenta_por_cobrar`
--
ALTER TABLE `movimiento_cuenta_por_cobrar`
  ADD PRIMARY KEY (`pk_id_movimiento_cuenta`),
  ADD KEY `fk_MOVIMIENTO_CUENTA_POR_COBRAR_CLIENTES1_idx` (`fk_id_cliente`),
  ADD KEY `fk_MOVIMIENTO_CUENTA_POR_COBRAR_TIPO_CUENTA_POR_COBRAR1_idx` (`fk_id_tipo_cuenta`),
  ADD KEY `fk_MOVIMIENTO_CUENTA_POR_COBRAR_FACTURAS1_idx` (`fk_id_factura`);

--
-- Indices de la tabla `movimiento_inventario`
--
ALTER TABLE `movimiento_inventario`
  ADD PRIMARY KEY (`pk_id_movimiento_inventario`),
  ADD KEY `pk_id_movimiento_inventario` (`pk_id_movimiento_inventario`),
  ADD KEY `fk_mov_inventario_tipo` (`fk_id_tipo_movimiento`),
  ADD KEY `fk_mov_inventario_ruta` (`fk_id_ruta`),
  ADD KEY `fk_mov_inventario_vehiculo` (`fk_id_vehiculo`);

--
-- Indices de la tabla `movimiento_inventario_detalle`
--
ALTER TABLE `movimiento_inventario_detalle`
  ADD PRIMARY KEY (`pk_id_movimiento_inventario_detalle`),
  ADD KEY `pk_id_movimiento_inventario_detalle` (`pk_id_movimiento_inventario_detalle`),
  ADD KEY `fk_mov_inventario_detalle_mov` (`fk_id_movimiento_inventario`),
  ADD KEY `fk_mov_inventario_detalle_producto` (`fk_id_producto`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`pk_id_municipio`),
  ADD KEY `pk_id_municipio` (`pk_id_municipio`),
  ADD KEY `fk_municipio_departamento` (`fk_id_departamento`);

--
-- Indices de la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  ADD PRIMARY KEY (`pk_id_orden_compra`),
  ADD KEY `fk_ORDEN_COMPRA_PRODUCTO1` (`fk_id_producto_orden_compra`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`pk_id_pais`),
  ADD KEY `pk_id_pais` (`pk_id_pais`);

--
-- Indices de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD PRIMARY KEY (`fk_id_pedido_encabezado`,`cod_linea_pedido_detalle`),
  ADD KEY `fk_id_pedido_encabezado` (`fk_id_pedido_encabezado`,`cod_linea_pedido_detalle`),
  ADD KEY `fk_pedido_producto` (`fk_id_producto`);

--
-- Indices de la tabla `pedido_encabezado`
--
ALTER TABLE `pedido_encabezado`
  ADD PRIMARY KEY (`pk_id_pedido_encabezado`),
  ADD KEY `pk_id_pedido_encabezado` (`pk_id_pedido_encabezado`),
  ADD KEY `fk_pedido_fabrica` (`fk_id_fabrica`);

--
-- Indices de la tabla `percepcion`
--
ALTER TABLE `percepcion`
  ADD PRIMARY KEY (`pk_id_percepcion`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`pk_id_perfil`);

--
-- Indices de la tabla `perfil_usuario`
--
ALTER TABLE `perfil_usuario`
  ADD PRIMARY KEY (`pk_id_perfil_usuario`),
  ADD KEY `fk_perfil_usuario_login` (`fk_idusuario_perfil_usuario`),
  ADD KEY `fk_perfil_usuario_perfil` (`fk_idperfil_perfil_usuario`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`pk_id_permiso`);

--
-- Indices de la tabla `peticion_poliza`
--
ALTER TABLE `peticion_poliza`
  ADD PRIMARY KEY (`pk_id_peticion_poliza`);

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- Indices de la tabla `poliza_detalle`
--
ALTER TABLE `poliza_detalle`
  ADD PRIMARY KEY (`pk_poliza_encabezado`,`pk_id_cuenta_contable`),
  ADD KEY `fk_poliza_detalle_cuenta` (`pk_id_cuenta_contable`);

--
-- Indices de la tabla `poliza_encabezado`
--
ALTER TABLE `poliza_encabezado`
  ADD PRIMARY KEY (`pk_poliza_encabezado`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`pk_id_producto`),
  ADD KEY `pk_id_producto` (`pk_id_producto`),
  ADD KEY `fk_producto_lineaProducto` (`fk_id_linea_producto`),
  ADD KEY `fk_producto_categoriaProducto` (`fk_id_categoria_producto`);

--
-- Indices de la tabla `producto_terminado`
--
ALTER TABLE `producto_terminado`
  ADD PRIMARY KEY (`pk_id_producto_terminado`),
  ADD KEY `fk_producto_terminado_producto` (`fk_id_producto_producto_terminado`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`pk_id_propietario`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`pk_id_proveedor`),
  ADD KEY `pk_id_proveedor` (`pk_id_proveedor`),
  ADD KEY `fk_proveedor_pais` (`fk_id_pais`);

--
-- Indices de la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD PRIMARY KEY (`pk_id_puesto`),
  ADD KEY `fk_horario_puesto` (`fk_id_horario_puesto`);

--
-- Indices de la tabla `recetas_encabezado`
--
ALTER TABLE `recetas_encabezado`
  ADD PRIMARY KEY (`pk_id_receta_encabezado`),
  ADD KEY `fk_recetas_encabezado_productos` (`fk_id_producto_receta_encabezado`);

--
-- Indices de la tabla `reclutamiento`
--
ALTER TABLE `reclutamiento`
  ADD PRIMARY KEY (`pk_id_reclutamiento`),
  ADD KEY `fk_nivel_estudio_reclutamiento` (`fk_id_nivel_estudio_reclutamiento`),
  ADD KEY `fk_genero_reclutamiento` (`fk_id_genero_reclutamiento`),
  ADD KEY `fk_estado_civil_reclutamiento` (`fk_id_estado_civil_reclutamiento`),
  ADD KEY `fk_licencia_conducir_reclutamiento` (`fk_id_licencia_conducir_reclutamiento`),
  ADD KEY `fk_puesto_reclutamiento` (`fk_id_puesto_reclutamiento`),
  ADD KEY `fk_departamento_empresarial_reclutamiento` (`fk_id_departamento_empresarial_reclutamiento`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`pk_id_reporte`),
  ADD KEY `pk_id_reporte` (`pk_id_reporte`);

--
-- Indices de la tabla `reporte_aplicativo`
--
ALTER TABLE `reporte_aplicativo`
  ADD PRIMARY KEY (`fk_id_reporte`,`fk_id_aplicacion`,`fk_id_modulo`),
  ADD KEY `fk_id_reporte` (`fk_id_reporte`,`fk_id_aplicacion`,`fk_id_modulo`),
  ADD KEY `fk_reporte_aplicativo_modulo` (`fk_id_modulo`),
  ADD KEY `fk_report_aplicativo` (`fk_id_aplicacion`);

--
-- Indices de la tabla `reporte_modulo`
--
ALTER TABLE `reporte_modulo`
  ADD PRIMARY KEY (`fk_id_reporte`,`fk_id_modulo`),
  ADD KEY `fk_id_reporte` (`fk_id_reporte`,`fk_id_modulo`),
  ADD KEY `fk_reporte_de_modulo_reportes` (`fk_id_modulo`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`pk_id_ruta`),
  ADD KEY `pk_id_ruta` (`pk_id_ruta`);

--
-- Indices de la tabla `saldo_historico`
--
ALTER TABLE `saldo_historico`
  ADD PRIMARY KEY (`pk_id_cuenta_contable`,`pk_fecha_saldo_historico`);

--
-- Indices de la tabla `telefono_proveedor`
--
ALTER TABLE `telefono_proveedor`
  ADD PRIMARY KEY (`pk_id_telefono_proveedor`),
  ADD KEY `pk_id_telefono_proveedor` (`pk_id_telefono_proveedor`),
  ADD KEY `fk_proveedor_telefono` (`fk_id_proveedor`);

--
-- Indices de la tabla `tipo_baja`
--
ALTER TABLE `tipo_baja`
  ADD PRIMARY KEY (`pk_id_tipo_baja`);

--
-- Indices de la tabla `tipo_competencia`
--
ALTER TABLE `tipo_competencia`
  ADD PRIMARY KEY (`pk_id_tipo_competencia`);

--
-- Indices de la tabla `tipo_cuenta_contable`
--
ALTER TABLE `tipo_cuenta_contable`
  ADD PRIMARY KEY (`pk_id_tipo_cuenta_contable`);

--
-- Indices de la tabla `tipo_cuenta_por_cobrar`
--
ALTER TABLE `tipo_cuenta_por_cobrar`
  ADD PRIMARY KEY (`pk_id_tipo_cuenta`);

--
-- Indices de la tabla `tipo_entrevista`
--
ALTER TABLE `tipo_entrevista`
  ADD PRIMARY KEY (`pk_id_tipo_entrevista`);

--
-- Indices de la tabla `tipo_moneda`
--
ALTER TABLE `tipo_moneda`
  ADD PRIMARY KEY (`pk_id_tipo_moneda`);

--
-- Indices de la tabla `tipo_movimiento`
--
ALTER TABLE `tipo_movimiento`
  ADD PRIMARY KEY (`pk_id_tipo_movimiento`),
  ADD KEY `pk_id_tipo_movimiento` (`pk_id_tipo_movimiento`);

--
-- Indices de la tabla `tipo_transaccion`
--
ALTER TABLE `tipo_transaccion`
  ADD PRIMARY KEY (`pk_id_tipo_transaccion`);

--
-- Indices de la tabla `tipo_venta`
--
ALTER TABLE `tipo_venta`
  ADD PRIMARY KEY (`pk_id_tipo_venta`);

--
-- Indices de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD PRIMARY KEY (`pk_id_transaccion`),
  ADD KEY `fk_transaccion_numero_cuenta` (`fk_id_numero_cuenta_bancaria`),
  ADD KEY `fk_transaccion_tipo_transaccion` (`fk_id_tipo_transaccion`),
  ADD KEY `fk_transaccion_tipo_moneda` (`fk_id_tipo_moneda`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`pk_id_vehiculo`),
  ADD KEY `pk_id_vehiculo` (`pk_id_vehiculo`),
  ADD KEY `fk_vehiculo_marca` (`fk_id_marca`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  MODIFY `pk_id_aplicacion` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5302;

--
-- AUTO_INCREMENT de la tabla `aplicacion_perfil`
--
ALTER TABLE `aplicacion_perfil`
  MODIFY `pk_id_aplicacion_perfil` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `aplicacion_usuario`
--
ALTER TABLE `aplicacion_usuario`
  MODIFY `pk_id_aplicacion_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `pk_id_bitacora` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT de la tabla `bodega`
--
ALTER TABLE `bodega`
  MODIFY `pk_id_bodega` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  MODIFY `pk_id_categoria_producto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `pk_id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `consulta_inteligente`
--
ALTER TABLE `consulta_inteligente`
  MODIFY `pk_id_consulta_inteligente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `control_empleado`
--
ALTER TABLE `control_empleado`
  MODIFY `pk_id_control` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `pk_id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `movimiento_cuenta_por_cobrar`
--
ALTER TABLE `movimiento_cuenta_por_cobrar`
  MODIFY `pk_id_movimiento_cuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte`
--
ALTER TABLE `reporte`
  MODIFY `pk_id_reporte` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
