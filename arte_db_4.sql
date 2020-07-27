-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2020 a las 20:02:29
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

--
-- Volcado de datos para la tabla `adresses`
--

INSERT INTO `adresses` (`id`, `idUser`, `street`, `number`, `floor`, `door`, `createdAt`, `updatedAt`, `deletedAt`, `cp`, `province`, `city`) VALUES
(1, 3, 'Calle falsa', 12, 1, 2, '2020-07-14 18:30:56', '2020-07-14 18:30:56', NULL, 1212, 'bsas', 'vicentine'),
(2, 3, 'elmer lulu', 12, 9, 4, '2020-07-15 00:37:49', '2020-07-15 00:37:49', NULL, 1212, 'catamarca', 'sanjose'),
(3, 3, 'Calle', 0, 0, 0, '2020-07-16 18:55:53', '2020-07-25 22:01:38', '2020-07-25 22:01:38', 0, '', ''),
(4, 3, 'Calle', 0, 0, 0, '2020-07-16 18:58:06', '2020-07-27 17:10:13', '2020-07-27 17:10:13', 0, 'Provincia', 'localidad'),
(5, 3, 'Calle', 0, 0, 0, '2020-07-16 19:21:18', '2020-07-27 17:10:16', '2020-07-27 17:10:16', 0, 'Provincia', 'localidad'),
(6, 107, 'falsa', 123, 0, 0, '2020-07-18 04:43:46', '2020-07-20 16:57:11', '2020-07-20 16:57:11', 1555, 'buenos aires', 'vicente lopez'),
(7, 107, 'sabiola', 1234, 2, 3, '2020-07-20 17:02:14', '2020-07-20 17:03:39', '2020-07-20 17:03:39', 1212, 'buenos aires', 'catmandu'),
(8, 108, 'Gould ', 865, 0, 0, '2020-07-27 17:34:28', '2020-07-27 17:34:28', NULL, 2000, 'Santa Fe', 'Rosario'),
(9, 109, 'Sarmiento', 154, 0, 0, '2020-07-27 17:48:49', '2020-07-27 17:48:49', NULL, 1623, 'Buenos Aires', 'Ingeniero Maszchwitz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartitems`
--

CREATE TABLE `cartitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `idUser` int(10) UNSIGNED NOT NULL,
  `idOrder` int(10) UNSIGNED DEFAULT NULL,
  `idProduct` int(10) UNSIGNED NOT NULL,
  `idSeller` int(10) UNSIGNED NOT NULL,
  `price` int(11) UNSIGNED NOT NULL,
  `status` tinyint(2) DEFAULT 0,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cartitems`
--

INSERT INTO `cartitems` (`id`, `idUser`, `idOrder`, `idProduct`, `idSeller`, `price`, `status`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(87, 3, NULL, 48, 3, 1100, 0, '2020-07-26 21:03:52', '2020-07-26 21:03:56', '2020-07-26 21:03:56'),
(88, 3, NULL, 48, 3, 1100, 0, '2020-07-26 21:04:00', '2020-07-26 21:04:05', '2020-07-26 21:04:05'),
(89, 3, NULL, 48, 3, 1100, 0, '2020-07-26 21:04:09', '2020-07-26 21:04:11', '2020-07-26 21:04:11'),
(90, 3, 31, 48, 3, 1100, 1, '2020-07-26 21:23:25', '2020-07-26 21:23:27', NULL),
(91, 3, NULL, 48, 3, 1100, 0, '2020-07-26 21:43:06', '2020-07-26 21:43:58', '2020-07-26 21:43:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `idUser` int(10) UNSIGNED NOT NULL,
  `idProduct` int(10) UNSIGNED NOT NULL,
  `idSeller` int(10) UNSIGNED NOT NULL,
  `comentario` text DEFAULT NULL,
  `respuesta` text DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `idUser`, `idProduct`, `idSeller`, `comentario`, `respuesta`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(5, 3, 48, 3, 'Muy lindo! ', 'Gracias', '2020-07-26 21:08:43', '2020-07-26 21:09:13', NULL),
(6, 109, 48, 3, 'El precio incluye la obra y el marco?? ', NULL, '2020-07-27 17:58:45', '2020-07-27 17:58:45', NULL),
(7, 109, 49, 3, 'Hola marcos! Me encanta lo que haces. Soy de Entre Rios, cuanto me saldria el envio? Gracias! Espero tu respuesta.', NULL, '2020-07-27 18:00:55', '2020-07-27 18:00:55', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `consulta` mediumtext NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`id`, `nombre`, `email`, `consulta`, `createdAt`, `updatedAt`) VALUES
(3, 'facundo', 'facundo@hotmail.com', 'Al contrario del pensamiento popular, el texto de Lorem Ipsum no es simplemente texto aleatorio. Tiene sus raices en una pieza cl´sica de la literatura del Latin, que data del año 45 antes de Cristo, haciendo que este adquiera mas de 2000 años de antiguedad. Richard McClintock, un profesor de Latin de la Universidad de Hampden-Sydney en Virginia, encontró una de las palabras más oscuras de la lengua del latín, \"consecteur\", en un pasaje de Lorem Ipsum, y al seguir leyendo distintos textos del latín, descubrió la fuente indudable. Lorem Ipsum viene de las secciones 1.10.32 y 1.10.33 de \"de Finnibus Bonorum et Malorum\" (Los Extremos del Bien y El Mal) por Cicero, escrito en el año 45 antes de Cristo. Este libro es un tratado de teoría de éticas, muy popular durante el Renacimiento. La primera linea del Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", viene de una linea en la sección 1.10.32', '2020-07-23 19:51:34', '2020-07-23 19:51:34');

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
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `total` int(11) UNSIGNED NOT NULL,
  `orderNumber` int(10) UNSIGNED NOT NULL,
  `userId` int(10) UNSIGNED DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `total`, `orderNumber`, `userId`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(31, 1100, 1, 3, '2020-07-26 21:23:27', '2020-07-26 21:23:27', NULL);

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
  `price` int(11) UNSIGNED NOT NULL,
  `ancho` smallint(6) DEFAULT NULL,
  `quantity` int(11) DEFAULT 1,
  `idUser` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `imageFile` char(255) DEFAULT NULL,
  `alto` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `ancho`, `quantity`, `idUser`, `createdAt`, `updatedAt`, `deletedAt`, `status`, `imageFile`, `alto`) VALUES
(48, 'hippe', ' Acrilico sobre tela. Enmarcada.  ', 1100, 70, 1, 3, '2020-07-26 20:40:36', '2020-07-26 21:43:01', NULL, 0, 'imageFile-1595796036321.jpg', 120),
(49, 'Multicolor', 'Pintura abstracta multicolor. Acrilico sobre tela utilizando distintas tecnicas.', 1600, 130, 1, 3, '2020-07-27 17:13:20', '2020-07-27 17:13:20', NULL, 0, 'imageFile-1595870000652.jpg', 80),
(50, 'Pensamientos', 'Obra de arte abstracto. Acrilico sobre tela. Mezcla de colores y texturas. ', 1900, 150, 1, 3, '2020-07-27 17:16:08', '2020-07-27 17:16:08', NULL, 1, 'imageFile-1595870168611.jpg', 90),
(51, 'Frio y calor', 'Acrilico sobre tela. Arte abstracto. Mezcla de colores calidos y colores frios. Distintas tecnicas', 2250, 120, 1, 3, '2020-07-27 17:26:37', '2020-07-27 17:26:37', NULL, 0, 'imageFile-1595870797363.jpg', 80),
(52, 'Casa del arbol', 'Acrilico sobre tela. Mi sueño de vivir en una casa del arbol. ', 1000, 40, 1, 108, '2020-07-27 17:36:48', '2020-07-27 17:36:48', NULL, 0, 'imageFile-1595871408941.jpeg', 70),
(53, 'Suburbano', 'Paisaja imaginario de las afueras de una pequeña ciudad, y un arbolito. Simple. Pintado con acrilico sobre madera. Una pequeña obra de arte, de escritorio. ', 650, 40, 1, 108, '2020-07-27 17:41:24', '2020-07-27 17:41:24', NULL, 0, 'imageFile-1595871682288.jpeg', 35),
(54, 'Retrato Bob Marley', 'Imagen retrato de Bob Marley tipo collage, a partir de muchas imagenes de el. Papel plastico de calidad. Marco de madera color negro. Consulta por otros diseños y/o marcos. Hago trabajos a pedido! Mandame la foto que quieras.', 800, 60, 1, 109, '2020-07-27 17:53:05', '2020-07-27 17:53:05', NULL, 0, 'imageFile-1595872385895.jpeg', 100),
(55, 'Cinema retro', 'Cuadro tipo bastidor. Imagen impresa sobre tela. Listo para colgar. Consulta por otras medidas y/o marcos. Hago trabajos a pedido! Mandame la imagen que quieras.', 950, 40, 1, 109, '2020-07-27 17:56:09', '2020-07-27 17:56:09', NULL, 0, 'imageFile-1595872569607.jpeg', 70),
(56, 'hawai coast', 'Cuadro tipo bastidor. Imagen impresa sobre tela. Listo para colgar. Consulta por otras medidas y/o marcos. Hago trabajos a pedido! Mandame la imagen que quieras. ', 700, 35, 1, 109, '2020-07-27 17:57:23', '2020-07-27 17:57:23', NULL, 0, 'imageFile-1595872641324.jpeg', 35);

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
(3, 'marcos', 'marcos', 'marquetsdf', 'marcos@hotmail.com', 'avatar-1595793473750.jpg', '$2a$10$BADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 1, 1, 1, 1, '0', '2020-06-24 18:59:48', '2020-07-27 00:07:23', NULL, 1),
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
(104, 'Patric', 'Rouch', 'prouch2r', 'prouch2r@unesco.org', NULL, '12an10oBADztSE68LHnyD1N/KoWtuDbkNvgBqXrx/9FU/wTqAkoU5/YBip2a', 0, 0, 0, 0, '0', '2020-06-26 12:02:08', NULL, NULL, 1),
(106, 'sadf', 'asdf', 'asdf', 'asdf', '', '$2a$10$.a7lhWu33F48178ihN37OemZEoSq4BKAxRvfvNeMFZ2cEuJyv83/K', 0, 0, 0, 0, '0', '2020-07-10 20:18:30', '2020-07-25 18:58:00', NULL, 0),
(107, 'Facu', 'ollers', 'Facu', 'facundo@hotmail.com', 'avatar-1595715854948.jpg', '$2a$10$VbJySpZHwLnw4yjeeqY5sOtbM1xXkGsRV5FCkcD4wvKxnX7dRR8JO', 1, 1, 1, 1, '0', '2020-07-18 04:39:32', '2020-07-25 22:24:14', NULL, 0),
(108, 'Esteban', 'Quito', 'tebi', 'esteban@esteban.com', 'avatar-1595871124318.jpg', '$2a$10$y4rPu0izcjrdtLdHLzslxe2ZB7jO9KykLwvi8vmaMg2Vno8ts8Zmi', 1, 0, 1, 1, '0', '2020-07-27 17:28:23', '2020-07-27 17:32:14', NULL, 0),
(109, 'maria', 'pereyra', 'mery', 'maria@maria.com', 'avatar-1595872038097.jpg', '$2a$10$Wp/p5tXRkTRbRf5mWYRIm.IKB2Q0J4zzzsxWntRxNTTrSMfu1P8PG', 1, 1, 1, 1, '0', '2020-07-27 17:43:16', '2020-07-27 17:47:18', NULL, 0);

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
-- Indices de la tabla `cartitems`
--
ALTER TABLE `cartitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idOrder` (`idOrder`),
  ADD KEY `idProduct` (`idProduct`),
  ADD KEY `idSeller` (`idSeller`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idSeller` (`idSeller`),
  ADD KEY `idProduct` (`idProduct`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `cartitems`
--
ALTER TABLE `cartitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adresses`
--
ALTER TABLE `adresses`
  ADD CONSTRAINT `adresses_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `cartitems`
--
ALTER TABLE `cartitems`
  ADD CONSTRAINT `idOrder` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idProduct` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idSeller` FOREIGN KEY (`idSeller`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idUser` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`idSeller`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comentarios_ibfk_3` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
