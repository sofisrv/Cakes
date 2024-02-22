-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-02-2024 a las 02:04:12
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
-- Base de datos: `cakes`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Cantidad de chispas por pastel` (IN `pastel` VARCHAR(40))   SELECT reserved_sprinkles.cake as Pastel, COUNT(sprinkles.consumed) AS cantidad FROM reserved_sprinkles INNER JOIN sprinkles ON reserved_sprinkles.sprinkle = sprinkles.sprinkle WHERE sprinkles.consumed = 1 && reserved_sprinkles.cake = pastel$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Chispas de todos los pasteles` ()   SELECT reserved_sprinkles.cake, reserved_sprinkles.sprinkle, sprinkles.consumed, sprinkles.sprinkle AS cantidad FROM reserved_sprinkles INNER JOIN sprinkles ON reserved_sprinkles.sprinkle = sprinkles.sprinkle WHERE sprinkles.consumed = 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Pasteles con betun disponible` ()   select cakes.cake as PASTEL, cakes.icing as BETUN from cakes INNER JOIN icings ON icings.icing = cakes.icing WHERE icings.consumed = 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Pasteles con chispas disponibles` ()   SELECT reserved_sprinkles.cake AS pasteloncio, reserved_sprinkles.sprinkle AS chispita FROM reserved_sprinkles INNER JOIN sprinkles ON reserved_sprinkles.sprinkle = sprinkles.sprinkle WHERE sprinkles.consumed = 1$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cakes`
--

CREATE TABLE `cakes` (
  `c_cake` varchar(40) NOT NULL,
  `c_icing` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cakes`
--

INSERT INTO `cakes` (`c_cake`, `c_icing`) VALUES
('Chocolate Buttercream', 'Chocolate Buttercream'),
('Chocolate Fondant', 'Chocolate Fondant'),
('Chocolate Frosting', 'Chocolate Frosting'),
('Chocolate Ganache', 'Chocolate Ganache'),
('Cream cheese', 'Cream cheese'),
('Strawberry Buttercream', 'Strawberry Buttercream'),
('Strawberry Fondant', 'Strawberry Fondant'),
('Strawberry Frosting', 'Strawberry Frosting'),
('Strawberry Ganache', 'Strawberry Ganache'),
('Vanilla Buttercream', 'Vanilla Buttercream'),
('Vanilla Fondant', 'Vanilla Fondant'),
('Vanilla Frosting', 'Vanilla Fondant'),
('Vanilla Ganache', 'Vanilla Ganache');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `icings`
--

CREATE TABLE `icings` (
  `i_icing` varchar(30) NOT NULL,
  `i_consumed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `icings`
--

INSERT INTO `icings` (`i_icing`, `i_consumed`) VALUES
('Chocolate Buttercream', 1),
('Chocolate Fondant', 1),
('Chocolate Frosting', 1),
('Chocolate Ganache', 1),
('Cream cheese', 1),
('Strawberry Buttercream', 1),
('Strawberry Fondant', 1),
('Strawberry Frosting', 1),
('Strawberry Ganache', 1),
('Vanilla Buttercream', 1),
('Vanilla Fondant', 1),
('Vanilla Frosting', 1),
('Vanilla Ganache', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserved_sprinkles`
--

CREATE TABLE `reserved_sprinkles` (
  `cake` varchar(40) NOT NULL,
  `sprinkle` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserved_sprinkles`
--

INSERT INTO `reserved_sprinkles` (`cake`, `sprinkle`) VALUES
('Chocolate Buttercream', 'Black'),
('Chocolate Buttercream', 'Blue'),
('Chocolate Buttercream', 'Golden'),
('Chocolate Fondant', 'Golden'),
('Chocolate Fondant', 'Green'),
('Chocolate Fondant', 'Red'),
('Chocolate Frosting', 'Gray'),
('Chocolate Frosting', 'Purple'),
('Chocolate Ganache', 'Pink'),
('Chocolate Ganache', 'Green'),
('Chocolate Ganache', 'Red'),
('Chocolate Ganache', 'Green');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sprinkles`
--

CREATE TABLE `sprinkles` (
  `s_sprinkle` varchar(30) NOT NULL,
  `s_consumed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sprinkles`
--

INSERT INTO `sprinkles` (`s_sprinkle`, `s_consumed`) VALUES
('Black', 1),
('Blue', 1),
('Colorfull', 1),
('Golden', 1),
('Gray', 1),
('Green', 1),
('Pink', 1),
('Purple', 1),
('Red', 1),
('White', 1),
('Yellow', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cakes`
--
ALTER TABLE `cakes`
  ADD PRIMARY KEY (`c_cake`),
  ADD KEY `icing` (`c_icing`);

--
-- Indices de la tabla `icings`
--
ALTER TABLE `icings`
  ADD PRIMARY KEY (`i_icing`);

--
-- Indices de la tabla `reserved_sprinkles`
--
ALTER TABLE `reserved_sprinkles`
  ADD KEY `cake` (`cake`),
  ADD KEY `sprinkle` (`sprinkle`);

--
-- Indices de la tabla `sprinkles`
--
ALTER TABLE `sprinkles`
  ADD PRIMARY KEY (`s_sprinkle`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cakes`
--
ALTER TABLE `cakes`
  ADD CONSTRAINT `cakes_ibfk_1` FOREIGN KEY (`c_icing`) REFERENCES `icings` (`i_icing`) ON DELETE NO ACTION;

--
-- Filtros para la tabla `reserved_sprinkles`
--
ALTER TABLE `reserved_sprinkles`
  ADD CONSTRAINT `reserved_sprinkles_ibfk_1` FOREIGN KEY (`cake`) REFERENCES `cakes` (`c_cake`) ON DELETE NO ACTION,
  ADD CONSTRAINT `reserved_sprinkles_ibfk_2` FOREIGN KEY (`sprinkle`) REFERENCES `sprinkles` (`s_sprinkle`) ON DELETE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
