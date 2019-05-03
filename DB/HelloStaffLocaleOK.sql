-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.19 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Export de la structure de la base pour hello_staff
DROP DATABASE IF EXISTS `hello_staff`;
CREATE DATABASE IF NOT EXISTS `hello_staff` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hello_staff`;

-- Export de la structure de la table hello_staff. agency
DROP TABLE IF EXISTS `agency`;
CREATE TABLE IF NOT EXISTS `agency` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(10) unsigned DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `agency_phone_unique` (`phone`),
  UNIQUE KEY `agency_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.agency : ~8 rows (environ)
DELETE FROM `agency`;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` (`id`, `name`, `address`, `number`, `city`, `tps`, `tvq`, `postal_code`, `province`, `country`, `logo`, `description_fr`, `description_en`, `phone`, `email`, `created_at`, `updated_at`) VALUES
	(43, 'gfhfgh', 'dfhfgh', 534534, 'fhfgh', NULL, NULL, '00110', 'Ontario', 'Canada', '2019-02-12-14-39-42-cas_2.0_global.PNG', 'utyutyityi', NULL, '54245345', 'aa@alternateeve.com', '2019-02-01 15:55:47', '2019-02-12 14:39:42'),
	(44, 'STAR', 'AMbolo', NULL, 'Antsirabe', NULL, NULL, '110', 'Colombie-Britannique', 'Canada', '2019-02-01-14-56-01-Koala.jpg', 'dsfsdgze', NULL, '5645635356', 'ericarisanjy20@gmail.com', '2019-02-01 15:56:01', '2019-02-01 15:56:01'),
	(45, 'MHV', '3486 Coloniale Avenue', 123445, 'Montreal', NULL, NULL, 'H2X2Y4', 'Québec', 'Canada', '2019-02-04-21-59-03-Capture d’écran 2019-02-04 à 16.55.23.png', 'bla bla bla', NULL, '5146496664', 'lussiezthomas06@gmail.com', '2019-02-04 22:59:03', '2019-02-04 22:59:03'),
	(46, 'test test', 'testest', 132456, 'testset', NULL, NULL, '12120', 'Colombie-Britannique', 'Canada', '2019-02-06-08-06-24-cas actualiser resultats.PNG', 'testset', NULL, '5646546', 'mr@alternateeve.com', '2019-02-06 09:06:24', '2019-02-06 09:06:24'),
	(47, 'aur', '31 rue lavoisier', 123546, 'paris', '012365478956412', '0123654789564124', '112', 'Québec', 'Canada', '2019-02-07-06-58-25-000338459_illustration_large.jpg', 'society', NULL, '3356987', 'aur@gmail.com', '2019-02-07 07:58:25', '2019-02-07 07:58:25'),
	(48, 'staff', 'paris', 123445, 'paris', '145879652312523', '1458796523125236', '11', 'Québec', 'Canada', '2019-02-07-07-12-28-000338459_illustration_large.jpg', 'society', NULL, '12365478', 'farahtianah@gmail.com', '2019-02-07 08:12:28', '2019-02-07 08:12:28'),
	(49, 'SEYDI', '3331 AVENUE MARECHAL, APPARTEMENT 9', NULL, 'Montréal', NULL, NULL, 'H3T1M8', 'Québec', 'Canada', '2019-02-11-17-31-59-logo.jpg', 'Entreprise IT', NULL, '+5142358974', 'seydisalva@gmail.com', '2019-02-11 18:31:59', '2019-02-11 18:31:59'),
	(50, '123thomas', '3486 Coloniale Avenue', NULL, 'Montreal', NULL, NULL, 'H2X2Y4', 'Québec', 'Canada', '2019-02-11-21-35-11-HelloStaff_LOGO_favicon_(standard).png', 'blabla', NULL, '5146496663', 'paulbaysse@yahoo.com', '2019-02-11 22:35:11', '2019-02-11 22:35:11');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. agency_users
DROP TABLE IF EXISTS `agency_users`;
CREATE TABLE IF NOT EXISTS `agency_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agency_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_agency_id` (`agency_id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `agency_users_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `agency_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.agency_users : ~9 rows (environ)
DELETE FROM `agency_users`;
/*!40000 ALTER TABLE `agency_users` DISABLE KEYS */;
INSERT INTO `agency_users` (`id`, `agency_id`, `user_id`) VALUES
	(50, 44, 69),
	(51, 45, 70),
	(52, 46, 71),
	(53, 47, 74),
	(54, 48, 75),
	(55, 49, 76),
	(56, 50, 77),
	(57, 43, 67),
	(58, 43, 68);
/*!40000 ALTER TABLE `agency_users` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. attributes
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE IF NOT EXISTS `attributes` (
  `attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.attributes : ~3 rows (environ)
DELETE FROM `attributes`;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` (`attribute_id`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, '1', '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(2, '1', '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(3, '1', '2019-01-22 07:28:00', '2019-01-22 07:28:00');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. attribute_options
DROP TABLE IF EXISTS `attribute_options`;
CREATE TABLE IF NOT EXISTS `attribute_options` (
  `attribute_option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`attribute_option_id`),
  KEY `idx_attribute_id` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.attribute_options : ~81 rows (environ)
DELETE FROM `attribute_options`;
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `attribute_options` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. attribute_option_gender
DROP TABLE IF EXISTS `attribute_option_gender`;
CREATE TABLE IF NOT EXISTS `attribute_option_gender` (
  `attribute_option_gender_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned DEFAULT NULL,
  `attribute_option_id` int(10) unsigned DEFAULT NULL,
  `gender_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_option_gender_id`),
  KEY `idx_attribute_id` (`attribute_id`),
  KEY `idx_attribute_option_id` (`attribute_option_id`),
  CONSTRAINT `attribute_option_gender_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_option_gender_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`attribute_option_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.attribute_option_gender : ~75 rows (environ)
DELETE FROM `attribute_option_gender`;
/*!40000 ALTER TABLE `attribute_option_gender` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `attribute_option_gender` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. attribute_option_translations
DROP TABLE IF EXISTS `attribute_option_translations`;
CREATE TABLE IF NOT EXISTS `attribute_option_translations` (
  `attribute_option_translation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_option_id` int(10) unsigned DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_option_translation_id`),
  KEY `idx_attribute_option_id` (`attribute_option_id`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`attribute_option_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.attribute_option_translations : ~162 rows (environ)
DELETE FROM `attribute_option_translations`;
/*!40000 ALTER TABLE `attribute_option_translations` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `attribute_option_translations` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. attribute_translations
DROP TABLE IF EXISTS `attribute_translations`;
CREATE TABLE IF NOT EXISTS `attribute_translations` (
  `attribute_translation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_translation_id`),
  KEY `idx_attribute_id` (`attribute_id`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.attribute_translations : ~6 rows (environ)
DELETE FROM `attribute_translations`;
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
INSERT INTO `attribute_translations` (`attribute_translation_id`, `attribute_id`, `name`, `language_id`) VALUES
	(1, 1, 'Veste/Chemises', 1),
	(2, 1, 'Jacket/Shirts', 2),
	(3, 2, 'Pantalons', 1),
	(4, 2, 'Pants', 2),
	(5, 3, 'Chaussures', 1),
	(6, 3, 'Shoes', 2);
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. event
DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agency_id` int(10) unsigned NOT NULL,
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
  PRIMARY KEY (`id`),
  KEY `idx_agency_id` (`agency_id`),
  CONSTRAINT `event_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.event : ~2 rows (environ)
DELETE FROM `event`;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` (`id`, `agency_id`, `name`, `customer`, `location_event`, `zip_event`, `country_event`, `zone_event`, `start_date`, `end_date`, `description_fr_event`, `description_en_event`, `start_hour_event`, `end_hour_event`, `picture_event`, `created_at`, `updated_at`) VALUES
	(5, 43, 'aaaaaa', 'aaaaaa', 'aaaa', '5424', 'Québec', 'blabla', '2019-02-16', '2019-02-17', 'hhgh', NULL, '01:00:00', '01:00:00', '2019-02-15-08-59-07-cas_d\'utilisation.PNG', '2019-02-15 08:59:07', '2019-02-15 08:59:07'),
	(6, 43, 'sssssss', 'sssss', 'ssss', '142', 'Colombie-Britannique', 'blabla', '2019-02-15', '2019-02-16', 'gfdhdfh', NULL, '01:00:00', '01:00:00', '2019-02-15-09-09-53-cas_d\'utilisation.PNG', '2019-02-15 09:09:53', '2019-02-15 09:09:53');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. event_manage_by
DROP TABLE IF EXISTS `event_manage_by`;
CREATE TABLE IF NOT EXISTS `event_manage_by` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_event_id` (`event_id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `event_manage_by_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_manage_by_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.event_manage_by : ~2 rows (environ)
DELETE FROM `event_manage_by`;
/*!40000 ALTER TABLE `event_manage_by` DISABLE KEYS */;
INSERT INTO `event_manage_by` (`id`, `event_id`, `user_id`) VALUES
	(5, 5, 67),
	(6, 6, 67);
/*!40000 ALTER TABLE `event_manage_by` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. event_staff
DROP TABLE IF EXISTS `event_staff`;
CREATE TABLE IF NOT EXISTS `event_staff` (
  `event_staff_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
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
  KEY `idx_event_id` (`event_id`),
  CONSTRAINT `event_staff_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.event_staff : ~2 rows (environ)
DELETE FROM `event_staff`;
/*!40000 ALTER TABLE `event_staff` DISABLE KEYS */;
INSERT INTO `event_staff` (`event_staff_id`, `event_id`, `post`, `necessary_staff`, `location_event_staff`, `zip_event_staff`, `country_event_staff`, `zone_event_staff`, `color_event_staff`, `hour_rate`, `description_fr_event_staff`, `description_en_event_staff`, `distance`, `per_diem`, `created_at`, `updated_at`) VALUES
	(5, 5, 'Modèle Promotionnel', 3, 'fdfsd', '452', 'Colombie-Britannique', 'Montréal centre-ville', 'linear-gradient(#f44236, #f44436, #f48f36)', 13, 'fgdfgfd', NULL, 35, 535, '2019-02-15 08:59:07', '2019-02-15 08:59:07'),
	(6, 6, 'Modèle Promotionnel', 2, 'hfdh', '2445', 'Alberta', 'Montréal centre-ville', 'linear-gradient(#1fa548, #21ffaa)', 14, 'gfdhfdhgk', NULL, 2545, 24242, '2019-02-15 09:09:53', '2019-02-15 09:09:53');
/*!40000 ALTER TABLE `event_staff` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. event_staff_date
DROP TABLE IF EXISTS `event_staff_date`;
CREATE TABLE IF NOT EXISTS `event_staff_date` (
  `event_staff_date_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_staff_id` int(10) unsigned NOT NULL,
  `start_hour_event_staff_date` time NOT NULL,
  `end_hour_event_staff_date` time NOT NULL,
  `color_event_staff_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  PRIMARY KEY (`event_staff_date_id`),
  KEY `idx_event_staff_id` (`event_staff_id`),
  CONSTRAINT `event_staff_date_event_staff_id_foreign` FOREIGN KEY (`event_staff_id`) REFERENCES `event_staff` (`event_staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.event_staff_date : ~4 rows (environ)
DELETE FROM `event_staff_date`;
/*!40000 ALTER TABLE `event_staff_date` DISABLE KEYS */;
INSERT INTO `event_staff_date` (`event_staff_date_id`, `event_staff_id`, `start_hour_event_staff_date`, `end_hour_event_staff_date`, `color_event_staff_date`, `created_at`, `updated_at`, `date_start`, `date_end`) VALUES
	(3, 5, '01:50:00', '13:50:00', '#36ccb5', '2019-02-15 08:59:07', '2019-02-15 08:59:07', '2019-02-15', '2019-02-15'),
	(4, 5, '01:00:00', '01:00:00', '#36ccb5', '2019-02-15 08:59:07', '2019-02-15 08:59:07', '2019-02-10', '2019-02-17'),
	(5, 6, '01:50:00', '13:50:00', '#36ccb5', '2019-02-15 09:09:53', '2019-02-15 09:09:53', '2019-02-15', '2019-02-15'),
	(6, 6, '01:00:00', '01:00:00', '#36ccb5', '2019-02-15 09:09:53', '2019-02-15 09:09:53', '2019-02-09', '2019-02-16');
/*!40000 ALTER TABLE `event_staff_date` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. gender
DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `gender_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.gender : ~2 rows (environ)
DELETE FROM `gender`;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` (`gender_id`, `name`) VALUES
	(1, 'Homme'),
	(2, 'Femme');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.jobs : ~19 rows (environ)
DELETE FROM `jobs`;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`job_id`, `icon`, `created_by`, `created_at`, `updated_at`) VALUES
	(77, 'megaphone.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(78, 'user.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(79, 'Group_2254.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(80, 'hostess.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(81, 'coordinating-people.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(82, 'settigns.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(83, 'chinese-food-bowl-from-side-view-and-chopsticks.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(84, 'folding-map.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(85, 'photo-camera.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(86, 'github.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(87, 'serving-drinks.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(88, 'liquid-soap.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(89, 'speech.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(90, 'dj-playing-records.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(91, 'magician.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(92, 'theatre-masks.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(93, 'black-shoes.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(94, 'microphone.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(95, 'hand-writing-with-ballpen.svg', 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. job_translation
DROP TABLE IF EXISTS `job_translation`;
CREATE TABLE IF NOT EXISTS `job_translation` (
  `job_translation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`job_translation_id`),
  KEY `idx_job_id` (`job_id`),
  CONSTRAINT `job_translation_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.job_translation : ~38 rows (environ)
DELETE FROM `job_translation`;
/*!40000 ALTER TABLE `job_translation` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `job_translation` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. language
DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.language : ~2 rows (environ)
DELETE FROM `language`;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` (`language_id`, `language_name`, `language_code`) VALUES
	(1, 'French', 'fr'),
	(2, 'English', 'en');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.migrations : ~31 rows (environ)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
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
	(23, '2019_01_23_100038_create_event_table', 2),
	(24, '2019_02_08_121718_edit_user_id_in_table_users', 3),
	(25, '2019_02_08_125633_edit_agency_id_in_table_agency', 3),
	(26, '2019_02_09_074015_update_agency_users_add_foreign_key', 3),
	(27, '2019_02_09_075103_update_staff_users_foreign_key', 3),
	(28, '2019_02_12_084132_update_table_event', 4),
	(29, '2019_02_12_084345_update_table_event_staff', 4),
	(30, '2019_02_12_084408_update_table_event_staff_date', 4),
	(31, '2019_02_12_111916_create_table_event_manage_by', 5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. mobility
DROP TABLE IF EXISTS `mobility`;
CREATE TABLE IF NOT EXISTS `mobility` (
  `mobility_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`mobility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.mobility : ~11 rows (environ)
DELETE FROM `mobility`;
/*!40000 ALTER TABLE `mobility` DISABLE KEYS */;
INSERT INTO `mobility` (`mobility_id`, `created_by`, `created_at`, `updated_at`) VALUES
	(41, 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(42, 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(43, 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(44, 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(45, 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(46, 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(47, 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(48, 1, '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(49, 1, '2019-01-31 22:00:00', '2019-01-31 22:00:00'),
	(50, 1, '2019-01-31 22:00:00', '2019-01-31 22:00:00'),
	(51, 1, '2019-01-31 22:00:00', '2019-01-31 22:00:00');
/*!40000 ALTER TABLE `mobility` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. mobility_translation
DROP TABLE IF EXISTS `mobility_translation`;
CREATE TABLE IF NOT EXISTS `mobility_translation` (
  `mobility_translation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobility_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`mobility_translation_id`),
  KEY `idx_mobility_id` (`mobility_id`),
  CONSTRAINT `mobility_translation_mobility_id_foreign` FOREIGN KEY (`mobility_id`) REFERENCES `mobility` (`mobility_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.mobility_translation : ~0 rows (environ)
DELETE FROM `mobility_translation`;
/*!40000 ALTER TABLE `mobility_translation` DISABLE KEYS */;
INSERT INTO `mobility_translation` (`mobility_translation_id`, `mobility_id`, `name`, `language_id`) VALUES
	(1, 41, 'Montréal centre', 1),
	(2, 42, 'Ville de Montréal', 1),
	(3, 43, 'Longueuil/Rive sud', 1),
	(4, 44, 'Rive-Sud de Montréal', 1),
	(5, 45, 'Rive nord de Montréal', 1),
	(6, 46, 'Québec city et ses alentours', 1),
	(7, 47, 'Reste du Québec', 1),
	(8, 48, 'Laval/Rive nord', 1),
	(9, 41, 'Montreal center', 2),
	(10, 42, 'City of Montreal', 2),
	(11, 43, 'Longueuil/South Shore', 2),
	(12, 44, 'South Shore of Montreal', 2),
	(13, 45, 'North Shore of Montreal', 2),
	(14, 46, 'Quebec city area', 2),
	(15, 47, 'Quebec area', 2),
	(16, 48, 'Laval/North Shore', 2),
	(17, 49, 'Toronto et ses alentours', 1),
	(18, 50, 'Ottawa et ses alentours', 1),
	(19, 51, 'Autres régions', 1),
	(20, 49, 'Greater Toronto area', 2),
	(21, 50, 'Ottawa area', 2),
	(22, 51, 'Others areas', 2);
/*!40000 ALTER TABLE `mobility_translation` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.password_resets : ~4 rows (environ)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
	('mikianico@gmail.com', '$2y$10$AdXa.i3Pa4/ZPQnb9KTx5ONcPO4R3F1Q6ohBIUh1luQgDFVRRxtbe', '2019-01-23 09:29:10'),
	('as@alternateeve.com', '$2y$10$rqLuVVsxNA.R.0Uo62weu.yLoQ7D663dSU2wfOaHAk/7xn0E62lzy', '2019-01-30 17:07:20'),
	('ericarisanjy20@gmail.com', '$2y$10$jGh96DmC5NGGre9I9nszjuXBR2FtQ.P.j52xgWouOz0lAnLB6oh6u', '2019-02-01 09:20:47'),
	('er@alternateeve.com', '$2y$10$C9wx2IiVYhNWziQJRdAOReXmTY7Ce8M9UD1txgcJIkhBF2EpRLU1C', '2019-02-01 09:25:33');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. staff
DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `staff_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
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
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `staff_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.staff : ~13 rows (environ)
DELETE FROM `staff`;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` (`staff_id`, `user_id`, `kind`, `birthday`, `city`, `address`, `zip_code`, `source`, `portrait_pic`, `single_storey_pic`, `cv`) VALUES
	(1, NULL, _binary 0x31, '1991-02-02', 'fzefazefaz', 'fzaefazef', 'fazefaz', 'Parrainage', '2019-01-22-06-32-03-Alternateeve_Lab_Technology_26Dec2018.png', '2019-01-22-06-32-03-Alternateeve_Lab_Technology_26Dec2018.png', '2019-01-22-06-32-03-bootstrap.pdf'),
	(2, NULL, _binary 0x32, '1990-01-01', 'fafe', 'sqfe', 'sdfz', 'Réseaux sociaux', '2019-01-22-13-49-48-Profil.jpg', '2019-01-22-13-49-48-DSC01325.jpg', '2019-01-22-13-49-48-Vivre en Jésus.pdf'),
	(3, NULL, _binary 0x32, '1993-12-02', 'Montréal', '3331 AVENUE MARECHAL, APPARTEMENT 9', 'H3T1M8', 'Réseaux sociaux', '2019-01-29-11-22-50-4J9A4544-2.jpg', '', '2019-01-29-11-22-50-CV SALVA SEYDI.pdf'),
	(4, NULL, _binary 0x32, '1993-12-02', 'Montréal', '3331 AVENUE MARECHAL, APPARTEMENT 9', 'H3T1M8', 'Parrainage', '2019-01-29-13-08-10-Image2.jpg', '', ''),
	(5, NULL, _binary 0x31, '1991-09-18', 'Antsirabe', 'Mahazoarivo', '00110', 'Notre site web', '2019-01-30-11-44-16-IMG_20181020_092838.jpg', '2019-01-30-11-44-16-IMG_20181020_105638.jpg', ''),
	(6, NULL, _binary 0x31, '1992-02-02', 'eaeza', 'ezaeaz', '345', 'Parrainage', '2019-01-30-12-17-16-Penguins.jpg', '', ''),
	(7, NULL, _binary 0x31, '1990-02-03', 'Antsirabe', 'sfqsdsgd', 'xfds', 'Notre site web', '2019-01-30-12-26-24-Koala.jpg', '2019-01-30-12-26-24-Penguins.jpg', ''),
	(8, NULL, _binary 0x31, '1991-02-02', 'fdfsdf', 'fsdfsd', 'fdsfs', 'Parrainage', '', '', ''),
	(9, NULL, _binary 0x31, '1994-02-19', 'Antsirabe', 'Mahazoarivo', '00110', 'Notre site web', '2019-01-31-06-51-00-IMG_20181020_092838.jpg', '2019-01-31-06-51-00-irina-iriser-591828-unsplash.jpg', ''),
	(10, NULL, _binary 0x31, '1992-01-02', 'Lyon', 'RT67', '678', 'Parrainage', '2019-01-31-11-44-35-Penguins.jpg', '2019-01-31-11-44-35-Koala.jpg', ''),
	(11, NULL, _binary 0x31, '1990-03-03', 'Morondava', 'Sans Fil', '619', 'Parrainage', '2019-02-01-06-08-40-Koala.jpg', '2019-02-01-06-08-40-Penguins.jpg', ''),
	(12, 72, _binary 0x31, '1992-02-02', 'Lyon', 'JK78', '78', 'Amis', '2019-02-06-14-42-35-Jellyfish.jpg', '', ''),
	(13, 73, _binary 0x32, '1980-04-24', 'paris', '31 rue lipsum', '100', 'Amis', '', '', '');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. staff_attribut
DROP TABLE IF EXISTS `staff_attribut`;
CREATE TABLE IF NOT EXISTS `staff_attribut` (
  `staff_attribut_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `tattoo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `piercing` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `not_pronounced` blob NOT NULL,
  PRIMARY KEY (`staff_attribut_id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `staff_attribut_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.staff_attribut : ~11 rows (environ)
DELETE FROM `staff_attribut`;
/*!40000 ALTER TABLE `staff_attribut` DISABLE KEYS */;
INSERT INTO `staff_attribut` (`staff_attribut_id`, `staff_id`, `tattoo`, `piercing`, `not_pronounced`) VALUES
	(1, 1, 'Visible', '', _binary 0x30),
	(2, 2, 'Aucun', 'Aucun', _binary 0x30),
	(3, 3, 'Aucun', 'Pas visible', _binary 0x30),
	(4, 4, '', '', _binary 0x30),
	(5, 5, 'Pas visible', 'Aucun', _binary 0x30),
	(6, 6, 'Aucun', '', _binary 0x30),
	(7, 7, '', 'Aucun', _binary 0x30),
	(8, 8, 'Pas visible', '', _binary 0x30),
	(9, 9, '', '', _binary 0x30),
	(10, 10, 'Pas visible', 'Aucun', _binary 0x30),
	(11, 11, 'Pas visible', 'Pas visible', _binary 0x30);
/*!40000 ALTER TABLE `staff_attribut` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. staff_attribute_options
DROP TABLE IF EXISTS `staff_attribute_options`;
CREATE TABLE IF NOT EXISTS `staff_attribute_options` (
  `staff_attribute_option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_attribut_id` int(10) unsigned DEFAULT NULL,
  `attribute_id` int(10) unsigned DEFAULT NULL,
  `attribute_option_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`staff_attribute_option_id`),
  KEY `idx_staff_attribut_id` (`staff_attribut_id`),
  KEY `idx_attribute_id` (`attribute_id`),
  KEY `idxattribute_option_id` (`attribute_option_id`),
  CONSTRAINT `staff_attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `staff_attribute_options_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`attribute_option_id`) ON DELETE CASCADE,
  CONSTRAINT `staff_attribute_options_staff_attribut_id_foreign` FOREIGN KEY (`staff_attribut_id`) REFERENCES `staff_attribut` (`staff_attribut_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.staff_attribute_options : ~33 rows (environ)
DELETE FROM `staff_attribute_options`;
/*!40000 ALTER TABLE `staff_attribute_options` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `staff_attribute_options` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. staff_certifications
DROP TABLE IF EXISTS `staff_certifications`;
CREATE TABLE IF NOT EXISTS `staff_certifications` (
  `staff_certification_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `actra` blob NOT NULL,
  `food_handling` blob NOT NULL,
  `uda` blob NOT NULL,
  `have_car` blob NOT NULL,
  `driver_license` blob NOT NULL,
  `driver_license_truck` blob NOT NULL,
  `smart_serve` blob NOT NULL,
  PRIMARY KEY (`staff_certification_id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `staff_certifications_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.staff_certifications : ~11 rows (environ)
DELETE FROM `staff_certifications`;
/*!40000 ALTER TABLE `staff_certifications` DISABLE KEYS */;
INSERT INTO `staff_certifications` (`staff_certification_id`, `staff_id`, `actra`, `food_handling`, `uda`, `have_car`, `driver_license`, `driver_license_truck`, `smart_serve`) VALUES
	(1, 1, _binary 0x30, _binary 0x30, _binary 0x30, _binary '', _binary 0x31, _binary '', _binary 0x30),
	(2, 2, _binary 0x30, _binary 0x31, _binary 0x30, _binary '', _binary '', _binary 0x31, _binary 0x30),
	(3, 3, _binary 0x30, _binary 0x30, _binary 0x30, _binary '', _binary 0x30, _binary '', _binary 0x30),
	(4, 4, _binary 0x30, _binary 0x30, _binary 0x30, _binary '', _binary 0x30, _binary '', _binary 0x30),
	(5, 5, _binary 0x30, _binary 0x31, _binary 0x30, _binary '', _binary 0x31, _binary 0x30, _binary 0x30),
	(6, 6, _binary 0x30, _binary 0x31, _binary 0x30, _binary '', _binary 0x31, _binary '', _binary 0x30),
	(7, 7, _binary 0x30, _binary 0x31, _binary 0x30, _binary '', _binary 0x30, _binary 0x31, _binary 0x30),
	(8, 8, _binary 0x30, _binary 0x31, _binary 0x30, _binary '', _binary 0x31, _binary '', _binary 0x30),
	(9, 9, _binary 0x30, _binary 0x31, _binary 0x30, _binary '', _binary 0x30, _binary 0x31, _binary 0x30),
	(10, 10, _binary 0x31, _binary 0x30, _binary 0x30, _binary '', _binary 0x31, _binary 0x31, _binary 0x30),
	(11, 11, _binary 0x30, _binary 0x31, _binary 0x30, _binary '', _binary 0x30, _binary 0x31, _binary 0x30);
/*!40000 ALTER TABLE `staff_certifications` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. staff_jobs
DROP TABLE IF EXISTS `staff_jobs`;
CREATE TABLE IF NOT EXISTS `staff_jobs` (
  `staff_job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `job_id` int(10) unsigned DEFAULT NULL,
  `experience_year` int(11) NOT NULL,
  PRIMARY KEY (`staff_job_id`),
  KEY `idx_staff_id` (`staff_id`),
  KEY `idx_job_id` (`job_id`),
  CONSTRAINT `staff_jobs_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE SET NULL,
  CONSTRAINT `staff_jobs_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.staff_jobs : ~9 rows (environ)
DELETE FROM `staff_jobs`;
/*!40000 ALTER TABLE `staff_jobs` DISABLE KEYS */;
INSERT INTO `staff_jobs` (`staff_job_id`, `staff_id`, `job_id`, `experience_year`) VALUES
	(1, 1, 78, 3),
	(2, 3, 80, 3),
	(3, 4, 93, 0),
	(4, 6, 79, 1),
	(5, 7, 78, 3),
	(6, 8, 78, 0),
	(7, 10, 78, 1),
	(8, 11, 86, 3),
	(9, 12, 79, 2);
/*!40000 ALTER TABLE `staff_jobs` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. staff_languages
DROP TABLE IF EXISTS `staff_languages`;
CREATE TABLE IF NOT EXISTS `staff_languages` (
  `staff_language_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`staff_language_id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `staff_languages_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.staff_languages : ~18 rows (environ)
DELETE FROM `staff_languages`;
/*!40000 ALTER TABLE `staff_languages` DISABLE KEYS */;
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
	(17, 11, 'Grec', 'Courant'),
	(18, 12, 'Francais', 'Courant');
/*!40000 ALTER TABLE `staff_languages` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. staff_mobility
DROP TABLE IF EXISTS `staff_mobility`;
CREATE TABLE IF NOT EXISTS `staff_mobility` (
  `staff_mobility_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `mobility_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`staff_mobility_id`),
  KEY `idx_staff_id` (`staff_id`),
  KEY `idx_mobility_id` (`mobility_id`),
  CONSTRAINT `staff_mobility_mobility_id_foreign` FOREIGN KEY (`mobility_id`) REFERENCES `mobility` (`mobility_id`) ON DELETE SET NULL,
  CONSTRAINT `staff_mobility_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.staff_mobility : ~13 rows (environ)
DELETE FROM `staff_mobility`;
/*!40000 ALTER TABLE `staff_mobility` DISABLE KEYS */;
INSERT INTO `staff_mobility` (`staff_mobility_id`, `staff_id`, `mobility_id`) VALUES
	(1, 1, NULL),
	(2, 2, NULL),
	(3, 3, NULL),
	(4, 4, NULL),
	(5, 5, NULL),
	(6, 6, NULL),
	(7, 7, NULL),
	(8, 8, NULL),
	(9, 9, NULL),
	(10, 10, NULL),
	(11, 10, NULL),
	(12, 11, NULL),
	(13, 11, NULL);
/*!40000 ALTER TABLE `staff_mobility` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. staff_remunerations
DROP TABLE IF EXISTS `staff_remunerations`;
CREATE TABLE IF NOT EXISTS `staff_remunerations` (
  `staff_remuneration_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `price` int(11) NOT NULL,
  `nas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`staff_remuneration_id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `staff_remunerations_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.staff_remunerations : ~11 rows (environ)
DELETE FROM `staff_remunerations`;
/*!40000 ALTER TABLE `staff_remunerations` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `staff_remunerations` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  KEY `idx_role_id` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`role_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.users : ~11 rows (environ)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `first_name`, `last_name`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(67, 2, 'dfjfdjd', 'hjgjdghj', 'aa@alternateeve.com', '2543543', '2019-02-04 07:57:16', '$2y$10$2wXTz8cEyQZYnlqwCaZFZ.AJJGZFs0YAnk69/w61M5r3uSKNxJJRm', 'nxQwSAOicuLmzqT5w5YUq7nMxKcYtHUEaralAzYnV8PsvcFABpwSoRdIwuKo', '2019-02-01 15:55:47', '2019-02-04 07:57:16'),
	(68, 2, 'dfhdfh', 'dqfhdfh', 'andryhsm@yahoo.fr', '543453', NULL, '$2y$10$VF7tFWzyvqy7jX6pMdWo.OgMckA8mOfpEO27PiB1dZnkPlzBDsgZG', NULL, '2019-02-01 15:55:47', '2019-02-01 15:55:47'),
	(69, 2, 'Arisanjy', 'Eric', 'ericarisanjy20@gmail.com', '65674564', '2019-02-01 16:05:27', '$2y$10$zwrqk.pox4iIL8ZAsoENnun7EibMrs/MpuQfyz6P7aSBZoBTRNYuG', 'oVqj9A4REFtXOZAFcl9XeYJ4qj2yoIs2eBWx4Py7YJy5RkW6iDNuMgThtF6E', '2019-02-01 15:56:01', '2019-02-01 16:05:27'),
	(70, 2, 'Thomas', 'Lussiez', 'lussiezthomas06@gmail.com', '5146496664', NULL, '$2y$10$AjtorL0RoW.ukfBZfPGbPO12Oml1jZ4TlrMMI9xCrg6Qfmv1NB28e', NULL, '2019-02-04 22:59:03', '2019-02-04 22:59:03'),
	(71, 2, 'Grand', 'Misaina', 'mr@alternateeve.com', '12345678', NULL, '$2y$10$o0qzm7dVbbwpvfnTZ3h7jOZcWxN8jix4QmuI9nDppnkhp1fb9vP.O', NULL, '2019-02-06 09:06:24', '2019-02-06 09:06:24'),
	(72, 1, 'Barry', 'Jamel', 'barry@gmail.com', '234156', NULL, '$2y$10$M7/tlIFPcdMiBPCd10kxKu3VpRIytxgkoupwbcHziT8a7pFGr29la', NULL, '2019-02-06 15:42:35', '2019-02-06 15:42:35'),
	(73, 1, 'Corine', 'Julie', 'clemen@gmail.com', '32146597', NULL, '$2y$10$wu8knf4kRgahX7kPGkfr2./hYItxh8dBQSp058rBEIlLU4Nq70oLK', NULL, '2019-02-07 07:52:20', '2019-02-07 07:52:20'),
	(74, 2, 'Alice', 'clement', 'clement@gmail.com', '123654', NULL, '$2y$10$cfi.FlT9L8mUCTxnzrVOReSZKOsyJcxNyDUpjWxAuNdNVHMKfP86i', 'z6H0jF7IJrhFLxwxZCtrHYdadQxXT516A9IDB9tBhx1PWXFtX1sOW1f5eOm0', '2019-02-07 07:58:25', '2019-02-07 07:58:25'),
	(75, 2, 'h', 'Crystal', 'farahtianah@gmail.com', '145879', '2019-02-07 08:13:29', '$2y$10$bOP3o4ZBfhQTST/ras1GWuPff8e8ecxPSRqk/UWp1loFGOYGvJiia', NULL, '2019-02-07 08:12:28', '2019-02-07 08:13:29'),
	(76, 2, 'SALVA', 'SS', 'salvadu_94@hotmail.fr', '+5142458963', '2019-02-11 18:43:44', '$2y$10$TjZ69.DfGEBNdiF.Y1lPr.KMhlNKHZPx2qO3cE.YeYgOSSEMibSx.', NULL, '2019-02-11 18:31:59', '2019-02-11 18:43:44'),
	(77, 2, 'Paul', 'Baysse', 'paulbaysse@yahoo.com', '5146496663', '2019-02-12 02:37:30', '$2y$10$vRNPiv0IXS8Yz7FTsMIUCe//iFD5rLDtV9xDSA5ISnYB.dKG3wMEW', 'JzGYzHhqDs0gnazoRz8WloZyYw5Rz8l8Zfri7Pr3wrLRGCa1Vdo6DDwI3pwq', '2019-02-11 22:35:11', '2019-02-12 02:37:30');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. user_role
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.user_role : ~2 rows (environ)
DELETE FROM `user_role`;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`role_id`, `role_name`, `created_at`, `updated_at`) VALUES
	(1, 'Staff', '2019-01-22 07:28:01', '2019-01-22 07:28:01'),
	(2, 'Agency', '2019-01-22 07:28:01', '2019-01-22 07:28:01');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
