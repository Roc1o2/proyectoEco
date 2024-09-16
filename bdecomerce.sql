-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2024 a las 13:15:48
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdecomerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `IdAdministrador` int(11) NOT NULL,
  `IdUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almancen`
--

CREATE TABLE `almancen` (
  `id_almacen` int(50) NOT NULL,
  `cantidad` int(50) NOT NULL,
  `tipo_pro` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `stock` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artesano`
--

CREATE TABLE `artesano` (
  `IdArtesano` int(11) NOT NULL,
  `Longitud` decimal(10,0) DEFAULT NULL,
  `Latitud` decimal(10,0) DEFAULT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  `Tipo_producto` varchar(50) DEFAULT NULL,
  `Cantidad_producto` decimal(10,0) DEFAULT NULL,
  `Comentario` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `IdCliente` int(11) NOT NULL,
  `Longitud` decimal(10,0) DEFAULT NULL,
  `Latitud` decimal(10,0) DEFAULT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Apellido` varchar(255) DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  `Correo_Electronico` varchar(255) DEFAULT NULL,
  `Telefono` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`IdCliente`, `Longitud`, `Latitud`, `IdUsuario`, `Nombre`, `Apellido`, `Edad`, `Genero`, `Correo_Electronico`, `Telefono`) VALUES
(1, -68, -16, NULL, 'Esther', 'Valdivia', 35, 'Femenino', 'esther_134@gmall.com', '7896655'),
(2, -68, -16, NULL, 'Esther', 'soliz', 23, 'Femenino', 'esther_134@gmall.com', '7896655');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunidad`
--

CREATE TABLE `comunidad` (
  `id_comunidad` int(50) NOT NULL,
  `id_artesano` int(50) NOT NULL,
  `id_almacen` int(50) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `ubicacion` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delivery`
--

CREATE TABLE `delivery` (
  `Iddelivery` int(11) NOT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Apellido` varchar(255) DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  `Correo_ElectrÃ³nico` varchar(255) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `disponibilidad_horaria` datetime DEFAULT NULL,
  `turno` varchar(255) DEFAULT NULL,
  `dias_disponibles` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `delivery`
--

INSERT INTO `delivery` (`Iddelivery`, `IdUsuario`, `Nombre`, `Apellido`, `Edad`, `Genero`, `Correo_ElectrÃ³nico`, `Telefono`, `disponibilidad_horaria`, `turno`, `dias_disponibles`) VALUES
(2, NULL, 'sam', 'mamaniu', 22, 'masculino', 'ini@gmail.com', 123123, '2024-09-07 11:51:00', 'maÃ±ana', 'lunes-viernes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_inv` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_compra`
--

CREATE TABLE `orden_compra` (
  `id_or` int(11) NOT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `tipo` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `lugar` varchar(255) NOT NULL,
  `detalle` varchar(255) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `idcliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `orden_compra`
--

INSERT INTO `orden_compra` (`id_or`, `idproducto`, `tipo`, `nombre`, `fecha`, `hora`, `lugar`, `detalle`, `cantidad`, `estado`, `idcliente`) VALUES
(11, 2, 'tejidos', 'awuayo rosa', '0000-00-00', '07:20:00', 'La Paz', ' awuayo color rosa con diseños tejidos', 1, 'pendiente', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_pro` int(50) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(400) NOT NULL,
  `cantidad` int(200) NOT NULL,
  `idArtesano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_pro`, `nombre`, `descripcion`, `cantidad`, `idArtesano`) VALUES
(1, 'Awuayo rosa', 'tejido a mano', 5, 0),
(2, 'Awuayo flores', 'tejido a mano', 4, 0),
(3, 'Runa flor', 'RaciÃ³n Seca ', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicidad`
--

CREATE TABLE `publicidad` (
  `IdEvento` int(11) NOT NULL,
  `Imagen` varchar(255) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Fecha` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `Lugar` varchar(255) NOT NULL,
  `Detalle` varchar(255) NOT NULL,
  `IdAdministrador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `publicidad`
--

INSERT INTO `publicidad` (`IdEvento`, `Imagen`, `Titulo`, `Fecha`, `fecha_fin`, `Lugar`, `Detalle`, `IdAdministrador`) VALUES
(2, 'produto-1', 'promocion', '2024-09-07', '2024-09-21', 'La Paz', 'Durado ', NULL),
(5, 'producto-2', 'promocion', '2024-09-15', '2024-10-15', 'Cochabamba', 'productos al 50%', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reseña`
--

CREATE TABLE `reseña` (
  `id_reseña` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `texto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IdUsuario` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Paterno` varchar(30) DEFAULT NULL,
  `Materno` varchar(30) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`IdAdministrador`);

--
-- Indices de la tabla `almancen`
--
ALTER TABLE `almancen`
  ADD PRIMARY KEY (`id_almacen`);

--
-- Indices de la tabla `artesano`
--
ALTER TABLE `artesano`
  ADD PRIMARY KEY (`IdArtesano`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`IdCliente`);

--
-- Indices de la tabla `comunidad`
--
ALTER TABLE `comunidad`
  ADD PRIMARY KEY (`id_comunidad`);

--
-- Indices de la tabla `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`Iddelivery`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inv`);

--
-- Indices de la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  ADD PRIMARY KEY (`id_or`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_pro`);

--
-- Indices de la tabla `publicidad`
--
ALTER TABLE `publicidad`
  ADD PRIMARY KEY (`IdEvento`);

--
-- Indices de la tabla `reseña`
--
ALTER TABLE `reseña`
  ADD PRIMARY KEY (`id_reseña`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IdUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almancen`
--
ALTER TABLE `almancen`
  MODIFY `id_almacen` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comunidad`
--
ALTER TABLE `comunidad`
  MODIFY `id_comunidad` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inv` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `publicidad`
--
ALTER TABLE `publicidad`
  MODIFY `IdEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `reseña`
--
ALTER TABLE `reseña`
  MODIFY `id_reseña` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
