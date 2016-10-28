-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-06-2015 a las 18:31:47
-- Versión del servidor: 5.6.24
-- Versión de PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `database`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `parent` int(11) NOT NULL,
  `url_image` text,
  `description` tinytext
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`, `parent`, `url_image`, `description`) VALUES
(1, 'New', 1, 'xD', 'desciption of... xD'),
(2, 'Jaume', 1, 'Made this', 'Hellow');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fav_locals`
--

CREATE TABLE IF NOT EXISTS `fav_locals` (
  `id` int(11) NOT NULL,
  `local_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `receive_notifications` tinyint(1) NOT NULL,
  `receive_offers` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fav_locals`
--

INSERT INTO `fav_locals` (`id`, `local_id`, `user_id`, `receive_notifications`, `receive_offers`) VALUES
(2, 5, 12, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locals`
--

CREATE TABLE IF NOT EXISTS `locals` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `phone_number` varchar(9) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `image_url` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tags` varchar(200) DEFAULT NULL,
  `views` int(11) NOT NULL,
  `quality_certificate` tinyint(1) NOT NULL,
  `category_id` text NOT NULL,
  `website_url` varchar(50) NOT NULL,
  `allow_comments` tinyint(1) NOT NULL,
  `score` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `locals`
--

INSERT INTO `locals` (`id`, `name`, `description`, `phone_number`, `address`, `image_url`, `user_id`, `orden`, `created_date`, `tags`, `views`, `quality_certificate`, `category_id`, `website_url`, `allow_comments`, `score`, `latitude`, `longitude`) VALUES
(1, 'Tienda OSU', 'Mongolo', NULL, NULL, 'xddd', 12, 1, '2015-06-21 18:16:29', NULL, 12, 1, '1', 'http://xd.com', 1, 12, 2.5, 2.3),
(4, 'Mongo', 'Osu forevah', NULL, NULL, 'eghe3g', 21, 2, '2015-06-21 18:28:17', NULL, 1222, 1, '2', 'ebvwebv', 1, 12, 2.5, 3.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL,
  `local_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `offers`
--

CREATE TABLE IF NOT EXISTS `offers` (
  `id` int(11) NOT NULL,
  `local_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `url_image` text,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `offers`
--

INSERT INTO `offers` (`id`, `local_id`, `title`, `description`, `url_image`, `user_id`) VALUES
(2, 2, 'fdvbwsv', 'ññññññññññññññññ', 'fjrjñ', 0),
(3, 1, 'ndn', 'gdndgd', 'ndgn', 0),
(4, 0, 'Shorte', 'ndgn', 'ndgn', 0),
(5, 0, 'gbehbehe', 'gwrgr2wgw', 'etbebg', 0),
(6, 0, 'Funciona', 'Bien ', 'Esto', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opinions`
--

CREATE TABLE IF NOT EXISTS `opinions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `score` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `local_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `opinions`
--

INSERT INTO `opinions` (`id`, `user_id`, `title`, `message`, `score`, `created_date`, `local_id`) VALUES
(2, 1, 'Hellow', 'World', 8, '2015-06-22 15:32:26', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` enum('bad_info','spam','duplicate','not_exist') NOT NULL,
  `local_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reports`
--

INSERT INTO `reports` (`id`, `user_id`, `type`, `local_id`) VALUES
(1, 12, 'spam', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `avatar_url` varchar(200) NOT NULL,
  `seller` tinyint(1) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_access_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_type` enum('user','local_owner','mod','admin') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar_url`, `seller`, `register_date`, `last_access_date`, `user_type`) VALUES
(1, 'jaume', 'gsgsgsg', 'gsgsfgsfg', 1, '2015-06-20 02:14:23', '0000-00-00 00:00:00', 'local_owner'),
(2, 'bhweb', 'bebebe', 'beb', 1, '2015-06-20 02:18:34', '0000-00-00 00:00:00', 'local_owner');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `fav_locals`
--
ALTER TABLE `fav_locals`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `locals`
--
ALTER TABLE `locals`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `orden` (`orden`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `opinions`
--
ALTER TABLE `opinions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `fav_locals`
--
ALTER TABLE `fav_locals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `locals`
--
ALTER TABLE `locals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `opinions`
--
ALTER TABLE `opinions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
