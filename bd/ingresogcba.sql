-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-08-2019 a las 08:50:31
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ingresogcba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `sector` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `apellido`, `sector`) VALUES
(1, 'Daniel', 'de Almeida', 'DGTAD - Legal y técnica'),
(2, 'Dario', 'Riva', 'DGCL - Legales'),
(3, 'Diego', 'Pellegrini', 'DGCL - Legales'),
(4, 'Federico', 'Musso', 'DGCCON - Normativa'),
(5, 'Laura', 'Rodriguez', 'MGEYA - Mesa de entradas'),
(6, 'Lautaro Ariel', 'Basanta', 'DGPRTGD - Proyectos tecnológicos'),
(7, 'Manuel', 'Castello', 'DGEGRAL - Escribanía'),
(8, 'Paula', 'Barrios', 'UAI - Auditoria'),
(9, 'Rocio', 'Diaz', 'SECLYT - Secretaria legal y técnica'),
(10, 'Sebastian', 'Parasis', 'UAI - Auditoria'),
(11, 'Walter', 'Marcote', 'DGEGRAL - Escribanía'),
(12, 'Guillermo', 'Balcarcel', 'DGCCON - Normativa'),
(13, 'Esteban', 'Gawron', 'DGPRTGD - Proyectos tecnológicos'),
(14, 'Enzo', 'Peddini', 'DGPRTGD - Proyectos tecnológicos'),
(15, 'Andrea', 'Russo', 'UAI - Auditoria'),
(16, 'Adrian', 'Zarate', 'DGTAD - Legal y técnica'),
(17, 'Melisa', 'Yune', 'DGTAD - Legal y técnica'),
(18, 'Nicolas', 'Russmann', 'SECLYT - Secretaria legal y técnica'),
(19, 'Galo', 'Trillo', 'SECLYT - Secretaria legal y técnica'),
(20, 'Diego', 'Pellegrini', 'DGCCON - Normativa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` int(11) NOT NULL,
  `fecha` varchar(50) NOT NULL,
  `hora` varchar(50) NOT NULL,
  `codigoTarjeta` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `renaper`
--

CREATE TABLE `renaper` (
  `dni` varchar(50) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `fechaNacimiento` varchar(50) NOT NULL,
  `mensaje` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `renaper`
--

INSERT INTO `renaper` (`dni`, `nombres`, `apellido`, `fechaNacimiento`, `mensaje`) VALUES
('', '', '', '', ''),
('30543567', 'López', 'Alberto', '20/10/1990', 'empleado'),
('20543568', 'Juan', 'Rodriguez', '25/9/1986', 'empleado'),
('45321876', 'Candela', 'Luciani', '10/01/1998', 'estudiante'),
('20313789', 'Solange', 'Garcia', '25/03/1988', 'empleada'),
('17432765', 'Mirta ', 'Sanchez', '17/12/1975', 'empleada'),
('40214569', 'Juan', 'Hernandez', '11/08/1995', 'estudiante'),
('45658962', 'Martina Valeria', 'Ruiz', '08/07/1998', 'empleada'),
('40478598', 'Mariano Javier', 'Sanchez', '2/10/1995', 'empleado'),
('45856932', 'Gabriela', 'Iglesias', '15/08/1998', 'estudiante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas`
--

CREATE TABLE `tarjetas` (
  `codigo` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tarjetas`
--

INSERT INTO `tarjetas` (`codigo`, `estado`) VALUES
(12345678, 'habilitado'),
(40123654, 'deshabilitado'),
(45678214, 'habilitado'),
(47856478, 'habilitado'),
(47895645, 'habilitado'),
(74123014, 'deshabilitado'),
(74125478, 'habilitado'),
(78945147, 'deshabilitado'),
(78945210, 'habilitado'),
(78965414, 'habilitado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
