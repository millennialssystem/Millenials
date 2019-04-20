-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-04-2019 a las 23:22:00
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ms`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetWebSettings` ()  BEGIN
SELECT wse_id, wse_name, wse_value FROM tm_wse_web_settings;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_lan_languaje`
--

CREATE TABLE `tm_lan_languaje` (
  `lan_ID` int(11) NOT NULL,
  `lan_Name` varchar(50) COLLATE utf32_spanish_ci NOT NULL,
  `lan_NameExtern` varchar(50) COLLATE utf32_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `tm_lan_languaje`
--

INSERT INTO `tm_lan_languaje` (`lan_ID`, `lan_Name`, `lan_NameExtern`) VALUES
(0, 'Englis', 'Ingles'),
(1, 'Espanol', 'espanol');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_usr_user`
--

CREATE TABLE `tm_usr_user` (
  `usr_ID` int(11) NOT NULL,
  `usr_Name` varchar(20) COLLATE utf32_spanish_ci NOT NULL,
  `usr_Email` varchar(30) COLLATE utf32_spanish_ci NOT NULL,
  `usr_Nameperson` varchar(30) COLLATE utf32_spanish_ci NOT NULL,
  `usr_Birthday` date NOT NULL,
  `lan_ID` int(11) NOT NULL,
  `pro_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_wse_web_settings`
--

CREATE TABLE `tm_wse_web_settings` (
  `wse_id` int(11) NOT NULL,
  `wse_name` varchar(200) COLLATE utf32_spanish_ci NOT NULL,
  `wse_value` varchar(200) COLLATE utf32_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `tm_wse_web_settings`
--

INSERT INTO `tm_wse_web_settings` (`wse_id`, `wse_name`, `wse_value`) VALUES
(0, 'Template', 'Vitality');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tm_lan_languaje`
--
ALTER TABLE `tm_lan_languaje`
  ADD PRIMARY KEY (`lan_ID`);

--
-- Indices de la tabla `tm_usr_user`
--
ALTER TABLE `tm_usr_user`
  ADD PRIMARY KEY (`usr_ID`);

--
-- Indices de la tabla `tm_wse_web_settings`
--
ALTER TABLE `tm_wse_web_settings`
  ADD PRIMARY KEY (`wse_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
