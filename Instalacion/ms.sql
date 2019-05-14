-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-05-2019 a las 20:15:52
-- Versión del servidor: 10.1.39-MariaDB
-- Versión de PHP: 7.3.5

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
SELECT wse_id, wse_key, wse_value FROM tm_wse_web_settings;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_acc_access`
--

CREATE TABLE `tm_acc_access` (
  `acc_id` int(11) NOT NULL,
  `acc_key` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_aud_audit`
--

CREATE TABLE `tm_aud_audit` (
  `aud_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `aud_date` datetime NOT NULL,
  `aud_action` smallint(6) NOT NULL,
  `aud_table` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_ctx_contenttex`
--

CREATE TABLE `tm_ctx_contenttex` (
  `ctx_id` int(11) NOT NULL,
  `ctx_key` varchar(200) NOT NULL,
  `ctx_value` varchar(200) NOT NULL,
  `pro_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_dau_detailaudit`
--

CREATE TABLE `tm_dau_detailaudit` (
  `dau_id` int(11) NOT NULL,
  `aud_id` int(11) NOT NULL,
  `dau_column` varchar(50) NOT NULL,
  `dau_before` varchar(100) NOT NULL,
  `dau_after` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Estructura de tabla para la tabla `tm_lde_languajedetail`
--

CREATE TABLE `tm_lde_languajedetail` (
  `lan_id` int(11) NOT NULL,
  `lde_key` varchar(40) NOT NULL,
  `lde_value` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_pac_profileaccess`
--

CREATE TABLE `tm_pac_profileaccess` (
  `pro_id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_pro_profile`
--

CREATE TABLE `tm_pro_profile` (
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `wse_key` varchar(200) COLLATE utf32_spanish_ci NOT NULL,
  `wse_value` varchar(200) COLLATE utf32_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `tm_wse_web_settings`
--

INSERT INTO `tm_wse_web_settings` (`wse_id`, `wse_key`, `wse_value`) VALUES
(0, 'Template', 'Vitality');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tm_acc_access`
--
ALTER TABLE `tm_acc_access`
  ADD PRIMARY KEY (`acc_id`);

--
-- Indices de la tabla `tm_aud_audit`
--
ALTER TABLE `tm_aud_audit`
  ADD PRIMARY KEY (`aud_id`);

--
-- Indices de la tabla `tm_ctx_contenttex`
--
ALTER TABLE `tm_ctx_contenttex`
  ADD PRIMARY KEY (`ctx_id`);

--
-- Indices de la tabla `tm_dau_detailaudit`
--
ALTER TABLE `tm_dau_detailaudit`
  ADD PRIMARY KEY (`dau_id`);

--
-- Indices de la tabla `tm_lan_languaje`
--
ALTER TABLE `tm_lan_languaje`
  ADD PRIMARY KEY (`lan_ID`);

--
-- Indices de la tabla `tm_pro_profile`
--
ALTER TABLE `tm_pro_profile`
  ADD PRIMARY KEY (`pro_id`);

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
