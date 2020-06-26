-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-06-2020 a las 17:05:20
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `arte_db_4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adresses`
--

CREATE TABLE `adresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `idUser` int(10) UNSIGNED NOT NULL,
  `street` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `floor` int(11) DEFAULT NULL,
  `door` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `keywords`
--

CREATE TABLE `keywords` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productimages`
--

CREATE TABLE `productimages` (
  `id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(255) NOT NULL,
  `idProduct` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productkeys`
--

CREATE TABLE `productkeys` (
  `id` int(10) UNSIGNED NOT NULL,
  `idProduct` int(10) UNSIGNED NOT NULL,
  `idKeyword` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT 1,
  `idUser` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `imageFile` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `size`, `quantity`, `idUser`, `createdAt`, `updatedAt`, `deletedAt`, `status`, `imageFile`) VALUES
(1, 'Mona Lisa', 'Prueba', '1200', NULL, 1, 3, '2020-06-26 09:48:54', NULL, NULL, 0, NULL),
(2, 'Skiando ando', 'Prueba 2', '850', NULL, 1, 3, '2020-06-26 09:51:20', NULL, NULL, 0, NULL),
(3, 'Lineas blancas', 'Prueba 3', '15000', NULL, 1, 3, '2020-06-26 09:52:08', NULL, NULL, 0, NULL),
(4, 'Cuadro de prueba', 'Prueba', '1000', NULL, 1, 3, '2020-06-26 09:53:42', NULL, NULL, 0, NULL),
(5, 'Cuadro de prueba 2', 'Prueba', '1000', NULL, 1, 3, '2020-06-26 09:54:15', NULL, NULL, 0, NULL),
(6, 'Cuadro de prueba 2', 'Prueba', '1000', NULL, 1, 3, '2020-06-26 09:55:39', NULL, NULL, 0, NULL),
(7, 'Cuadro de prueba 3', 'Prueba', '1000', NULL, 1, 3, '2020-06-26 09:55:48', NULL, NULL, 0, NULL),
(8, 'Cuadro de prueba 4', 'Prueba', '1000', NULL, 1, 3, '2020-06-26 09:55:53', NULL, NULL, 0, NULL),
(9, 'Cuadro de prueba 5', 'Prueba', '1000', NULL, 1, 3, '2020-06-26 09:55:55', NULL, NULL, 0, NULL),
(10, 'Cuadro de prueba 6', 'Prueba', '1000', NULL, 1, 3, '2020-06-26 09:55:57', NULL, NULL, 0, NULL),
(11, 'Cuadro de prueba 7', 'Prueba', '1000', NULL, 1, 3, '2020-06-26 09:55:58', NULL, NULL, 0, NULL),
(12, 'Cuadro de prueba 8', 'Prueba', '1000', NULL, 1, 3, '2020-06-26 09:56:00', NULL, NULL, 0, NULL),
(13, 'Cuadro de prueba 9', 'Prueba', '1000', NULL, 1, 3, '2020-06-26 09:56:04', NULL, NULL, 0, NULL),
(14, 'Cuadro de prueba 10', 'Prueba', '1000', NULL, 1, 3, '2020-06-26 09:56:06', NULL, NULL, 0, NULL),
(15, 'Cuadro de prueba 11', 'Prueba', '1000', NULL, 1, 3, '2020-06-26 09:56:08', NULL, NULL, 0, NULL),
(16, 'Cuadro de prueba 12', 'Prueba', '1000', NULL, 1, 3, '2020-06-26 09:56:10', NULL, NULL, 0, NULL),
(17, 'Cuadro de prueba 13', 'Prueba', '1000', NULL, 1, 3, '2020-06-26 09:56:11', NULL, NULL, 0, NULL),
(18, 'Cuadro de prueba 14', 'Prueba', '1000', NULL, 1, 3, '2020-06-26 09:56:13', NULL, NULL, 0, NULL),
(19, 'Cuadro de prueba 15', 'Prueba', '1000', NULL, 1, 3, '2020-06-26 09:56:16', NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `rol` tinyint(4) DEFAULT 0,
  `mailShipping` tinyint(4) DEFAULT 0,
  `privateShipping` tinyint(4) DEFAULT 0,
  `noShipping` tinyint(4) DEFAULT 0,
  `averageScore` decimal(10,0) DEFAULT 0,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL,
  `newsletter` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `username`, `email`, `avatar`, `password`, `rol`, `mailShipping`, `privateShipping`, `noShipping`, `averageScore`, `createdAt`, `updatedAt`, `deletedAt`, `newsletter`) VALUES
(1, 'Juan', 'Gomez', 'juangomez', 'juangomez@hotmail.com', NULL, '$2a$10$mCbDx6aVt93hji2Z4Z2p3ux1bhx8GIDUbjmOFrMzXFrHU3ccSn7iS', 0, 0, 0, 0, '0', '2020-06-24 18:50:27', '2020-06-24 18:50:27', NULL, 1),
(2, 'daniel', 'daniel', 'daniel', 'daniel@hotmail.com', NULL, '$2a$10$9B0ckMUWSXJHOrpogpDEaOVBqK43pMlHMy3jDl3CY5vw7Oiofc5Zu', 0, 0, 0, 0, '0', '2020-06-24 18:58:06', '2020-06-24 18:58:06', NULL, 1),
(3, 'marcos', 'marcos', 'marcos', 'marcos@hotmail.com', NULL, '$2a$10$BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-24 18:59:48', '2020-06-24 18:59:48', NULL, 1),
(4, 'Laura', 'Laura', 'Laura', 'laura@hotmail.com', NULL, '$2a$10$HKmB2dT//eapBd458qg97e8o8nmojo4WyQMCZRZ4UZClr9TG2wHLS', 1, 0, 0, 0, '0', '2020-06-26 13:40:49', '2020-06-26 13:40:49', NULL, 1),
(5, 'Jillane', 'Bertomeu', 'jbertomeu0', 'jbertomeu0@earthlink.net', NULL, '02am103BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(6, 'Jamey', 'MacCrackan', 'jmaccrackan1', 'jmaccrackan1@moonfruit.com', NULL, 'f2ac104BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(7, 'Nolana', 'Stirtle', 'nstirtle2', 'nstirtle2@wunderground.com', NULL, '22a510eBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(8, 'Ardys', 'Lacase', 'alacase3', 'alacase3@yelp.com', NULL, '62ad100BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(9, 'Beck', 'McCandie', 'bmccandie4', 'bmccandie4@com.com', NULL, 'l2aq10tBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(10, 'Dur', 'Elias', 'delias5', 'delias5@xrea.com', NULL, 'q2ac10pBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(11, 'Annora', 'Jerson', 'ajerson6', 'ajerson6@goo.gl', NULL, 'g2aw10kBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(12, 'Zulema', 'Volett', 'zvolett7', 'zvolett7@imdb.com', NULL, 'n2ag10oBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(13, 'Lyon', 'Cattlow', 'lcattlow8', 'lcattlow8@istockphoto.com', NULL, '62a710zBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(14, 'Keely', 'Corbishley', 'kcorbishley9', 'kcorbishley9@nps.gov', NULL, 't2a810kBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(15, 'Shandeigh', 'Boller', 'sbollera', 'sbollera@fotki.com', NULL, 'f2a9108BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(16, 'Babette', 'Krook', 'bkrookb', 'bkrookb@ameblo.jp', NULL, '82a9105BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(17, 'Deina', 'MacCurley', 'dmaccurleyc', 'dmaccurleyc@wordpress.org', NULL, 'h2ar108BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(18, 'Aida', 'Bladesmith', 'abladesmithd', 'abladesmithd@wikia.com', NULL, 'a2a410rBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(19, 'Betta', 'Bareford', 'bbareforde', 'bbareforde@abc.net.au', NULL, 'y2ae10tBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(20, 'Fenelia', 'Williscroft', 'fwilliscroftf', 'fwilliscroftf@spotify.com', NULL, 'y2ax10zBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(21, 'Nicolette', 'Clamo', 'nclamog', 'nclamog@washington.edu', NULL, '12ap101BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(22, 'Teador', 'Guerrier', 'tguerrierh', 'tguerrierh@usatoday.com', NULL, 'q2a7109BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(23, 'June', 'Lode', 'jlodei', 'jlodei@guardian.co.uk', NULL, '52aj10iBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(24, 'Broddy', 'Ramsted', 'bramstedj', 'bramstedj@bbc.co.uk', NULL, 'h2a010lBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(25, 'Daria', 'Marielle', 'dmariellek', 'dmariellek@cisco.com', NULL, '02ah10iBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(26, 'Letitia', 'Stoneman', 'lstonemanl', 'lstonemanl@nationalgeographic.com', NULL, '62ao10sBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(27, 'Miltie', 'Hands', 'mhandsm', 'mhandsm@google.cn', NULL, 'a2am109BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(28, 'Lay', 'Petrina', 'lpetrinan', 'lpetrinan@tripadvisor.com', NULL, 'a2am108BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(29, 'Eulalie', 'Burston', 'eburstono', 'eburstono@mlb.com', NULL, '62a1102BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(30, 'Delilah', 'Keme', 'dkemep', 'dkemep@yolasite.com', NULL, 'b2ae10dBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(31, 'Darn', 'Alfuso', 'dalfusoq', 'dalfusoq@princeton.edu', NULL, 'x2af10sBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(32, 'Dusty', 'Kubik', 'dkubikr', 'dkubikr@icio.us', NULL, 'j2a610pBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(33, 'Nickey', 'Crotch', 'ncrotchs', 'ncrotchs@boston.com', NULL, '82az10sBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(34, 'Durward', 'Dunstan', 'ddunstant', 'ddunstant@nih.gov', NULL, 'f2a9100BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(35, 'Eddi', 'Tetford', 'etetfordu', 'etetfordu@google.co.uk', NULL, 'z2aa105BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(36, 'Humfrey', 'Skivington', 'hskivingtonv', 'hskivingtonv@scientificamerican.com', NULL, '42aq104BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(37, 'Nealon', 'Knowlman', 'nknowlmanw', 'nknowlmanw@homestead.com', NULL, '32as10xBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(38, 'Bee', 'Moorwood', 'bmoorwoodx', 'bmoorwoodx@1688.com', NULL, 'w2a010uBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(39, 'Bennett', 'Cicci', 'bcicciy', 'bcicciy@mayoclinic.com', NULL, 'r2a0104BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(40, 'Tad', 'Rivilis', 'trivilisz', 'trivilisz@photobucket.com', NULL, 'p2ah108BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(41, 'Aldus', 'Billes', 'abilles10', 'abilles10@wikipedia.org', NULL, 'm2ak10gBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(42, 'Cal', 'Carlet', 'ccarlet11', 'ccarlet11@forbes.com', NULL, 'r2al106BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(43, 'Jordan', 'Bowker', 'jbowker12', 'jbowker12@xrea.com', NULL, 'i2as10pBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(44, 'Tucker', 'Mawby', 'tmawby13', 'tmawby13@istockphoto.com', NULL, 'w2a610cBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(45, 'Sebastien', 'Goodier', 'sgoodier14', 'sgoodier14@boston.com', NULL, '92ak10mBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(46, 'Amy', 'Jacobowitz', 'ajacobowitz15', 'ajacobowitz15@mediafire.com', NULL, '52an10pBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(47, 'Darren', 'Helsdon', 'dhelsdon16', 'dhelsdon16@diigo.com', NULL, 'e2ag10nBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(48, 'Austine', 'Brody', 'abrody17', 'abrody17@freewebs.com', NULL, 'z2ah10rBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(49, 'Annis', 'Fawlkes', 'afawlkes18', 'afawlkes18@fc2.com', NULL, 'm2a8102BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(50, 'Sydelle', 'Wyldbore', 'swyldbore19', 'swyldbore19@google.es', NULL, 'd2ae103BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(51, 'Wendeline', 'Giraudou', 'wgiraudou1a', 'wgiraudou1a@paypal.com', NULL, '62a510xBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(52, 'Brucie', 'Thorne', 'bthorne1b', 'bthorne1b@statcounter.com', NULL, 'c2ai10kBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(53, 'Currey', 'Biss', 'cbiss1c', 'cbiss1c@msn.com', NULL, '92ap10tBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(54, 'Walton', 'Baigrie', 'wbaigrie1d', 'wbaigrie1d@scribd.com', NULL, 's2ai10zBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(55, 'Fina', 'Eliet', 'feliet1e', 'feliet1e@ed.gov', NULL, 'm2ah10oBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(56, 'Gerald', 'Weatherall', 'gweatherall1f', 'gweatherall1f@wisc.edu', NULL, 'e2a010sBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(57, 'Annmaria', 'Gethyn', 'agethyn1g', 'agethyn1g@amazon.co.jp', NULL, 'l2at10bBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(58, 'Elizabet', 'Wilsher', 'ewilsher1h', 'ewilsher1h@typepad.com', NULL, 'n2ab102BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(59, 'Simeon', 'Berthomieu', 'sberthomieu1i', 'sberthomieu1i@house.gov', NULL, '62ay108BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(60, 'Jada', 'Dudding', 'jdudding1j', 'jdudding1j@tripod.com', NULL, '02ao10hBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(61, 'Orlando', 'Crass', 'ocrass1k', 'ocrass1k@discuz.net', NULL, '32aq104BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(62, 'Chad', 'Davies', 'cdavies1l', 'cdavies1l@time.com', NULL, 'e2a610qBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(63, 'Ritchie', 'Bester', 'rbester1m', 'rbester1m@scientificamerican.com', NULL, '12a010aBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(64, 'Concordia', 'Culp', 'cculp1n', 'cculp1n@nasa.gov', NULL, '12as108BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(65, 'Shelbi', 'Pereira', 'spereira1o', 'spereira1o@ebay.co.uk', NULL, '42aq10sBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(66, 'Nike', 'Gumbrell', 'ngumbrell1p', 'ngumbrell1p@mysql.com', NULL, 'r2ag10pBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(67, 'Josepha', 'Arnholz', 'jarnholz1q', 'jarnholz1q@freewebs.com', NULL, '82ai10iBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(68, 'Mandi', 'Messom', 'mmessom1r', 'mmessom1r@histats.com', NULL, 't2a110xBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(69, 'Town', 'Domenichini', 'tdomenichini1s', 'tdomenichini1s@ibm.com', NULL, 'm2ap10sBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(70, 'Janie', 'Gaytor', 'jgaytor1t', 'jgaytor1t@hostgator.com', NULL, '62ab104BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(71, 'Barbara', 'Wotton', 'bwotton1u', 'bwotton1u@nifty.com', NULL, 'b2at10jBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(72, 'Barnaby', 'Dalby', 'bdalby1v', 'bdalby1v@tuttocitta.it', NULL, 'w2az10tBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(73, 'Ranna', 'Haig', 'rhaig1w', 'rhaig1w@nhs.uk', NULL, 'h2an10uBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(74, 'Ali', 'Billison', 'abillison1x', 'abillison1x@seattletimes.com', NULL, 'n2ak10fBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(75, 'Woodie', 'Matieu', 'wmatieu1y', 'wmatieu1y@examiner.com', NULL, 'g2ag10lBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(76, 'Jacob', 'Cavell', 'jcavell1z', 'jcavell1z@symantec.com', NULL, 't2ag105BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(77, 'Chrystel', 'O\' Driscoll', 'codriscoll20', 'codriscoll20@cdc.gov', NULL, 'o2a4101BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(78, 'Agretha', 'Dexter', 'adexter21', 'adexter21@geocities.com', NULL, '92aq10fBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(79, 'Rita', 'Boughen', 'rboughen22', 'rboughen22@paypal.com', NULL, 'w2a510pBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(80, 'Constancy', 'Massimi', 'cmassimi23', 'cmassimi23@ezinearticles.com', NULL, 'h2ar10fBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(81, 'Shea', 'Bench', 'sbench24', 'sbench24@cbslocal.com', NULL, '02aq104BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(82, 'Freddie', 'Whiskin', 'fwhiskin25', 'fwhiskin25@ehow.com', NULL, 'a2av10vBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(83, 'Haze', 'Monks', 'hmonks26', 'hmonks26@joomla.org', NULL, 'x2a310wBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(84, 'Thedrick', 'Sterte', 'tsterte27', 'tsterte27@nbcnews.com', NULL, 'n2ap10pBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(85, 'Yves', 'Dod', 'ydod28', 'ydod28@wix.com', NULL, 'k2am10qBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(86, 'Felic', 'Chadwen', 'fchadwen29', 'fchadwen29@nsw.gov.au', NULL, 'c2a9105BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(87, 'Gideon', 'Spurway', 'gspurway2a', 'gspurway2a@seattletimes.com', NULL, 'n2at108BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(88, 'Elliot', 'Earwicker', 'eearwicker2b', 'eearwicker2b@ibm.com', NULL, '42ad108BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(89, 'Oran', 'Stanbro', 'ostanbro2c', 'ostanbro2c@mozilla.com', NULL, '62a9108BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(90, 'Arman', 'Kuhl', 'akuhl2d', 'akuhl2d@imdb.com', NULL, '72ae10nBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(91, 'Kristos', 'Andress', 'kandress2e', 'kandress2e@illinois.edu', NULL, '42ag10hBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(92, 'Jeannine', 'Davenport', 'jdavenport2f', 'jdavenport2f@yellowpages.com', NULL, 'g2a210uBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(93, 'Trace', 'Ubsdale', 'tubsdale2g', 'tubsdale2g@wsj.com', NULL, '82ac10fBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(94, 'Emmanuel', 'Teaser', 'eteaser2h', 'eteaser2h@imgur.com', NULL, 'l2an106BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(95, 'Cybill', 'Dykas', 'cdykas2i', 'cdykas2i@reuters.com', NULL, 'm2ao10pBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(96, 'Gordan', 'Kidwell', 'gkidwell2j', 'gkidwell2j@macromedia.com', NULL, 'u2aw10sBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(97, 'Dewitt', 'Bruyett', 'dbruyett2k', 'dbruyett2k@bbc.co.uk', NULL, 'x2am109BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(98, 'Zarla', 'Charter', 'zcharter2l', 'zcharter2l@acquirethisname.com', NULL, 'u2ac10dBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(99, 'Rebbecca', 'Pullin', 'rpullin2m', 'rpullin2m@is.gd', NULL, 'h2ah102BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(100, 'Krystalle', 'Izon', 'kizon2n', 'kizon2n@goodreads.com', NULL, '02a110vBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(101, 'Clement', 'Haymes', 'chaymes2o', 'chaymes2o@networksolutions.com', NULL, 'b2a010aBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(102, 'Tine', 'Baumaier', 'tbaumaier2p', 'tbaumaier2p@weebly.com', NULL, 'c2al10hBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(103, 'Nananne', 'Greeding', 'ngreeding2q', 'ngreeding2q@example.com', NULL, 't2a7102BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(104, 'Patric', 'Rouch', 'prouch2r', 'prouch2r@unesco.org', NULL, '12an10oBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adresses`
--
ALTER TABLE `adresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indices de la tabla `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productimages`
--
ALTER TABLE `productimages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProduct` (`idProduct`);

--
-- Indices de la tabla `productkeys`
--
ALTER TABLE `productkeys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProduct` (`idProduct`),
  ADD KEY `idKeyword` (`idKeyword`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `imageFile` (`imageFile`),
  ADD KEY `idUser` (`idUser`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adresses`
--
ALTER TABLE `adresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productimages`
--
ALTER TABLE `productimages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productkeys`
--
ALTER TABLE `productkeys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adresses`
--
ALTER TABLE `adresses`
  ADD CONSTRAINT `adresses_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `productimages`
--
ALTER TABLE `productimages`
  ADD CONSTRAINT `productimages_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `productkeys`
--
ALTER TABLE `productkeys`
  ADD CONSTRAINT `productkeys_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `productkeys_ibfk_2` FOREIGN KEY (`idKeyword`) REFERENCES `keywords` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
