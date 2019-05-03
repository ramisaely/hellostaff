-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 08 fév. 2019 à 09:44
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `hello_staff`
--
CREATE DATABASE IF NOT EXISTS `hello_staff` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hello_staff`;

-- --------------------------------------------------------

--
-- Structure de la table `agency`
--
-- Création :  lun. 28 jan. 2019 à 10:00
--

DROP TABLE IF EXISTS `agency`;
CREATE TABLE IF NOT EXISTS `agency` (
  `agency_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(10) UNSIGNED DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tps` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tvq` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_fr` text COLLATE utf8mb4_unicode_ci,
  `description_en` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `agency_phone` blob NOT NULL,
  `agency_mail` blob NOT NULL,
  PRIMARY KEY (`agency_id`),
  UNIQUE KEY `agency_phone_unique` (`phone`),
  UNIQUE KEY `agency_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `agency`
--

INSERT INTO `agency` (`agency_id`, `name`, `address`, `number`, `city`, `tps`, `tvq`, `postal_code`, `province`, `country`, `logo`, `description_fr`, `description_en`, `phone`, `email`, `created_at`, `updated_at`, `agency_phone`, `agency_mail`) VALUES
(28, 'Razoary', 'malokila', NULL, 'dfef', NULL, NULL, 'fsq', 'Québec', 'Canada', '2019-01-31-07-33-09-Hydrangeas.jpg', 'Lorem ipsum', NULL, '+456453', 'ericarisanjy20@gmail.com', '2019-01-31 07:33:09', '2019-01-31 07:33:09', '', ''),
(30, 'Rasoa', 'antsoso', NULL, 'betafo', NULL, NULL, '112', 'Québec', 'Canada', '2019-01-31-12-03-50-Desert.jpg', 'dfdsfs', NULL, '+5644564', 'ericarisanjy20@gmail.comf', '2019-01-31 12:03:50', '2019-01-31 12:03:50', '', ''),
(34, 'fgdfhgfd', 'hfdhfdh', 534534, 'sdgsdg', NULL, NULL, '00110', 'Ontario', 'Canada', '2019-01-31-12-40-19-IMG_20181020_092829.jpg', 'hfgjhgfjfgj', NULL, '+456456', 'aa@alternateeve.com', '2019-01-31 12:40:19', '2019-01-31 12:40:19', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `agency_users`
--
-- Création :  lun. 28 jan. 2019 à 10:01
--

DROP TABLE IF EXISTS `agency_users`;
CREATE TABLE IF NOT EXISTS `agency_users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `agency_users`
--

INSERT INTO `agency_users` (`id`, `agency_id`, `user_id`) VALUES
(27, 28, 38),
(29, 30, 45),
(33, 34, 49);

-- --------------------------------------------------------

--
-- Structure de la table `attributes`
--
-- Création :  lun. 28 jan. 2019 à 10:01
--

DROP TABLE IF EXISTS `attributes`;
CREATE TABLE IF NOT EXISTS `attributes` (
  `attribute_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `attributes`
--

INSERT INTO `attributes` (`attribute_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '1', '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(2, '1', '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(3, '1', '2019-01-22 06:28:00', '2019-01-22 06:28:00');

-- --------------------------------------------------------

--
-- Structure de la table `attribute_options`
--
-- Création :  lun. 28 jan. 2019 à 10:01
--

DROP TABLE IF EXISTS `attribute_options`;
CREATE TABLE IF NOT EXISTS `attribute_options` (
  `attribute_option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) UNSIGNED DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`attribute_option_id`),
  KEY `idx_attribute_id` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `attribute_options`
--

INSERT INTO `attribute_options` (`attribute_option_id`, `attribute_id`, `sort_order`) VALUES
(19, 1, 1),
(20, 1, 2),
(21, 1, 3),
(22, 1, 4),
(23, 1, 5),
(24, 1, 6),
(25, 2, 1),
(26, 2, 2),
(27, 2, 3),
(28, 2, 4),
(29, 2, 5),
(30, 2, 6),
(31, 2, 7),
(32, 2, 8),
(33, 2, 9),
(34, 2, 10),
(35, 2, 11),
(36, 2, 12),
(37, 2, 13),
(38, 2, 14),
(39, 2, 15),
(40, 2, 16),
(41, 2, 17),
(42, 2, 18),
(43, 2, 19),
(44, 2, 20),
(45, 2, 21),
(46, 2, 22),
(47, 2, 23),
(48, 2, 24),
(49, 2, 25),
(50, 2, 26),
(51, 2, 27),
(52, 2, 28),
(53, 2, 29),
(54, 2, 30),
(55, 2, 31),
(56, 2, 32),
(57, 2, 33),
(58, 2, 34),
(59, 2, 35),
(60, 2, 36),
(61, 3, 1),
(62, 3, 2),
(63, 3, 3),
(64, 3, 4),
(65, 3, 5),
(66, 3, 6),
(67, 3, 7),
(68, 3, 8),
(69, 3, 9),
(70, 3, 10),
(71, 3, 11),
(72, 3, 12),
(73, 3, 13),
(74, 3, 14),
(75, 3, 15),
(76, 3, 16),
(77, 3, 17),
(78, 3, 18),
(79, 3, 19),
(80, 3, 20),
(81, 3, 21),
(82, 3, 22),
(83, 3, 23),
(84, 3, 24),
(85, 3, 25),
(86, 3, 26),
(87, 3, 27),
(88, 3, 28),
(89, 3, 29),
(90, 3, 30),
(91, 3, 31),
(92, 3, 32),
(93, 3, 33),
(94, 3, 34),
(95, 3, 35),
(96, 3, 36),
(97, 3, 37),
(98, 3, 38),
(99, 3, 39);

-- --------------------------------------------------------

--
-- Structure de la table `attribute_option_gender`
--
-- Création :  lun. 28 jan. 2019 à 10:01
--

DROP TABLE IF EXISTS `attribute_option_gender`;
CREATE TABLE IF NOT EXISTS `attribute_option_gender` (
  `attribute_option_gender_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) UNSIGNED DEFAULT NULL,
  `attribute_option_id` int(10) UNSIGNED DEFAULT NULL,
  `gender_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_option_gender_id`),
  KEY `idx_attribute_id` (`attribute_id`),
  KEY `idx_attribute_option_id` (`attribute_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `attribute_option_gender`
--

INSERT INTO `attribute_option_gender` (`attribute_option_gender_id`, `attribute_id`, `attribute_option_id`, `gender_id`) VALUES
(1, 2, 25, 2),
(2, 2, 26, 2),
(3, 2, 27, 2),
(4, 2, 28, 2),
(5, 2, 29, 2),
(6, 2, 30, 2),
(7, 2, 31, 2),
(8, 2, 32, 2),
(9, 2, 33, 2),
(10, 2, 34, 2),
(11, 2, 35, 2),
(12, 2, 36, 2),
(13, 2, 37, 2),
(14, 2, 38, 2),
(15, 2, 39, 2),
(16, 2, 40, 2),
(17, 2, 41, 2),
(18, 2, 42, 1),
(19, 2, 43, 1),
(20, 2, 44, 1),
(21, 2, 45, 1),
(22, 2, 46, 1),
(23, 2, 47, 1),
(24, 2, 48, 1),
(25, 2, 49, 1),
(26, 2, 50, 1),
(27, 2, 51, 1),
(28, 2, 52, 1),
(29, 2, 53, 1),
(30, 2, 54, 1),
(31, 2, 55, 1),
(32, 2, 56, 1),
(33, 2, 57, 1),
(34, 2, 58, 1),
(35, 2, 59, 1),
(36, 2, 60, 1),
(37, 3, 61, 2),
(38, 3, 62, 2),
(39, 3, 63, 2),
(40, 3, 64, 2),
(41, 3, 65, 2),
(42, 3, 66, 2),
(43, 3, 67, 2),
(44, 3, 68, 2),
(45, 3, 69, 2),
(46, 3, 70, 2),
(47, 3, 71, 2),
(48, 3, 72, 2),
(49, 3, 73, 2),
(50, 3, 74, 2),
(51, 3, 75, 2),
(52, 3, 76, 2),
(53, 3, 77, 2),
(54, 3, 78, 1),
(55, 3, 79, 1),
(56, 3, 80, 1),
(57, 3, 81, 1),
(58, 3, 82, 1),
(59, 3, 83, 1),
(60, 3, 84, 1),
(61, 3, 85, 1),
(62, 3, 86, 1),
(63, 3, 87, 1),
(64, 3, 88, 1),
(65, 3, 89, 1),
(66, 3, 90, 1),
(67, 3, 91, 1),
(68, 3, 92, 1),
(69, 3, 93, 1),
(70, 3, 94, 1),
(71, 3, 95, 1),
(72, 3, 96, 1),
(73, 3, 97, 1),
(74, 3, 98, 1),
(75, 3, 99, 1);

-- --------------------------------------------------------

--
-- Structure de la table `attribute_option_translations`
--
-- Création :  lun. 28 jan. 2019 à 10:01
--

DROP TABLE IF EXISTS `attribute_option_translations`;
CREATE TABLE IF NOT EXISTS `attribute_option_translations` (
  `attribute_option_translation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_option_id` int(10) UNSIGNED DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_option_translation_id`),
  KEY `idx_attribute_option_id` (`attribute_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `attribute_option_translations`
--

INSERT INTO `attribute_option_translations` (`attribute_option_translation_id`, `attribute_option_id`, `value`, `language_id`) VALUES
(1, 19, 'XS', 1),
(2, 19, 'XS', 2),
(3, 20, 'S', 1),
(4, 20, 'S', 2),
(5, 21, 'M', 1),
(6, 21, 'M', 2),
(7, 22, 'L', 1),
(8, 22, 'L', 2),
(9, 23, 'XL', 1),
(10, 23, 'XL', 2),
(11, 24, 'XXL', 1),
(12, 24, 'XXL', 2),
(13, 25, '34EU - 24US', 1),
(14, 25, '34EU - 24US', 2),
(15, 26, '35EU - 25US', 1),
(16, 26, '35EU - 25US', 2),
(17, 27, '36EU - 26US', 1),
(18, 27, '36EU - 26US', 2),
(19, 28, '37EU - 27US', 1),
(20, 28, '37EU - 27US', 2),
(21, 29, '38EU - 28US', 1),
(22, 29, '38EU - 28US', 2),
(23, 30, '39EU - 29US', 1),
(24, 30, '39EU - 29US', 2),
(25, 31, '40EU - 30US', 1),
(26, 31, '40EU - 30US', 2),
(27, 32, '41EU - 31US', 1),
(28, 32, '41EU - 31US', 2),
(29, 33, '42EU - 32US', 1),
(30, 33, '42EU - 32US', 2),
(31, 34, '43EU - 33US', 1),
(32, 34, '43EU - 33US', 2),
(33, 35, '44EU - 34US', 1),
(34, 35, '44EU - 34US', 2),
(35, 36, '45EU - 35US', 1),
(36, 36, '45EU - 35US', 2),
(37, 37, '46EU - 36US', 1),
(38, 37, '46EU - 36US', 2),
(39, 38, '47EU - 37US', 1),
(40, 38, '47EU - 37US', 2),
(41, 39, '48EU - 38US', 1),
(42, 39, '48EU - 38US', 2),
(43, 40, '49EU - 39US', 1),
(44, 40, '49EU - 39US', 2),
(45, 41, '50EU - 40US', 1),
(46, 41, '50EU - 40US', 2),
(47, 42, '34EU - 24US', 1),
(48, 42, '34EU - 24US', 2),
(49, 43, '35EU - 25US', 1),
(50, 43, '35EU - 25US', 2),
(51, 44, '36EU - 26US', 1),
(52, 44, '36EU - 26US', 2),
(53, 45, '37EU - 27US', 1),
(54, 45, '37EU - 27US', 2),
(55, 46, '38EU - 28US', 1),
(56, 46, '38EU - 28US', 2),
(57, 47, '39EU - 29US', 1),
(58, 47, '39EU - 29US', 2),
(59, 48, '40EU - 30US', 1),
(60, 48, '40EU - 30US', 2),
(61, 49, '41EU - 31US', 1),
(62, 49, '41EU - 31US', 2),
(63, 50, '42EU - 32US', 1),
(64, 50, '42EU - 32US', 2),
(65, 51, '43EU - 33US', 1),
(66, 51, '43EU - 33US', 2),
(67, 52, '44EU - 34US', 1),
(68, 52, '44EU - 34US', 2),
(69, 53, '45EU - 35US', 1),
(70, 53, '45EU - 35US', 2),
(71, 54, '46EU - 36US', 1),
(72, 54, '46EU - 36US', 2),
(73, 55, '47EU - 37US', 1),
(74, 55, '47EU - 37US', 2),
(75, 56, '48EU - 38US', 1),
(76, 56, '48EU - 38US', 2),
(77, 57, '49EU - 39US', 1),
(78, 57, '49EU - 39US', 2),
(79, 58, '50EU - 40US', 1),
(80, 58, '50EU - 40US', 2),
(81, 59, '51EU - 41US', 1),
(82, 59, '51EU - 41US', 2),
(83, 60, '52EU - 42US', 1),
(84, 60, '52EU - 42US', 2),
(85, 61, '35EU - 4US', 1),
(86, 61, '35EU - 4US', 2),
(87, 62, '35,5EU - 4,5US', 1),
(88, 62, '35,5EU - 4,5US', 2),
(89, 63, '36EU - 5US', 1),
(90, 63, '36EU - 5US', 2),
(91, 64, '36,5EU - 5,5US', 1),
(92, 64, '36,5EU - 5,5US', 2),
(93, 65, '37EU - 5,5US', 1),
(94, 65, '37EU - 5,5US', 2),
(95, 66, '37,5EU - 6US', 1),
(96, 66, '37,5EU - 6US', 2),
(97, 67, '38EU - 6,5US', 1),
(98, 67, '38EU - 6,5US', 2),
(99, 68, '38,5EU - 7US', 1),
(100, 68, '38,5EU - 7US', 2),
(101, 69, '39EU - 7,5US', 1),
(102, 69, '39EU - 7,5US', 2),
(103, 70, '39,5EU - 7,5US', 1),
(104, 70, '39,5EU - 7,5US', 2),
(105, 71, '40EU - 8US', 1),
(106, 71, '40EU - 8US', 2),
(107, 72, '40,5EU - 8,5US', 1),
(108, 72, '40,5EU - 8,5US', 2),
(109, 73, '41EU - 9US', 1),
(110, 73, '41EU - 9US', 2),
(111, 74, '41,5EU - 9,5US', 1),
(112, 74, '41,5EU - 9,5US', 2),
(113, 75, '42EU - 9,5US', 1),
(114, 75, '42EU - 9,5US', 2),
(115, 76, '42,5EU - 10US', 1),
(116, 76, '42,5EU - 10US', 2),
(117, 77, '43EU - 10,5US', 1),
(118, 77, '43EU - 10,5US', 2),
(119, 78, '39EU - 6US', 1),
(120, 78, '39EU - 6US', 2),
(121, 79, '39,5EU - 6,5US', 1),
(122, 79, '39,5EU - 6,5US', 2),
(123, 80, '40EU - 7US', 1),
(124, 80, '40EU - 7US', 2),
(125, 81, '40,5EU - 7,5US', 1),
(126, 81, '40,5EU - 7,5US', 2),
(127, 82, '41EU - 8US', 1),
(128, 82, '41EU - 8US', 2),
(129, 83, '41,5EU - 8US', 1),
(130, 83, '41,5EU - 8US', 2),
(131, 84, '42EU - 8,5US', 1),
(132, 84, '42EU - 8,5US', 2),
(133, 85, '42,5EU - 9US', 1),
(134, 85, '42,5EU - 9US', 2),
(135, 86, '43EU - 9,5US', 1),
(136, 86, '43EU - 9,5US', 2),
(137, 87, '43,5EU - 9,5US', 1),
(138, 87, '43,5EU - 9,5US', 2),
(139, 88, '44EU - 10US', 1),
(140, 88, '44EU - 10US', 2),
(141, 89, '44,5EU - 10,5US', 1),
(142, 89, '44,5EU - 10,5US', 2),
(143, 90, '45EU - 11US', 1),
(144, 90, '45EU - 11US', 2),
(145, 91, '45,5EU - 11,5US', 1),
(146, 91, '45,5EU - 11,5US', 2),
(147, 92, '46EU - 11,5US', 1),
(148, 92, '46EU - 11,5US', 2),
(149, 93, '46,5EU - 12US', 1),
(150, 93, '46,5EU - 12US', 2),
(151, 94, '47EU - 12,5US', 1),
(152, 94, '47EU - 12,5US', 2),
(153, 95, '47,5EU - 13US', 1),
(154, 95, '47,5EU - 13US', 2),
(155, 96, '48EU - 13,5US', 1),
(156, 96, '48EU - 13,5US', 2),
(157, 97, '48,5EU - 14US', 1),
(158, 97, '48,5EU - 14US', 2),
(159, 98, '49EU - 14,5US', 1),
(160, 98, '49EU - 14,5US', 2),
(161, 99, '49,5EU - 15US', 1),
(162, 99, '49,5EU - 15US', 2);

-- --------------------------------------------------------

--
-- Structure de la table `attribute_translations`
--
-- Création :  lun. 28 jan. 2019 à 10:01
--

DROP TABLE IF EXISTS `attribute_translations`;
CREATE TABLE IF NOT EXISTS `attribute_translations` (
  `attribute_translation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_translation_id`),
  KEY `idx_attribute_id` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `attribute_translations`
--

INSERT INTO `attribute_translations` (`attribute_translation_id`, `attribute_id`, `name`, `language_id`) VALUES
(1, 1, 'Veste/Chemises', 1),
(2, 1, 'Jacket/Shirts', 2),
(3, 2, 'Pantalons', 1),
(4, 2, 'Pants', 2),
(5, 3, 'Chaussures', 1),
(6, 3, 'Shoes', 2);

-- --------------------------------------------------------

--
-- Structure de la table `event`
--
-- Création :  lun. 28 jan. 2019 à 10:01
-- Dernière modification :  ven. 08 fév. 2019 à 08:49
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `event_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `agency_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description_fr_event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_en_event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_hour_event` time NOT NULL,
  `end_hour_event` time NOT NULL,
  `picture_event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `idx_agency_id` (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`event_id`, `agency_id`, `name`, `customer`, `location_event`, `zip_event`, `country_event`, `zone_event`, `start_date`, `end_date`, `description_fr_event`, `description_en_event`, `start_hour_event`, `end_hour_event`, `picture_event`, `created_at`, `updated_at`) VALUES
(1, 34, 'Première évènement', 'Tout le monde', 'Mahafaly', '110', 'Madagascar', 'Vakinankaratra', '2019-02-04', '2019-02-19', 'Aucun', 'Aucun', '10:31:00', '18:00:00', '2018-12-04-13-21-46-football-wallpapers-31082-3076555.jpg', NULL, NULL),
(2, 28, 'Deuxième évènement', 'Des étudiants', 'Tombontsoa', '110', 'Madagascar', 'Vakinankaratra', '2019-02-11', '2019-02-15', 'Aucun', 'Aucun', '08:00:00', '17:30:00', '2019-01-31-12-40-19-IMG_20181020_092829.jpp', NULL, NULL),
(3, 34, 'Troisième évènement', 'Tout le monde', 'Mahafaly', '110', 'Madagascar', 'Vakinankaratra', '2019-02-21', '2019-03-22', 'Aucun', 'Aucun', '10:31:00', '18:00:00', '2018-12-04-13-21-46-football-wallpapers-31082-3076555.jpg', NULL, NULL),
(4, 28, 'Quatrième évènement', 'Des étudiants', 'Tombontsoa', '110', 'Madagascar', 'Vakinankaratra', '2019-02-14', '2019-04-25', 'Aucun', 'Aucun', '08:00:00', '17:30:00', '2019-01-31-12-40-19-IMG_20181020_092829.jpp', NULL, NULL),
(5, 34, 'Notre évènement', 'Nos clients', 'Mahafaly', '110', 'Madagascar', 'Vakinankaratra', '2019-02-01', '2019-02-28', 'C\'est estimation temporelle pour achéver le projet HelloStaff. Il faut donc bosser!!!', 'It\'s our time estimation to finish the HelloStaff project! So, we must boss!!!', '09:00:00', '18:00:00', '2019-01-31-12-40-19-IMG_20181020_092829.jpp', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `event_staff`
--
-- Création :  lun. 28 jan. 2019 à 10:01
--

DROP TABLE IF EXISTS `event_staff`;
CREATE TABLE IF NOT EXISTS `event_staff` (
  `event_staff_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `event_id` int(10) UNSIGNED NOT NULL,
  `post` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `necessary_staff` int(11) NOT NULL,
  `location_event_staff` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_event_staff` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_event_staff` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_event_staff` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_event_staff` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hour_rate` int(11) NOT NULL,
  `description_fr_event_staff` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_en_event_staff` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` double NOT NULL,
  `per_diem` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`event_staff_id`),
  KEY `idx_event_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `event_staff_date`
--
-- Création :  lun. 28 jan. 2019 à 10:01
--

DROP TABLE IF EXISTS `event_staff_date`;
CREATE TABLE IF NOT EXISTS `event_staff_date` (
  `event_staff_date_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `event_staff_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `start_hour_event_staff_date` int(11) NOT NULL,
  `end_hour_event_staff_date` time NOT NULL,
  `color_event_staff_date` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`event_staff_date_id`),
  KEY `idx_event_staff_id` (`event_staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gender`
--
-- Création :  lun. 28 jan. 2019 à 10:01
--

DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `gender_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gender`
--

INSERT INTO `gender` (`gender_id`, `name`) VALUES
(1, 'Homme'),
(2, 'Femme');

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--
-- Création :  lun. 21 jan. 2019 à 15:10
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `job_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`job_id`, `icon`, `created_by`, `created_at`, `updated_at`) VALUES
(77, 'megaphone.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(78, 'user.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(79, 'Group_2254.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(80, 'hostess.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(81, 'coordinating-people.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(82, 'settigns.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(83, 'chinese-food-bowl-from-side-view-and-chopsticks.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(84, 'folding-map.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(85, 'photo-camera.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(86, 'github.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(87, 'serving-drinks.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(88, 'liquid-soap.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(89, 'speech.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(90, 'dj-playing-records.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(91, 'magician.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(92, 'theatre-masks.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(93, 'black-shoes.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(94, 'microphone.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(95, 'hand-writing-with-ballpen.svg', 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00');

-- --------------------------------------------------------

--
-- Structure de la table `job_translation`
--
-- Création :  lun. 28 jan. 2019 à 10:00
--

DROP TABLE IF EXISTS `job_translation`;
CREATE TABLE IF NOT EXISTS `job_translation` (
  `job_translation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `job_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`job_translation_id`),
  KEY `idx_job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `job_translation`
--

INSERT INTO `job_translation` (`job_translation_id`, `job_id`, `name`, `language_id`) VALUES
(1, 77, 'Ambassadeur de marque', 1),
(2, 78, 'Chef d\'équipe', 1),
(3, 79, 'Spécialiste Produit', 1),
(4, 80, 'Hôte', 1),
(5, 81, 'Coordinateur de terrain', 1),
(6, 82, 'Equipe de montage/démontage', 1),
(7, 83, 'Dégustation', 1),
(8, 84, 'Distribution de dépliants', 1),
(9, 85, 'Photographe', 1),
(10, 86, 'Mascotte', 1),
(11, 87, 'Serveur', 1),
(12, 88, 'Plongueur', 1),
(13, 89, 'Maître de cérémonie', 1),
(14, 90, 'DJ', 1),
(15, 91, 'Magicien', 1),
(16, 92, 'Acteur', 1),
(17, 93, 'Danseur', 1),
(18, 94, 'Chanteur', 1),
(19, 95, 'Caricaturiste', 1),
(20, 77, 'Brand ambassador', 2),
(21, 78, 'Leader', 2),
(22, 79, 'Product Specialist', 2),
(23, 80, 'Host', 2),
(24, 81, 'Field coordinator', 2),
(25, 82, 'Assembly / disassembly team', 2),
(26, 83, 'Tasting', 2),
(27, 84, 'Distribution of leaflets', 2),
(28, 85, 'Photographer', 2),
(29, 86, 'Mascot', 2),
(30, 87, 'Waiter', 2),
(31, 88, 'Diver', 2),
(32, 89, 'Master of Ceremonies', 2),
(33, 90, 'DJ', 2),
(34, 91, 'Magician', 2),
(35, 92, 'Actor', 2),
(36, 93, 'Dancer', 2),
(37, 94, 'Singer', 2),
(38, 95, 'Cartoonist', 2);

-- --------------------------------------------------------

--
-- Structure de la table `language`
--
-- Création :  lun. 28 jan. 2019 à 10:01
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `language_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `language`
--

INSERT INTO `language` (`language_id`, `language_name`, `language_code`) VALUES
(1, 'French', 'fr'),
(2, 'English', 'en');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--
-- Création :  lun. 21 jan. 2019 à 09:26
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_09_24_112729_create_staff_jobs_table', 1),
(4, '2018_09_24_121508_create_staff_languages_table', 1),
(5, '2018_09_24_121901_create_staff_certifications_table', 1),
(6, '2018_09_24_130405_create_staff_attributs_table', 1),
(7, '2018_09_24_134519_create_staff_remunerations_table', 1),
(8, '2018_09_24_134823_create_staff_mobilities_table', 1),
(9, '2018_09_25_064012_create_table_language', 1),
(10, '2018_09_25_071339_create_attributes_table', 1),
(11, '2018_09_25_071459_create_attribute_translations_table', 1),
(12, '2018_09_25_071840_create_attribute_options_table', 1),
(13, '2018_09_25_072019_create_attribute_option_translations_table', 1),
(14, '2018_09_25_072438_create_staff_attribute_options_table', 1),
(15, '2018_09_27_121231_create_table_gender', 1),
(16, '2018_09_27_121300_create_table_attribute_option_gender', 1),
(17, '2018_11_15_093720_add_smart_serve_to_staff_certifications', 1),
(18, '2018_11_15_113355_add_not_pronounced_to_staff_attributs', 1),
(19, '2019_01_02_122602_create_agency_table', 1),
(20, '2019_01_02_123916_create_agency_users_table', 1),
(21, '2019_01_02_130410_add_agency_phone_to_agency', 1),
(22, '2019_01_02_142431_add_agency_mail_to_agency', 1),
(23, '2019_01_23_100038_create_event_table', 2);

-- --------------------------------------------------------

--
-- Structure de la table `mobility`
--
-- Création :  lun. 28 jan. 2019 à 10:00
--

DROP TABLE IF EXISTS `mobility`;
CREATE TABLE IF NOT EXISTS `mobility` (
  `mobility_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`mobility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mobility`
--

INSERT INTO `mobility` (`mobility_id`, `created_by`, `created_at`, `updated_at`) VALUES
(41, 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(42, 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(43, 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(44, 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(45, 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(46, 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(47, 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00'),
(48, 1, '2019-01-22 06:28:00', '2019-01-22 06:28:00');

-- --------------------------------------------------------

--
-- Structure de la table `mobility_translation`
--
-- Création :  lun. 28 jan. 2019 à 10:00
--

DROP TABLE IF EXISTS `mobility_translation`;
CREATE TABLE IF NOT EXISTS `mobility_translation` (
  `mobility_translation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mobility_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`mobility_translation_id`),
  KEY `idx_mobility_id` (`mobility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mobility_translation`
--

INSERT INTO `mobility_translation` (`mobility_translation_id`, `mobility_id`, `name`, `language_id`) VALUES
(1, 41, 'Montréal centre', 1),
(2, 42, 'Est de Montréal', 1),
(3, 43, 'Ouest de Montréal', 1),
(4, 44, 'Rive-Sud de Montréal', 1),
(5, 45, 'Rive nord de Montréal', 1),
(6, 46, 'Région de Québec', 1),
(7, 47, 'Reste du Québec', 1),
(8, 48, 'Hors Québec', 1),
(9, 41, 'Montreal center', 2),
(10, 42, 'East of Montreal', 2),
(11, 43, 'West of Montreal', 2),
(12, 44, 'South Shore of Montreal', 2),
(13, 45, 'North Shore of Montreal', 2),
(14, 46, 'Quebec Region', 2),
(15, 47, 'Rest of Quebec', 2),
(16, 48, 'Outside Quebec', 2);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--
-- Création :  lun. 21 jan. 2019 à 15:10
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('mikianico@gmail.com', '$2y$10$AdXa.i3Pa4/ZPQnb9KTx5ONcPO4R3F1Q6ohBIUh1luQgDFVRRxtbe', '2019-01-23 08:29:10'),
('as@alternateeve.com', '$2y$10$rqLuVVsxNA.R.0Uo62weu.yLoQ7D663dSU2wfOaHAk/7xn0E62lzy', '2019-01-30 16:07:20');

-- --------------------------------------------------------

--
-- Structure de la table `staff`
--
-- Création :  lun. 21 jan. 2019 à 09:26
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `staff_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `kind` blob NOT NULL,
  `birthday` date NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `portrait_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `single_storey_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `staff`
--

INSERT INTO `staff` (`staff_id`, `user_id`, `kind`, `birthday`, `city`, `address`, `zip_code`, `source`, `portrait_pic`, `single_storey_pic`, `cv`) VALUES
(1, NULL, 0x31, '1991-02-02', 'fzefazefaz', 'fzaefazef', 'fazefaz', 'Parrainage', '2019-01-22-06-32-03-Alternateeve_Lab_Technology_26Dec2018.png', '2019-01-22-06-32-03-Alternateeve_Lab_Technology_26Dec2018.png', '2019-01-22-06-32-03-bootstrap.pdf'),
(2, NULL, 0x32, '1990-01-01', 'fafe', 'sqfe', 'sdfz', 'Réseaux sociaux', '2019-01-22-13-49-48-Profil.jpg', '2019-01-22-13-49-48-DSC01325.jpg', '2019-01-22-13-49-48-Vivre en Jésus.pdf'),
(3, NULL, 0x32, '1993-12-02', 'Montréal', '3331 AVENUE MARECHAL, APPARTEMENT 9', 'H3T1M8', 'Réseaux sociaux', '2019-01-29-11-22-50-4J9A4544-2.jpg', '', '2019-01-29-11-22-50-CV SALVA SEYDI.pdf'),
(4, NULL, 0x32, '1993-12-02', 'Montréal', '3331 AVENUE MARECHAL, APPARTEMENT 9', 'H3T1M8', 'Parrainage', '2019-01-29-13-08-10-Image2.jpg', '', ''),
(5, NULL, 0x31, '1991-09-18', 'Antsirabe', 'Mahazoarivo', '00110', 'Notre site web', '2019-01-30-11-44-16-IMG_20181020_092838.jpg', '2019-01-30-11-44-16-IMG_20181020_105638.jpg', ''),
(6, NULL, 0x31, '1992-02-02', 'eaeza', 'ezaeaz', '345', 'Parrainage', '2019-01-30-12-17-16-Penguins.jpg', '', ''),
(7, NULL, 0x31, '1990-02-03', 'Antsirabe', 'sfqsdsgd', 'xfds', 'Notre site web', '2019-01-30-12-26-24-Koala.jpg', '2019-01-30-12-26-24-Penguins.jpg', ''),
(8, NULL, 0x31, '1991-02-02', 'fdfsdf', 'fsdfsd', 'fdsfs', 'Parrainage', '', '', ''),
(9, NULL, 0x31, '1994-02-19', 'Antsirabe', 'Mahazoarivo', '00110', 'Notre site web', '2019-01-31-06-51-00-IMG_20181020_092838.jpg', '2019-01-31-06-51-00-irina-iriser-591828-unsplash.jpg', ''),
(10, 43, 0x31, '1992-01-02', 'Lyon', 'RT67', '678', 'Parrainage', '2019-01-31-11-44-35-Penguins.jpg', '2019-01-31-11-44-35-Koala.jpg', ''),
(11, 50, 0x31, '1990-03-03', 'Morondava', 'Sans Fil', '619', 'Parrainage', '2019-02-01-06-08-40-Koala.jpg', '2019-02-01-06-08-40-Penguins.jpg', '');

-- --------------------------------------------------------

--
-- Structure de la table `staff_attribut`
--
-- Création :  lun. 28 jan. 2019 à 10:00
--

DROP TABLE IF EXISTS `staff_attribut`;
CREATE TABLE IF NOT EXISTS `staff_attribut` (
  `staff_attribut_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `tattoo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `piercing` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `not_pronounced` blob NOT NULL,
  PRIMARY KEY (`staff_attribut_id`),
  KEY `idx_staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `staff_attribut`
--

INSERT INTO `staff_attribut` (`staff_attribut_id`, `staff_id`, `tattoo`, `piercing`, `not_pronounced`) VALUES
(1, 1, 'Visible', '', 0x30),
(2, 2, 'Aucun', 'Aucun', 0x30),
(3, 3, 'Aucun', 'Pas visible', 0x30),
(4, 4, '', '', 0x30),
(5, 5, 'Pas visible', 'Aucun', 0x30),
(6, 6, 'Aucun', '', 0x30),
(7, 7, '', 'Aucun', 0x30),
(8, 8, 'Pas visible', '', 0x30),
(9, 9, '', '', 0x30),
(10, 10, 'Pas visible', 'Aucun', 0x30),
(11, 11, 'Pas visible', 'Pas visible', 0x30);

-- --------------------------------------------------------

--
-- Structure de la table `staff_attribute_options`
--
-- Création :  lun. 28 jan. 2019 à 10:01
--

DROP TABLE IF EXISTS `staff_attribute_options`;
CREATE TABLE IF NOT EXISTS `staff_attribute_options` (
  `staff_attribute_option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_attribut_id` int(10) UNSIGNED DEFAULT NULL,
  `attribute_id` int(10) UNSIGNED DEFAULT NULL,
  `attribute_option_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`staff_attribute_option_id`),
  KEY `idx_staff_attribut_id` (`staff_attribut_id`),
  KEY `idx_attribute_id` (`attribute_id`),
  KEY `idxattribute_option_id` (`attribute_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `staff_attribute_options`
--

INSERT INTO `staff_attribute_options` (`staff_attribute_option_id`, `staff_attribut_id`, `attribute_id`, `attribute_option_id`) VALUES
(1, 1, 1, 19),
(2, 1, 2, 59),
(3, 1, 3, 79),
(4, 2, 1, 19),
(5, 2, 2, 41),
(6, 2, 3, 61),
(7, 3, 1, 22),
(8, 3, 2, 31),
(9, 3, 3, 69),
(10, 4, 1, NULL),
(11, 4, 2, NULL),
(12, 4, 3, NULL),
(13, 5, 1, 21),
(14, 5, 2, 46),
(15, 5, 3, 88),
(16, 6, 1, 20),
(17, 6, 2, 42),
(18, 6, 3, 79),
(19, 7, 1, 20),
(20, 7, 2, 42),
(21, 7, 3, 79),
(22, 8, 1, 19),
(23, 8, 2, 42),
(24, 8, 3, 78),
(25, 9, 1, 21),
(26, 9, 2, 44),
(27, 9, 3, 81),
(28, 10, 1, 22),
(29, 10, 2, 43),
(30, 10, 3, 80),
(31, 11, 1, 20),
(32, 11, 2, 44),
(33, 11, 3, 79);

-- --------------------------------------------------------

--
-- Structure de la table `staff_certifications`
--
-- Création :  lun. 28 jan. 2019 à 10:00
--

DROP TABLE IF EXISTS `staff_certifications`;
CREATE TABLE IF NOT EXISTS `staff_certifications` (
  `staff_certification_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `actra` blob NOT NULL,
  `food_handling` blob NOT NULL,
  `uda` blob NOT NULL,
  `have_car` blob NOT NULL,
  `driver_license` blob NOT NULL,
  `driver_license_truck` blob NOT NULL,
  `smart_serve` blob NOT NULL,
  PRIMARY KEY (`staff_certification_id`),
  KEY `idx_staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `staff_certifications`
--

INSERT INTO `staff_certifications` (`staff_certification_id`, `staff_id`, `actra`, `food_handling`, `uda`, `have_car`, `driver_license`, `driver_license_truck`, `smart_serve`) VALUES
(1, 1, 0x30, 0x30, 0x30, '', 0x31, '', 0x30),
(2, 2, 0x30, 0x31, 0x30, '', '', 0x31, 0x30),
(3, 3, 0x30, 0x30, 0x30, '', 0x30, '', 0x30),
(4, 4, 0x30, 0x30, 0x30, '', 0x30, '', 0x30),
(5, 5, 0x30, 0x31, 0x30, '', 0x31, 0x30, 0x30),
(6, 6, 0x30, 0x31, 0x30, '', 0x31, '', 0x30),
(7, 7, 0x30, 0x31, 0x30, '', 0x30, 0x31, 0x30),
(8, 8, 0x30, 0x31, 0x30, '', 0x31, '', 0x30),
(9, 9, 0x30, 0x31, 0x30, '', 0x30, 0x31, 0x30),
(10, 10, 0x31, 0x30, 0x30, '', 0x31, 0x31, 0x30),
(11, 11, 0x30, 0x31, 0x30, '', 0x30, 0x31, 0x30);

-- --------------------------------------------------------

--
-- Structure de la table `staff_jobs`
--
-- Création :  lun. 21 jan. 2019 à 15:11
--

DROP TABLE IF EXISTS `staff_jobs`;
CREATE TABLE IF NOT EXISTS `staff_jobs` (
  `staff_job_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `job_id` int(10) UNSIGNED DEFAULT NULL,
  `experience_year` int(11) NOT NULL,
  PRIMARY KEY (`staff_job_id`),
  KEY `idx_staff_id` (`staff_id`),
  KEY `idx_job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `staff_jobs`
--

INSERT INTO `staff_jobs` (`staff_job_id`, `staff_id`, `job_id`, `experience_year`) VALUES
(1, 1, 78, 3),
(2, 3, 80, 3),
(3, 4, 93, 0),
(4, 6, 79, 1),
(5, 7, 78, 3),
(6, 8, 78, 0),
(7, 10, 78, 1),
(8, 11, 86, 3);

-- --------------------------------------------------------

--
-- Structure de la table `staff_languages`
--
-- Création :  lun. 28 jan. 2019 à 10:00
--

DROP TABLE IF EXISTS `staff_languages`;
CREATE TABLE IF NOT EXISTS `staff_languages` (
  `staff_language_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`staff_language_id`),
  KEY `idx_staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `staff_languages`
--

INSERT INTO `staff_languages` (`staff_language_id`, `staff_id`, `name`, `level`) VALUES
(1, 1, 'Francais', 'Moyen'),
(2, 2, 'Portuguais', 'Débutant'),
(3, 3, 'Francais', 'Langue maternelle'),
(4, 3, 'Anglais', 'Courant'),
(5, 3, 'Allemand', 'Moyen'),
(6, 4, 'Francais', 'Langue maternelle'),
(7, 5, 'Francais', 'Courant'),
(8, 5, 'Anglais', 'Moyen'),
(9, 6, 'Portuguais', 'Courant'),
(10, 7, 'Russe', 'Moyen'),
(11, 8, 'Francais', 'Courant'),
(12, 9, 'Francais', 'Langue maternelle'),
(13, 9, 'Anglais', 'Moyen'),
(14, 10, 'Francais', 'Courant'),
(15, 10, 'Portuguais', 'Courant'),
(16, 11, 'Italien', 'Courant'),
(17, 11, 'Grec', 'Courant');

-- --------------------------------------------------------

--
-- Structure de la table `staff_mobility`
--
-- Création :  lun. 28 jan. 2019 à 10:01
--

DROP TABLE IF EXISTS `staff_mobility`;
CREATE TABLE IF NOT EXISTS `staff_mobility` (
  `staff_mobility_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `mobility_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`staff_mobility_id`),
  KEY `idx_staff_id` (`staff_id`),
  KEY `idx_mobility_id` (`mobility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `staff_mobility`
--

INSERT INTO `staff_mobility` (`staff_mobility_id`, `staff_id`, `mobility_id`) VALUES
(1, 1, 42),
(2, 2, 43),
(3, 3, 41),
(4, 4, 41),
(5, 5, 41),
(6, 6, 42),
(7, 7, 43),
(8, 8, 41),
(9, 9, 42),
(10, 10, 42),
(11, 10, 45),
(12, 11, 43),
(13, 11, 48);

-- --------------------------------------------------------

--
-- Structure de la table `staff_remunerations`
--
-- Création :  lun. 28 jan. 2019 à 10:00
--

DROP TABLE IF EXISTS `staff_remunerations`;
CREATE TABLE IF NOT EXISTS `staff_remunerations` (
  `staff_remuneration_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `price` int(11) NOT NULL,
  `nas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`staff_remuneration_id`),
  KEY `idx_staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `staff_remunerations`
--

INSERT INTO `staff_remunerations` (`staff_remuneration_id`, `staff_id`, `price`, `nas`) VALUES
(1, 1, 15, ''),
(2, 2, 18, ''),
(3, 3, 18, '122563489'),
(4, 4, 15, ''),
(5, 5, 16, '124515424'),
(6, 6, 16, '456789009'),
(7, 7, 15, ''),
(8, 8, 16, ''),
(9, 9, 16, ''),
(10, 10, 16, '456785445'),
(11, 11, 18, '786785670');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--
-- Création :  lun. 21 jan. 2019 à 09:26
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  KEY `idx_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `role_id`, `first_name`, `last_name`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(38, 2, 'Arisanjy', 'Eric', 'ericarisanjy20@gmail.com', '+56457453', NULL, '$2y$10$Wciqrx.cssWeaKLXZJlQFunl0tAsNA95Cdl5chg2LWXcYXgeZ6qJG', 'JDQ9kpYxyyv79DqZmKGVto4UuCa9UIkhm8GSTr1mhgVG8JVOSMMXC3eM2phV', '2019-01-31 07:33:09', '2019-01-31 07:33:09'),
(43, 1, 'Rakotonirina', 'Benja', 'rakotonirinabjr@gmail.com', '2345678765432345', NULL, '$2y$10$xRTvbrefObiMkSZfv4CPTOT8.s1ojyPQio5oppc4YL/zZeDjYL2Ga', 'cw2frAPkMli88mXh2QhcryfSFOIfG60JrKtLsHo6ekusM16EIrgkVpt9eIE0', '2019-01-31 11:44:35', '2019-01-31 11:44:35'),
(45, 2, 'rasolo', 'rasolo', 'ericarisanjy20@gmail.coms', '+5644564', NULL, '$2y$10$3y1AoBrnZihoLxUdGiTNJOpH0ZsRUHYo56eiROzufyT01BTviqVNC', 'QNbnFYPnTywuaaxy2GnBbeqvxyROF1QrRpwQND8q1gHBv4RN22WkJbM5bCrv', '2019-01-31 12:03:50', '2019-01-31 12:03:50'),
(49, 2, 'fgjdhjdfh', 'dtufj', 'aa@alternateeve.com', '+13543', '2019-01-31 12:41:12', '$2y$10$BMWFJjFpjDMCYh11WLYkMuCaqoAi8P4m9yKkjmUpZK.OOMkxRcoWa', 'tcoRVzeGNfiRKHhalJECT4N3FtyFPg1IlHoQhA9BBeFRRmVwRHNHdMXadw5O', '2019-01-31 12:40:20', '2019-01-31 12:41:12'),
(50, 1, 'rabe', 'tsito', 'er@alternateeve.com', '0344118293', NULL, '$2y$10$8R2ZwYxpJn6PdnfHe5NWLuC9CJrlM7EoAuMTh8PR.QOvntQiAGNRW', 'DrYFVFMFydbDU1agHceBEZQgzWS3ZEUYGUzJEKI0mclZKFShi0cCbiw61BEd', '2019-02-01 06:08:40', '2019-02-01 06:08:40');

-- --------------------------------------------------------

--
-- Structure de la table `user_role`
--
-- Création :  lun. 21 jan. 2019 à 09:26
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_role`
--

INSERT INTO `user_role` (`role_id`, `role_name`, `created_at`, `updated_at`) VALUES
(1, 'Staff', '2019-01-22 06:28:01', '2019-01-22 06:28:01'),
(2, 'Agency', '2019-01-22 06:28:01', '2019-01-22 06:28:01');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`attribute_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `attribute_option_gender`
--
ALTER TABLE `attribute_option_gender`
  ADD CONSTRAINT `attribute_option_gender_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_option_gender_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`attribute_option_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `attribute_option_translations`
--
ALTER TABLE `attribute_option_translations`
  ADD CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`attribute_option_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`attribute_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`agency_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `event_staff`
--
ALTER TABLE `event_staff`
  ADD CONSTRAINT `event_staff_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `event_staff_date`
--
ALTER TABLE `event_staff_date`
  ADD CONSTRAINT `event_staff_date_event_staff_id_foreign` FOREIGN KEY (`event_staff_id`) REFERENCES `event_staff` (`event_staff_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job_translation`
--
ALTER TABLE `job_translation`
  ADD CONSTRAINT `job_translation_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `mobility_translation`
--
ALTER TABLE `mobility_translation`
  ADD CONSTRAINT `mobility_translation_mobility_id_foreign` FOREIGN KEY (`mobility_id`) REFERENCES `mobility` (`mobility_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `staff_attribut`
--
ALTER TABLE `staff_attribut`
  ADD CONSTRAINT `staff_attribut_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `staff_attribute_options`
--
ALTER TABLE `staff_attribute_options`
  ADD CONSTRAINT `staff_attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staff_attribute_options_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`attribute_option_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staff_attribute_options_staff_attribut_id_foreign` FOREIGN KEY (`staff_attribut_id`) REFERENCES `staff_attribut` (`staff_attribut_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `staff_certifications`
--
ALTER TABLE `staff_certifications`
  ADD CONSTRAINT `staff_certifications_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `staff_jobs`
--
ALTER TABLE `staff_jobs`
  ADD CONSTRAINT `staff_jobs_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `staff_jobs_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `staff_languages`
--
ALTER TABLE `staff_languages`
  ADD CONSTRAINT `staff_languages_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `staff_mobility`
--
ALTER TABLE `staff_mobility`
  ADD CONSTRAINT `staff_mobility_mobility_id_foreign` FOREIGN KEY (`mobility_id`) REFERENCES `mobility` (`mobility_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `staff_mobility_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `staff_remunerations`
--
ALTER TABLE `staff_remunerations`
  ADD CONSTRAINT `staff_remunerations_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`role_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
