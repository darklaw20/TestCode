-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2019 a las 00:26:50
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `extraexamen`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `care`
--

CREATE TABLE `care` (
  `idCare` int(11) NOT NULL,
  `idStaff` int(11) NOT NULL,
  `idSupportedPeople` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persons`
--

CREATE TABLE `persons` (
  `personId` int(11) NOT NULL,
  `personName` varchar(70) NOT NULL,
  `personLastName` varchar(70) NOT NULL,
  `personCURP` varchar(18) NOT NULL,
  `personGender` enum('F','M') DEFAULT NULL,
  `personCD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `personLU` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proffesors`
--

CREATE TABLE `proffesors` (
  `proffersorId` int(11) NOT NULL,
  `proffesorStatus` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `proffesorNum` varchar(8) NOT NULL,
  `fkPerson` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `staff`
--

CREATE TABLE `staff` (
  `idStaff` int(11) NOT NULL,
  `staffType` int(11) NOT NULL,
  `forename` varchar(45) NOT NULL,
  `surname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stafftypes`
--

CREATE TABLE `stafftypes` (
  `idStaffType` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `stafftypes`
--

INSERT INTO `stafftypes` (`idStaffType`, `description`) VALUES
(1, ''),
(2, 'hola1'),
(3, 'hola3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE `students` (
  `StudentId` int(11) NOT NULL,
  `studentStatus` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `studentEnroll` varchar(13) NOT NULL,
  `fkPerson` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supportedpeople`
--

CREATE TABLE `supportedpeople` (
  `idSupportedPeople` int(11) NOT NULL,
  `forename` varchar(45) NOT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `dob` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `userEmail` varchar(160) NOT NULL,
  `userPassword` varchar(160) NOT NULL,
  `userType` enum('Admin','Student','Proffesor') NOT NULL,
  `userBlock` enum('0','1','2') NOT NULL DEFAULT '0',
  `userCD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userLU` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fkPerson` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `care`
--
ALTER TABLE `care`
  ADD PRIMARY KEY (`idCare`),
  ADD KEY `idStaff` (`idStaff`),
  ADD KEY `idSupportedPeople` (`idSupportedPeople`);

--
-- Indices de la tabla `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`personId`),
  ADD UNIQUE KEY `personCURP` (`personCURP`);

--
-- Indices de la tabla `proffesors`
--
ALTER TABLE `proffesors`
  ADD PRIMARY KEY (`proffersorId`),
  ADD UNIQUE KEY `proffesorNum` (`proffesorNum`),
  ADD KEY `fkPerson` (`fkPerson`);

--
-- Indices de la tabla `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`idStaff`),
  ADD KEY `staffType` (`staffType`);

--
-- Indices de la tabla `stafftypes`
--
ALTER TABLE `stafftypes`
  ADD PRIMARY KEY (`idStaffType`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentId`),
  ADD UNIQUE KEY `studentEnroll` (`studentEnroll`),
  ADD KEY `fkPerson` (`fkPerson`);

--
-- Indices de la tabla `supportedpeople`
--
ALTER TABLE `supportedpeople`
  ADD PRIMARY KEY (`idSupportedPeople`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userEmail` (`userEmail`),
  ADD KEY `fkPerson` (`fkPerson`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `care`
--
ALTER TABLE `care`
  MODIFY `idCare` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persons`
--
ALTER TABLE `persons`
  MODIFY `personId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proffesors`
--
ALTER TABLE `proffesors`
  MODIFY `proffersorId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `staff`
--
ALTER TABLE `staff`
  MODIFY `idStaff` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `stafftypes`
--
ALTER TABLE `stafftypes`
  MODIFY `idStaffType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
  MODIFY `StudentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `supportedpeople`
--
ALTER TABLE `supportedpeople`
  MODIFY `idSupportedPeople` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `care`
--
ALTER TABLE `care`
  ADD CONSTRAINT `care_ibfk_1` FOREIGN KEY (`idStaff`) REFERENCES `staff` (`idStaff`),
  ADD CONSTRAINT `care_ibfk_2` FOREIGN KEY (`idSupportedPeople`) REFERENCES `supportedpeople` (`idSupportedPeople`);

--
-- Filtros para la tabla `proffesors`
--
ALTER TABLE `proffesors`
  ADD CONSTRAINT `proffesors_ibfk_1` FOREIGN KEY (`fkPerson`) REFERENCES `persons` (`personId`);

--
-- Filtros para la tabla `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`staffType`) REFERENCES `stafftypes` (`idStaffType`);

--
-- Filtros para la tabla `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`fkPerson`) REFERENCES `persons` (`personId`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`fkPerson`) REFERENCES `persons` (`personId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
