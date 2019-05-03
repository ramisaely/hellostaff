-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Listage de la structure de la table hello_staff. agency
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.agency : ~3 rows (environ)
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` (`id`, `name`, `address`, `number`, `city`, `tps`, `tvq`, `postal_code`, `province`, `country`, `logo`, `description_fr`, `description_en`, `phone`, `email`, `created_at`, `updated_at`) VALUES
	(28, 'Razoary', 'malokila', NULL, 'dfef', NULL, NULL, 'fsq', 'Québec', 'Canada', '2019-01-31-07-33-09-Hydrangeas.jpg', 'Lorem ipsum', NULL, '+456453', 'ericarisanjy20@gmail.com', '2019-01-31 10:33:09', '2019-01-31 10:33:09'),
	(30, 'Rasoa', 'antsoso', NULL, 'betafo', NULL, NULL, '112', 'Québec', 'Canada', '2019-01-31-12-03-50-Desert.jpg', 'dfdsfs', NULL, '+5644564', 'ericarisanjy20@gmail.comf', '2019-01-31 15:03:50', '2019-01-31 15:03:50'),
	(34, 'fgdfhgfd', 'hfdhfdh', 534534, 'sdgsdg', NULL, NULL, '00110', 'Ontario', 'Canada', '2019-01-31-12-40-19-IMG_20181020_092829.jpg', 'hfgjhgfjfgj', NULL, '+456456', 'aa@alternateeve.com', '2019-01-31 15:40:19', '2019-01-31 15:40:19'),
	(35, 'Alternateeve', 'Mahafaly', NULL, 'Antsirabe', NULL, NULL, '110', 'Ontario', 'Canada', '2019-02-11-06-35-33-Penguins.jpg', 'lorem ipsum', NULL, '0342772585', 'ericarisanjy@gmail.com', '2019-02-11 06:35:34', '2019-02-11 06:35:34'),
	(36, 'Alternateeve', 'Mahafaly', NULL, 'Bira', NULL, NULL, '110', 'Québec', 'Canada', '2019-02-12-12-51-54-vlcsnap-2019-02-02-08h00m05s103.png', 'Manao nyy retra retra', NULL, '54563452', 'alternateeve@alternateeve.com', '2019-02-11 14:19:00', '2019-02-12 12:51:55');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. agency_users
CREATE TABLE IF NOT EXISTS `agency_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agency_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_agency_id` (`agency_id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `agency_users_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `agency_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.agency_users : ~3 rows (environ)
/*!40000 ALTER TABLE `agency_users` DISABLE KEYS */;
INSERT INTO `agency_users` (`id`, `agency_id`, `user_id`) VALUES
	(79, 36, 56),
	(80, 36, 57),
	(81, 36, 58);
/*!40000 ALTER TABLE `agency_users` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. attributes
CREATE TABLE IF NOT EXISTS `attributes` (
  `attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.attributes : ~3 rows (environ)
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` (`attribute_id`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, '1', '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(2, '1', '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(3, '1', '2019-01-22 09:28:00', '2019-01-22 09:28:00');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. attribute_options
CREATE TABLE IF NOT EXISTS `attribute_options` (
  `attribute_option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`attribute_option_id`),
  KEY `idx_attribute_id` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.attribute_options : ~81 rows (environ)
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

-- Listage de la structure de la table hello_staff. attribute_option_gender
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

-- Listage des données de la table hello_staff.attribute_option_gender : ~75 rows (environ)
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

-- Listage de la structure de la table hello_staff. attribute_option_translations
CREATE TABLE IF NOT EXISTS `attribute_option_translations` (
  `attribute_option_translation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_option_id` int(10) unsigned DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_option_translation_id`),
  KEY `idx_attribute_option_id` (`attribute_option_id`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`attribute_option_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.attribute_option_translations : ~162 rows (environ)
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

-- Listage de la structure de la table hello_staff. attribute_translations
CREATE TABLE IF NOT EXISTS `attribute_translations` (
  `attribute_translation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_translation_id`),
  KEY `idx_attribute_id` (`attribute_id`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.attribute_translations : ~6 rows (environ)
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
INSERT INTO `attribute_translations` (`attribute_translation_id`, `attribute_id`, `name`, `language_id`) VALUES
	(1, 1, 'Veste/Chemises', 1),
	(2, 1, 'Jacket/Shirts', 2),
	(3, 2, 'Pantalons', 1),
	(4, 2, 'Pants', 2),
	(5, 3, 'Chaussures', 1),
	(6, 3, 'Shoes', 2);
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. event
CREATE TABLE IF NOT EXISTS `event` (
  `event_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`event_id`),
  KEY `idx_agency_id` (`agency_id`),
  CONSTRAINT `event_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.event : ~5 rows (environ)
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` (`event_id`, `agency_id`, `name`, `customer`, `location_event`, `zip_event`, `country_event`, `zone_event`, `start_date`, `end_date`, `description_fr_event`, `description_en_event`, `start_hour_event`, `end_hour_event`, `picture_event`, `created_at`, `updated_at`) VALUES
	(1, 34, 'Première évènement', 'Tout le monde', 'Mahafaly', '110', 'Madagascar', 'Vakinankaratra', '2019-02-04', '2019-02-19', 'Aucun', 'Aucun', '10:31:00', '18:00:00', '2018-12-04-13-21-46-football-wallpapers-31082-3076555.jpg', NULL, NULL),
	(2, 28, 'Deuxième évènement', 'Des étudiants', 'Tombontsoa', '110', 'Madagascar', 'Vakinankaratra', '2019-02-11', '2019-02-15', 'Aucun', 'Aucun', '08:00:00', '17:30:00', '2019-01-31-12-40-19-IMG_20181020_092829.jpp', NULL, NULL),
	(3, 34, 'Troisième évènement', 'Tout le monde', 'Mahafaly', '110', 'Madagascar', 'Vakinankaratra', '2019-02-21', '2019-03-22', 'Aucun', 'Aucun', '10:31:00', '18:00:00', '2018-12-04-13-21-46-football-wallpapers-31082-3076555.jpg', NULL, NULL),
	(4, 28, 'Quatrième évènement', 'Des étudiants', 'Tombontsoa', '110', 'Madagascar', 'Vakinankaratra', '2019-02-14', '2019-04-25', 'Aucun', 'Aucun', '08:00:00', '17:30:00', '2019-01-31-12-40-19-IMG_20181020_092829.jpp', NULL, NULL),
	(5, 34, 'Notre évènement', 'Nos clients', 'Mahafaly', '110', 'Madagascar', 'Vakinankaratra', '2019-02-01', '2019-02-28', 'C\'est estimation temporelle pour achéver le projet HelloStaff. Il faut donc bosser!!!', 'It\'s our time estimation to finish the HelloStaff project! So, we must boss!!!', '09:00:00', '18:00:00', '2019-01-31-12-40-19-IMG_20181020_092829.jpp', NULL, NULL);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. event_staff
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
  CONSTRAINT `event_staff_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.event_staff : ~0 rows (environ)
/*!40000 ALTER TABLE `event_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_staff` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. event_staff_date
CREATE TABLE IF NOT EXISTS `event_staff_date` (
  `event_staff_date_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_staff_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `start_hour_event_staff_date` int(11) NOT NULL,
  `end_hour_event_staff_date` time NOT NULL,
  `color_event_staff_date` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`event_staff_date_id`),
  KEY `idx_event_staff_id` (`event_staff_id`),
  CONSTRAINT `event_staff_date_event_staff_id_foreign` FOREIGN KEY (`event_staff_id`) REFERENCES `event_staff` (`event_staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.event_staff_date : ~0 rows (environ)
/*!40000 ALTER TABLE `event_staff_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_staff_date` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. gender
CREATE TABLE IF NOT EXISTS `gender` (
  `gender_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.gender : ~2 rows (environ)
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` (`gender_id`, `name`) VALUES
	(1, 'Homme'),
	(2, 'Femme');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.jobs : ~19 rows (environ)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`job_id`, `icon`, `created_by`, `created_at`, `updated_at`) VALUES
	(77, 'megaphone.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(78, 'user.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(79, 'Group_2254.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(80, 'hostess.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(81, 'coordinating-people.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(82, 'settigns.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(83, 'chinese-food-bowl-from-side-view-and-chopsticks.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(84, 'folding-map.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(85, 'photo-camera.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(86, 'github.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(87, 'serving-drinks.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(88, 'liquid-soap.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(89, 'speech.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(90, 'dj-playing-records.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(91, 'magician.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(92, 'theatre-masks.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(93, 'black-shoes.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(94, 'microphone.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(95, 'hand-writing-with-ballpen.svg', 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. job_translation
CREATE TABLE IF NOT EXISTS `job_translation` (
  `job_translation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`job_translation_id`),
  KEY `idx_job_id` (`job_id`),
  CONSTRAINT `job_translation_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.job_translation : ~38 rows (environ)
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

-- Listage de la structure de la table hello_staff. language
CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.language : ~2 rows (environ)
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` (`language_id`, `language_name`, `language_code`) VALUES
	(1, 'French', 'fr'),
	(2, 'English', 'en');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.migrations : ~27 rows (environ)
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
	(27, '2019_02_09_075103_update_staff_users_foreign_key', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. mobility
CREATE TABLE IF NOT EXISTS `mobility` (
  `mobility_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`mobility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.mobility : ~8 rows (environ)
/*!40000 ALTER TABLE `mobility` DISABLE KEYS */;
INSERT INTO `mobility` (`mobility_id`, `created_by`, `created_at`, `updated_at`) VALUES
	(41, 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(42, 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(43, 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(44, 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(45, 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(46, 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(47, 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00'),
	(48, 1, '2019-01-22 09:28:00', '2019-01-22 09:28:00');
/*!40000 ALTER TABLE `mobility` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. mobility_translation
CREATE TABLE IF NOT EXISTS `mobility_translation` (
  `mobility_translation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobility_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`mobility_translation_id`),
  KEY `idx_mobility_id` (`mobility_id`),
  CONSTRAINT `mobility_translation_mobility_id_foreign` FOREIGN KEY (`mobility_id`) REFERENCES `mobility` (`mobility_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.mobility_translation : ~16 rows (environ)
/*!40000 ALTER TABLE `mobility_translation` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `mobility_translation` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.password_resets : ~2 rows (environ)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
	('mikianico@gmail.com', '$2y$10$AdXa.i3Pa4/ZPQnb9KTx5ONcPO4R3F1Q6ohBIUh1luQgDFVRRxtbe', '2019-01-23 11:29:10'),
	('as@alternateeve.com', '$2y$10$rqLuVVsxNA.R.0Uo62weu.yLoQ7D663dSU2wfOaHAk/7xn0E62lzy', '2019-01-30 19:07:20');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. staff
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.staff : ~11 rows (environ)
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
	(11, NULL, _binary 0x31, '1990-03-03', 'Morondava', 'Sans Fil', '619', 'Parrainage', '2019-02-01-06-08-40-Koala.jpg', '2019-02-01-06-08-40-Penguins.jpg', '');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. staff_attribut
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

-- Listage des données de la table hello_staff.staff_attribut : ~11 rows (environ)
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

-- Listage de la structure de la table hello_staff. staff_attribute_options
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

-- Listage des données de la table hello_staff.staff_attribute_options : ~33 rows (environ)
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

-- Listage de la structure de la table hello_staff. staff_certifications
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

-- Listage des données de la table hello_staff.staff_certifications : ~11 rows (environ)
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

-- Listage de la structure de la table hello_staff. staff_jobs
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.staff_jobs : ~8 rows (environ)
/*!40000 ALTER TABLE `staff_jobs` DISABLE KEYS */;
INSERT INTO `staff_jobs` (`staff_job_id`, `staff_id`, `job_id`, `experience_year`) VALUES
	(1, 1, 78, 3),
	(2, 3, 80, 3),
	(3, 4, 93, 0),
	(4, 6, 79, 1),
	(5, 7, 78, 3),
	(6, 8, 78, 0),
	(7, 10, 78, 1),
	(8, 11, 86, 3);
/*!40000 ALTER TABLE `staff_jobs` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. staff_languages
CREATE TABLE IF NOT EXISTS `staff_languages` (
  `staff_language_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`staff_language_id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `staff_languages_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.staff_languages : ~17 rows (environ)
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
	(17, 11, 'Grec', 'Courant');
/*!40000 ALTER TABLE `staff_languages` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. staff_mobility
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

-- Listage des données de la table hello_staff.staff_mobility : ~13 rows (environ)
/*!40000 ALTER TABLE `staff_mobility` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `staff_mobility` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. staff_remunerations
CREATE TABLE IF NOT EXISTS `staff_remunerations` (
  `staff_remuneration_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `price` int(11) NOT NULL,
  `nas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`staff_remuneration_id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `staff_remunerations_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.staff_remunerations : ~11 rows (environ)
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

-- Listage de la structure de la table hello_staff. users
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.users : ~2 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `first_name`, `last_name`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(56, 2, 'Eric', 'Arisanjy', 'ericarisanjy20@gmail.com', '5456356487', NULL, '$2y$10$vyBdA9BZ3UdOiUlZADngp.s0dyz0ZSUpvIyKmtiyIMzHBaup/BiGC', NULL, '2019-02-11 14:19:01', '2019-02-11 14:19:01'),
	(57, 2, 'Rakotonirina', 'Eric', 'er@alternateeve.com', '5453653', '2019-02-11 14:22:59', '$2y$10$oxAZXw0RxeA25hird7eXzeja7FVhvul7yReyOMkOiRN7Jhi4i1OOS', 'sjP2gZrvsAmZIrQfLFyVWteFrq3qOcLdcSq9SgF0GjrSAlYlBtRXUIDBgohB', '2019-02-11 14:19:02', '2019-02-11 14:27:17'),
	(58, 2, 'Nika', 'Mandaniaro', 'sariakamandaniaro@gmail.com', '546748476', NULL, '$2y$10$umXlEsLGXcZM5WAoUn6PI.7fc8xriZII.obffQTx7/MckDYZvEC8q', NULL, '2019-02-11 14:19:02', '2019-02-11 14:19:02');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Listage de la structure de la table hello_staff. user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table hello_staff.user_role : ~2 rows (environ)
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`role_id`, `role_name`, `created_at`, `updated_at`) VALUES
	(1, 'Staff', '2019-01-22 09:28:01', '2019-01-22 09:28:01'),
	(2, 'Agency', '2019-01-22 09:28:01', '2019-01-22 09:28:01');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
