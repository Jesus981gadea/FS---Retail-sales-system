-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-08-2025 a las 18:49:33
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
-- Base de datos: `ferreteria2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `balance_diario`
--

CREATE TABLE `balance_diario` (
  `id_balance` int(11) NOT NULL,
  `total_efectivo` decimal(10,2) DEFAULT NULL,
  `total_yape` decimal(10,2) DEFAULT NULL,
  `total_plin` decimal(10,2) DEFAULT NULL,
  `total_tarjeta` decimal(10,2) DEFAULT NULL,
  `venta_total` decimal(10,2) DEFAULT NULL,
  `total_gastos` decimal(10,2) DEFAULT NULL,
  `total_con_gastos` decimal(10,2) DEFAULT NULL,
  `fecha_balance` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`) VALUES
(7, 'Focos'),
(8, 'Cables'),
(9, 'Electrico'),
(10, 'Tomacorrientes'),
(11, 'Llave Termica'),
(12, 'Pinturas'),
(13, 'Esmaltes'),
(14, 'Barniz/Zinc'),
(15, 'Brochas'),
(16, 'Espatula'),
(17, 'Rodillos'),
(18, 'Cintas'),
(19, 'Tuberias'),
(20, 'Conexiones'),
(21, 'Brocas'),
(22, 'Quimicos'),
(23, 'Tornillos'),
(24, 'Pernos'),
(25, 'Herramientas'),
(26, 'Discos'),
(27, 'Construccion'),
(28, 'Trampas'),
(29, 'Baño'),
(30, 'Empaquetaduras'),
(31, 'Candados'),
(32, 'Pegamentos'),
(33, 'Cintillos'),
(34, 'Caños'),
(35, 'Aerosoles'),
(36, 'Mangueras'),
(37, 'Tarugos'),
(38, 'Bisagras'),
(39, 'Cerrojos'),
(40, 'Lijas'),
(41, 'Armellas'),
(42, 'Trampas'),
(43, 'Clavos'),
(44, 'Limpieza'),
(45, 'Tubos de Abastos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `ruc` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `dni`, `ruc`) VALUES
(1000, 'Jesus Gasde', '73041088', 2147483647),
(1001, 'Flor Milagros', '07034329', 2147483647),
(1002, 'Santa Maria', '78945612', 2147483647),
(1003, 'Alex Marco', '74125896', 2147483647),
(1004, 'Radio Parla', '}787}87', 465795555),
(1005, 'Carlos', '7894568', 1236547865),
(1006, 'Federico Luis', '78945623', 2147483647),
(1007, 'Juan victorio', '7894658', 2147483647),
(1008, 'Aquiles Alias', '7894561', 2147483647),
(1009, 'Julian Alvarez', '78945612', 2147483647),
(1010, 'Julian Alvarez', '7894512', 1234689785),
(1011, 'Iban Marco', '7894652', 2147483647),
(1012, 'Ivan Torres', '7896541', 2147483647),
(1013, 'Julian Alvarez', '5874698', 1593578624),
(1014, 'SAC TEE', '78569423', 2147483647),
(1015, 'Juanita', '73041088', NULL),
(1016, 'Caroline', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `fecha_compra` datetime DEFAULT current_timestamp(),
  `id_proveedor` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compra`, `fecha_compra`, `id_proveedor`, `total`) VALUES
(1000, '2025-07-26 00:00:00', NULL, 14.40),
(1001, '2025-07-26 00:00:00', NULL, -6.00),
(1002, '2025-07-27 00:00:00', NULL, 88.00),
(1003, '2025-07-27 00:00:00', NULL, 0.00),
(1004, '2025-07-27 00:00:00', NULL, 0.00),
(1005, '2025-07-27 00:00:00', NULL, 0.00),
(1006, '2025-07-27 00:00:00', NULL, 0.00),
(1007, '2025-07-27 00:00:00', NULL, 0.00),
(1008, '2025-07-27 00:00:00', NULL, 0.00),
(1009, '2025-07-27 00:00:00', NULL, 0.00),
(1010, '2025-07-27 00:00:00', NULL, 0.00),
(1011, '2025-07-27 00:00:00', NULL, 0.00),
(1012, '2025-07-27 00:00:00', NULL, 0.00),
(1013, '2025-07-27 00:00:00', NULL, 0.00),
(1014, '2025-07-27 00:00:00', NULL, 0.00),
(1015, '2025-07-27 00:00:00', NULL, 0.00),
(1016, '2025-07-27 00:00:00', NULL, 0.00),
(1017, '2025-07-27 00:00:00', NULL, 0.00),
(1018, '2025-07-27 00:00:00', NULL, 0.00),
(1019, '2025-07-27 00:00:00', NULL, 0.00),
(1020, '2025-07-27 00:00:00', NULL, 0.00),
(1021, '2025-07-27 00:00:00', NULL, 42.00),
(1022, '2025-07-27 00:00:00', NULL, 0.00),
(1023, '2025-07-27 00:00:00', NULL, 58.50),
(1024, '2025-07-27 00:00:00', NULL, 0.00),
(1025, '2025-07-27 00:00:00', NULL, 120.00),
(1026, '2025-07-27 00:00:00', NULL, 21.00),
(1027, '2025-07-27 00:00:00', NULL, -16.50),
(1028, '2025-07-27 00:00:00', NULL, 0.00),
(1029, '2025-07-27 00:00:00', NULL, 0.00),
(1030, '2025-07-27 00:00:00', NULL, 0.00),
(1031, '2025-07-27 00:00:00', NULL, 0.00),
(1032, '2025-07-27 00:00:00', NULL, 0.00),
(1033, '2025-07-27 00:00:00', NULL, 0.00),
(1034, '2025-07-27 00:00:00', NULL, 0.00),
(1035, '2025-07-27 00:00:00', NULL, 0.00),
(1036, '2025-07-27 00:00:00', NULL, 0.00),
(1037, '2025-07-27 00:00:00', NULL, 0.00),
(1038, '2025-07-27 00:00:00', NULL, 0.00),
(1039, '2025-07-27 00:00:00', NULL, 0.00),
(1040, '2025-07-27 00:00:00', NULL, 0.00),
(1041, '2025-07-27 00:00:00', NULL, 0.00),
(1042, '2025-07-27 00:00:00', NULL, 0.00),
(1043, '2025-07-31 00:00:00', NULL, 0.00),
(1044, '2025-08-01 00:00:00', NULL, 0.00),
(1045, '2025-08-01 00:00:00', NULL, 0.00),
(1046, '2025-08-01 00:00:00', NULL, 30.00),
(1047, '2025-08-01 00:00:00', 1000, 0.00),
(1048, '2025-08-01 00:00:00', NULL, 0.00),
(1049, '2025-08-01 00:00:00', NULL, 0.00),
(1050, '2025-08-01 00:00:00', NULL, 0.00),
(1051, '2025-08-01 00:00:00', 1003, 0.00),
(1052, '2025-08-01 00:00:00', NULL, 0.00),
(1053, '2025-08-01 00:00:00', NULL, 100.00),
(1054, '2025-08-01 00:00:00', NULL, 0.00),
(1055, '2025-08-01 00:00:00', NULL, 0.00),
(1056, '2025-08-01 00:00:00', 1003, 0.00),
(1057, '2025-08-01 00:00:00', NULL, 0.00),
(1058, '2025-08-01 00:00:00', NULL, 0.00),
(1059, '2025-08-01 00:00:00', NULL, 0.00),
(1060, '2025-08-01 00:00:00', NULL, 0.00),
(1061, '2025-08-01 00:00:00', NULL, 30.00),
(1062, '2025-08-01 00:00:00', NULL, 0.00),
(1063, '2025-08-01 00:00:00', NULL, 0.00),
(1064, '2025-08-01 00:00:00', NULL, 0.00),
(1065, '2025-08-01 00:00:00', NULL, 60.00),
(1066, '2025-08-01 00:00:00', NULL, 200.00),
(1067, '2025-08-01 00:00:00', NULL, 100.00),
(1068, '2025-08-01 00:00:00', NULL, 0.00),
(1069, '2025-08-01 00:00:00', NULL, 0.00),
(1070, '2025-08-01 00:00:00', NULL, 0.00),
(1071, '2025-08-01 00:00:00', NULL, 0.00),
(1072, '2025-08-01 00:00:00', NULL, 0.00),
(1073, '2025-08-01 00:00:00', NULL, 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id_detalle` int(11) NOT NULL,
  `id_compra` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`id_detalle`, `id_compra`, `id_producto`, `cantidad`, `precio_compra`, `subtotal`) VALUES
(1000, 1000, 1330, 12, 1.20, 14.40),
(1001, 1001, 1330, -5, 1.20, -6.00),
(1002, 1002, 1539, 20, 0.90, 18.00),
(1003, 1002, 1540, 20, 3.50, 70.00),
(1004, 1003, 1541, 6, 0.00, 0.00),
(1005, 1003, 1542, 6, 0.00, 0.00),
(1006, 1003, 1543, 6, 0.00, 0.00),
(1007, 1004, 1544, 12, 0.00, 0.00),
(1008, 1005, 1545, 200, 0.00, 0.00),
(1009, 1006, 1546, 3, 0.00, 0.00),
(1010, 1007, 1547, 5, 0.00, 0.00),
(1011, 1008, 1284, 0, 0.00, 0.00),
(1012, 1009, 1548, 25, 0.00, 0.00),
(1013, 1010, 1550, 25, 0.00, 0.00),
(1014, 1011, 1551, 20, 0.00, 0.00),
(1015, 1011, 1552, 12, 0.00, 0.00),
(1016, 1011, 1553, 8, 0.00, 0.00),
(1017, 1012, 1555, 6, 0.00, 0.00),
(1018, 1012, 1556, 12, 0.00, 0.00),
(1019, 1012, 1557, 15, 0.00, 0.00),
(1020, 1013, 1558, 2, 0.00, 0.00),
(1021, 1013, 1559, 3, 0.00, 0.00),
(1022, 1014, 1560, 3, 0.00, 0.00),
(1023, 1015, 1561, 36, 0.00, 0.00),
(1024, 1016, 1562, 2, 0.00, 0.00),
(1025, 1017, 1563, 3, 0.00, 0.00),
(1026, 1017, 1565, 3, 0.00, 0.00),
(1027, 1018, 1566, 20, 0.00, 0.00),
(1028, 1018, 1567, 25, 0.00, 0.00),
(1029, 1019, 1568, 100, 0.00, 0.00),
(1030, 1020, 1570, 12, 0.00, 0.00),
(1031, 1021, 1572, 12, 3.50, 42.00),
(1032, 1022, 1573, 12, 0.00, 0.00),
(1033, 1023, 1574, 3, 19.50, 58.50),
(1034, 1024, 1046, 0, 0.00, 0.00),
(1035, 1025, 1569, 100, 1.20, 120.00),
(1036, 1026, 1575, 2, 10.50, 21.00),
(1037, 1027, 1284, -15, 1.10, -16.50),
(1038, 1028, 1496, -20, 0.00, 0.00),
(1039, 1029, 1642, 5, 0.00, 0.00),
(1040, 1030, 1759, 20, 0.00, 0.00),
(1041, 1031, 1760, 32, 0.00, 0.00),
(1042, 1032, 1761, 8, 0.00, 0.00),
(1043, 1032, 1762, 8, 0.00, 0.00),
(1044, 1032, 1763, 8, 0.00, 0.00),
(1045, 1033, 1764, 24, 0.00, 0.00),
(1046, 1034, 1785, 10, 0.00, 0.00),
(1047, 1034, 1786, 10, 0.00, 0.00),
(1048, 1035, 1845, 5, 0.00, 0.00),
(1049, 1036, 1846, 24, 0.00, 0.00),
(1050, 1037, 1847, 6, 0.00, 0.00),
(1051, 1038, 1848, 15, 0.00, 0.00),
(1052, 1039, 1849, 6, 0.00, 0.00),
(1053, 1040, 1850, 5, 0.00, 0.00),
(1054, 1041, 1851, 3, 0.00, 0.00),
(1055, 1042, 1852, 12, 0.00, 0.00),
(1056, 1042, 1853, 12, 0.00, 0.00),
(1057, 1043, 1001, 0, 1.60, 0.00),
(1058, 1044, 1854, 2, 0.00, 0.00),
(1059, 1045, 1855, 10, 0.00, 0.00),
(1060, 1046, 1856, 2, 15.00, 30.00),
(1061, 1047, 1857, 12, 0.00, 0.00),
(1062, 1047, 1858, 2, 0.00, 0.00),
(1063, 1048, 1857, 1, 0.00, 0.00),
(1064, 1049, 1859, 6, 0.00, 0.00),
(1065, 1050, 1859, 0, 0.00, 0.00),
(1066, 1050, 1860, 6, 0.00, 0.00),
(1067, 1051, 1861, 6, 0.00, 0.00),
(1068, 1052, 1075, 0, 12.50, 0.00),
(1069, 1053, 1862, 10, 10.00, 100.00),
(1070, 1054, 1862, 0, 0.00, 0.00),
(1071, 1055, 1863, 10, 0.00, 0.00),
(1072, 1055, 1864, 10, 0.00, 0.00),
(1073, 1056, 1865, 6, 0.00, 0.00),
(1074, 1056, 1866, 6, 0.00, 0.00),
(1075, 1056, 1867, 6, 0.00, 0.00),
(1076, 1057, 1868, 6, 0.00, 0.00),
(1077, 1058, 1869, 20, 0.00, 0.00),
(1078, 1058, 1870, 20, 0.00, 0.00),
(1079, 1058, 1871, 6, 0.00, 0.00),
(1080, 1059, 1872, 36, 0.00, 0.00),
(1081, 1060, 1873, 4, 0.00, 0.00),
(1082, 1060, 1874, 6, 0.00, 0.00),
(1083, 1060, 1875, 6, 0.00, 0.00),
(1084, 1061, 1876, 50, 0.60, 30.00),
(1085, 1061, 1877, 50, 0.00, 0.00),
(1086, 1062, 1913, 6, 0.00, 0.00),
(1087, 1063, 1914, 2, 0.00, 0.00),
(1088, 1064, 1915, 15, 0.00, 0.00),
(1089, 1065, 1916, 6, 10.00, 60.00),
(1090, 1066, 1917, 10, 0.00, 0.00),
(1091, 1066, 1918, 10, 10.00, 100.00),
(1092, 1066, 1919, 10, 10.00, 100.00),
(1093, 1067, 1920, 10, 0.00, 0.00),
(1094, 1067, 1921, 10, 10.00, 100.00),
(1095, 1068, 1922, 5, 0.00, 0.00),
(1096, 1069, 1923, 3, 0.00, 0.00),
(1097, 1070, 1924, 10, 0.00, 0.00),
(1098, 1071, 1925, 15, 0.00, 0.00),
(1099, 1072, 1926, 50, 0.00, 0.00),
(1100, 1073, 1927, 5, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `descuento_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id_detalle`, `id_venta`, `id_producto`, `cantidad`, `precio_unitario`, `subtotal`, `descuento_unitario`) VALUES
(1001, 1001, 1202, 1, 2.50, 2.50, 0.00),
(1002, 1002, 1539, 2, 2.50, 5.00, 0.00),
(1003, 1003, 1540, 1, 8.50, 8.50, 0.00),
(1004, 1004, 1541, 1, 3.50, 3.50, 0.00),
(1007, 1007, 1544, 2, 3.50, 7.00, 0.00),
(1008, 1007, 1545, 1, 1.00, 1.00, 0.00),
(1009, 1008, 1546, 1, 8.50, 8.50, 0.00),
(1010, 1009, 1547, 3, 2.00, 6.00, 0.00),
(1011, 1010, 1284, 1, 3.50, 3.50, 0.00),
(1012, 1011, 1550, 3, 1.00, 3.00, 0.00),
(1013, 1012, 1033, 1, 3.50, 3.50, 0.00),
(1014, 1013, 1043, 1, 2.50, 2.50, 0.00),
(1015, 1014, 1553, 1, 8.50, 8.50, 0.00),
(1016, 1015, 1557, 1, 3.50, 3.50, 0.00),
(1017, 1016, 1558, 1, 12.00, 12.00, 0.00),
(1018, 1017, 1428, 3, 1.00, 3.00, 0.00),
(1019, 1018, 1560, 1, 25.00, 25.00, 0.00),
(1020, 1018, 1561, 1, 1.50, 1.50, 0.00),
(1021, 1018, 1071, 1, 6.00, 6.00, 0.00),
(1022, 1019, 1562, 1, 10.00, 10.00, 0.00),
(1023, 1020, 1563, 1, 20.00, 20.00, 0.00),
(1024, 1020, 1567, 1, 3.50, 3.50, 0.00),
(1025, 1020, 1568, 1, 1.50, 1.50, 0.00),
(1026, 1021, 1570, 1, 6.00, 6.00, 0.00),
(1027, 1021, 1572, 3, 3.50, 10.50, 0.00),
(1028, 1021, 1573, 1, 3.50, 3.50, 0.00),
(1029, 1022, 1561, 1, 1.50, 1.50, 0.00),
(1030, 1023, 1574, 1, 35.00, 35.00, 0.00),
(1031, 1024, 1046, 1, 7.00, 7.00, 0.00),
(1032, 1025, 1569, 2, 3.00, 6.00, 0.00),
(1033, 1025, 1338, 2, 6.60, 13.20, 0.00),
(1034, 1025, 1321, 1, 0.33, 0.33, 0.00),
(1035, 1026, 1575, 1, 25.00, 25.00, 0.00),
(1037, 1028, 1284, 1, 3.80, 3.80, 0.00),
(1038, 1029, 1283, 1, 7.50, 7.50, 0.00),
(1039, 1030, 1101, 1, 19.50, 19.50, 0.00),
(1040, 1030, 1259, 1, 3.50, 3.50, 0.00),
(1041, 1030, 1601, 1, 2.50, 2.50, 0.00),
(1042, 1030, 1133, 1, 2.50, 2.50, 0.00),
(1043, 1030, 1133, 1, 2.50, 2.50, 0.50),
(1044, 1031, 1638, 1, 7.00, 7.00, 0.00),
(1045, 1031, 1496, 1, 4.50, 4.50, 0.00),
(1046, 1032, 1204, 2, 2.00, 4.00, 0.00),
(1047, 1032, 1213, 1, 2.00, 2.00, 0.00),
(1048, 1033, 1642, 1, 5.00, 5.00, 0.00),
(1049, 1034, 1698, 2, 2.00, 4.00, 0.00),
(1050, 1034, 1033, 1, 3.50, 3.50, 0.00),
(1051, 1035, 1724, 1, 17.50, 17.50, 0.00),
(1052, 1035, 1556, 1, 5.50, 5.50, 0.00),
(1053, 1035, 1759, 2, 0.75, 1.50, 0.00),
(1054, 1036, 1760, 8, 0.70, 5.60, 0.00),
(1055, 1037, 1761, 1, 8.50, 8.50, 0.00),
(1056, 1037, 1764, 1, 3.50, 3.50, 0.00),
(1057, 1038, 1131, 1, 5.50, 5.50, 0.00),
(1058, 1039, 1786, 2, 6.50, 13.00, 0.00),
(1059, 1039, 1569, 2, 3.00, 6.00, 0.00),
(1060, 1039, 1834, 1, 3.50, 3.50, 0.00),
(1061, 1039, 1833, 1, 2.50, 2.50, 0.00),
(1062, 1039, 1829, 1, 1.70, 1.70, 0.20),
(1063, 1040, 1762, 1, 8.50, 8.50, 0.00),
(1064, 1041, 1845, 1, 7.50, 7.50, 0.00),
(1065, 1042, 1846, 1, 9.50, 9.50, 0.00),
(1066, 1043, 1847, 1, 6.50, 6.50, 0.00),
(1067, 1044, 1848, 2, 2.50, 5.00, 0.00),
(1068, 1045, 1089, 1, 29.50, 29.50, 0.00),
(1069, 1046, 1849, 2, 10.00, 20.00, 0.00),
(1070, 1047, 1850, 1, 4.00, 4.00, 0.00),
(1071, 1048, 1851, 1, 10.00, 10.00, 0.00),
(1072, 1049, 1852, 1, 8.50, 8.50, 0.00),
(1073, 1049, 1853, 1, 5.50, 5.50, 0.00),
(1074, 1050, 1089, 1, 29.50, 29.50, 0.00),
(1075, 1051, 1005, 1, 8.50, 8.50, 0.00),
(1076, 1051, 1561, 1, 1.50, 1.50, 0.00),
(1077, 1052, 1604, 3, 2.50, 7.50, 0.00),
(1078, 1053, 1032, 1, 5.00, 5.00, 0.00),
(1080, 1055, 1854, 1, 35.00, 35.00, 0.00),
(1081, 1056, 1855, 1, 14.50, 14.50, 0.00),
(1082, 1057, 1236, 1, 6.50, 6.50, 0.00),
(1083, 1058, 1856, 1, 35.00, 35.00, 0.00),
(1084, 1059, 1284, 1, 3.80, 3.80, 0.00),
(1085, 1059, 1857, 1, 9.50, 9.50, 0.00),
(1086, 1060, 1860, 1, 17.50, 17.50, 0.00),
(1087, 1061, 1161, 2, 4.50, 9.00, 0.00),
(1088, 1062, 1428, 9, 1.00, 9.00, 0.00),
(1089, 1062, 1425, 10, 0.65, 6.50, 0.00),
(1090, 1062, 1423, 6, 0.40, 2.40, 0.00),
(1091, 1063, 1566, 1, 6.50, 6.50, 0.50),
(1092, 1064, 1861, 1, 7.50, 7.50, 0.50),
(1093, 1065, 1075, 1, 35.00, 35.00, 0.00),
(1094, 1066, 1761, 1, 8.50, 8.50, 0.00),
(1095, 1067, 1284, 1, 3.80, 3.80, 0.00),
(1096, 1067, 1602, 1, 2.50, 2.50, 0.00),
(1097, 1068, 1847, 1, 6.50, 6.50, 0.00),
(1098, 1068, 1864, 1, 2.50, 2.50, 1.50),
(1099, 1069, 1865, 1, 11.00, 11.00, 0.00),
(1100, 1069, 1853, 1, 5.50, 5.50, 0.00),
(1101, 1069, 1868, 1, 4.50, 4.50, 0.00),
(1102, 1070, 1869, 1, 2.00, 2.00, 0.00),
(1103, 1071, 1872, 1, 1.00, 1.00, 0.00),
(1104, 1072, 1873, 1, 12.00, 12.00, 0.00),
(1105, 1073, 1005, 2, 8.50, 17.00, 0.00),
(1106, 1074, 1876, 8, 0.80, 6.40, 0.00),
(1107, 1074, 1877, 8, 0.20, 1.60, 0.00),
(1108, 1074, 1877, 3, 0.20, 0.60, 0.00),
(1109, 1075, 1723, 2, 13.50, 27.00, 0.00),
(1110, 1076, 1333, 5, 0.42, 2.10, 0.00),
(1111, 1076, 1293, 1, 0.30, 0.30, 0.00),
(1112, 1077, 1898, 10, 1.00, 10.00, 0.00),
(1113, 1077, 1895, 15, 0.60, 9.00, 1.00),
(1114, 1078, 1238, 1, 8.50, 8.50, 0.00),
(1115, 1078, 1833, 1, 2.50, 2.50, 0.00),
(1116, 1079, 1604, 2, 2.50, 5.00, 0.00),
(1117, 1080, 1258, 1, 6.50, 6.50, 0.00),
(1118, 1081, 1913, 1, 7.50, 7.50, 0.00),
(1119, 1081, 1542, 1, 4.50, 4.50, 0.00),
(1120, 1082, 1546, 1, 8.50, 8.50, 0.00),
(1121, 1083, 1557, 1, 3.50, 3.50, 0.00),
(1122, 1084, 1914, 1, 9.00, 9.00, 0.00),
(1123, 1084, 1496, 1, 4.50, 4.50, 0.00),
(1124, 1084, 1915, 1, 2.50, 2.50, 0.50),
(1125, 1085, 1916, 1, 25.00, 25.00, 0.00),
(1126, 1086, 1918, 1, 12.00, 12.00, 0.00),
(1127, 1086, 1917, 1, 12.00, 12.00, 0.00),
(1128, 1087, 1921, 1, 15.00, 15.00, 0.00),
(1129, 1087, 1922, 1, 6.50, 6.50, 0.00),
(1130, 1087, 1490, 1, 27.50, 27.50, 2.50),
(1131, 1087, 1923, 1, 10.00, 10.00, 0.00),
(1132, 1087, 1561, 1, 1.50, 1.50, 0.00),
(1133, 1088, 1924, 1, 15.50, 15.50, 0.00),
(1134, 1088, 1561, 1, 1.50, 1.50, 0.00),
(1135, 1088, 1925, 1, 3.50, 3.50, 0.00),
(1136, 1089, 1030, 9, 1.50, 13.50, 0.00),
(1137, 1090, 1011, 1, 25.00, 25.00, 0.00),
(1138, 1091, 1604, 1, 2.50, 2.50, 0.00),
(1139, 1092, 1546, 1, 8.50, 8.50, 0.00),
(1140, 1093, 1007, 1, 13.80, 13.80, 0.80),
(1141, 1094, 1865, 1, 11.00, 11.00, 0.00),
(1142, 1094, 1868, 1, 4.50, 4.50, 0.00),
(1143, 1094, 1927, 2, 5.00, 10.00, 0.00),
(1144, 1095, 1575, 1, 25.00, 25.00, 0.00),
(1145, 1095, 1008, 1, 15.50, 15.50, 0.00),
(1146, 1096, 1072, 1, 6.00, 6.00, 0.00),
(1148, 1098, 1256, 1, 23.00, 23.00, 0.00),
(1149, 1099, 1421, 2, 0.30, 0.60, 0.00),
(1150, 1100, 1421, 1, 0.30, 0.30, 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `id_gastos` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `tipo_gasto` varchar(100) DEFAULT NULL,
  `cantidad` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gastos`
--

INSERT INTO `gastos` (`id_gastos`, `fecha`, `tipo_gasto`, `cantidad`) VALUES
(1000, '2025-07-25', 'Mercadería', 12),
(1002, '2025-07-25', 'Mascota', 5),
(1003, '2025-07-25', 'Empleado', 30),
(1004, '2025-07-26', 'Mascota', 2),
(1008, '2025-07-26', 'Desayuno', 10),
(1009, '2025-07-26', 'Comida', 20),
(1010, '2025-07-26', 'Empleado', 30),
(1011, '2025-07-26', 'Mama Pasaje', 3),
(1012, '2025-07-26', 'Mama Pasaje', 5),
(1013, '2025-07-26', 'Mercaderia Sika', 15),
(1016, '2025-07-26', 'Soca', 6),
(1021, '2025-07-28', 'p', 10),
(1022, '2025-07-31', 'Comida', 10),
(1023, '2025-07-31', 'Abram', 30),
(1024, '2025-08-01', 'Desayuno', 5),
(1025, '2025-08-01', 'Gasolina', 20),
(1026, '2025-08-01', 'Abram', 30),
(1027, '2025-08-01', 'Perro', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `stock_actual` int(11) DEFAULT 0,
  `id_categoria` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio_unitario`, `stock_actual`, `id_categoria`, `id_proveedor`) VALUES
(1001, 'Foco Led 3w x Unid', NULL, 4.50, 17, 7, NULL),
(1002, 'Foco Led 3w x Unid', NULL, 5.50, 30, 7, NULL),
(1003, 'Foco Led 5w x Unid', NULL, 6.50, 27, 7, NULL),
(1004, 'Foco Led 7w x Unid', NULL, 7.50, 26, 7, NULL),
(1005, 'Foco Led 9w x Unid', NULL, 8.50, 27, 7, NULL),
(1006, 'Foco Led 13w x Unid', NULL, 11.80, 30, 7, NULL),
(1007, 'Foco Led 15w x Unid', NULL, 13.80, 29, 7, NULL),
(1008, 'Foco Led 18w x Unid', NULL, 15.50, 29, 7, NULL),
(1009, 'Foco Botella 12w x Unid', NULL, 10.50, 29, 7, NULL),
(1010, 'Foco Botella 13w x Unid', NULL, 11.00, 29, 7, NULL),
(1011, 'Foco Botella 22w x Unid', NULL, 25.00, 29, 7, NULL),
(1012, 'Foco Botella 28w Rosado x Unid', NULL, 11.50, 29, 7, NULL),
(1013, 'Foco Botella 30w x Unid', NULL, 30.50, 30, 7, NULL),
(1014, 'Foco Botella 34w x Unid', NULL, 35.00, 30, 7, NULL),
(1015, 'Foco Recargable Led 50w x Unid', NULL, 35.00, 28, 7, NULL),
(1016, 'Foco Parlante 12w x Unid', NULL, 32.50, 30, 7, NULL),
(1017, 'Foco Plano Redondo 40w x Unid', NULL, 30.00, 30, 7, NULL),
(1018, 'Foco Plano Torta 36w x Unid', NULL, 27.50, 30, 7, NULL),
(1019, 'Foco Plano Empotrar 20w x Unid', NULL, 25.00, 30, 7, NULL),
(1020, 'Foco Plato Empotrar 30w x Unid', NULL, 32.50, 30, 7, NULL),
(1021, 'Cable Indeco #12 x Paq', NULL, 220.00, 29, 8, NULL),
(1022, 'Cable Indeco #12 x Mt', NULL, 2.80, 27, 8, NULL),
(1023, 'Cable Indeco #14 x Paq', NULL, 145.00, 28, 8, NULL),
(1024, 'Cable Indeco #14 x Mt', NULL, 2.00, 30, 8, NULL),
(1025, 'Cable Mellizo #12 x Paq', NULL, 205.00, 30, 8, NULL),
(1026, 'Cable Mellizo #12 x Mt', NULL, 2.00, 30, 8, NULL),
(1027, 'Cable Mellizo #14 x Paq', NULL, 145.00, 30, 8, NULL),
(1028, 'Cable Mellizo #14 x Mt', NULL, 1.50, 30, 8, NULL),
(1029, 'Cable Vulcanizado x Mt', NULL, 2.50, 30, 8, NULL),
(1030, 'Cable Acero Cordel x Mt', NULL, 1.50, 21, 8, NULL),
(1031, 'Enchufe triple EPEM x Unid', NULL, 6.50, 18, 9, NULL),
(1032, 'Adaptador EPEM x Unid', NULL, 5.00, 29, 9, NULL),
(1033, 'Adaptador Economico x Unid', NULL, 3.50, 28, 9, NULL),
(1034, 'Splitter Coaxial 1-2 x Unid', NULL, 7.50, 30, 9, NULL),
(1035, 'Splitter Coaxial 1-3 x Unid', NULL, 9.50, 30, 9, NULL),
(1036, 'Splitter Coaxial 2-3 x Unid', NULL, 10.00, 30, 9, NULL),
(1037, 'Union Internet x Unid', NULL, 2.50, 30, 9, NULL),
(1038, 'Conector Internet x Unid', NULL, 1.00, 30, 9, NULL),
(1039, 'Conector Internet 2 x Unid', NULL, 1.50, 30, 9, NULL),
(1040, 'Enchufe de Colores x Unid', NULL, 3.50, 30, 9, NULL),
(1041, 'Enchufe Blanco/Negro EPEM x Unid', NULL, 1.50, 27, 9, NULL),
(1042, 'Enchufe Codelca x Unid', NULL, 10.00, 30, 9, NULL),
(1043, 'Cinta Aislante 1000 3M Chico x Unid', NULL, 2.50, 28, 9, NULL),
(1044, 'Cinta Aislante 1000 3M Grande x Unid', NULL, 6.50, 30, 9, NULL),
(1045, 'Cinta Aislante 165 3M Grande-Azul x Unid', NULL, 10.00, 30, 9, NULL),
(1046, 'Caja para 1 llave x Unid', NULL, 7.00, 28, 9, NULL),
(1047, 'Caja para 2 llaves 2-5 Polos x Unid', NULL, 12.00, 28, 9, NULL),
(1048, 'Caja para llaves 2 Polos x Unid', NULL, 17.50, 30, 9, NULL),
(1049, 'Medidor Digital Portiza x Unid', NULL, 55.00, 30, 9, NULL),
(1050, 'Medidor Analogico Portiza x Unid', NULL, 45.50, 30, 9, NULL),
(1051, 'Bateria 9v Toshiba x Unid', NULL, 6.00, 30, 9, NULL),
(1052, 'Pila AA Toshiba x Unid', NULL, 2.00, 30, 9, NULL),
(1053, 'Pila AAA Toshiba x Unid', NULL, 2.50, 30, 9, NULL),
(1054, 'Pila AA Panasonic x Unid', NULL, 2.50, 30, 9, NULL),
(1055, 'Pila AAA Panasonic x Unid', NULL, 3.00, 30, 9, NULL),
(1056, 'Tomacorriente doble Sobreponer Bticino x Unid', NULL, 8.50, 30, 10, NULL),
(1057, 'Tomacorriente triple Sobreponer Bticino x Unid', NULL, 9.50, 30, 10, NULL),
(1058, 'Tomacorriente doble Empotrar Bticino x Unid', NULL, 8.50, 30, 10, NULL),
(1059, 'Tomacorriente de Uno Empotrar Bticino x Unid', NULL, 8.50, 30, 10, NULL),
(1060, 'Tomacorriente doble Empotrar Cubull x Unid', NULL, 15.00, 30, 10, NULL),
(1061, 'Tomacorriente doble Empotrar Ultra power x Unid', NULL, 12.00, 30, 10, NULL),
(1062, 'Interruptor de Uno Empotrar Ultra power x Unid', NULL, 10.00, 30, 10, NULL),
(1063, 'Interruptor de Uno Empotrar Bticino x Unid', NULL, 8.50, 30, 10, NULL),
(1064, 'Interruptor doble Empotrar Bticino x Unid', NULL, 8.50, 30, 10, NULL),
(1065, 'Interruptor sapito Empotrar Bticino x Unid', NULL, 5.00, 30, 10, NULL),
(1066, 'Interruptor triple Empotrar Bticino x Unid', NULL, 10.00, 30, 10, NULL),
(1067, 'Interruptor timbre Empotrar Bticino x Unid', NULL, 7.50, 30, 10, NULL),
(1068, 'Soquete plano Bticino x Unid', NULL, 7.50, 30, 10, NULL),
(1069, 'Soquete bola Bticino x Unid', NULL, 9.50, 30, 10, NULL),
(1070, 'Interruptor de uno Ultra (Sencillo) x Unid', NULL, 6.00, 30, 10, NULL),
(1071, 'Tomacorriente de uno Ultra (Sencillo) x Unid', NULL, 6.00, 29, 10, NULL),
(1072, 'Soquete plano Ultra (Sencillo) x Unid', NULL, 6.00, 29, 10, NULL),
(1073, 'Enchufe Ultra x Unid', NULL, 6.00, 30, 10, NULL),
(1074, 'Llave termica C20 Bticino x Unid', NULL, 35.00, 30, 11, NULL),
(1075, 'Llave termica C32 Bticino x Unid', NULL, 35.00, 29, 11, NULL),
(1076, 'Llave termica C40 Bticino x Unid', NULL, 45.00, 30, 11, NULL),
(1077, 'Llave termica C63 Bticino x Unid', NULL, 45.00, 30, 11, NULL),
(1078, 'Llave termica C32 Stranger x Unid', NULL, 35.00, 30, 11, NULL),
(1079, 'Llave termica C16 Izolux x Unid', NULL, 25.00, 30, 11, NULL),
(1080, 'Llave termica C20 Izolux x Unid', NULL, 25.00, 30, 11, NULL),
(1081, 'Llave termica C32 Izolux x Unid', NULL, 25.00, 30, 11, NULL),
(1082, 'Llave termica C40 Izolux x Unid', NULL, 25.00, 30, 11, NULL),
(1083, 'Llave termica C40 Celux x Unid', NULL, 30.00, 30, 11, NULL),
(1084, 'Llave termica C20 Celux x Unid', NULL, 25.00, 30, 11, NULL),
(1085, 'Llave termica C32 Celux x Unid', NULL, 25.00, 30, 11, NULL),
(1086, 'Llave termica electronica portiza x Unid', NULL, 70.00, 30, 11, NULL),
(1087, 'Llave diferencial A32 x Unid', NULL, 75.00, 30, 11, NULL),
(1088, 'Temple 25 kg Losaro x Unid', NULL, 23.00, 30, 12, NULL),
(1089, 'Temple 25 kg Majestad x Unid', NULL, 29.50, 28, 12, NULL),
(1090, 'Temple 25 kg Perucolor x Unid', NULL, 28.00, 30, 12, NULL),
(1091, 'Temple 5 kg Losaro x Unid', NULL, 6.00, 29, 12, NULL),
(1092, 'Temple 5 kg Majestad x Unid', NULL, 8.50, 30, 12, NULL),
(1093, 'Temple 5 kg Perucolor x Unid', NULL, 7.00, 30, 12, NULL),
(1094, 'Gloss Gln Losaro x Unid', NULL, 75.00, 23, 13, NULL),
(1095, 'Base al Aceite Gln Losaro x Unid', NULL, 75.00, 30, 13, NULL),
(1096, 'Esmalte Gln Losaro Negro x Unid', NULL, 55.00, 30, 13, NULL),
(1097, 'Esmalte Gln Losaro Negro x Unid', NULL, 55.00, 30, 13, NULL),
(1098, 'Esmalte 1/32 Gln Negro Losaro x Unid', NULL, 6.50, 30, 13, NULL),
(1099, 'Esmalte 1/16 Gln Negro Losaro x Unid', NULL, 9.50, 30, 13, NULL),
(1100, 'Esmalte 1/8 Gln Negro Losaro x Unid', NULL, 12.00, 30, 13, NULL),
(1101, 'Esmalte 1/4 Gln Negro Losaro x Unid', NULL, 19.50, 29, 13, NULL),
(1102, 'Esmalte 1/32 Gln Blanco Losaro x Unid', NULL, 6.50, 30, 13, NULL),
(1103, 'Esmalte 1/16 Gln Blanco Losaro x Unid', NULL, 9.50, 30, 13, NULL),
(1104, 'Esmalte 1/8 Gln Blanco Losaro x Unid', NULL, 12.00, 30, 13, NULL),
(1105, 'Esmalte 1/4 Gln Blanco Losaro x Unid', NULL, 19.50, 30, 13, NULL),
(1106, 'Esmalte 1/32 Gln Gris Claro Losaro x Unid', NULL, 6.50, 30, 13, NULL),
(1107, 'Esmalte 1/16 Gln Gris Claro Losaro x Unid', NULL, 9.50, 30, 13, NULL),
(1108, 'Esmalte 1/8 Gln Gris Claro Losaro x Unid', NULL, 12.00, 30, 13, NULL),
(1109, 'Esmalte 1/4 Gln Gris Claro Losaro x Unid', NULL, 19.50, 30, 13, NULL),
(1110, 'Esmalte 1/32 Gln Gris Oscuro Losaro x Unid', NULL, 6.50, 30, 13, NULL),
(1111, 'Esmalte 1/16 Gln Gris Oscuro Losaro x Unid', NULL, 9.50, 30, 13, NULL),
(1112, 'Esmalte 1/8 Gln Gris Oscuro Losaro x Unid', NULL, 12.00, 30, 13, NULL),
(1113, 'Esmalte 1/4 Gln Gris Oscuro Losaro x Unid', NULL, 19.50, 30, 13, NULL),
(1114, 'Zincromato Gln Losaro x Unid', NULL, 55.00, 30, 14, NULL),
(1115, 'Zincromato 1/4 Gln Losaro x Unid', NULL, 20.00, 30, 14, NULL),
(1116, 'Barniz 1/16 Gln Caoba Losaro x Unid', NULL, 10.00, 30, 14, NULL),
(1117, 'Barniz 1/8 Gln Caoba Losaro x Unid', NULL, 14.50, 30, 14, NULL),
(1118, 'Barniz 1/4 Gln Caoba Losaro x Unid', NULL, 20.00, 30, 14, NULL),
(1119, 'Barniz 1/16 Gln Cedro Losaro x Unid', NULL, 10.00, 30, 14, NULL),
(1120, 'Barniz 1/8 Gln Cedro Losaro x Unid', NULL, 14.50, 30, 14, NULL),
(1121, 'Barniz 1/4 Gln Cedro Losaro x Unid', NULL, 20.00, 30, 14, NULL),
(1122, 'Barniz 1/16 Gln Nogal Losaro x Unid', NULL, 10.00, 30, 14, NULL),
(1123, 'Barniz 1/8 Gln Nogal Losaro x Unid', NULL, 14.50, 30, 14, NULL),
(1124, 'Barniz 1/4 Gln Nogal Losaro x Unid', NULL, 20.00, 30, 14, NULL),
(1125, 'Barniz 1/16 Gln Roble Losaro x Unid', NULL, 10.00, 30, 14, NULL),
(1126, 'Barniz 1/8 Gln Roble Losaro x Unid', NULL, 14.50, 30, 14, NULL),
(1127, 'Barniz 1/4 Gln Roble Losaro x Unid', NULL, 20.00, 30, 14, NULL),
(1128, 'Brocha de 4, Madera x Unid', NULL, 10.50, 23, 15, NULL),
(1129, 'Brocha de 3, Madera x Unid', NULL, 8.50, 28, 15, NULL),
(1130, 'Brocha de 2, Madera x Unid', NULL, 7.50, 30, 15, NULL),
(1131, 'Brocha de 1 1/2, Madera x Unid', NULL, 5.50, 29, 15, NULL),
(1132, 'Brocha de 3/4, Madera x Unid', NULL, 3.50, 30, 15, NULL),
(1133, 'Brocha de 1/2, Madera x Unid', NULL, 2.50, 28, 15, NULL),
(1134, 'Brocha de 4, Plastico x Unid', NULL, 8.50, 30, 15, NULL),
(1135, 'Brocha de 3, Plastico x Unid', NULL, 6.50, 30, 15, NULL),
(1136, 'Brocha de 2 1/2, Plastico x Unid', NULL, 5.50, 30, 15, NULL),
(1137, 'Brocha de 2, Plastico x Unid', NULL, 4.50, 30, 15, NULL),
(1138, 'Brocha de 1, Plastico x Unid', NULL, 3.50, 30, 15, NULL),
(1139, 'Brocha de 4, Atlas x Unid', NULL, 25.00, 30, 15, NULL),
(1140, 'Brocha de 3, Atlas x Unid', NULL, 18.00, 30, 15, NULL),
(1141, 'Brocha de 2, Atlas x Unid', NULL, 14.50, 30, 15, NULL),
(1142, 'Brocha de 3, Aguila x Unid', NULL, 17.50, 30, 15, NULL),
(1143, 'Brocha de 2, Aguila x Unid', NULL, 12.50, 30, 15, NULL),
(1144, 'Espatula de 4, Madera x Unid', NULL, 7.50, 30, 16, NULL),
(1145, 'Espatula de 3, Madera x Unid', NULL, 5.50, 30, 16, NULL),
(1146, 'Espatula de 2 1/2, Madera x Unid', NULL, 4.50, 30, 16, NULL),
(1147, 'Espatula de 2, Madera x Unid', NULL, 3.50, 30, 16, NULL),
(1148, 'Espatula de 2, Goma x Unid', NULL, 5.50, 30, 16, NULL),
(1149, 'Espatula de 2 1/2, Goma x Unid', NULL, 4.50, 30, 16, NULL),
(1150, 'Espatula de 3, Goma x Unid', NULL, 7.50, 30, 16, NULL),
(1151, 'Espatula de 4, Goma x Unid', NULL, 8.50, 30, 16, NULL),
(1152, 'Rodillo #9 Toro x Unid', NULL, 19.50, 30, 17, NULL),
(1153, 'Rodillo #9 Ineco x Unid', NULL, 17.50, 30, 17, NULL),
(1154, 'Rodillo #9 CyA x Unid', NULL, 15.50, 30, 17, NULL),
(1155, 'Rodillo #9 A x Unid', NULL, 15.50, 30, 17, NULL),
(1156, 'Rodillo #9 B x Unid', NULL, 15.50, 30, 17, NULL),
(1157, 'Rodillo #9 C x Unid', NULL, 15.50, 30, 17, NULL),
(1158, 'Rodillo #12 x Unid', NULL, 25.00, 30, 17, NULL),
(1159, 'Rodillo #7 x Unid', NULL, 7.50, 30, 17, NULL),
(1160, 'Cinta Masking tape 1/2 x Unid', NULL, 3.50, 29, 18, NULL),
(1161, 'Cinta Masking tape 3/4 x Unid', NULL, 4.50, 28, 18, NULL),
(1162, 'Cinta Masking tape 1 x Unid', NULL, 6.00, 30, 18, NULL),
(1163, 'Cinta Masking tape 1 1/2 x Unid', NULL, 8.50, 30, 18, NULL),
(1164, 'Tubo Luz 5/8 Economico x Unid', NULL, 3.00, 30, 19, NULL),
(1165, 'Tubo Luz 3/4 Economico x Unid', NULL, 3.50, 30, 19, NULL),
(1166, 'Tubo Luz 3/4 Nicoll x Unid', NULL, 5.50, 30, 19, NULL),
(1167, 'Tubo Agua 3/4 Economico x Unid', NULL, 14.00, 30, 19, NULL),
(1168, 'Tubo Agua 3/4 Nicoll x Unid', NULL, 17.00, 30, 19, NULL),
(1169, 'Tubo de Agua 1/2 Economico x Unid', NULL, 17.00, 30, 19, NULL),
(1170, 'Tubo de Agua 1/2 Nicoll x Unid', NULL, 25.00, 28, 19, NULL),
(1171, 'Tubo de Agua 1 1/2 Economico x Unid', NULL, 17.00, 30, 19, NULL),
(1172, 'Tubo de Desague 2 Nicoll x Unid', NULL, 25.00, 30, 19, NULL),
(1173, 'Tubo de Desague 2 1/2 Nicoll x Unid', NULL, 25.00, 30, 19, NULL),
(1174, 'Tubo de Desague 4 Nicoll x Unid', NULL, 36.00, 30, 19, NULL),
(1175, 'Union de 3/4 con rosca x Unid', NULL, 3.00, 30, 20, NULL),
(1176, 'Niple de 3/4 x 3 x Unid', NULL, 3.00, 30, 20, NULL),
(1177, 'Niple de 3/4 x 2 x Unid', NULL, 2.50, 30, 20, NULL),
(1178, 'Adaptador de 3/4 x Unid', NULL, 3.00, 30, 20, NULL),
(1179, 'Adaptador de 3/4 sin rosca (Embone) x Unid', NULL, 3.00, 30, 20, NULL),
(1180, 'Codo de 3/4 con rosca x Unid', NULL, 5.00, 30, 20, NULL),
(1181, 'Codo de 3/4 x Unid', NULL, 3.50, 30, 20, NULL),
(1182, 'Codo de 3/4 Pavco x Unid', NULL, 4.50, 27, 20, NULL),
(1183, 'Adaptador 3/4 a 1/2 con rosca x Unid', NULL, 3.50, 30, 20, NULL),
(1184, 'Tee de 3/4 Embone x Unid', NULL, 4.50, 30, 20, NULL),
(1185, 'Adaptador de 1 x Unid', NULL, 3.50, 30, 20, NULL),
(1186, 'Union de 1 x Unid', NULL, 3.50, 30, 20, NULL),
(1187, 'Codo de 1 - Mixto x Unid', NULL, 4.00, 30, 20, NULL),
(1188, 'Niple de 1 x 1 x Unid', NULL, 2.50, 30, 20, NULL),
(1189, 'Niple de 1 x 4 x Unid', NULL, 3.50, 30, 20, NULL),
(1190, 'Tee de 1 x Unid', NULL, 4.50, 30, 20, NULL),
(1191, 'Adaptador de 1 a 1/2 sin rosca (Embone) x Unid', NULL, 3.50, 30, 20, NULL),
(1192, 'Codo de 1 1/2 Embone x Unid', NULL, 2.50, 30, 20, NULL),
(1193, 'Curva de 1 1/2 Embone x Unid', NULL, 2.50, 30, 20, NULL),
(1194, 'Union de 1 1/2 Embone x Unid', NULL, 2.00, 30, 20, NULL),
(1195, 'Codo de 2 Logarex x Unid', NULL, 2.50, 30, 20, NULL),
(1196, 'Codo de 2 Nicoll x Unid', NULL, 3.50, 30, 20, NULL),
(1197, 'Codo de 2x45 Logarex x Unid', NULL, 2.50, 30, 20, NULL),
(1198, 'Codo de 2x45 Nicoll x Unid', NULL, 3.50, 30, 20, NULL),
(1199, 'Yee de 2 Nicoll x Unid', NULL, 7.50, 30, 20, NULL),
(1200, 'Yee de 2 Logarex Sanitaria x Unid', NULL, 5.00, 30, 20, NULL),
(1201, 'Yee de 2 Logarex x Unid', NULL, 5.00, 30, 20, NULL),
(1202, 'Tapon de 2 x Unid', NULL, 2.50, 29, 20, NULL),
(1203, 'Union de 2 x Unid', NULL, 2.50, 30, 20, NULL),
(1204, 'Union de 1/2 Nicoll x Unid', NULL, 2.00, 28, 20, NULL),
(1205, 'Union de 1/2 Pavco x Unid', NULL, 2.50, 30, 20, NULL),
(1206, 'Adaptador de 1/2 Nicoll x Unid', NULL, 2.00, 30, 20, NULL),
(1207, 'Tapon de 1/2 macho x Unid', NULL, 1.50, 30, 20, NULL),
(1208, 'Tapon de 1/2 hembra x Unid', NULL, 1.50, 30, 20, NULL),
(1209, 'Tee de 1/2 economico x Unid', NULL, 2.50, 30, 20, NULL),
(1210, 'Tee de 1/2 Pavco x Unid', NULL, 3.50, 30, 20, NULL),
(1211, 'Tee de 1/2 Nicoll x Unid', NULL, 3.50, 30, 20, NULL),
(1212, 'Adaptador de 1/2 economico x Unid', NULL, 2.00, 30, 20, NULL),
(1213, 'Codo de 1/2 economico x Unid', NULL, 2.00, 29, 20, NULL),
(1214, 'Codo de 1/2 Pavco x Unid', NULL, 2.50, 30, 20, NULL),
(1215, 'Union de 1/2 - Mixta x Unid', NULL, 2.50, 30, 20, NULL),
(1216, 'Curva de 1/2 x Unid', NULL, 2.00, 30, 20, NULL),
(1217, 'Codo de 1/2 con rosca x Unid', NULL, 3.50, 30, 20, NULL),
(1218, 'Reduccion de 4 a 2 x Unid', NULL, 6.00, 30, 20, NULL),
(1219, 'Codo de 4 Nicoll x Unid', NULL, 13.50, 30, 20, NULL),
(1220, 'Codo de 4 Logarex x Unid', NULL, 9.80, 30, 20, NULL),
(1221, 'Codo de 4 a 2 Logarex x Unid', NULL, 12.50, 30, 20, NULL),
(1222, 'Tee de 4 Logarex x Unid', NULL, 12.50, 30, 20, NULL),
(1223, 'Tee de 4 a 2 Logarex x Unid', NULL, 10.50, 30, 20, NULL),
(1224, 'Tee de 4 a 2 Nicoll x Unid', NULL, 12.50, 30, 20, NULL),
(1225, 'Yee de 4 Logarex x Unid', NULL, 15.50, 28, 20, NULL),
(1226, 'Tee de 4 Logarex Sanitaria x Unid', NULL, 15.50, 30, 20, NULL),
(1227, 'Yee de 4 a 2 x Unid', NULL, 12.50, 30, 20, NULL),
(1228, 'Broca de metal 3/32 x Unid', NULL, 3.00, 30, 21, NULL),
(1229, 'Broca de metal 7/64 x Unid', NULL, 3.50, 30, 21, NULL),
(1230, 'Broca de metal 1/8 x Unid', NULL, 4.50, 30, 21, NULL),
(1231, 'Broca de metal 1/8 Herragro x Unid', NULL, 5.50, 30, 21, NULL),
(1232, 'Broca de metal 5/32 x Unid', NULL, 5.50, 30, 21, NULL),
(1233, 'Broca de metal 5/33 Herragro x Unid', NULL, 7.50, 30, 21, NULL),
(1234, 'Broca de metal 3/16 x Unid', NULL, 5.50, 30, 21, NULL),
(1235, 'Broca de metal 3/16 Herragro x Unid', NULL, 6.50, 30, 21, NULL),
(1236, 'Broca de metal 1/4 x Unid', NULL, 6.50, 29, 21, NULL),
(1237, 'Broca de metal 1/4 Herragro x Unid', NULL, 9.50, 30, 21, NULL),
(1238, 'Broca de metal 5/16 x Unid', NULL, 8.50, 29, 21, NULL),
(1239, 'Broca de concreto 5/32 Herragro x Unid', NULL, 7.50, 30, 21, NULL),
(1240, 'Broca de concreto 5/32 Shubert x Unid', NULL, 4.50, 30, 21, NULL),
(1241, 'Broca de concreto 3/16 Shubert x Unid', NULL, 4.50, 30, 21, NULL),
(1242, 'Broca de concreto 3/16 Herrragro x Unid', NULL, 9.50, 30, 21, NULL),
(1243, 'Broca de concreto 1/4 Herragro x Unid', NULL, 10.00, 30, 21, NULL),
(1244, 'Broca de concreto 1/4 Ocaco x Unid', NULL, 6.50, 30, 21, NULL),
(1245, 'Broca de concreto 5/16 Shubert x Unid', NULL, 8.50, 30, 21, NULL),
(1246, 'Broca de concreto 5/16 Herragro x Unid', NULL, 12.50, 30, 21, NULL),
(1247, 'Broca de concreto 3/8 Shubert x Unid', NULL, 9.00, 30, 21, NULL),
(1248, 'Broca de concreto 3/8 Herragro x Unid', NULL, 14.50, 30, 21, NULL),
(1249, 'Broca de concreto 1/2 Shubert x Unid', NULL, 12.50, 30, 21, NULL),
(1250, 'Broca de madera 1/8 x Unid', NULL, 2.50, 30, 21, NULL),
(1251, 'Broca de madera 5/32 x Unid', NULL, 3.50, 30, 21, NULL),
(1252, 'Broca de madera 3/16 x Unid', NULL, 4.50, 30, 21, NULL),
(1253, 'Broca de madera 1/4 x Unid', NULL, 6.50, 30, 21, NULL),
(1254, 'Broca de madera 5/16 x Unid', NULL, 7.50, 30, 21, NULL),
(1255, 'Broca de madera 3/8 x Unid', NULL, 8.50, 30, 21, NULL),
(1256, 'Thiner Acrilico 1 Gln Kinger x Unid', NULL, 23.00, 9, 22, NULL),
(1257, 'Thiner Acrilico 1 Lt kinger x Unid', NULL, 9.50, 28, 22, NULL),
(1258, 'Thiner Acrilico 1/2 Lt kinger x Unid', NULL, 6.50, 28, 22, NULL),
(1259, 'Thiner Acrilico 1/4 Lt kinger x Unid', NULL, 3.50, 29, 22, NULL),
(1260, 'Acondicionador de Metales 1 Lt Losaro x Unid', NULL, 17.50, 29, 22, NULL),
(1261, 'Bencina 1 Lt Losaro x Unid', NULL, 12.50, 30, 22, NULL),
(1262, 'Quita sarro 1 Lt kinger x Unid', NULL, 8.50, 30, 22, NULL),
(1263, 'Quita sarro 1/2 Lt kinger x Unid', NULL, 6.50, 30, 22, NULL),
(1264, 'Limpia Mayolica/Fragua 1 Lt kinger x Unid', NULL, 10.00, 30, 22, NULL),
(1265, 'Limpia Mayolica/Fragua 1/2 Lt kinger x Unid', NULL, 7.00, 29, 22, NULL),
(1266, 'Saca grasa + 1/2 Lt bratel x Unid', NULL, 10.00, 30, 22, NULL),
(1267, 'Cera Limpiadora 1/2 Lt daryza x Unid', NULL, 10.00, 30, 22, NULL),
(1268, 'Limpia todo Lavanda 1 Lt Kinger x Unid', NULL, 4.50, 30, 22, NULL),
(1269, 'Limpia todo Lavanda 1/2 Lt Kinger x Unid', NULL, 2.50, 30, 22, NULL),
(1270, 'Limpia todo Bebe 1 Lt Kinger x Unid', NULL, 4.50, 30, 22, NULL),
(1271, 'Limpia todo Bebe 1/2 Lt Kinger x Unid', NULL, 2.50, 30, 22, NULL),
(1272, 'Pino 1 Lt kinger x Unid', NULL, 8.50, 30, 22, NULL),
(1273, 'Pino 1/2 Lt kinger x Unid', NULL, 4.50, 30, 22, NULL),
(1274, 'Ron de quemar 1 Lt x Unid', NULL, 9.50, 30, 22, NULL),
(1275, 'Ron de quemar 1/2 Lt x Unid', NULL, 5.00, 30, 22, NULL),
(1276, 'Preservante de madera 1 Lt x Unid', NULL, 13.50, 30, 22, NULL),
(1277, 'Jabon liquido 1 Lt Losaro x Unid', NULL, 9.50, 30, 22, NULL),
(1278, 'Jabon liquido La primera x Unid', NULL, 8.50, 30, 22, NULL),
(1279, 'Lava vajilla 1 Lt x Unid', NULL, 13.50, 30, 22, NULL),
(1280, 'Limpia Vidrio 1 Lt x Unid', NULL, 9.50, 29, 22, NULL),
(1281, 'Saca grasa 1 Lt kinger x Unid', NULL, 9.50, 30, 22, NULL),
(1282, 'Saca grasa 1/2 Lt kinger x Unid', NULL, 5.00, 30, 22, NULL),
(1283, 'Acido 1 Lt Kinger x Unid', NULL, 7.50, 29, 22, NULL),
(1284, 'Acido 1/2 Lt Kinger x Unid', NULL, 3.80, 11, 22, NULL),
(1285, 'Kreso 1 Lt kinger x Unid', NULL, 7.50, 30, 22, NULL),
(1286, 'Kreso 1/2 Lt kinger x Unid', NULL, 3.80, 30, 22, NULL),
(1287, 'Lejia 1 Lt x Unid', NULL, 3.50, 30, 22, NULL),
(1288, 'Lejia 1/2 Lt x Unid', NULL, 2.00, 30, 22, NULL),
(1289, 'Tornillo spack 3.5 x 16 x Unid', NULL, 0.20, 30, 23, NULL),
(1290, 'Tornillo spack 3.5 x 16 x Doc', NULL, 2.40, 30, 23, NULL),
(1291, 'Tornillo spack 3.5 x 16 x Cnto', NULL, 20.00, 28, 23, NULL),
(1292, 'Tornillo spack 3.5 x 16 x Paq', NULL, 1.50, 30, 23, NULL),
(1293, 'Tornillo spack 3.5 x 20 x Unid', NULL, 0.30, 29, 23, NULL),
(1294, 'Tornillo spack 3.5 x 20 x Doc', NULL, 3.60, 30, 23, NULL),
(1295, 'Tornillo spack 3.5 x 20 x Cnto', NULL, 30.00, 30, 23, NULL),
(1296, 'Tornillo spack 3.5 x 20 x Paq', NULL, 2.50, 30, 23, NULL),
(1297, 'Tornillo spack 3.5 x 30 x Unid', NULL, 0.30, 30, 23, NULL),
(1298, 'Tornillo spack 3.5 x 30 x Doc', NULL, 3.60, 30, 23, NULL),
(1299, 'Tornillo spack 3.5 x 30 x Cnto', NULL, 30.00, 30, 23, NULL),
(1300, 'Tornillo spack 3.5 x 30 x Paq', NULL, 2.80, 30, 23, NULL),
(1301, 'Tornillo spack 3.5 x 40 x Unid', NULL, 0.35, 30, 23, NULL),
(1302, 'Tornillo spack 3.5 x 40 x Doc', NULL, 4.20, 30, 23, NULL),
(1303, 'Tornillo spack 3.5 x 40 x Cnto', NULL, 35.00, 30, 23, NULL),
(1304, 'Tornillo spack 3.5 x 40 x Paq', NULL, 3.20, 30, 23, NULL),
(1305, 'Tornillo spack 3.5 x 50 x Unid', NULL, 0.35, 30, 23, NULL),
(1306, 'Tornillo spack 3.5 x 50 x Doc', NULL, 4.20, 30, 23, NULL),
(1307, 'Tornillo spack 3.5 x 50 x Cnto', NULL, 35.00, 30, 23, NULL),
(1308, 'Tornillo spack 3.5 x 50 x Paq', NULL, 3.50, 30, 23, NULL),
(1309, 'Tornillo spack 4 x 20 x Unid', NULL, 0.20, 30, 23, NULL),
(1310, 'Tornillo spack 4 x 20 x Doc', NULL, 2.40, 30, 23, NULL),
(1311, 'Tornillo spack 4 x 20 x Cnto', NULL, 20.00, 30, 23, NULL),
(1312, 'Tornillo spack 4 x 20 x Paq', NULL, 2.00, 30, 23, NULL),
(1313, 'Tornillo spack 4 x 25 x Unid', NULL, 0.25, 30, 23, NULL),
(1314, 'Tornillo spack 4 x 25 x Doc', NULL, 3.00, 30, 23, NULL),
(1315, 'Tornillo spack 4 x 25 x Cnto', NULL, 25.00, 30, 23, NULL),
(1316, 'Tornillo spack 4 x 25 x Paq', NULL, 2.00, 30, 23, NULL),
(1317, 'Tornillo spack 4 x 30 x Unid', NULL, 0.30, 30, 23, NULL),
(1318, 'Tornillo spack 4 x 30 x Doc', NULL, 3.60, 30, 23, NULL),
(1319, 'Tornillo spack 4 x 30 x Cnto', NULL, 30.00, 30, 23, NULL),
(1320, 'Tornillo spack 4 x 30 x Paq', NULL, 2.50, 30, 23, NULL),
(1321, 'Tornillo spack 4 x 35 x Unid', NULL, 0.33, 29, 23, NULL),
(1322, 'Tornillo spack 4 x 35 x Doc', NULL, 3.96, 30, 23, NULL),
(1323, 'Tornillo spack 4 x 35 x Cnto', NULL, 33.00, 30, 23, NULL),
(1324, 'Tornillo spack 4 x 35 x Paq', NULL, 3.00, 30, 23, NULL),
(1325, 'Tornillo spack 4 x 40 x Unid', NULL, 0.37, 30, 23, NULL),
(1326, 'Tornillo spack 4 x 40 x Doc', NULL, 4.44, 30, 23, NULL),
(1327, 'Tornillo spack 4 x 40 x Cnto', NULL, 37.00, 30, 23, NULL),
(1328, 'Tornillo spack 4 x 40 x Paq', NULL, 3.50, 30, 23, NULL),
(1329, 'Tornillo spack 4 x 50 x Unid', NULL, 0.39, 30, 23, NULL),
(1330, 'Tornillo spack 4 x 50 x Doc', NULL, 4.68, 32, 23, NULL),
(1331, 'Tornillo spack 4 x 50 x Cnto', NULL, 39.00, 30, 23, NULL),
(1332, 'Tornillo spack 4 x 50 x Paq', NULL, 4.00, 30, 23, NULL),
(1333, 'Tornillo spack 4 x 60 x Unid', NULL, 0.42, 25, 23, NULL),
(1334, 'Tornillo spack 4 x 60 x Doc', NULL, 5.04, 30, 23, NULL),
(1335, 'Tornillo spack 4 x 60 x Cnto', NULL, 42.00, 30, 23, NULL),
(1336, 'Tornillo spack 4 x 60 x Paq', NULL, 5.00, 30, 23, NULL),
(1337, 'Tornillo spack 4 x 70 x Unid', NULL, 0.55, 30, 23, NULL),
(1338, 'Tornillo spack 4 x 70 x Doc', NULL, 6.60, 28, 23, NULL),
(1339, 'Tornillo spack 4 x 70 x Cnto', NULL, 55.00, 30, 23, NULL),
(1340, 'Tornillo spack 4 x 70 x Paq', NULL, 6.00, 30, 23, NULL),
(1341, 'Tornillo spack 4.5 x 30 x Unid', NULL, 0.33, 30, 23, NULL),
(1342, 'Tornillo spack 4.5 x 30 x Doc', NULL, 3.96, 30, 23, NULL),
(1343, 'Tornillo spack 4.5 x 30 x Cnto', NULL, 33.00, 30, 23, NULL),
(1344, 'Tornillo spack 4.5 x 30 x Paq', NULL, 3.00, 30, 23, NULL),
(1345, 'Tornillo spack 4.5 x 35 x Unid', NULL, 0.37, 30, 23, NULL),
(1346, 'Tornillo spack 4.5 x 35 x Doc', NULL, 4.44, 30, 23, NULL),
(1347, 'Tornillo spack 4.5 x 35 x Cnto', NULL, 37.00, 30, 23, NULL),
(1348, 'Tornillo spack 4.5 x 35 x Paq', NULL, 3.50, 30, 23, NULL),
(1349, 'Tornillo spack 4.5 x 60 x Unid', NULL, 0.37, 30, 23, NULL),
(1350, 'Tornillo spack 4.5 x 60 x Doc', NULL, 4.44, 30, 23, NULL),
(1351, 'Tornillo spack 4.5 x 60 x Cnto', NULL, 37.00, 30, 23, NULL),
(1352, 'Tornillo spack 4.5 x 60 x Paq', NULL, 3.50, 30, 23, NULL),
(1353, 'Tornillo spack 4.5 x 70 x Unid', NULL, 0.57, 30, 23, NULL),
(1354, 'Tornillo spack 4.5 x 70 x Doc', NULL, 6.84, 30, 23, NULL),
(1355, 'Tornillo spack 4.5 x 70 x Cnto', NULL, 57.00, 30, 23, NULL),
(1356, 'Tornillo spack 4.5 x 70 x Paq', NULL, 6.50, 30, 23, NULL),
(1357, 'Tornillo spack 5 x 20 x Unid', NULL, 0.23, 30, 23, NULL),
(1358, 'Tornillo spack 5 x 20 x Doc', NULL, 2.76, 30, 23, NULL),
(1359, 'Tornillo spack 5 x 20 x Cnto', NULL, 23.00, 30, 23, NULL),
(1360, 'Tornillo spack 5 x 20 x Paq', NULL, 2.50, 30, 23, NULL),
(1361, 'Tornillo spack 5 x 30 x Unid', NULL, 0.40, 30, 23, NULL),
(1362, 'Tornillo spack 5 x 30 x Doc', NULL, 4.80, 30, 23, NULL),
(1363, 'Tornillo spack 5 x 30 x Cnto', NULL, 40.00, 30, 23, NULL),
(1364, 'Tornillo spack 5 x 30 x Paq', NULL, 3.00, 30, 23, NULL),
(1365, 'Tornillo spack 5 x 35 x Unid', NULL, 0.37, 30, 23, NULL),
(1366, 'Tornillo spack 5 x 35 x Doc', NULL, 4.44, 30, 23, NULL),
(1367, 'Tornillo spack 5 x 35 x Cnto', NULL, 37.00, 30, 23, NULL),
(1368, 'Tornillo spack 5 x 35 x Paq', NULL, 3.50, 30, 23, NULL),
(1369, 'Tornillo spack 5 x 40 x Unid', NULL, 0.39, 30, 23, NULL),
(1370, 'Tornillo spack 5 x 40 x Doc', NULL, 4.68, 30, 23, NULL),
(1371, 'Tornillo spack 5 x 40 x Cnto', NULL, 39.00, 30, 23, NULL),
(1372, 'Tornillo spack 5 x 40 x Paq', NULL, 4.00, 30, 23, NULL),
(1373, 'Tornillo spack 5 x 45 x Unid', NULL, 0.42, 30, 23, NULL),
(1374, 'Tornillo spack 5 x 45 x Doc', NULL, 5.04, 30, 23, NULL),
(1375, 'Tornillo spack 5 x 45 x Cnto', NULL, 42.00, 30, 23, NULL),
(1376, 'Tornillo spack 5 x 45 x Paq', NULL, 4.50, 30, 23, NULL),
(1377, 'Tornillo spack 5 x 50 x Unid', NULL, 0.42, 30, 23, NULL),
(1378, 'Tornillo spack 5 x 50 x Doc', NULL, 5.04, 30, 23, NULL),
(1379, 'Tornillo spack 5 x 50 x Cnto', NULL, 42.00, 30, 23, NULL),
(1380, 'Tornillo spack 5 x 50 x Paq', NULL, 5.00, 30, 23, NULL),
(1381, 'Tornillo spack 5 x 60 x Unid', NULL, 0.45, 30, 23, NULL),
(1382, 'Tornillo spack 5 x 60 x Doc', NULL, 5.40, 30, 23, NULL),
(1383, 'Tornillo spack 5 x 60 x Cnto', NULL, 45.00, 30, 23, NULL),
(1384, 'Tornillo spack 5 x 60 x Paq', NULL, 5.50, 30, 23, NULL),
(1385, 'Tornillo spack 5 x 80 x Unid', NULL, 0.55, 30, 23, NULL),
(1386, 'Tornillo spack 5 x 80 x Doc', NULL, 6.60, 30, 23, NULL),
(1387, 'Tornillo spack 5 x 80 x Cnto', NULL, 55.00, 30, 23, NULL),
(1388, 'Tornillo spack 5 x 80 x Paq', NULL, 6.00, 30, 23, NULL),
(1389, 'Tornillo spack 5 x 90 x Unid', NULL, 0.60, 30, 23, NULL),
(1390, 'Tornillo spack 5 x 90 x Doc', NULL, 7.20, 30, 23, NULL),
(1391, 'Tornillo spack 5 x 90 x Cnto', NULL, 60.00, 30, 23, NULL),
(1392, 'Tornillo spack 5 x 90 x Paq', NULL, 7.00, 30, 23, NULL),
(1393, 'Tornillo spack 5 x 100 x Unid', NULL, 0.64, 30, 23, NULL),
(1394, 'Tornillo spack 5 x 100 x Doc', NULL, 7.68, 30, 23, NULL),
(1395, 'Tornillo spack 5 x 100 x Cnto', NULL, 64.00, 30, 23, NULL),
(1396, 'Tornillo spack 5 x 100 x Paq', NULL, 7.50, 30, 23, NULL),
(1397, 'Tornillo spack 6 x 30 x Unid', NULL, 0.30, 30, 23, NULL),
(1398, 'Tornillo spack 6 x 30 x Doc', NULL, 3.60, 30, 23, NULL),
(1399, 'Tornillo spack 6 x 30 x Cnto', NULL, 30.00, 30, 23, NULL),
(1400, 'Tornillo spack 6 x 30 x Paq', NULL, 3.00, 30, 23, NULL),
(1401, 'Tornillo spack 6 x 40 x Unid', NULL, 0.37, 30, 23, NULL),
(1402, 'Tornillo spack 6 x 40 x Doc', NULL, 4.44, 30, 23, NULL),
(1403, 'Tornillo spack 6 x 40 x Cnto', NULL, 37.00, 30, 23, NULL),
(1404, 'Tornillo spack 6 x 40 x Paq', NULL, 3.50, 30, 23, NULL),
(1405, 'Tornillo spack 6 x 50 x Unid', NULL, 0.39, 30, 23, NULL),
(1406, 'Tornillo spack 6 x 50 x Doc', NULL, 4.68, 30, 23, NULL),
(1407, 'Tornillo spack 6 x 50 x Cnto', NULL, 39.00, 30, 23, NULL),
(1408, 'Tornillo spack 6 x 50 x Paq', NULL, 4.00, 30, 23, NULL),
(1409, 'Tornillo spack 6 x 60 x Unid', NULL, 0.45, 30, 23, NULL),
(1410, 'Tornillo spack 6 x 60 x Doc', NULL, 5.40, 30, 23, NULL),
(1411, 'Tornillo spack 6 x 60 x Cnto', NULL, 45.00, 30, 23, NULL),
(1412, 'Tornillo spack 6 x 60 x Paq', NULL, 5.50, 30, 23, NULL),
(1413, 'Tornillo spack 6 x 80 x Unid', NULL, 0.57, 30, 23, NULL),
(1414, 'Tornillo spack 6 x 80 x Doc', NULL, 6.84, 30, 23, NULL),
(1415, 'Tornillo spack 6 x 80 x Cnto', NULL, 57.00, 30, 23, NULL),
(1416, 'Tornillo spack 6 x 80 x Paq', NULL, 6.50, 30, 23, NULL),
(1417, 'Tornillo spack 6 x 90 x Unid', NULL, 0.70, 30, 23, NULL),
(1418, 'Tornillo spack 6 x 90 x Doc', NULL, 8.40, 30, 23, NULL),
(1419, 'Tornillo spack 6 x 90 x Cnto', NULL, 70.00, 30, 23, NULL),
(1420, 'Tornillo spack 6 x 90 x Paq', NULL, 7.50, 30, 23, NULL),
(1421, 'Perno Hexagonal de 1/4 x 5/8 x Unid', NULL, 0.30, 27, 24, NULL),
(1422, 'Perno Hexagonal de 1/4 x 3/4 x Unid', NULL, 0.30, 30, 24, NULL),
(1423, 'Perno Hexagonal de 1/4 x 1 1/4 x Unid', NULL, 0.40, 24, 24, NULL),
(1424, 'Perno Hexagonal de 1/4 x 1 1/2 x Unid', NULL, 0.55, 30, 24, NULL),
(1425, 'Perno Hexagonal de 1/4 x 2 x Unid', NULL, 0.65, 20, 24, NULL),
(1426, 'Perno Hexagonal de 1/4 x 2 1/2 x Unid', NULL, 0.80, 30, 24, NULL),
(1427, 'Perno Hexagonal de 1/4 x 3 x Unid', NULL, 0.90, 30, 24, NULL),
(1428, 'Perno Hexagonal de 1/4 x 3 1/2 x Unid', NULL, 1.00, 18, 24, NULL),
(1429, 'Perno Hexagonal de 1/4 x 4 x Unid', NULL, 1.20, 30, 24, NULL),
(1430, 'Perno Hexagonal de 5/16 x 3/4 x Unid', NULL, 0.50, 30, 24, NULL),
(1431, 'Perno Hexagonal de 5/16 x 1 x Unid', NULL, 0.60, 30, 24, NULL),
(1432, 'Perno Hexagonal de 5/16 x 2 x Unid', NULL, 0.75, 30, 24, NULL),
(1433, 'Perno Hexagonal de 5/16 x 2 1/2 x Unid', NULL, 0.95, 30, 24, NULL),
(1434, 'Perno Hexagonal de 5/16 x 3 x Unid', NULL, 1.20, 30, 24, NULL),
(1435, 'Perno Hexagonal de 3/8 x 3 x Unid', NULL, 1.40, 30, 24, NULL),
(1436, 'Tirafon Hexagonal de 1/4 x 1 x Unid', NULL, 0.40, 30, 24, NULL),
(1437, 'Tirafon Hexagonal de 1/4 x 1 1/2 x Unid', NULL, 0.45, 30, 24, NULL),
(1438, 'Tirafon Hexagonal de 1/4 x 2 x Unid', NULL, 0.50, 30, 24, NULL),
(1439, 'Tirafon Hexagonal de 1/4 x 2 1/2 x Unid', NULL, 0.60, 30, 24, NULL),
(1440, 'Tirafon Hexagonal de 1/4 x 3 x Unid', NULL, 0.90, 30, 24, NULL),
(1441, 'Tirafon Hexagonal de 1/4 x 3 1/2 x Unid', NULL, 1.00, 30, 24, NULL),
(1442, 'Tirafon Hexagonal de 1/4 x 4 x Unid', NULL, 1.20, 30, 24, NULL),
(1443, 'Tirafon Hexagonal de 5/16 x 1 1/2 x Unid', NULL, 0.60, 30, 24, NULL),
(1444, 'Tirafon Hexagonal de 5/16 x 2 x Unid', NULL, 0.80, 30, 24, NULL),
(1445, 'Tirafon Hexagonal de 5/16 x 4 x Unid', NULL, 1.30, 30, 24, NULL),
(1446, 'Perno c/coche de 1/4 x 1 1/2 x Unid', NULL, 0.50, 30, 24, NULL),
(1447, 'Perno c/coche de 1/4 x 2 x Unid', NULL, 0.60, 30, 24, NULL),
(1448, 'Perno c/coche de 1/4 x 2 1/2 x Unid', NULL, 0.70, 30, 24, NULL),
(1449, 'Perno c/coche de 1/4 x 3 x Unid', NULL, 0.80, 30, 24, NULL),
(1450, 'Perno c/coche de 1/4 x 3 1/2 x Unid', NULL, 1.00, 30, 24, NULL),
(1451, 'Perno c/coche de 1/4 x 4 x Unid', NULL, 1.20, 30, 24, NULL),
(1452, 'Perno c/coche de 5/16 x 1 x Unid', NULL, 0.50, 30, 24, NULL),
(1453, 'Perno c/coche de 5/16 x 1 1/2 x Unid', NULL, 0.70, 30, 24, NULL),
(1454, 'Perno c/coche de 5/16 x 2 x Unid', NULL, 0.80, 30, 24, NULL),
(1455, 'Perno c/coche de 5/16 x 3 x Unid', NULL, 1.00, 30, 24, NULL),
(1456, 'Perno c/coche de 5/16 x 3 1/2 x Unid', NULL, 1.20, 30, 24, NULL),
(1457, 'Martillo tramontina x Unid', NULL, 35.00, 30, 25, NULL),
(1458, 'Martillo casco x Unid', NULL, 35.00, 30, 25, NULL),
(1459, 'Comba octagonal x Unid', NULL, 30.50, 30, 25, NULL),
(1460, 'Martillo economico x Unid', NULL, 18.50, 30, 25, NULL),
(1461, 'Lapiz carpintero x Unid', NULL, 2.00, 30, 25, NULL),
(1462, 'Cuter Stanly (doble) x Unid', NULL, 18.00, 30, 25, NULL),
(1463, 'Cuter Utility x Unid', NULL, 17.00, 30, 25, NULL),
(1464, 'Piedra set P (Vastago 1/4) x Unid', NULL, 15.00, 30, 25, NULL),
(1465, 'Mecha tipo paleta - Asaki x Unid', NULL, 5.00, 30, 25, NULL),
(1466, 'Mecha tipo paleta - Asaki x Paq', NULL, 25.00, 30, 25, NULL),
(1467, 'Mecha tipo paleta - Utustools x Unid', NULL, 10.00, 30, 25, NULL),
(1468, 'Mecha tipo paleta - Utustools x Paq', NULL, 35.00, 30, 25, NULL),
(1469, 'Poncheador - (Alicate de Internet) x Unid', NULL, 35.00, 30, 25, NULL),
(1470, 'Alicate corte diagonal - KAMASA x Unid', NULL, 23.00, 30, 25, NULL),
(1471, 'Alicate (Pelacable) - ALMOS x Unid', NULL, 17.00, 30, 25, NULL),
(1472, 'Alicate Simple x Unid', NULL, 16.50, 30, 25, NULL),
(1473, 'Alicate mini bolt cutter - INECO x Unid', NULL, 28.50, 30, 25, NULL),
(1474, 'Socket y bits set x Unid', NULL, 28.00, 30, 25, NULL),
(1475, 'Juego (Dado, puntilla, broca) [Bolsa] x Unid', NULL, 27.50, 30, 25, NULL),
(1476, 'Juego broca copa x Unid', NULL, 17.50, 30, 25, NULL),
(1477, 'Alicate en punta x Unid', NULL, 15.50, 30, 25, NULL),
(1478, 'Cutin de madera x Unid', NULL, 17.50, 30, 25, NULL),
(1479, 'Cutin en Pistola x Unid', NULL, 25.00, 30, 25, NULL),
(1480, 'Alicate mini - ALMOS x Unid', NULL, 10.00, 30, 25, NULL),
(1481, 'Alicate mini - ALMOS x Paq', NULL, 30.00, 30, 25, NULL),
(1482, 'Alicate mini - Kamazaki x Unid', NULL, 9.00, 30, 25, NULL),
(1483, 'Alicate mini - Kamazaki x Paq', NULL, 35.00, 30, 25, NULL),
(1484, 'Juego de broca de 3 - Kenny tools x Paq', NULL, 25.00, 30, 25, NULL),
(1485, 'Juego Broca de madera - Profield x Paq', NULL, 17.50, 30, 25, NULL),
(1486, 'Juego de brocas - Asaki x Paq', NULL, 38.00, 30, 25, NULL),
(1487, 'Remachadora Asaki x Unid', NULL, 25.00, 30, 25, NULL),
(1488, 'Alicate de presion x Unid', NULL, 35.00, 30, 25, NULL),
(1489, 'Llave francesa #12 x Unid', NULL, 33.00, 30, 25, NULL),
(1490, 'Llave francesa #10 x Unid', NULL, 27.50, 29, 25, NULL),
(1491, 'Llave francesa #8 x Unid', NULL, 22.50, 30, 25, NULL),
(1492, 'Llave francesa #6 x Unid', NULL, 15.50, 30, 25, NULL),
(1493, 'Llave Stilson #10 x Unid', NULL, 32.50, 30, 25, NULL),
(1494, 'Llave Universal - ALMOS x Paq', NULL, 35.00, 30, 25, NULL),
(1495, 'Multimetro digital x Unid', NULL, 35.00, 30, 25, NULL),
(1496, 'Desarmador Profield x Unid', NULL, 4.50, 8, 25, NULL),
(1497, 'Desarmador Profield x Paq', NULL, 30.00, 30, 25, NULL),
(1498, 'Desarmador Total x Unid', NULL, 10.00, 30, 25, NULL),
(1499, 'Desarmador Total x Paq', NULL, 35.00, 30, 25, NULL),
(1500, 'Desarmador Ineco x Unid', NULL, 11.00, 30, 25, NULL),
(1501, 'Desarmador Ineco x Paq', NULL, 38.00, 30, 25, NULL),
(1502, 'Desarmador Individual Amarillo x Unid', NULL, 8.00, 30, 25, NULL),
(1503, 'Desarmador con golpe Grande x Unid', NULL, 8.50, 30, 25, NULL),
(1504, 'Desarmador con golpe Mediano x Unid', NULL, 7.50, 30, 25, NULL),
(1505, 'Desarmador con golpe Chico x Unid', NULL, 6.50, 30, 25, NULL),
(1506, 'Tiralinea x Unid', NULL, 17.50, 30, 25, NULL),
(1507, 'Formon de 1/2 Profield x Unid', NULL, 10.00, 30, 25, NULL),
(1508, 'Formon de 3/4 Profield x Unid', NULL, 12.50, 30, 25, NULL),
(1509, 'Formon de 1 Profield x Unid', NULL, 15.00, 30, 25, NULL),
(1510, 'Lima triangular x Unid', NULL, 15.00, 30, 25, NULL),
(1511, 'Lima cuadrada x Unid', NULL, 10.00, 30, 25, NULL),
(1512, 'Arco de sierra CyA x Unid', NULL, 19.50, 30, 25, NULL),
(1513, 'Arco de sierra Aolong x Unid', NULL, 25.00, 30, 25, NULL),
(1514, 'Arco de sierra Tool Max x Unid', NULL, 15.50, 30, 25, NULL),
(1515, 'Wincha pasacable 10 mt metal x Unid', NULL, 23.00, 30, 25, NULL),
(1516, 'Wincha pasacable 15 mt metal x Unid', NULL, 28.00, 30, 25, NULL),
(1517, 'Wincha pasacable 20 mt hydra x Unid', NULL, 25.00, 30, 25, NULL),
(1518, 'Wincha pasacable 5 mt Plastico x Unid', NULL, 12.50, 30, 25, NULL),
(1519, 'Wincha pasacable 10 mt Plastico x Unid', NULL, 20.00, 30, 25, NULL),
(1520, 'Wincha pasacable 15 mt Plastico x Unid', NULL, 25.00, 30, 25, NULL),
(1521, 'Pistola para tubo de silicona x Unid', NULL, 25.00, 30, 25, NULL),
(1522, 'Repuesto para cortar mayolica x Unid', NULL, 23.50, 30, 25, NULL),
(1523, 'Wincha de 7.5 mt x Unid', NULL, 12.50, 30, 25, NULL),
(1524, 'Wincha de 7.5 mt CASCO x Unid', NULL, 22.50, 30, 25, NULL),
(1525, 'Wincha de 5 mt ALMOS x Unid', NULL, 8.50, 30, 25, NULL),
(1526, 'Wincha de 3mt Shubert x Unid', NULL, 8.00, 30, 25, NULL),
(1527, 'Wincha de 3mt x Unid', NULL, 6.50, 30, 25, NULL),
(1528, 'Wincha de 5mt Stanley x Unid', NULL, 25.00, 30, 25, NULL),
(1529, 'Lija de papel #7 Hefesto x Unid', NULL, 17.50, 30, 25, NULL),
(1530, 'Lija de papel #7 Tool Max x Unid', NULL, 15.00, 30, 25, NULL),
(1531, 'Lija de papel #4 Josili x Unid', NULL, 12.00, 30, 25, NULL),
(1532, 'Disco de pulir #4 x Unid', NULL, 7.50, 30, 26, NULL),
(1533, 'Disco de metal de 4 1/2 x Unid', NULL, 5.00, 30, 26, NULL),
(1534, 'Disco de metal de 4 1/2 Abracol x Unid', NULL, 7.50, 30, 26, NULL),
(1535, 'Disco de metal de 4 1/2 Norton x Unid', NULL, 7.50, 30, 26, NULL),
(1536, 'Disco flap #40 x Unid', NULL, 6.50, 30, 26, NULL),
(1537, 'Disco flap #60 x Unid', NULL, 6.50, 30, 26, NULL),
(1538, 'Disco flap #80 x Unid', NULL, 6.00, 30, 26, NULL),
(1539, 'Pegamento de Mayolica x Kg', NULL, 2.50, 15, 27, NULL),
(1540, 'Desague para Lavadero 1 1/4', NULL, 8.50, 19, 28, NULL),
(1541, 'Niple de 1/2 x 1 de Bronce x Unid', NULL, 3.50, 5, 20, NULL),
(1542, ' Niple de 1/2 x 1 1/2 de Bronce x Unid', NULL, 4.50, 5, 20, NULL),
(1543, 'Niple de 1/2 x 2 de Bronce x Unid', NULL, 5.50, 6, 20, NULL),
(1544, 'Argolla para Cortina x Doc', NULL, 3.50, 10, 29, NULL),
(1545, 'Trompito', NULL, 1.00, 199, 30, NULL),
(1546, 'Disco de Desbaste 4 1/2 x Unid', NULL, 8.50, 0, 26, NULL),
(1547, 'Cemento x Kg', NULL, 2.00, 2, 27, NULL),
(1548, 'Esponja', NULL, 0.50, 25, 29, NULL),
(1549, 'Esponja x Unid ', NULL, 0.00, 0, 29, NULL),
(1550, 'Esponja de Alta x Unid', NULL, 1.00, 22, 29, NULL),
(1551, 'Candado de 20mm Bronce x Unid', NULL, 6.50, 20, 31, NULL),
(1552, 'Candado de 25mm Bronce x Unid', NULL, 7.50, 12, 31, NULL),
(1553, 'Candado de 38mm Bronce x Unid', NULL, 8.50, 7, 31, NULL),
(1554, 'Terrocal 1/4 Africano x Unid', NULL, 0.00, 0, NULL, NULL),
(1555, 'Terrocal 1/4 Africano x Unid', NULL, 20.00, 6, 32, NULL),
(1556, 'Terrocal 1/16 Africano x Unid', NULL, 5.50, 11, 32, NULL),
(1557, 'Terrocal 1/32 Africano x Unid', NULL, 3.50, 13, 32, NULL),
(1558, 'Cintillo Negro de 4.5 x 25 mm x Paq', NULL, 12.00, 1, 33, NULL),
(1559, 'Cintillo Negro de 4.5 x 20 mm x Paq', NULL, 13.00, 3, 33, NULL),
(1560, 'Llave de Paso 1/2 Galvanizado', NULL, 25.00, 2, 34, NULL),
(1561, 'Cinta Teflon x Unid', NULL, 1.50, 27, 18, NULL),
(1562, 'Mata Mosca Sapolio Aerosol x Unid', NULL, 10.00, 1, 35, NULL),
(1563, 'Manguera para Lvadora 2 Mt x Unid', NULL, 20.00, 2, 36, NULL),
(1564, 'Manguera para Lvadora 3 Mt x Unid', NULL, 0.00, 0, 36, NULL),
(1565, 'Manguera para Lvadora 3 Mt x Unid', NULL, 25.00, 3, 36, NULL),
(1566, 'Hoja de sierra Sanflex x Unid', NULL, 6.50, 19, 25, NULL),
(1567, 'Hoja de sierra Economica x Unid', NULL, 3.50, 24, 25, NULL),
(1568, 'Tarugo de plastico 5/16 Azul x 1/2 Doc', NULL, 1.50, 99, 37, NULL),
(1569, 'Tarugo de plastico 5/16 Azul x Doc', NULL, 3.00, 96, 37, NULL),
(1570, 'Tomacorriente Plomo c/t x Unid', NULL, 6.00, 11, 10, NULL),
(1572, 'Bisagra de 3 plg x Unid', NULL, 3.50, 9, 38, NULL),
(1573, 'Cerrojo de 2 plg x Unid', NULL, 3.50, 11, 39, NULL),
(1574, 'Caño Corrugado para Cocina x Unid', NULL, 35.00, 2, 34, NULL),
(1575, 'Pintura Blanco Latex Losaro', NULL, 25.00, -2, 12, NULL),
(1601, 'Lija fierro #40 x Unid', NULL, 2.50, 39, NULL, NULL),
(1602, 'Lija fierro #60 x Unid', NULL, 2.50, 39, NULL, NULL),
(1603, 'Lija fierro #80 x Unid', NULL, 2.50, 37, NULL, NULL),
(1604, 'Lija fierro #100 x Unid', NULL, 2.50, 34, NULL, NULL),
(1605, 'Lija fierro #120 x Unid', NULL, 2.50, 40, NULL, NULL),
(1606, 'Lija fierro #150 x Unid', NULL, 2.50, 40, NULL, NULL),
(1607, 'Lija fierro #180 x Unid', NULL, 2.50, 40, NULL, NULL),
(1608, 'Lija fierro #220 x Unid', NULL, 2.50, 40, NULL, NULL),
(1609, 'Lija fierro #240 x Unid', NULL, 2.50, 40, NULL, NULL),
(1610, 'Lija fierro #320 x Unid', NULL, 2.50, 40, NULL, NULL),
(1611, 'Lija agua #80 x Unid', NULL, 2.40, 40, NULL, NULL),
(1612, 'Lija agua #100 x Unid', NULL, 2.50, 40, NULL, NULL),
(1613, 'Lija agua #120 x Unid', NULL, 2.50, 40, NULL, NULL),
(1614, 'Lija agua #150 x Unid', NULL, 2.50, 40, NULL, NULL),
(1615, 'Lija agua #180 x Unid', NULL, 2.40, 40, NULL, NULL),
(1616, 'Lija agua #220 x Unid', NULL, 2.40, 40, NULL, NULL),
(1617, 'Lija agua #240 x Unid', NULL, 2.90, 40, NULL, NULL),
(1618, 'Lija agua #320 x Unid', NULL, 2.80, 40, NULL, NULL),
(1619, 'Lija agua #400 x Unid', NULL, 2.70, 40, NULL, NULL),
(1620, 'Lija agua #600 x Unid', NULL, 2.60, 40, NULL, NULL),
(1621, 'Lija agua #800 x Unid', NULL, 2.50, 40, NULL, NULL),
(1622, 'Lija agua #1000 x Unid', NULL, 2.40, 40, NULL, NULL),
(1623, 'Lija agua #1200 x Unid', NULL, 2.30, 40, NULL, NULL),
(1624, 'Lija agua #1500 x Unid', NULL, 2.20, 40, NULL, NULL),
(1625, 'Lija agua #2000 x Unid', NULL, 2.10, 40, NULL, NULL),
(1636, 'Fragua Blanco Losaro x Kg', NULL, 6.00, 41, NULL, NULL),
(1637, 'Fragua Gris Plata Losaro x Kg', NULL, 6.00, 41, NULL, NULL),
(1638, 'Fragua Gris Plata Chema x Kg', NULL, 7.00, 40, NULL, NULL),
(1639, 'Fragua Negro Losaro x Kg', NULL, 6.00, 41, NULL, NULL),
(1640, 'Fragua Naranja Losaro x Kg', NULL, 6.00, 41, NULL, NULL),
(1641, 'Fragua Crema Hueso Losaro x Kg', NULL, 6.00, 41, NULL, NULL),
(1642, 'Llave Triangular para Cajar de luz', NULL, 5.00, 4, 25, NULL),
(1691, 'Armella abierta 5/8\" x Unid', NULL, 0.30, 20, 41, NULL),
(1692, 'Armella abierta 3/4\" x Unid', NULL, 0.40, 20, 41, NULL),
(1693, 'Armella abierta 7/8\" x Unid', NULL, 0.40, 20, 41, NULL),
(1694, 'Armella abierta 1\" x Unid', NULL, 0.50, 20, 41, NULL),
(1695, 'Armella abierta 1-1/4\" x Unid', NULL, 0.80, 20, 41, NULL),
(1696, 'Armella abierta 1-1/2\" x Unid', NULL, 1.00, 20, 41, NULL),
(1697, 'Armella abierta 1-3/4\" x Unid', NULL, 1.30, 20, 41, NULL),
(1698, 'Armella abierta 2\" x Unid', NULL, 2.00, 18, 41, NULL),
(1699, 'Armella abierta 5/8\" x Doc', NULL, 2.52, 20, 41, NULL),
(1700, 'Armella abierta 3/4\" x Doc', NULL, 3.36, 20, 41, NULL),
(1701, 'Armella abierta 7/8\" x Doc', NULL, 3.36, 20, 41, NULL),
(1702, 'Armella abierta 1\" x Doc', NULL, 4.20, 20, 41, NULL),
(1703, 'Armella abierta 1-1/4\" x Doc', NULL, 6.72, 20, 41, NULL),
(1704, 'Armella abierta 1-1/2\" x Doc', NULL, 8.40, 20, 41, NULL),
(1705, 'Armella abierta 1-3/4\" x Doc', NULL, 10.92, 20, 41, NULL),
(1706, 'Armella abierta 2\" x Doc', NULL, 16.80, 20, 41, NULL),
(1707, 'Armella cerrada 5/8\" x Unid', NULL, 0.36, 20, 41, NULL),
(1708, 'Armella cerrada 3/4\" x Unid', NULL, 0.48, 20, 41, NULL),
(1709, 'Armella cerrada 7/8\" x Unid', NULL, 0.48, 20, 41, NULL),
(1710, 'Armella cerrada 1\" x Unid', NULL, 0.60, 20, 41, NULL),
(1711, 'Armella cerrada 1-1/4\" x Unid', NULL, 0.96, 20, 41, NULL),
(1712, 'Armella cerrada 1-1/2\" x Unid', NULL, 1.20, 20, 41, NULL),
(1713, 'Armella cerrada 1-3/4\" x Unid', NULL, 1.56, 20, 41, NULL),
(1714, 'Armella cerrada 2\" x Unid', NULL, 2.40, 20, 41, NULL),
(1715, 'Armella cerrada 5/8\" x Doc', NULL, 3.02, 20, 41, NULL),
(1716, 'Armella cerrada 3/4\" x Doc', NULL, 4.03, 20, 41, NULL),
(1717, 'Armella cerrada 7/8\" x Doc', NULL, 4.03, 20, 41, NULL),
(1718, 'Armella cerrada 1\" x Doc', NULL, 5.04, 20, 41, NULL),
(1719, 'Armella cerrada 1-1/4\" x Doc', NULL, 8.06, 20, 41, NULL),
(1720, 'Armella cerrada 1-1/2\" x Doc', NULL, 10.08, 20, 41, NULL),
(1721, 'Armella cerrada 1-3/4\" x Doc', NULL, 13.10, 20, 41, NULL),
(1722, 'Armella cerrada 2\" x Doc', NULL, 20.16, 20, 41, NULL),
(1723, 'Trampa para Lavatorio de 2 plg', NULL, 13.50, 18, 42, NULL),
(1724, 'Trampa P 1 1/4 ABS', NULL, 17.50, 19, 42, NULL),
(1725, 'Trampa P 1 1/4', NULL, 13.50, 20, 42, NULL),
(1726, 'Trampa Corrugada', NULL, 20.50, 20, 42, NULL),
(1727, 'Trampa P 1 1/2 ABS', NULL, 14.00, 20, 42, NULL),
(1728, 'Trampa P 2 ABS', NULL, 18.50, 20, 42, NULL),
(1729, 'Trampa S 1 1/4 PVC', NULL, 12.00, 20, 42, NULL),
(1730, 'Trampa S 1 1/2 PVC', NULL, 15.00, 20, 42, NULL),
(1731, 'Trampa S 2 PVC', NULL, 20.00, 20, 42, NULL),
(1732, 'Trampa Lavatorio 1 1/4 Cromada', NULL, 25.00, 20, 42, NULL),
(1733, 'Trampa Lavatorio 1 1/4 Acero Inox', NULL, 30.00, 20, 42, NULL),
(1734, 'Trampa Corrugada 1 1/4', NULL, 16.00, 20, 42, NULL),
(1735, 'Trampa Corrugada 1 1/2', NULL, 18.00, 20, 42, NULL),
(1736, 'Trampa Corrugada 2', NULL, 22.00, 20, 42, NULL),
(1737, 'Trampa Flexible Extensible 1 1/2', NULL, 25.00, 20, 42, NULL),
(1738, 'Trampa con Sifón Inodoro', NULL, 28.00, 20, 42, NULL),
(1739, 'Trampa para Bidé 1 1/4', NULL, 22.00, 20, 42, NULL),
(1740, 'Trampa para Lavandería 2', NULL, 35.00, 20, 42, NULL),
(1741, 'Trampa con Filtro para Cocina', NULL, 40.00, 20, 42, NULL),
(1742, 'Adaptador Trampa a Desagüe 1 1/2 a 2', NULL, 4.50, 20, 42, NULL),
(1743, 'Codo Recto para Trampa 90° 1 1/2', NULL, 3.80, 20, 42, NULL),
(1744, 'Junta Universal para Trampas', NULL, 2.50, 20, 42, NULL),
(1745, 'Abrazadera Ajustable para Trampa', NULL, 1.80, 20, 42, NULL),
(1746, 'Cinta Teflón para Sellado (10m)', NULL, 3.00, 20, 42, NULL),
(1747, 'Valvula de Ingreso para Inodoro', NULL, 8.00, 20, 42, NULL),
(1748, 'Valvula de Ingreso para Inodoro Trevor', NULL, 12.00, 20, 42, NULL),
(1749, 'Valvula de Salida para Inodoro', NULL, 6.50, 20, 42, NULL),
(1750, 'Valvula de Descarga para Inodoro One Piece Trevor', NULL, 25.00, 20, 42, NULL),
(1751, 'Valvula de Descarga Dual para Inodoro', NULL, 18.00, 20, 42, NULL),
(1752, 'Accesorios tanque completo', NULL, 30.00, 20, 42, NULL),
(1753, 'Flotador para Tanque', NULL, 7.00, 20, 42, NULL),
(1754, 'Tubo de Descarga para Tanque', NULL, 5.00, 20, 42, NULL),
(1755, 'Acople con Pestaña 1 1/4', NULL, 5.00, 20, 42, NULL),
(1756, 'Acople con Pestaña 1 1/2', NULL, 5.00, 20, 42, NULL),
(1757, 'Acople con Embone 1 1/4', NULL, 5.00, 20, 42, NULL),
(1758, 'Acople con Embone 1 1/2', NULL, 5.00, 20, 42, NULL),
(1759, 'Angulo Galvanizado de 1 plg', NULL, 0.75, 18, 41, NULL),
(1760, 'Varilla de Soldar Punta azul x Unid', NULL, 0.70, 24, NULL, NULL),
(1761, 'Spray Negro Mate x Unid', NULL, 8.50, 6, 35, NULL),
(1762, 'Spray Negro Brillante x Unid', NULL, 8.50, 7, 35, NULL),
(1763, 'Spray Blanco Mate x Unid', NULL, 8.50, 8, 35, NULL),
(1764, 'Shampoo Amigo x Unid ', NULL, 3.50, 23, NULL, NULL),
(1785, 'Rejilla para Ducha de 2 plg x Unid', NULL, 6.50, 10, 29, NULL),
(1786, 'Registro de Sumidero de 2 plg x Unid', NULL, 6.50, 8, 29, NULL),
(1827, 'Tarugo de plastico 3/16 Rojo x 1/2 Doc', NULL, 1.20, 20, 37, NULL),
(1828, 'Tarugo de plastico 1/4 Verde x 1/2 Doc', NULL, 1.30, 20, 37, NULL),
(1829, 'Tarugo de plastico 3/8 Naranja x 1/2 Doc', NULL, 1.70, 19, 37, NULL),
(1830, 'Tarugo de plastico 1/2 Gris x 1/2 Doc', NULL, 2.30, 20, 37, NULL),
(1831, 'Tarugo de plastico 5/8 Plomo x 1/2 Doc', NULL, 2.80, 20, 37, NULL),
(1832, 'Tarugo de plastico 3/16 Rojo x Doc', NULL, 2.00, 18, 37, NULL),
(1833, 'Tarugo de plastico 1/4 Verde x Doc', NULL, 2.50, 18, 37, NULL),
(1834, 'Tarugo de plastico 3/8 Naranja x Doc', NULL, 3.50, 19, 37, NULL),
(1835, 'Tarugo de plastico 1/2 Gris x Doc', NULL, 4.50, 20, 37, NULL),
(1836, 'Tarugo de plastico 5/8 Plomo x Doc', NULL, 5.50, 20, 37, NULL),
(1837, 'Tarugo de madera 1/4 x 1/2 Doc', NULL, 1.00, 20, 37, NULL),
(1838, 'Tarugo de madera 5/16 x 1/2 Doc', NULL, 1.30, 20, 37, NULL),
(1839, 'Tarugo de madera 3/8 x 1/2 Doc', NULL, 1.60, 20, 37, NULL),
(1840, 'Tarugo de madera 1/2 x 1/2 Doc', NULL, 1.80, 20, 37, NULL),
(1841, 'Tarugo de madera 1/4 x Doc', NULL, 2.00, 20, 37, NULL),
(1842, 'Tarugo de madera 5/16 x Doc', NULL, 2.50, 20, 37, NULL),
(1843, 'Tarugo de madera 3/8 x Doc', NULL, 3.00, 20, 37, NULL),
(1844, 'Tarugo de madera 1/2 x Doc', NULL, 3.50, 20, 37, NULL),
(1845, 'Extension de 3 mt economica x Unid', NULL, 7.50, 4, 8, NULL),
(1846, 'Disco de metal de 7 x Unid', NULL, 9.50, 23, 26, NULL),
(1847, 'Bencina 1/2 Lt Losaro x Unid', NULL, 6.50, 4, 22, NULL),
(1848, 'Tachuela x Paq ', NULL, 2.50, 13, 43, NULL),
(1849, 'Foco Plano Redondo de 18 w x Unid', NULL, 10.00, 4, 7, NULL),
(1850, 'Hilo Nylon #45', NULL, 4.00, 4, NULL, NULL),
(1851, 'Spray Silicona para Tablero Fresa x Unid', NULL, 10.00, 2, 35, NULL),
(1852, 'Escoba economica x Unid', NULL, 8.50, 11, 44, NULL),
(1853, 'Recogedor con Soporte', NULL, 5.50, 10, 44, NULL),
(1854, 'Silicona SikaFlex Blanco ', NULL, 35.00, 1, NULL, NULL),
(1855, 'Silicona Kanauff Blanco', NULL, 14.50, 9, NULL, NULL),
(1856, 'Tubo de Abasto de tanque 7/8 x 1/2 x 50cm', NULL, 35.00, 1, 45, NULL),
(1857, 'Soda Caustica 1/2 Kg Kinguer', NULL, 9.50, 12, 22, NULL),
(1858, 'Soda Caustica 1 Kg Kinguer', NULL, 14.50, 2, 22, NULL),
(1859, 'Caño Galvanizado para Lavatorio', NULL, 14.50, 6, 34, NULL),
(1860, 'Caño de Bronce Pesado', NULL, 17.50, 5, 34, NULL),
(1861, 'Desatorador de Madera', NULL, 7.50, 5, 29, NULL),
(1862, 'Waype 1 Kg', NULL, 10.00, 10, NULL, NULL),
(1863, 'Waype de 1/2 Kg', NULL, 5.00, 10, NULL, NULL),
(1864, 'Waype de 1/4 Kg', NULL, 2.50, 9, NULL, NULL),
(1865, 'Escoba Chinita', NULL, 11.00, 4, 44, NULL),
(1866, 'Escoba Italiana', NULL, 13.00, 6, 44, NULL),
(1867, 'Escoba Bambino', NULL, 10.00, 6, 44, NULL),
(1868, 'Recogedor simple', NULL, 4.50, 4, 44, NULL),
(1869, 'Clavo de Madera de 3/4 x Paq', NULL, 2.00, 19, 43, NULL),
(1870, 'Clavo de Madera de 1 x Paq', NULL, 2.00, 20, 43, NULL),
(1871, 'Clavo de Madera de 1 1/2 c/c x Paq', NULL, 2.00, 6, 43, NULL),
(1872, 'Super Blue', NULL, 1.00, 35, NULL, NULL),
(1873, 'Soldimix 10 Min x Unid', NULL, 12.00, 3, 32, NULL),
(1874, 'Moldimix Epoxico x Unid', NULL, 9.50, 6, NULL, NULL),
(1875, 'Soldimix Extrafuerte x Unid', NULL, 12.50, 6, 32, NULL),
(1876, 'Perno Milimetrico 1/4 x 1 x Unid', NULL, 0.80, 42, 24, NULL),
(1877, 'Arandela de 1/4 x Unid', NULL, 0.20, 39, 24, NULL),
(1892, 'Clavo cemento 1\" x Unid', NULL, 0.20, 100, 43, NULL),
(1893, 'Clavo cemento 1 1/2\" x Unid', NULL, 0.30, 100, 43, NULL),
(1894, 'Clavo cemento 2\" x Unid', NULL, 0.50, 100, 43, NULL),
(1895, 'Clavo cemento 2 1/2\" x Unid', NULL, 0.60, 65, 43, NULL),
(1896, 'Clavo cemento 3\" x Unid', NULL, 0.70, 80, 43, NULL),
(1897, 'Clavo cemento 3 1/2\" x Unid', NULL, 0.90, 50, 43, NULL),
(1898, 'Clavo cemento 4\" x Unid', NULL, 1.00, 40, 43, NULL),
(1899, 'Clavo cemento 1\" x Unid', NULL, 0.20, 100, 43, NULL),
(1900, 'Clavo cemento 1 1/2\" x Unid', NULL, 0.30, 100, 43, NULL),
(1901, 'Clavo cemento 2\" x Unid', NULL, 0.50, 100, 43, NULL),
(1902, 'Clavo cemento 2 1/2\" x Unid', NULL, 0.60, 80, 43, NULL),
(1903, 'Clavo cemento 3\" x Unid', NULL, 0.70, 80, 43, NULL),
(1904, 'Clavo cemento 3 1/2\" x Unid', NULL, 0.90, 50, 43, NULL),
(1905, 'Clavo cemento 4\" x Unid', NULL, 1.00, 50, 43, NULL),
(1906, 'Clavo cemento 1\" x Paq (100 Unid)', NULL, 14.00, 30, 43, NULL),
(1907, 'Clavo cemento 1 1/2\" x Paq (100 Unid)', NULL, 15.00, 30, 43, NULL),
(1908, 'Clavo cemento 2\" x Paq (100 Unid)', NULL, 15.50, 30, 43, NULL),
(1909, 'Clavo cemento 2 1/2\" x Paq (100 Unid)', NULL, 16.00, 20, 43, NULL),
(1910, 'Clavo cemento 3\" x Paq (100 Unid)', NULL, 17.00, 20, 43, NULL),
(1911, 'Clavo cemento 3 1/2\" x Paq (100 Unid)', NULL, 17.00, 15, 43, NULL),
(1912, 'Clavo cemento 4\" x Paq (100 Unid)', NULL, 17.00, 15, 43, NULL),
(1913, 'Tee de Bronce 1/2', NULL, 7.50, 5, 20, NULL),
(1914, 'Alambre Galbanizado #14 x 1/4 Kg', NULL, 9.00, 1, NULL, NULL),
(1915, 'Cerrojo de 1 1/2 plg x Unid', NULL, 2.50, 14, NULL, NULL),
(1916, 'Pegamento de Mayolica Derquin x 25 Kg', NULL, 25.00, 5, 32, NULL),
(1917, 'Ocre Rojo de 1 kg x Unid', NULL, 12.00, 9, NULL, NULL),
(1918, 'Ocre Amarillo de 1 kg x Unid', NULL, 12.00, 9, NULL, NULL),
(1919, 'Ocre Negro de 1 kg x Unid', NULL, 12.00, 10, NULL, NULL),
(1920, 'Perilla Acrilica ', NULL, 8.50, 10, 29, NULL),
(1921, 'Perilla Acrilica Marca', NULL, 15.00, 9, 29, NULL),
(1922, 'Desarmador Perillero Mediano', NULL, 6.50, 4, 25, NULL),
(1923, 'Vastago de Llave de Ducha', NULL, 10.00, 2, 34, NULL),
(1924, 'Tubo de Abasto 1/2 x 1/2 Metusa Lavatorio', NULL, 15.50, 9, NULL, NULL),
(1925, 'Pegatubo Azul chico', NULL, 3.50, 14, 32, NULL),
(1926, 'Cable Acerado para Cordel x Mt', NULL, 1.50, 50, 8, NULL),
(1927, 'Guantes Latex M x Par', NULL, 5.00, 3, 44, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_empresa` varchar(100) NOT NULL,
  `ruc` varchar(20) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre_empresa`, `ruc`, `telefono`, `direccion`) VALUES
(1000, 'Kinguer', '', '', ''),
(1001, '', '', '', ''),
(1002, '', '', '', ''),
(1003, 'Julian', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `fecha_venta` datetime DEFAULT current_timestamp(),
  `id_cliente` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `total_desc` decimal(10,2) NOT NULL,
  `total_desc_sd` decimal(10,2) NOT NULL,
  `total_igv` decimal(10,2) NOT NULL,
  `total_valor_venta` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `fecha_venta`, `id_cliente`, `id_empleado`, `total`, `total_desc`, `total_desc_sd`, `total_igv`, `total_valor_venta`, `metodo_pago`) VALUES
(1001, '2025-07-25 08:34:00', NULL, NULL, 2.50, 0.00, 2.50, 0.38, 2.12, 'Efectivo'),
(1002, '2025-07-25 08:35:00', NULL, NULL, 5.00, 0.00, 5.00, 0.76, 4.24, 'Efectivo'),
(1003, '2025-07-25 08:35:00', NULL, NULL, 8.50, 0.00, 8.50, 1.30, 7.20, 'Efectivo'),
(1004, '2025-07-25 08:35:00', NULL, NULL, 3.50, 0.00, 3.50, 0.53, 2.97, 'Efectivo'),
(1007, '2025-07-25 08:47:00', NULL, NULL, 8.00, 0.00, 8.00, 1.22, 6.78, 'Yape'),
(1008, '2025-07-25 08:47:00', NULL, NULL, 8.50, 0.00, 8.50, 1.30, 7.20, 'Yape'),
(1009, '2025-07-25 08:49:00', NULL, NULL, 6.00, 0.00, 6.00, 0.92, 5.08, 'Efectivo'),
(1010, '2025-07-25 08:50:00', NULL, NULL, 3.50, 0.00, 3.50, 0.53, 2.97, 'Efectivo'),
(1011, '2025-07-25 08:53:00', NULL, NULL, 3.00, 0.00, 3.00, 0.46, 2.54, 'Efectivo'),
(1012, '2025-07-25 08:54:00', NULL, NULL, 3.50, 0.00, 3.50, 0.53, 2.97, 'Efectivo'),
(1013, '2025-07-25 08:54:00', NULL, NULL, 2.50, 0.00, 2.50, 0.38, 2.12, 'Efectivo'),
(1014, '2025-07-25 08:57:00', NULL, NULL, 8.50, 0.00, 8.50, 1.30, 7.20, 'Efectivo'),
(1015, '2025-07-25 09:04:00', NULL, NULL, 3.50, 0.00, 3.50, 0.53, 2.97, 'Yape'),
(1016, '2025-07-25 09:09:00', NULL, NULL, 12.00, 0.00, 12.00, 1.83, 10.17, 'Efectivo'),
(1017, '2025-07-25 09:12:00', NULL, NULL, 3.00, 0.00, 3.00, 0.46, 2.54, 'Yape'),
(1018, '2025-07-25 09:23:00', NULL, NULL, 32.50, 0.00, 32.50, 4.96, 27.54, 'Yape'),
(1019, '2025-07-25 09:26:00', NULL, NULL, 10.00, 0.00, 10.00, 1.53, 8.47, 'Efectivo'),
(1020, '2025-07-25 09:46:00', NULL, NULL, 25.00, 0.00, 25.00, 3.81, 21.19, 'Yape'),
(1021, '2025-07-25 10:30:00', NULL, NULL, 20.00, 0.00, 20.00, 3.05, 16.95, 'Efectivo'),
(1022, '2025-07-25 10:37:00', NULL, NULL, 1.50, 0.00, 1.50, 0.23, 1.27, 'Efectivo'),
(1023, '2025-07-25 10:39:00', NULL, NULL, 35.00, 0.00, 35.00, 5.34, 29.66, 'Yape'),
(1024, '2025-07-25 10:40:00', NULL, NULL, 7.00, 0.00, 7.00, 1.07, 5.93, 'Yape'),
(1025, '2025-07-25 11:58:00', NULL, NULL, 19.53, 0.00, 19.53, 2.98, 16.55, 'Yape'),
(1026, '2025-07-25 12:14:00', NULL, NULL, 25.00, 0.00, 25.00, 3.81, 21.19, 'Efectivo'),
(1028, '2025-07-25 12:21:00', NULL, NULL, 3.80, 0.00, 3.80, 0.58, 3.22, 'Yape'),
(1029, '2025-07-25 12:26:00', NULL, NULL, 7.50, 0.00, 7.50, 1.14, 6.36, 'Efectivo'),
(1030, '2025-07-26 13:09:00', NULL, NULL, 30.00, 0.50, 30.50, 4.58, 25.42, 'Yape'),
(1031, '2025-07-26 18:26:00', NULL, NULL, 11.50, 0.00, 11.50, 1.75, 9.75, 'Efectivo'),
(1032, '2025-07-26 18:27:00', NULL, NULL, 6.00, 0.00, 6.00, 0.92, 5.08, 'Efectivo'),
(1033, '2025-07-26 18:28:00', NULL, NULL, 5.00, 0.00, 5.00, 0.76, 4.24, 'Efectivo'),
(1034, '2025-07-26 18:46:00', NULL, NULL, 7.50, 0.00, 7.50, 1.14, 6.36, 'Efectivo'),
(1035, '2025-07-26 19:17:00', NULL, NULL, 24.50, 0.00, 24.50, 3.74, 20.76, 'Yape'),
(1036, '2025-07-26 19:21:00', NULL, NULL, 5.60, 0.00, 5.60, 0.85, 4.75, 'Efectivo'),
(1037, '2025-07-26 19:25:00', NULL, NULL, 12.00, 0.00, 12.00, 1.83, 10.17, 'Efectivo'),
(1038, '2025-07-26 19:25:00', NULL, NULL, 5.50, 0.00, 5.50, 0.84, 4.66, 'Efectivo'),
(1039, '2025-07-26 19:56:00', NULL, NULL, 26.50, 0.20, 26.70, 4.04, 22.46, 'Yape'),
(1040, '2025-07-26 19:57:00', NULL, NULL, 8.50, 0.00, 8.50, 1.30, 7.20, 'Yape'),
(1041, '2025-07-26 19:58:00', NULL, NULL, 7.50, 0.00, 7.50, 1.14, 6.36, 'Yape'),
(1042, '2025-07-26 20:00:00', NULL, NULL, 9.50, 0.00, 9.50, 1.45, 8.05, 'Efectivo'),
(1043, '2025-07-26 20:01:00', NULL, NULL, 6.50, 0.00, 6.50, 0.99, 5.51, 'Plin'),
(1044, '2025-07-26 20:04:00', NULL, NULL, 5.00, 0.00, 5.00, 0.76, 4.24, 'Efectivo'),
(1045, '2025-07-26 20:04:00', NULL, NULL, 29.50, 0.00, 29.50, 4.50, 25.00, 'Efectivo'),
(1046, '2025-07-26 20:06:00', NULL, NULL, 20.00, 0.00, 20.00, 3.05, 16.95, 'Yape'),
(1047, '2025-07-26 20:07:00', NULL, NULL, 4.00, 0.00, 4.00, 0.61, 3.39, 'Yape'),
(1048, '2025-07-26 20:08:00', NULL, NULL, 10.00, 0.00, 10.00, 1.53, 8.47, 'Efectivo'),
(1049, '2025-07-26 20:10:00', NULL, NULL, 14.00, 0.00, 14.00, 2.14, 11.86, 'Efectivo'),
(1050, '2025-07-26 20:14:00', NULL, NULL, 29.50, 0.00, 29.50, 4.50, 25.00, 'Efectivo'),
(1051, '2025-07-26 20:14:00', NULL, NULL, 10.00, 0.00, 10.00, 1.53, 8.47, 'Efectivo'),
(1052, '2025-07-31 15:22:00', NULL, NULL, 7.50, 0.00, 7.50, 1.14, 6.36, 'Yape'),
(1053, '2025-07-31 15:22:00', NULL, NULL, 5.00, 0.00, 5.00, 0.76, 4.24, 'Efectivo'),
(1055, '2025-07-31 15:51:00', NULL, NULL, 35.00, 0.00, 35.00, 5.34, 29.66, 'Yape'),
(1056, '2025-07-31 15:53:00', NULL, NULL, 14.50, 0.00, 14.50, 2.21, 12.29, 'Yape'),
(1057, '2025-07-31 15:56:00', NULL, NULL, 6.50, 0.00, 6.50, 0.99, 5.51, 'Yape'),
(1058, '2025-07-31 15:58:00', NULL, NULL, 35.00, 0.00, 35.00, 5.34, 29.66, 'Efectivo'),
(1059, '2025-07-31 16:03:00', NULL, NULL, 13.30, 0.00, 13.30, 2.03, 11.27, 'Efectivo'),
(1060, '2025-07-31 16:18:00', NULL, NULL, 17.50, 0.00, 17.50, 2.67, 14.83, 'Yape'),
(1061, '2025-07-31 16:22:00', NULL, NULL, 9.00, 0.00, 9.00, 1.37, 7.63, 'Efectivo'),
(1062, '2025-07-31 16:24:00', NULL, NULL, 17.90, 0.00, 17.90, 2.73, 15.17, 'Efectivo'),
(1063, '2025-07-31 16:25:00', NULL, NULL, 6.00, 0.50, 6.50, 0.92, 5.08, 'Yape'),
(1064, '2025-07-31 16:27:00', NULL, NULL, 7.00, 0.50, 7.50, 1.07, 5.93, 'Yape'),
(1065, '2025-07-31 16:28:00', NULL, NULL, 35.00, 0.00, 35.00, 5.34, 29.66, 'Yape'),
(1066, '2025-07-31 16:29:00', NULL, NULL, 8.50, 0.00, 8.50, 1.30, 7.20, 'Efectivo'),
(1067, '2025-07-31 16:29:00', NULL, NULL, 6.30, 0.00, 6.30, 0.96, 5.34, 'Efectivo'),
(1068, '2025-07-31 16:40:00', NULL, NULL, 7.50, 1.50, 9.00, 1.14, 6.36, 'Efectivo'),
(1069, '2025-07-31 16:44:00', NULL, NULL, 21.00, 0.00, 21.00, 3.20, 17.80, 'Efectivo'),
(1070, '2025-07-31 16:50:00', NULL, NULL, 2.00, 0.00, 2.00, 0.31, 1.69, 'Yape'),
(1071, '2025-07-31 16:51:00', NULL, NULL, 1.00, 0.00, 1.00, 0.15, 0.85, 'Yape'),
(1072, '2025-07-31 17:00:00', NULL, NULL, 12.00, 0.00, 12.00, 1.83, 10.17, 'Efectivo'),
(1073, '2025-07-31 17:01:00', NULL, NULL, 17.00, 0.00, 17.00, 2.59, 14.41, 'Efectivo'),
(1074, '2025-08-01 17:25:00', NULL, NULL, 8.60, 0.00, 8.60, 1.31, 7.29, 'Efectivo'),
(1075, '2025-08-01 17:26:00', NULL, NULL, 27.00, 0.00, 27.00, 4.12, 22.88, 'Yape'),
(1076, '2025-08-01 17:27:00', NULL, NULL, 2.40, 0.00, 2.40, 0.37, 2.03, 'Efectivo'),
(1077, '2025-08-01 19:24:00', NULL, NULL, 18.00, 1.00, 19.00, 2.75, 15.25, 'Yape'),
(1078, '2025-08-01 19:25:00', NULL, NULL, 11.00, 0.00, 11.00, 1.68, 9.32, 'Yape'),
(1079, '2025-08-01 19:26:00', NULL, NULL, 5.00, 0.00, 5.00, 0.76, 4.24, 'Yape'),
(1080, '2025-08-01 19:26:00', NULL, NULL, 6.50, 0.00, 6.50, 0.99, 5.51, 'Yape'),
(1081, '2025-08-01 19:29:00', NULL, NULL, 12.00, 0.00, 12.00, 1.83, 10.17, 'Yape'),
(1082, '2025-08-01 19:30:00', NULL, NULL, 8.50, 0.00, 8.50, 1.30, 7.20, 'Efectivo'),
(1083, '2025-08-01 19:30:00', NULL, NULL, 3.50, 0.00, 3.50, 0.53, 2.97, 'Efectivo'),
(1084, '2025-08-01 19:35:00', NULL, NULL, 15.50, 0.50, 16.00, 2.36, 13.14, 'Efectivo'),
(1085, '2025-08-01 19:36:00', NULL, NULL, 25.00, 0.00, 25.00, 3.81, 21.19, 'Efectivo'),
(1086, '2025-08-01 19:39:00', NULL, NULL, 24.00, 0.00, 24.00, 3.66, 20.34, 'Yape'),
(1087, '2025-08-01 19:49:00', NULL, NULL, 58.00, 2.50, 60.50, 8.85, 49.15, 'Yape'),
(1088, '2025-08-01 19:52:00', NULL, NULL, 20.50, 0.00, 20.50, 3.13, 17.37, 'Efectivo'),
(1089, '2025-08-01 19:53:00', NULL, NULL, 13.50, 0.00, 13.50, 2.06, 11.44, 'Efectivo'),
(1090, '2025-08-01 19:53:00', NULL, NULL, 25.00, 0.00, 25.00, 3.81, 21.19, 'Yape'),
(1091, '2025-08-01 19:54:00', NULL, NULL, 2.50, 0.00, 2.50, 0.38, 2.12, 'Efectivo'),
(1092, '2025-08-01 20:02:00', NULL, NULL, 8.50, 0.00, 8.50, 1.30, 7.20, 'Efectivo'),
(1093, '2025-08-01 20:03:00', NULL, NULL, 13.00, 0.80, 13.80, 1.98, 11.02, 'Yape'),
(1094, '2025-08-01 20:04:00', NULL, NULL, 25.50, 0.00, 25.50, 3.89, 21.61, 'Efectivo'),
(1095, '2025-08-01 20:08:00', NULL, NULL, 40.50, 0.00, 40.50, 6.18, 34.32, 'Efectivo'),
(1096, '2025-08-01 20:16:00', NULL, NULL, 6.00, 0.00, 6.00, 0.92, 5.08, 'Yape'),
(1098, '2025-08-02 11:34:00', NULL, NULL, 23.00, 0.00, 23.00, 3.51, 19.49, 'Efectivo'),
(1099, '2025-08-02 11:43:00', NULL, NULL, 0.60, 0.00, 0.60, 0.09, 0.51, 'Efectivo'),
(1100, '2025-08-02 11:44:00', NULL, NULL, 0.30, 0.00, 0.30, 0.05, 0.25, 'Efectivo');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_balance_diario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_balance_diario` (
`fecha_balance` date
,`total_efectivo` decimal(32,2)
,`total_yape` decimal(32,2)
,`total_plin` decimal(32,2)
,`total_tarjeta` decimal(32,2)
,`venta_total` decimal(32,2)
,`total_gastos` double
,`total_con_gastos` double
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_balance_diario`
--
DROP TABLE IF EXISTS `vista_balance_diario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_balance_diario`  AS SELECT cast(`v`.`fecha_venta` as date) AS `fecha_balance`, sum(case when `v`.`metodo_pago` = 'Efectivo' then `v`.`total` else 0 end) AS `total_efectivo`, sum(case when `v`.`metodo_pago` = 'Yape' then `v`.`total` else 0 end) AS `total_yape`, sum(case when `v`.`metodo_pago` = 'Plin' then `v`.`total` else 0 end) AS `total_plin`, sum(case when `v`.`metodo_pago` = 'Tarjeta' then `v`.`total` else 0 end) AS `total_tarjeta`, sum(`v`.`total`) AS `venta_total`, coalesce((select sum(`g`.`cantidad`) from `gastos` `g` where cast(`g`.`fecha` as date) = cast(`v`.`fecha_venta` as date)),0) AS `total_gastos`, sum(case when `v`.`metodo_pago` = 'Efectivo' then `v`.`total` else 0 end) - coalesce((select sum(`g`.`cantidad`) from `gastos` `g` where cast(`g`.`fecha` as date) = cast(`v`.`fecha_venta` as date)),0) AS `total_con_gastos` FROM `ventas` AS `v` GROUP BY cast(`v`.`fecha_venta` as date) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `balance_diario`
--
ALTER TABLE `balance_diario`
  ADD PRIMARY KEY (`id_balance`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`id_gastos`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `balance_diario`
--
ALTER TABLE `balance_diario`
  MODIFY `id_balance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1017;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1074;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1101;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1151;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id_gastos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1028;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1928;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1101;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`),
  ADD CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
