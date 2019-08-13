-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-08-2019 a las 02:24:51
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
  `nombreEmpleado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`id`, `fecha`, `hora`, `codigoTarjeta`, `dni`, `nombreEmpleado`) VALUES
(1, '12/8/2019', '5:34 p. m.', 12345678, 20543568, 'Guillermo Balcarcel'),
(2, '12/8/2019', '5:40 p. m.', 12345678, 20543568, 'Guillermo Balcarcel'),
(3, '12/8/2019', '5:42 p. m.', 12345678, 20543568, 'Guillermo Balcarcel'),
(4, '12/8/2019', '5:43 p. m.', 12345678, 20543568, 'Guillermo Balcarcel'),
(5, '12/8/2019', '5:45 p. m.', 12345678, 20543568, 'Guillermo Balcarcel'),
(6, '12/8/2019', '5:46 p. m.', 12345678, 20543568, 'Guillermo Balcarcel'),
(7, '12/8/2019', '5:49 p. m.', 12345678, 20543568, 'Guillermo Balcarcel'),
(8, '12/8/2019', '5:52 p. m.', 12345678, 20543568, 'Guillermo Balcarcel'),
(9, '12/8/2019', '5:52 p. m.', 12345678, 20543568, 'Guillermo Balcarcel'),
(10, '12/8/2019', '5:53 p. m.', 12345678, 20543568, 'Guillermo Balcarcel'),
(11, '12/8/2019', '5:57 p. m.', 12345678, 20543568, 'Guillermo Balcarcel'),
(12, '12/8/2019', '8:44 p. m.', 12345678, 20543568, 'Diego Pellegrini'),
(13, '12/8/2019', '8:45 p. m.', 12345678, 20543568, 'Laura Rodriguez'),
(14, '12/8/2019', '8:57 p. m.', 12345678, 40478598, 'Adrian Zarate'),
(15, '12/8/2019', '8:58 p. m.', 12345678, 45856932, 'Federico Musso'),
(16, '12/8/2019', '8:59 p. m.', 12345678, 45321876, 'Sebastian Parasis'),
(17, '12/8/2019', '8:59 p. m.', 12345678, 45321876, 'Dario Riva'),
(18, '12/8/2019', '8:59 p. m.', 12345678, 45321876, 'Federico Musso'),
(19, '12/8/2019', '8:59 p. m.', 12345678, 20313789, 'Laura Rodriguez'),
(20, '12/8/2019', '9:00 p. m.', 12345678, 20313789, 'Walter Marcote'),
(21, '12/8/2019', '9:00 p. m.', 12345678, 20313789, 'Esteban Gawron'),
(22, '12/8/2019', '9:00 p. m.', 12345678, 20313789, 'Adrian Zarate'),
(23, '12/8/2019', '9:01 p. m.', 47895645, 30543567, 'Lautaro Ariel Basanta'),
(24, '12/8/2019', '9:01 p. m.', 47895645, 30543567, 'Dario Riva'),
(25, '12/8/2019', '9:01 p. m.', 47895645, 30543567, 'Rocio Diaz'),
(26, '12/8/2019', '9:01 p. m.', 47895645, 30543567, 'Diego Pellegrini'),
(27, '12/8/2019', '9:02 p. m.', 47895645, 30543567, 'Daniel de Almeida'),
(28, '12/8/2019', '9:12 p. m.', 74125478, 45658962, 'Paula Barrios'),
(29, '12/8/2019', '9:12 p. m.', 74125478, 45658962, 'Diego Pellegrini'),
(30, '12/8/2019', '9:12 p. m.', 74125478, 45658962, 'Guillermo Balcarcel'),
(31, '12/8/2019', '9:22 p. m.', 12345678, 30543567, 'Diego Pellegrini');

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
('30543567', 'Francisco', 'Hernandez', '20/10/1990', 'empleado'),
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
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tarjetas`
--

INSERT INTO `tarjetas` (`codigo`) VALUES
(12345678),
(40123654),
(45678214),
(47856478),
(47895645),
(74123014),
(74125478),
(78945147),
(78945210),
(78965414);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
