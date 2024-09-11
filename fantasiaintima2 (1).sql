-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-09-2024 a las 00:35:57
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fantasiaintima2`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarcategoria` (IN `id_categoria` INT(11), IN `NombreCategoria` VARCHAR(80))   BEGIN
UPDATE categoria set NombreCategoria=NombreCategoria WHERE IdCategoria=id_categoria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarsubcategoria` (IN `id_subcategoria` INT, IN `NombresubCategoria` VARCHAR(45))   BEGIN
UPDATE subcategoria set NombresubCategoria=NombresubCategoria WHERE IdSubCategoria=id_subcategoria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarcategoria` (IN `id_categoria` INT(11))   BEGIN
DELETE FROM categoria WHERE IdCategoria=id_categoria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarsubcategoria` (IN `id_subcategoria` INT(11))   BEGIN
DELETE FROM subcategoria WHERE id_subcategoria=id_subcategoria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarcategoria` (IN `id_categoria` INT)   BEGIN

SELECT * FROM categoria WHERE IdCategoria=id_categoria;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarsubcategoria` (IN `id_subcategoria` INT)   BEGIN

SELECT * FROM subcategoria WHERE id_subcategoria=id_subcategoria;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarcategorias` (IN `NombreCategoria` VARCHAR(80))   BEGIN
INSERT INTO categoria(NombreCategoria) VALUES (NombreCategoria);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarsubcategorias` (IN `NombresubCategoria` VARCHAR(45))   BEGIN
INSERT INTO subcategoria(NombresubCategoria) VALUES (NombresubCategoria);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadocategorias` ()   BEGIN
SELECT * FROM categoria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadosubcategorias` ()   BEGIN
SELECT * FROM subcategoria;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE `calificacion` (
  `IdCalificacion` int NOT NULL,
  `Calificacion` int NOT NULL,
  `IdProducto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `IdCategoria` int NOT NULL,
  `NombreCategoria` varchar(80) COLLATE utf8mb3_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`IdCategoria`, `NombreCategoria`) VALUES
(1, 'Juguetes sexual'),
(2, 'Lenceria'),
(13, 'dildos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentabancaria`
--

CREATE TABLE `cuentabancaria` (
  `IdCuentaBancaria` int NOT NULL,
  `TipoCuenta` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `NumeroCuenta` int NOT NULL,
  `MontoTransaccion` int NOT NULL,
  `NombreUsuario` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `TipoDocumento` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `NumeroDocumento` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devolucion`
--

CREATE TABLE `devolucion` (
  `IdDevolucion` int NOT NULL,
  `CodigoPedido` int NOT NULL,
  `CantidadProductosDevueltos` int NOT NULL,
  `NombreProductosDevolver` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `DescripcionDevolucion` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `FechaDevolucion` date NOT NULL,
  `IdPedidoxProducto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domiciliario`
--

CREATE TABLE `domiciliario` (
  `IdDomiciliario` int NOT NULL,
  `TipoDocumento` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `Documento` int NOT NULL,
  `NombreDomiciliario` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `PrimerApellido` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `SegundoApellido` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `Celular` int NOT NULL,
  `HorarioDisponibilidad` datetime(4) NOT NULL,
  `Ciudad` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formaentrega`
--

CREATE TABLE `formaentrega` (
  `IdFormaEntrega` int NOT NULL,
  `NombreCliente` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `Direccion` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `FechaEnrega` date NOT NULL,
  `IdDomiciliario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodopago`
--

CREATE TABLE `metodopago` (
  `IdMetodoPago` int NOT NULL,
  `FormaPago` varchar(60) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `IdCuentaBancaria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `IdPedido` int NOT NULL,
  `CodigoPedido` int NOT NULL,
  `FechaCompra` datetime NOT NULL,
  `CantidadProducto` int NOT NULL,
  `NombreProducto` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `NombreCliente` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `PrecioTotal` float NOT NULL,
  `MetodoDePago` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `PrecioProductos` float NOT NULL,
  `DescripcionProducto` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `Imagen` text COLLATE utf8mb3_spanish2_ci NOT NULL,
  `PrecioEnvio` float NOT NULL,
  `TipoDocumento` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `Direccion` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `NumeroDocumento` int NOT NULL,
  `NumeroCelular` int NOT NULL,
  `IdDomiciliario` int NOT NULL,
  `IdUsuario` int NOT NULL,
  `IdCuentaBancaria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidoxproducto`
--

CREATE TABLE `pedidoxproducto` (
  `IdProducto` int NOT NULL,
  `IdPedido` int NOT NULL,
  `IdPedidoxProducto` int NOT NULL,
  `Cantidad` int NOT NULL,
  `Total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `IdProducto` int NOT NULL,
  `Img` text COLLATE utf8mb3_spanish2_ci NOT NULL,
  `Nombre` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `Descripcion` varchar(255) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `Cantidad` int NOT NULL,
  `Precio` float NOT NULL,
  `FechaVence` date NOT NULL,
  `IdCategoria*` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recuperarcontraseña`
--

CREATE TABLE `recuperarcontraseña` (
  `IdRecuperarContraseña` int NOT NULL,
  `CodigoVerificacion` int NOT NULL,
  `NuevaContraseña` varchar(50) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `ConfirmacionContraseña` varchar(50) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `IdUsuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `IdRol` int NOT NULL,
  `TipoRol` varchar(30) COLLATE utf8mb3_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`IdRol`, `TipoRol`) VALUES
(2, 'Admin'),
(3, 'Usuario'),
(4, 'Domiciliario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria`
--

CREATE TABLE `subcategoria` (
  `IdSubCategoria` int NOT NULL,
  `NombreSubCategoria` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `IdCategoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IdUsuario` int NOT NULL,
  `PrimerNombre` varchar(255) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `OtrosNombres` varchar(255) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `PrimerApellido` varchar(255) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `SegundoApellido` varchar(255) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `Correo` varchar(255) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `NombreUsuario` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `Contraseña` varchar(50) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `idRol` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IdUsuario`, `PrimerNombre`, `OtrosNombres`, `PrimerApellido`, `SegundoApellido`, `Correo`, `NombreUsuario`, `Contraseña`, `idRol`) VALUES
(1, 'Isabel', 'Cristina', 'Legarda', 'Ciro', 'isisi@gmail.com', 'Isa', '1267j', 2),
(2, 'Tom', '', 'Torres', 'Gomez', 'tom@gmail.com', 'tom', '68hy', 3),
(3, 'Harumi', '', 'Torres', 'Lopez', 'harumi@gmail.com', 'Haru', 'rtyui97', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`IdCalificacion`),
  ADD KEY `fk_Calificacion_Productos1_idx` (`IdProducto`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`IdCategoria`);

--
-- Indices de la tabla `cuentabancaria`
--
ALTER TABLE `cuentabancaria`
  ADD PRIMARY KEY (`IdCuentaBancaria`);

--
-- Indices de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD PRIMARY KEY (`IdDevolucion`),
  ADD KEY `fk_Devolucion_PEDIDOXPRODUCTO1_idx` (`IdPedidoxProducto`);

--
-- Indices de la tabla `domiciliario`
--
ALTER TABLE `domiciliario`
  ADD PRIMARY KEY (`IdDomiciliario`);

--
-- Indices de la tabla `formaentrega`
--
ALTER TABLE `formaentrega`
  ADD PRIMARY KEY (`IdFormaEntrega`),
  ADD KEY `fk_FormaEntrega_Domicilio1_idx` (`IdDomiciliario`);

--
-- Indices de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  ADD PRIMARY KEY (`IdMetodoPago`),
  ADD KEY `fk_MetodoPago_CuentaBancaria1_idx` (`IdCuentaBancaria`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`IdPedido`),
  ADD KEY `fk_pedido_Domicilio1_idx` (`IdDomiciliario`),
  ADD KEY `fk_pedido_Usuario1_idx` (`IdUsuario`),
  ADD KEY `fk_Pedido_CuentaBancaria1_idx` (`IdCuentaBancaria`);

--
-- Indices de la tabla `pedidoxproducto`
--
ALTER TABLE `pedidoxproducto`
  ADD PRIMARY KEY (`IdPedidoxProducto`),
  ADD KEY `fk_PEDIDOXPRODUCTO_Productos1_idx` (`IdProducto`),
  ADD KEY `fk_PEDIDOXPRODUCTO_pedido1_idx` (`IdPedido`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`IdProducto`),
  ADD UNIQUE KEY `TipoCategoria*_UNIQUE` (`IdCategoria*`),
  ADD KEY `fk_Productos_Categoria1_idx` (`IdCategoria*`);

--
-- Indices de la tabla `recuperarcontraseña`
--
ALTER TABLE `recuperarcontraseña`
  ADD PRIMARY KEY (`IdRecuperarContraseña`),
  ADD KEY `fk_RecuperarContraseña_Usuario1_idx` (`IdUsuario`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`IdRol`);

--
-- Indices de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD PRIMARY KEY (`IdSubCategoria`),
  ADD KEY `fk_SubCategoria_Categoria1_idx` (`IdCategoria`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IdUsuario`),
  ADD UNIQUE KEY `correo_UNIQUE` (`Correo`),
  ADD UNIQUE KEY `NombreUsuario_UNIQUE` (`NombreUsuario`),
  ADD UNIQUE KEY `Contraseña_UNIQUE` (`Contraseña`),
  ADD KEY `fk_usuario_roles1_idx` (`idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `IdCalificacion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `IdCategoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `cuentabancaria`
--
ALTER TABLE `cuentabancaria`
  MODIFY `IdCuentaBancaria` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  MODIFY `IdDevolucion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `domiciliario`
--
ALTER TABLE `domiciliario`
  MODIFY `IdDomiciliario` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formaentrega`
--
ALTER TABLE `formaentrega`
  MODIFY `IdFormaEntrega` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  MODIFY `IdMetodoPago` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `IdPedido` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `IdProducto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recuperarcontraseña`
--
ALTER TABLE `recuperarcontraseña`
  MODIFY `IdRecuperarContraseña` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `IdRol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  MODIFY `IdSubCategoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IdUsuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD CONSTRAINT `fk_Calificacion_Productos1` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`);

--
-- Filtros para la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD CONSTRAINT `fk_Devolucion_PEDIDOXPRODUCTO1` FOREIGN KEY (`IdPedidoxProducto`) REFERENCES `pedidoxproducto` (`IdPedidoxProducto`);

--
-- Filtros para la tabla `formaentrega`
--
ALTER TABLE `formaentrega`
  ADD CONSTRAINT `fk_FormaEntrega_Domicilio1` FOREIGN KEY (`IdDomiciliario`) REFERENCES `domiciliario` (`IdDomiciliario`);

--
-- Filtros para la tabla `metodopago`
--
ALTER TABLE `metodopago`
  ADD CONSTRAINT `fk_MetodoPago_CuentaBancaria1` FOREIGN KEY (`IdCuentaBancaria`) REFERENCES `cuentabancaria` (`IdCuentaBancaria`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_Pedido_CuentaBancaria1` FOREIGN KEY (`IdCuentaBancaria`) REFERENCES `cuentabancaria` (`IdCuentaBancaria`),
  ADD CONSTRAINT `fk_pedido_Domicilio1` FOREIGN KEY (`IdDomiciliario`) REFERENCES `domiciliario` (`IdDomiciliario`),
  ADD CONSTRAINT `fk_pedido_Usuario1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`);

--
-- Filtros para la tabla `pedidoxproducto`
--
ALTER TABLE `pedidoxproducto`
  ADD CONSTRAINT `fk_PEDIDOXPRODUCTO_pedido1` FOREIGN KEY (`IdPedido`) REFERENCES `pedido` (`IdPedido`),
  ADD CONSTRAINT `fk_PEDIDOXPRODUCTO_Productos1` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_Productos_Categoria1` FOREIGN KEY (`IdCategoria*`) REFERENCES `categoria` (`IdCategoria`);

--
-- Filtros para la tabla `recuperarcontraseña`
--
ALTER TABLE `recuperarcontraseña`
  ADD CONSTRAINT `fk_RecuperarContraseña_Usuario1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`);

--
-- Filtros para la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD CONSTRAINT `fk_SubCategoria_Categoria1` FOREIGN KEY (`IdCategoria`) REFERENCES `categoria` (`IdCategoria`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_roles1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`IdRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
