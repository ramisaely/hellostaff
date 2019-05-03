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
CREATE DATABASE IF NOT EXISTS `hello_staff` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hello_staff`;

-- Export de la structure de la table hello_staff. agency
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.agency : ~9 rows (environ)
DELETE FROM `agency`;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` (`id`, `name`, `address`, `number`, `city`, `tps`, `tvq`, `postal_code`, `province`, `country`, `logo`, `description_fr`, `description_en`, `phone`, `email`, `created_at`, `updated_at`) VALUES
	(43, 'My entreprise 1', 'dfhfgh', 534534, 'fhfgh', NULL, NULL, '00110', 'Ontario', 'Canada', '2019-03-07-06-12-42-classe_delete.PNG', 'test description', NULL, '54245345', 'aa@alternateeve.com', '2019-02-01 15:55:47', '2019-03-07 06:12:42'),
	(44, 'STAR', 'AMbolo', NULL, 'Antsirabe', NULL, NULL, '110', 'Colombie-Britannique', 'Canada', '2019-02-01-14-56-01-Koala.jpg', 'dsfsdgze', NULL, '5645635356', 'ericarisanjy20@gmail.com', '2019-02-01 15:56:01', '2019-02-01 15:56:01'),
	(45, 'MHV', '3486 Coloniale Avenue', 123445, 'Montreal', NULL, NULL, 'H2X2Y4', 'Québec', 'Canada', '2019-02-04-21-59-03-Capture d’écran 2019-02-04 à 16.55.23.png', 'bla bla bla', NULL, '5146496664', 'lussiezthomas06@gmail.com', '2019-02-04 22:59:03', '2019-02-04 22:59:03'),
	(46, 'test test', 'testest', 132456, 'testset', NULL, NULL, '12120', 'Colombie-Britannique', 'Canada', '2019-02-06-08-06-24-cas actualiser resultats.PNG', 'testset', NULL, '5646546', 'mr@alternateeve.com', '2019-02-06 09:06:24', '2019-02-06 09:06:24'),
	(47, 'aur', '31 rue lavoisier', 123546, 'paris', '012365478956412', '0123654789564124', '112', 'Québec', 'Canada', '2019-02-07-06-58-25-000338459_illustration_large.jpg', 'society', NULL, '3356987', 'aur@gmail.com', '2019-02-07 07:58:25', '2019-02-07 07:58:25'),
	(48, 'staff', 'paris', 123445, 'paris', '145879652312523', '1458796523125236', '11', 'Québec', 'Canada', '2019-02-07-07-12-28-000338459_illustration_large.jpg', 'society', NULL, '12365478', 'farahtianah@gmail.com', '2019-02-07 08:12:28', '2019-02-07 08:12:28'),
	(49, 'SEYDI', '3331 AVENUE MARECHAL, APPARTEMENT 9', NULL, 'Montréal', NULL, NULL, 'H3T1M8', 'Québec', 'Canada', '2019-02-11-17-31-59-logo.jpg', 'Entreprise IT', NULL, '+5142358974', 'seydisalva@gmail.com', '2019-02-11 18:31:59', '2019-02-11 18:31:59'),
	(50, '123thomas', '3486 Coloniale Avenue', NULL, 'Montreal', NULL, NULL, 'H2X2Y4', 'Québec', 'Canada', '2019-02-11-21-35-11-HelloStaff_LOGO_favicon_(standard).png', 'blabla', NULL, '5146496663', 'paulbaysse@yahoo.com', '2019-02-11 22:35:11', '2019-02-11 22:35:11'),
	(51, 'DEV', 'Vatofotsy', 123, 'Mahafaly', NULL, NULL, '00110', 'Ontario', 'Canada', '2019-03-04-06-59-34-cas_2.0_global.PNG', 'etztzrt', NULL, '5454', 'andryhsm@yahoo.fr', '2019-03-04 06:59:34', '2019-03-04 06:59:34'),
	(56, 'gdhsdgh', '456456121', 45646511, '456456', NULL, NULL, '456456', 'Colombie-Britannique', 'Canada', '2019-03-04-19-07-30-conception_actualisation.PNG', 'test', NULL, '456412', 'andryhery@yahoo.fr', '2019-03-04 19:07:30', '2019-03-04 19:07:30');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. agency_staff
CREATE TABLE IF NOT EXISTS `agency_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agency_id` int(10) unsigned NOT NULL,
  `staff_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_agency_id` (`agency_id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `agency_staff_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `agency_staff_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.agency_staff : ~6 rows (environ)
DELETE FROM `agency_staff`;
/*!40000 ALTER TABLE `agency_staff` DISABLE KEYS */;
INSERT INTO `agency_staff` (`id`, `agency_id`, `staff_id`, `created_at`, `updated_at`) VALUES
	(1, 43, 14, '2019-03-18 06:33:09', '2019-03-18 06:33:09'),
	(4, 43, 15, '2019-03-18 11:43:54', '2019-03-18 11:43:54'),
	(6, 43, 21, '2019-03-18 11:44:10', '2019-03-18 11:44:10'),
	(7, 43, 22, '2019-03-18 11:49:09', '2019-03-18 11:49:09'),
	(8, 43, 30, '2019-03-25 06:16:08', '2019-03-25 06:16:08'),
	(10, 43, 17, '2019-03-25 13:02:45', '2019-03-25 13:02:45');
/*!40000 ALTER TABLE `agency_staff` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. agency_users
CREATE TABLE IF NOT EXISTS `agency_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agency_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_agency_id` (`agency_id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `agency_users_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `agency_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.agency_users : ~5 rows (environ)
DELETE FROM `agency_users`;
/*!40000 ALTER TABLE `agency_users` DISABLE KEYS */;
INSERT INTO `agency_users` (`id`, `agency_id`, `user_id`) VALUES
	(51, 45, 70),
	(55, 49, 76),
	(102, 51, 79),
	(109, 56, 82),
	(112, 43, 67);
/*!40000 ALTER TABLE `agency_users` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. all_language
CREATE TABLE IF NOT EXISTS `all_language` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.all_language : ~11 rows (environ)
DELETE FROM `all_language`;
/*!40000 ALTER TABLE `all_language` DISABLE KEYS */;
INSERT INTO `all_language` (`id`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, NULL),
	(2, 1, NULL, NULL),
	(3, 1, NULL, NULL),
	(4, 1, NULL, NULL),
	(5, 1, NULL, NULL),
	(6, 1, NULL, NULL),
	(7, 1, NULL, NULL),
	(8, 1, NULL, NULL),
	(9, 1, NULL, NULL),
	(10, 1, NULL, NULL),
	(11, 1, NULL, NULL),
	(12, 1, NULL, NULL);
/*!40000 ALTER TABLE `all_language` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. all_language_choice
CREATE TABLE IF NOT EXISTS `all_language_choice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.all_language_choice : ~4 rows (environ)
DELETE FROM `all_language_choice`;
/*!40000 ALTER TABLE `all_language_choice` DISABLE KEYS */;
INSERT INTO `all_language_choice` (`id`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, NULL),
	(2, 1, NULL, NULL),
	(3, 1, NULL, NULL),
	(4, 1, NULL, NULL);
/*!40000 ALTER TABLE `all_language_choice` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. all_language_choice_translation
CREATE TABLE IF NOT EXISTS `all_language_choice_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `all_language_choice_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_all_language_choice_id` (`all_language_choice_id`),
  CONSTRAINT `all_language_choice_translation_all_language_choice_id_foreign` FOREIGN KEY (`all_language_choice_id`) REFERENCES `all_language_choice` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.all_language_choice_translation : ~8 rows (environ)
DELETE FROM `all_language_choice_translation`;
/*!40000 ALTER TABLE `all_language_choice_translation` DISABLE KEYS */;
INSERT INTO `all_language_choice_translation` (`id`, `all_language_choice_id`, `name`, `language_id`) VALUES
	(1, 1, 'Débutant', 1),
	(2, 2, 'Intermédiaire', 1),
	(3, 3, 'Courant', 1),
	(4, 4, 'Langue maternelle', 1),
	(5, 1, 'Beginner', 2),
	(6, 2, 'Intermediate', 2),
	(7, 3, 'Fluent', 2),
	(8, 4, 'Native language', 2);
/*!40000 ALTER TABLE `all_language_choice_translation` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. all_language_translation
CREATE TABLE IF NOT EXISTS `all_language_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `all_language_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_all_language_id` (`all_language_id`),
  CONSTRAINT `all_language_translation_all_language_id_foreign` FOREIGN KEY (`all_language_id`) REFERENCES `all_language` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.all_language_translation : ~21 rows (environ)
DELETE FROM `all_language_translation`;
/*!40000 ALTER TABLE `all_language_translation` DISABLE KEYS */;
INSERT INTO `all_language_translation` (`id`, `all_language_id`, `name`, `decription`, `language_id`) VALUES
	(1, 1, 'Français', NULL, 1),
	(2, 2, 'Anglais', NULL, 1),
	(3, 3, 'Espagnol', NULL, 1),
	(4, 4, 'Allemand', NULL, 1),
	(5, 5, 'Portugais', NULL, 1),
	(6, 6, 'Italien', NULL, 1),
	(7, 7, 'Grec', NULL, 1),
	(8, 8, 'Russe', NULL, 1),
	(9, 9, 'Japonais', NULL, 1),
	(10, 10, 'Chinois', '(Mandarin/Cantonais)', 1),
	(11, 11, 'Arabe', NULL, 1),
	(12, 12, 'Langage des signes', NULL, 1),
	(14, 1, 'French', NULL, 2),
	(15, 2, 'English', NULL, 2),
	(16, 3, 'Spanish', NULL, 2),
	(17, 4, 'German', NULL, 2),
	(18, 5, 'Portuguese', NULL, 2),
	(19, 6, 'Italian', NULL, 2),
	(20, 7, 'Greek', NULL, 2),
	(21, 8, 'Russian', NULL, 2),
	(22, 9, 'Japanese', NULL, 2),
	(23, 10, 'Chinese', '(Mandarin/Cantonais)', 2),
	(24, 11, 'Arab', NULL, 2),
	(25, 12, 'Sign language', NULL, 2);
/*!40000 ALTER TABLE `all_language_translation` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. attributes
CREATE TABLE IF NOT EXISTS `attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.attributes : ~3 rows (environ)
DELETE FROM `attributes`;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` (`id`, `created_by`, `image`, `created_at`, `updated_at`) VALUES
	(1, '1', 'vetement.JPG', '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(2, '1', 'pantalons.JPG', '2019-01-22 07:28:00', '2019-01-22 07:28:00'),
	(3, '1', 'chassure.JPG', '2019-01-22 07:28:00', '2019-01-22 07:28:00');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. attribute_options
CREATE TABLE IF NOT EXISTS `attribute_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_attribute_id` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.attribute_options : ~81 rows (environ)
DELETE FROM `attribute_options`;
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
INSERT INTO `attribute_options` (`id`, `attribute_id`, `sort_order`) VALUES
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
CREATE TABLE IF NOT EXISTS `attribute_option_gender` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned DEFAULT NULL,
  `attribute_option_id` int(10) unsigned DEFAULT NULL,
  `gender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_attribute_id` (`attribute_id`),
  KEY `idx_attribute_option_id` (`attribute_option_id`),
  CONSTRAINT `attribute_option_gender_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_option_gender_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.attribute_option_gender : ~75 rows (environ)
DELETE FROM `attribute_option_gender`;
/*!40000 ALTER TABLE `attribute_option_gender` DISABLE KEYS */;
INSERT INTO `attribute_option_gender` (`id`, `attribute_id`, `attribute_option_id`, `gender_id`) VALUES
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
CREATE TABLE IF NOT EXISTS `attribute_option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_option_id` int(10) unsigned DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_attribute_option_id` (`attribute_option_id`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.attribute_option_translations : ~162 rows (environ)
DELETE FROM `attribute_option_translations`;
/*!40000 ALTER TABLE `attribute_option_translations` DISABLE KEYS */;
INSERT INTO `attribute_option_translations` (`id`, `attribute_option_id`, `value`, `language_id`) VALUES
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
CREATE TABLE IF NOT EXISTS `attribute_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_attribute_id` (`attribute_id`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.attribute_translations : ~6 rows (environ)
DELETE FROM `attribute_translations`;
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `name`, `language_id`) VALUES
	(1, 1, 'Veste/Chemises', 1),
	(2, 1, 'Jacket/Shirts', 2),
	(3, 2, 'Pantalons', 1),
	(4, 2, 'Pants', 2),
	(5, 3, 'Chaussures', 1),
	(6, 3, 'Shoes', 2);
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. event
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.event : ~2 rows (environ)
DELETE FROM `event`;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` (`id`, `agency_id`, `name`, `customer`, `location_event`, `zip_event`, `country_event`, `zone_event`, `start_date`, `end_date`, `description_fr_event`, `description_en_event`, `start_hour_event`, `end_hour_event`, `picture_event`, `created_at`, `updated_at`) VALUES
	(19, 43, 'Event 2', 'Client 2', 'VAtofotsy', '121212', 'British Colombia', 'Areas around Quebec city', '2019-03-15', '2019-03-29', 'test test test', NULL, '00:00:00', '00:00:00', '2019-03-07-07-25-42-classe_add.PNG', '2019-03-07 07:25:42', '2019-03-18 07:42:26'),
	(20, 43, 'Event 5', 'ADIDAS', 'Vatofotsy', 'm1m1m1', 'Ontario', 'Les alentours de la ville de Québec', '2019-03-20', '2019-03-30', 'test', NULL, '00:00:00', '00:00:00', '2019-03-11-08-20-49-IMG_20190306_130748.jpg', '2019-03-11 08:20:49', '2019-03-11 08:20:49');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. event_assessment
CREATE TABLE IF NOT EXISTS `event_assessment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `agency_id` int(10) unsigned NOT NULL,
  `event_staff_id` int(10) unsigned NOT NULL,
  `rating` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_staff_id` (`staff_id`),
  KEY `idx_event_id` (`event_id`),
  KEY `idx_agency_id` (`agency_id`),
  KEY `idx_event_staff_id` (`event_staff_id`),
  CONSTRAINT `event_assessment_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_assessment_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_assessment_event_staff_id_foreign` FOREIGN KEY (`event_staff_id`) REFERENCES `event_staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_assessment_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.event_assessment : ~5 rows (environ)
DELETE FROM `event_assessment`;
/*!40000 ALTER TABLE `event_assessment` DISABLE KEYS */;
INSERT INTO `event_assessment` (`id`, `staff_id`, `event_id`, `agency_id`, `event_staff_id`, `rating`, `description`, `created_at`, `updated_at`) VALUES
	(1, 17, 20, 43, 24, 2, 'test e', '2019-03-22 13:40:50', '2019-03-22 13:40:50'),
	(2, 20, 20, 43, 24, 3, 'ttet', '2019-03-22 13:40:50', '2019-03-22 13:40:50'),
	(3, 22, 20, 43, 24, 5, 'ttrtrt', '2019-03-22 13:40:50', '2019-03-22 13:40:50'),
	(4, 17, 20, 43, 24, 3, 'test Njato', '2019-03-25 06:29:16', '2019-03-25 06:29:16'),
	(5, 20, 20, 43, 24, 4, 'tets', '2019-03-25 06:29:16', '2019-03-25 06:29:16'),
	(6, 22, 20, 43, 24, 2, 'tet ', '2019-03-25 06:29:16', '2019-03-25 06:29:16');
/*!40000 ALTER TABLE `event_assessment` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. event_candidate
CREATE TABLE IF NOT EXISTS `event_candidate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_staff_id` int(10) unsigned NOT NULL,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `status_event_id` int(11) NOT NULL,
  `agency_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_event_staff_id` (`event_staff_id`),
  KEY `idx_staff_id` (`staff_id`),
  KEY `idx_agency_id` (`agency_id`),
  CONSTRAINT `event_candidate_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_candidate_event_staff_id_foreign` FOREIGN KEY (`event_staff_id`) REFERENCES `event_staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_candidate_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.event_candidate : ~3 rows (environ)
DELETE FROM `event_candidate`;
/*!40000 ALTER TABLE `event_candidate` DISABLE KEYS */;
INSERT INTO `event_candidate` (`id`, `event_staff_id`, `staff_id`, `status_event_id`, `agency_id`) VALUES
	(8, 24, 17, 4, 43),
	(9, 24, 20, 2, 43);
/*!40000 ALTER TABLE `event_candidate` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. event_manage_by
CREATE TABLE IF NOT EXISTS `event_manage_by` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_event_id` (`event_id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `event_manage_by_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_manage_by_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.event_manage_by : ~2 rows (environ)
DELETE FROM `event_manage_by`;
/*!40000 ALTER TABLE `event_manage_by` DISABLE KEYS */;
INSERT INTO `event_manage_by` (`id`, `event_id`, `user_id`) VALUES
	(9, 20, 67),
	(10, 19, 67);
/*!40000 ALTER TABLE `event_manage_by` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. event_mobility
CREATE TABLE IF NOT EXISTS `event_mobility` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `mobility_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_event_id` (`event_id`),
  KEY `idx_mobility_id` (`mobility_id`),
  CONSTRAINT `event_mobility_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_mobility_mobility_id_foreign` FOREIGN KEY (`mobility_id`) REFERENCES `mobility` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.event_mobility : ~2 rows (environ)
DELETE FROM `event_mobility`;
/*!40000 ALTER TABLE `event_mobility` DISABLE KEYS */;
INSERT INTO `event_mobility` (`id`, `event_id`, `mobility_id`) VALUES
	(6, 20, 44),
	(7, 19, 44);
/*!40000 ALTER TABLE `event_mobility` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. event_staff
CREATE TABLE IF NOT EXISTS `event_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  KEY `idx_event_id` (`event_id`),
  CONSTRAINT `event_staff_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.event_staff : ~7 rows (environ)
DELETE FROM `event_staff`;
/*!40000 ALTER TABLE `event_staff` DISABLE KEYS */;
INSERT INTO `event_staff` (`id`, `event_id`, `post`, `necessary_staff`, `location_event_staff`, `zip_event_staff`, `country_event_staff`, `zone_event_staff`, `color_event_staff`, `hour_rate`, `description_fr_event_staff`, `description_en_event_staff`, `distance`, `per_diem`, `created_at`, `updated_at`) VALUES
	(21, 19, 'Product Specialist', 10, 'vatofotsy', '242424', 'Saskatchewan', 'Quebec city', 'linear-gradient(60deg, #F44236, #F48F36)', 16, 'test test test', NULL, 12, 12, '2019-03-07 07:25:42', '2019-03-07 07:25:42'),
	(22, 19, 'In-field Coordinator', 3, 'mahazoarivo', '244521', 'British Colombia', 'Quebec city', 'linear-gradient(231deg, #899ED4, #A389D4)', 20, 'tets', NULL, 14, 14, '2019-03-07 07:25:42', '2019-03-18 07:42:26'),
	(23, 19, 'Set up / tear down team', 11, 'ivory', '145454', 'British Colombia', 'Greater Toronto', 'linear-gradient(67deg, #1FA548, #21FFAA)', 15, 'test test testytr', NULL, 14, 14, '2019-03-07 07:25:42', '2019-03-18 07:42:26'),
	(24, 20, 'Chef d\'équipe', 1, 'Vatofotsy', 'm1m1m1', 'Colombie-Britannique', 'Les alentours de la ville de Québec', 'linear-gradient(60deg, #F44236, #F48F36)', 17, 'test', NULL, 14, 14, '2019-03-11 08:20:49', '2019-03-25 08:44:14'),
	(25, 20, 'Spécialiste Produit', 4, 'Ambohimena', 'm1m1m1', 'Alberta', 'Les alentours de la ville de Québec', 'linear-gradient(231deg, #899ED4, #A389D4)', 14, 'test', NULL, 15, 46, '2019-03-11 08:20:49', '2019-03-11 08:20:49'),
	(26, 20, 'Hôte', 2, 'Mahazoarivo', 'm1m1m1', 'Colombie-Britannique', 'Ville de Québec', 'linear-gradient(67deg, #1FA548, #21FFAA)', 16, 'ret', NULL, 10, 12, '2019-03-11 08:20:49', '2019-03-11 08:20:49'),
	(27, 20, 'Equipe de montage/démontage', 5, 'Tarasaotra', 'l1l1l1', 'Colombie-Britannique', 'Grand Toronto', 'linear-gradient(237deg, #48C6EF, #337DE2)', 19, 'test', NULL, 25, 25, '2019-03-11 08:20:49', '2019-03-11 08:20:49');
/*!40000 ALTER TABLE `event_staff` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. event_staff_date
CREATE TABLE IF NOT EXISTS `event_staff_date` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_staff_id` int(10) unsigned NOT NULL,
  `start_hour_event_staff_date` time NOT NULL,
  `end_hour_event_staff_date` time NOT NULL,
  `color_event_staff_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_event_staff_id` (`event_staff_id`),
  CONSTRAINT `event_staff_date_event_staff_id_foreign` FOREIGN KEY (`event_staff_id`) REFERENCES `event_staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.event_staff_date : ~13 rows (environ)
DELETE FROM `event_staff_date`;
/*!40000 ALTER TABLE `event_staff_date` DISABLE KEYS */;
INSERT INTO `event_staff_date` (`id`, `event_staff_id`, `start_hour_event_staff_date`, `end_hour_event_staff_date`, `color_event_staff_date`, `created_at`, `updated_at`, `date_start`, `date_end`) VALUES
	(26, 21, '01:00:00', '01:00:00', 'linear-gradient(60deg, #F44236, #F48F36)', '2019-03-07 07:25:42', '2019-03-18 07:42:26', '2019-03-18', '2019-03-19'),
	(27, 21, '01:00:00', '01:00:00', 'linear-gradient(60deg, #F44236, #F48F36)', '2019-03-07 07:25:42', '2019-03-18 07:42:26', '2019-03-20', '2019-03-21'),
	(28, 22, '01:00:00', '01:00:00', 'linear-gradient(231deg, #899ED4, #A389D4)', '2019-03-07 07:25:42', '2019-03-18 07:42:26', '2019-03-22', '2019-03-23'),
	(29, 22, '01:00:00', '01:00:00', 'linear-gradient(231deg, #899ED4, #A389D4)', '2019-03-07 07:25:42', '2019-03-18 07:42:26', '2019-03-24', '2019-03-25'),
	(30, 23, '01:00:00', '01:00:00', 'linear-gradient(67deg, #1FA548, #21FFAA)', '2019-03-07 07:25:42', '2019-03-18 07:42:26', '2019-03-15', '2019-03-16'),
	(31, 23, '01:00:00', '01:00:00', 'linear-gradient(67deg, #1FA548, #21FFAA)', '2019-03-07 07:25:42', '2019-03-18 07:42:26', '2019-03-18', '2019-03-20'),
	(32, 24, '01:00:00', '01:01:00', 'linear-gradient(239deg, #1DE9B6, #1DC4E9)', '2019-03-11 08:20:49', '2019-03-11 08:20:49', '2019-03-13', '2019-03-15'),
	(33, 24, '01:00:00', '01:01:00', 'linear-gradient(239deg, #1DE9B6, #1DC4E9)', '2019-03-11 08:20:49', '2019-03-11 08:20:49', '2019-03-18', '2019-03-19'),
	(34, 25, '01:00:00', '01:01:00', 'linear-gradient(231deg, #899ED4, #A389D4)', '2019-03-11 08:20:49', '2019-03-11 08:20:49', '2019-03-14', '2019-03-15'),
	(35, 25, '01:00:00', '01:01:00', 'linear-gradient(231deg, #899ED4, #A389D4)', '2019-03-11 08:20:49', '2019-03-11 08:20:49', '2019-03-19', '2019-03-22'),
	(36, 26, '01:00:00', '01:01:00', 'linear-gradient(67deg, #1FA548, #21FFAA)', '2019-03-11 08:20:49', '2019-03-11 08:20:49', '2019-03-14', '2019-03-22'),
	(37, 27, '01:00:00', '01:01:00', 'linear-gradient(237deg, #48C6EF, #337DE2)', '2019-03-11 08:20:49', '2019-03-11 08:20:49', '2019-03-14', '2019-03-15'),
	(38, 27, '01:00:00', '01:01:00', 'linear-gradient(237deg, #48C6EF, #337DE2)', '2019-03-11 08:20:49', '2019-03-11 08:20:49', '2019-03-18', '2019-03-22');
/*!40000 ALTER TABLE `event_staff_date` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. event_staff_jobs
CREATE TABLE IF NOT EXISTS `event_staff_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_staff_id` int(10) unsigned NOT NULL,
  `job_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_event_staff_id` (`event_staff_id`),
  KEY `idx_job_id` (`job_id`),
  CONSTRAINT `event_staff_jobs_event_staff_id_foreign` FOREIGN KEY (`event_staff_id`) REFERENCES `event_staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_staff_jobs_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.event_staff_jobs : ~7 rows (environ)
DELETE FROM `event_staff_jobs`;
/*!40000 ALTER TABLE `event_staff_jobs` DISABLE KEYS */;
INSERT INTO `event_staff_jobs` (`id`, `event_staff_id`, `job_id`) VALUES
	(31, 24, 78),
	(32, 25, 79),
	(33, 26, 80),
	(34, 27, 82),
	(35, 21, 79),
	(36, 22, 81),
	(37, 23, 82);
/*!40000 ALTER TABLE `event_staff_jobs` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. event_staff_mobility
CREATE TABLE IF NOT EXISTS `event_staff_mobility` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_staff_id` int(10) unsigned NOT NULL,
  `mobility_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_event_staff_id` (`event_staff_id`),
  KEY `idx_mobility_id` (`mobility_id`),
  CONSTRAINT `event_staff_mobility_event_staff_id_foreign` FOREIGN KEY (`event_staff_id`) REFERENCES `event_staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_staff_mobility_mobility_id_foreign` FOREIGN KEY (`mobility_id`) REFERENCES `mobility` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.event_staff_mobility : ~7 rows (environ)
DELETE FROM `event_staff_mobility`;
/*!40000 ALTER TABLE `event_staff_mobility` DISABLE KEYS */;
INSERT INTO `event_staff_mobility` (`id`, `event_staff_id`, `mobility_id`) VALUES
	(8, 24, 44),
	(9, 25, 44),
	(10, 26, 43),
	(11, 27, 45),
	(12, 21, 43),
	(13, 22, 43),
	(14, 23, 45);
/*!40000 ALTER TABLE `event_staff_mobility` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. event_statement
CREATE TABLE IF NOT EXISTS `event_statement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `agency_id` int(10) unsigned NOT NULL,
  `staff_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_event_id` (`event_id`),
  KEY `idx_agency_id` (`agency_id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `event_statement_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_statement_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_statement_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.event_statement : ~0 rows (environ)
DELETE FROM `event_statement`;
/*!40000 ALTER TABLE `event_statement` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_statement` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. event_statement_question_answer
CREATE TABLE IF NOT EXISTS `event_statement_question_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_statement_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_event_statement_id` (`event_statement_id`),
  CONSTRAINT `event_statement_question_answer_event_statement_id_foreign` FOREIGN KEY (`event_statement_id`) REFERENCES `event_statement` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.event_statement_question_answer : ~0 rows (environ)
DELETE FROM `event_statement_question_answer`;
/*!40000 ALTER TABLE `event_statement_question_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_statement_question_answer` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. event_statement_question_answer_file
CREATE TABLE IF NOT EXISTS `event_statement_question_answer_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_answer_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_question_answer_id` (`question_answer_id`),
  CONSTRAINT `event_statement_question_answer_file_question_answer_id_foreign` FOREIGN KEY (`question_answer_id`) REFERENCES `event_statement_question_answer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.event_statement_question_answer_file : ~0 rows (environ)
DELETE FROM `event_statement_question_answer_file`;
/*!40000 ALTER TABLE `event_statement_question_answer_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_statement_question_answer_file` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. gender
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.gender : ~2 rows (environ)
DELETE FROM `gender`;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` (`id`, `name`) VALUES
	(1, 'Homme'),
	(2, 'Femme');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.jobs : ~19 rows (environ)
DELETE FROM `jobs`;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`id`, `icon`, `created_by`, `created_at`, `updated_at`) VALUES
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
CREATE TABLE IF NOT EXISTS `job_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_job_id` (`job_id`),
  CONSTRAINT `job_translation_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.job_translation : ~38 rows (environ)
DELETE FROM `job_translation`;
/*!40000 ALTER TABLE `job_translation` DISABLE KEYS */;
INSERT INTO `job_translation` (`id`, `job_id`, `name`, `language_id`) VALUES
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
	(21, 78, 'Team Lead', 2),
	(22, 79, 'Product Specialist', 2),
	(23, 80, 'Host', 2),
	(24, 81, 'In-field Coordinator', 2),
	(25, 82, 'Set up / tear down team', 2),
	(26, 83, 'In-store sampling', 2),
	(27, 84, 'Flyer distributions', 2),
	(28, 85, 'Photographer', 2),
	(29, 86, 'Mascot', 2),
	(30, 87, 'Waiter', 2),
	(31, 88, 'Diver', 2),
	(32, 89, 'Animator/ EMCEE', 2),
	(33, 90, 'DJ', 2),
	(34, 91, 'Magician', 2),
	(35, 92, 'Actor', 2),
	(36, 93, 'Dancer', 2),
	(37, 94, 'Singer', 2),
	(38, 95, 'Cartoonist', 2);
/*!40000 ALTER TABLE `job_translation` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. language
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.language : ~2 rows (environ)
DELETE FROM `language`;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` (`id`, `language_name`, `language_code`) VALUES
	(1, 'French', 'fr'),
	(2, 'English', 'en');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.migrations : ~74 rows (environ)
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
	(31, '2019_02_12_111916_create_table_event_manage_by', 5),
	(32, '2019_02_18_150950_update_table_event_staff', 6),
	(33, '2019_02_18_151223_update_table_event_staff_date', 6),
	(34, '2019_02_19_070755_update_table_event_staff_rename_id', 6),
	(35, '2019_02_19_070922_update_table_event_staff_date_rename_id', 6),
	(36, '2019_02_19_141150_update_table_jobs_rename_id', 7),
	(37, '2019_02_19_141415_update_table_job_translation_rename_foreiorereign_key', 7),
	(38, '2019_02_19_141720_create_table_event_staff__jobs', 7),
	(39, '2019_02_20_062853_update_mobility_rename_id', 8),
	(40, '2019_02_20_064611_update_mobility_translation_rename_id', 8),
	(41, '2019_02_20_071325_create_table_event_mobility', 8),
	(42, '2019_02_20_071515_create_event_staff_mobility', 8),
	(43, '2019_03_04_065346_update_users_add_language_code', 9),
	(44, '2019_03_05_115521_update_attributes_column_id', 10),
	(45, '2019_03_05_141200_update_attribute_options_column_id', 10),
	(46, '2019_03_05_141841_update_attribute_option_gender_column_id', 10),
	(47, '2019_03_05_142341_update_attribute_option_translations_column_id', 10),
	(48, '2019_03_05_142816_update_attribute_translations_column_id', 10),
	(49, '2019_03_05_143010_update_gender_column_id', 10),
	(50, '2019_03_05_143151_update_language_column_id', 10),
	(51, '2019_03_05_143319_update_staff_column_id', 10),
	(52, '2019_03_05_143555_update_staff_attribut_column_id', 10),
	(53, '2019_03_05_144142_update_staff_attribute_options_column_id', 10),
	(54, '2019_03_05_144539_update_staff_certifications_column_id', 10),
	(55, '2019_03_05_144759_update_staff_jobs_column_id', 10),
	(56, '2019_03_05_145120_update_staff_language_column_id', 10),
	(57, '2019_03_05_145519_update_staff_mobility_column_id', 10),
	(58, '2019_03_05_145756_update_staff_remuneration_column_id', 10),
	(59, '2019_03_05_145957_update_user_role_column_id', 10),
	(60, '2019_03_08_062431_create_table_all_language', 11),
	(61, '2019_03_08_062924_create_table_all_language_translation', 12),
	(62, '2019_03_08_081405_create_table_all_language_choice', 13),
	(63, '2019_03_08_081447_create_table_all_language_choice_translation', 13),
	(64, '2019_03_08_132621_update_table_staff_add_column_age', 14),
	(65, '2019_03_08_134404_update_table_staff_languages_add_column_all_language', 15),
	(66, '2019_03_08_134911_update_table_staff_languages_add_column_all_language', 16),
	(67, '2019_03_12_085827_create_table_event_statement', 17),
	(68, '2019_03_12_091006_create_table_event_statement_question_answer', 17),
	(69, '2019_03_12_091735_update_table_event_statement_question_answer', 17),
	(70, '2019_03_13_112722_update_table_event_statement', 17),
	(71, '2019_03_13_134126_create_table_event_candidate', 18),
	(72, '2019_03_13_130906_create_agency_staff_table', 19),
	(73, '2019_03_13_141850_update_table_event_statement_user_id_column', 19),
	(74, '2019_03_13_145038_update_table_event_statement_staff_id_column_', 19),
	(75, '2019_03_15_133221_create_table_status_event', 20),
	(76, '2019_03_15_133400_create_table_status_event_translation', 20),
	(77, '2019_03_15_135043_update_table_event_candidate', 21),
	(78, '2019_03_15_135719_update_table_event_candidate_plus', 22),
	(79, '2019_03_18_074923_update_event_candidate_add_agency_id', 23),
	(80, '2019_03_18_133620_create_table_event_statement_question_answer_file', 24),
	(81, '2019_03_20_115838_update_table_staff_attribut', 24),
	(82, '2019_03_21_073045_create_event_assessment_table', 25),
	(83, '2019_03_21_125635_create_event_assessment_table', 26),
	(84, '2019_03_22_064253_update_table_attributes_add_image', 27);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. mobility
CREATE TABLE IF NOT EXISTS `mobility` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.mobility : ~9 rows (environ)
DELETE FROM `mobility`;
/*!40000 ALTER TABLE `mobility` DISABLE KEYS */;
INSERT INTO `mobility` (`id`, `created_by`, `created_at`, `updated_at`) VALUES
	(41, 1, '2019-01-22 05:28:00', '2019-01-22 05:28:00'),
	(42, 1, '2019-01-22 05:28:00', '2019-01-22 05:28:00'),
	(43, 1, '2019-01-22 05:28:00', '2019-01-22 05:28:00'),
	(44, 1, '2019-01-22 05:28:00', '2019-01-22 05:28:00'),
	(45, 1, '2019-01-22 05:28:00', '2019-01-22 05:28:00'),
	(46, 1, '2019-01-22 05:28:00', '2019-01-22 05:28:00'),
	(47, 1, '2019-01-22 05:28:00', '2019-01-22 05:28:00'),
	(48, 1, '2019-01-22 05:28:00', '2019-01-22 05:28:00'),
	(49, 1, '2019-01-31 20:00:00', '2019-01-31 20:00:00');
/*!40000 ALTER TABLE `mobility` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. mobility_translation
CREATE TABLE IF NOT EXISTS `mobility_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobility_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mobility_id` (`mobility_id`),
  CONSTRAINT `mobility_translation_mobility_id_foreign` FOREIGN KEY (`mobility_id`) REFERENCES `mobility` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.mobility_translation : ~18 rows (environ)
DELETE FROM `mobility_translation`;
/*!40000 ALTER TABLE `mobility_translation` DISABLE KEYS */;
INSERT INTO `mobility_translation` (`id`, `mobility_id`, `name`, `language_id`) VALUES
	(1, 41, 'Grand Montréal', 1),
	(2, 42, 'Les alentours de Montréal', 1),
	(3, 43, 'Ville de Québec', 1),
	(4, 44, 'Les alentours de la ville de Québec', 1),
	(5, 45, 'Grand Toronto', 1),
	(6, 46, 'Les alentours de Toronto', 1),
	(7, 47, 'Ottawa-Gatineau', 1),
	(8, 48, 'Grand Vancouver', 1),
	(9, 41, 'Greater Montreal', 2),
	(10, 42, 'Areas around Montreal', 2),
	(11, 43, 'Quebec city', 2),
	(12, 44, 'Areas around Quebec city', 2),
	(13, 45, 'Greater Toronto', 2),
	(14, 46, 'Areas around Toronto', 2),
	(15, 47, 'Ottawa-Gatineau', 2),
	(16, 48, 'Greater Vancouver', 2),
	(17, 49, 'Les alentours de Vancouver', 1),
	(18, 49, 'Areas around Vancouver', 2);
/*!40000 ALTER TABLE `mobility_translation` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. password_resets
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
CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `kind` blob NOT NULL,
  `birthday` date NOT NULL,
  `ages` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `portrait_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `single_storey_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `staff_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.staff : ~9 rows (environ)
DELETE FROM `staff`;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` (`id`, `user_id`, `kind`, `birthday`, `ages`, `city`, `address`, `zip_code`, `source`, `portrait_pic`, `single_storey_pic`, `cv`) VALUES
	(14, 78, _binary 0x31, '1960-03-02', 28, 'Antsirabe', 'Vatofotsy', '00110', 'Our website', '2019-03-14-12-11-07-IMG_20190306_123114.jpg', '2019-03-14-12-11-07-IMG_20190306_122451.jpg', '2019-02-28-14-12-35-Fanasana.docx'),
	(15, 80, _binary 0x31, '1991-02-03', 28, '213', '13213', '1213', 'Parrainage', '2019-03-04-18-25-45-classe_auth.PNG', '2019-03-04-18-25-45-classe_delete.PNG', '2019-03-04-18-25-45-Avancement_HelloStaff.docx'),
	(17, 84, _binary 0x31, '1993-02-03', 26, '123123', '123123', 'm3m3m3', 'Notre site web', '2019-03-08-14-02-29-IMG_20190306_122313.jpg', '2019-03-08-14-02-29-IMG_20190306_123126.jpg', '2018-11-19-06-51-15-ExemplesCV.pdf'),
	(20, 88, _binary 0x31, '1994-02-02', 25, '4747', '4747', 'm5m5m5', 'Notre site web', '2019-03-08-14-15-01-IMG_20190306_122634.jpg', '2019-03-08-14-15-01-IMG_20190306_123356.jpg', '2019-03-08-14-15-01-Inscription_Staff_-_Traduction_.docx'),
	(21, 89, _binary 0x32, '1996-02-03', 23, '898989', '898989', 'p8p8p8', 'Parrainage', '2019-03-08-14-16-41-IMG_20190306_122313.jpg', '2019-03-08-14-16-41-IMG_20190306_122451.jpg', '2019-03-08-14-16-41-Inscription_Staff_-_Traduction_.docx'),
	(22, 90, _binary 0x31, '1993-02-03', 26, '585858', '5858585', 'p5p5p5', 'Parrainage', '2019-03-08-14-26-19-IMG_20190306_122634.jpg', '2019-03-08-14-26-19-IMG_20190306_133542.jpg', '2019-03-08-14-26-19-Inscription_Staff_-_Traduction_.docx'),
	(23, 91, _binary 0x32, '2017-11-03', 2, 'Antsirabe', 'Mahazoarivo', 'm0m0m0', 'Notre site web', '2019-03-10-09-26-03-IMG_20190306_133946.jpg', '2019-03-10-09-26-03-IMG_20190306_123356.jpg', '2019-03-10-09-26-03-Inscription_Staff_-_Traduction_.docx'),
	(27, 96, _binary 0x31, '1990-01-01', 29, 'test', 'test', 'e1e2e1', 'Amis', '2019-03-19-18-11-14-cas_gerer_abonnées.PNG', '2019-03-19-18-11-14-cas_d\'utilisation.PNG', '2019-03-19-18-11-14-Avancement_HelloStaff.docx'),
	(28, 97, _binary 0x31, '1991-03-02', 28, 'dede', 'dede', 'e1e2e1', 'Parrainage', '2019-03-19-18-18-13-cas_d\'utilisation.PNG', '2019-03-19-18-18-13-cas_actualiser_resultats.PNG', '2019-03-19-18-18-13-Fanasana.docx'),
	(29, 98, _binary 0x31, '1990-01-01', 29, 'he', 'he', 'e2h2h2', 'Parrainage', '2019-03-19-18-32-52-classe_modify.PNG', '2019-03-19-18-32-52-cas_2.0_global.PNG', '2019-03-19-18-32-52-Avancement_HelloStaff.docx'),
	(30, 99, _binary 0x31, '1991-02-02', 28, 'dsfsdfsdf', 'sdfsdf', 'k1k1k1', 'Parrainage', '2019-03-22-08-26-21-cas_d\'utilisation.PNG', '2019-03-22-08-26-21-cas_actualiser_resultats.PNG', '2019-03-22-08-26-21-Avancement_HelloStaff.docx');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. staff_attribut
CREATE TABLE IF NOT EXISTS `staff_attribut` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `tattoo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `piercing` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `not_pronounced` blob NOT NULL,
  `height` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `staff_attribut_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.staff_attribut : ~10 rows (environ)
DELETE FROM `staff_attribut`;
/*!40000 ALTER TABLE `staff_attribut` DISABLE KEYS */;
INSERT INTO `staff_attribut` (`id`, `staff_id`, `tattoo`, `piercing`, `not_pronounced`, `height`) VALUES
	(12, 14, '2', '2', _binary 0x30, '5\'3" = 1.60m'),
	(13, 15, '1', '1', _binary 0x30, '5\'3" = 1.60m'),
	(14, 17, '3', '3', _binary 0x30, '5\'3" = 1.60m'),
	(15, 20, '1', '2', _binary 0x30, '5\'3" = 1.60m'),
	(16, 21, '1', '2', _binary 0x30, '5\'3" = 1.60m'),
	(17, 22, '3', '1', _binary 0x30, '5\'3" = 1.60m'),
	(18, 23, '1', '1', _binary 0x30, '5\'3" = 1.60m'),
	(22, 27, '1', '2', _binary 0x30, '5\'3" = 1.60m'),
	(23, 28, '2', '2', _binary 0x30, '5\'3" = 1.60m'),
	(24, 29, '2', '2', _binary 0x30, '5\'3" = 1.60m'),
	(25, 30, '3', '3', _binary 0x30, '5\'3" = 1.60m');
/*!40000 ALTER TABLE `staff_attribut` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. staff_attribute_options
CREATE TABLE IF NOT EXISTS `staff_attribute_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_attribut_id` int(10) unsigned DEFAULT NULL,
  `attribute_id` int(10) unsigned DEFAULT NULL,
  `attribute_option_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_staff_attribut_id` (`staff_attribut_id`),
  KEY `idx_attribute_id` (`attribute_id`),
  KEY `idxattribute_option_id` (`attribute_option_id`),
  CONSTRAINT `staff_attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `staff_attribute_options_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `staff_attribute_options_staff_attribut_id_foreign` FOREIGN KEY (`staff_attribut_id`) REFERENCES `staff_attribut` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.staff_attribute_options : ~33 rows (environ)
DELETE FROM `staff_attribute_options`;
/*!40000 ALTER TABLE `staff_attribute_options` DISABLE KEYS */;
INSERT INTO `staff_attribute_options` (`id`, `staff_attribut_id`, `attribute_id`, `attribute_option_id`) VALUES
	(34, 12, 1, 22),
	(35, 12, 2, 26),
	(36, 12, 3, 62),
	(37, 13, 1, 20),
	(38, 13, 2, 42),
	(39, 13, 3, 79),
	(40, 14, 1, 22),
	(41, 14, 2, 31),
	(42, 14, 3, 87),
	(43, NULL, NULL, 21),
	(44, NULL, NULL, NULL),
	(45, NULL, NULL, 79),
	(46, NULL, NULL, NULL),
	(47, NULL, NULL, NULL),
	(48, NULL, NULL, NULL),
	(49, 17, 1, 23),
	(50, 17, 2, 29),
	(51, 17, 3, 64),
	(52, 18, 1, 23),
	(53, 18, 2, 29),
	(54, 18, 3, 63),
	(64, 22, 1, 19),
	(65, 22, 2, 25),
	(66, 22, 3, 61),
	(67, 23, 1, 20),
	(68, 23, 2, 25),
	(69, 23, 3, 62),
	(70, 24, 1, 19),
	(71, 24, 2, 25),
	(72, 24, 3, 61),
	(73, 25, 1, 22),
	(74, 25, 2, NULL),
	(75, 25, 3, NULL);
/*!40000 ALTER TABLE `staff_attribute_options` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. staff_certifications
CREATE TABLE IF NOT EXISTS `staff_certifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `actra` blob NOT NULL,
  `food_handling` blob NOT NULL,
  `uda` blob NOT NULL,
  `have_car` blob NOT NULL,
  `driver_license` blob NOT NULL,
  `driver_license_truck` blob NOT NULL,
  `smart_serve` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `staff_certifications_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.staff_certifications : ~9 rows (environ)
DELETE FROM `staff_certifications`;
/*!40000 ALTER TABLE `staff_certifications` DISABLE KEYS */;
INSERT INTO `staff_certifications` (`id`, `staff_id`, `actra`, `food_handling`, `uda`, `have_car`, `driver_license`, `driver_license_truck`, `smart_serve`) VALUES
	(12, 14, _binary 0x31, _binary 0x30, _binary 0x30, _binary 0x30, _binary 0x30, _binary 0x30, _binary 0x31),
	(13, 15, _binary 0x31, _binary 0x30, _binary 0x30, _binary 0x31, _binary 0x31, _binary 0x31, _binary 0x30),
	(14, 17, _binary 0x31, _binary 0x31, _binary 0x30, _binary 0x31, _binary 0x30, _binary 0x31, _binary 0x30),
	(15, 20, _binary 0x30, _binary 0x30, _binary 0x31, _binary 0x30, _binary 0x31, _binary 0x30, _binary 0x30),
	(16, 21, _binary 0x30, _binary 0x30, _binary 0x30, _binary 0x31, _binary 0x31, _binary 0x31, _binary 0x30),
	(17, 22, _binary 0x30, _binary 0x30, _binary 0x31, _binary 0x31, _binary 0x31, _binary 0x31, _binary 0x30),
	(18, 23, _binary 0x30, _binary 0x30, _binary 0x31, _binary 0x31, _binary 0x31, _binary 0x30, _binary 0x30),
	(22, 27, _binary 0x30, _binary 0x30, _binary 0x30, _binary 0x31, _binary 0x31, _binary 0x31, _binary 0x30),
	(23, 28, _binary 0x30, _binary 0x30, _binary 0x30, _binary 0x31, _binary 0x31, _binary 0x31, _binary 0x30),
	(24, 29, _binary 0x30, _binary 0x30, _binary 0x30, _binary 0x31, _binary 0x31, _binary 0x31, _binary 0x30),
	(25, 30, _binary 0x31, _binary 0x30, _binary 0x30, _binary 0x31, _binary 0x30, _binary 0x30, _binary 0x31);
/*!40000 ALTER TABLE `staff_certifications` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. staff_jobs
CREATE TABLE IF NOT EXISTS `staff_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `job_id` int(10) unsigned DEFAULT NULL,
  `experience_year` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_staff_id` (`staff_id`),
  KEY `idx_job_id` (`job_id`),
  CONSTRAINT `staff_jobs_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `staff_jobs_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.staff_jobs : ~9 rows (environ)
DELETE FROM `staff_jobs`;
/*!40000 ALTER TABLE `staff_jobs` DISABLE KEYS */;
INSERT INTO `staff_jobs` (`id`, `staff_id`, `job_id`, `experience_year`) VALUES
	(10, 14, 78, 1),
	(12, 17, 78, 2),
	(13, 17, 94, 1),
	(18, 20, 78, 0),
	(19, 22, 78, 3),
	(20, 23, 81, 1),
	(23, 14, 77, 3),
	(25, 27, 78, 1),
	(26, 28, 78, 1),
	(27, 29, 78, 2),
	(28, 30, 78, 1),
	(29, 30, 91, 2),
	(30, 21, 91, 2),
	(31, 15, 91, 2);
/*!40000 ALTER TABLE `staff_jobs` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. staff_languages
CREATE TABLE IF NOT EXISTS `staff_languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `all_language_id` int(11) NOT NULL,
  `all_language_choice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `staff_languages_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.staff_languages : ~18 rows (environ)
DELETE FROM `staff_languages`;
/*!40000 ALTER TABLE `staff_languages` DISABLE KEYS */;
INSERT INTO `staff_languages` (`id`, `staff_id`, `all_language_id`, `all_language_choice_id`) VALUES
	(19, 14, 1, 3),
	(21, 15, 6, 2),
	(24, 17, 1, 4),
	(25, 17, 2, 2),
	(28, 20, 6, 4),
	(29, 20, 8, 3),
	(30, 20, 9, 3),
	(31, 20, 11, 2),
	(32, 20, 12, 2),
	(33, 21, 5, 2),
	(34, 21, 8, 2),
	(35, 22, 2, 2),
	(36, 22, 3, 3),
	(37, 22, 6, 2),
	(38, 22, 9, 2),
	(39, 23, 1, 3),
	(40, 23, 2, 2),
	(41, 23, 4, 1),
	(47, 27, 1, 3),
	(48, 28, 8, 2),
	(49, 29, 2, 1),
	(50, 30, 1, 2),
	(51, 30, 2, 3);
/*!40000 ALTER TABLE `staff_languages` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. staff_mobility
CREATE TABLE IF NOT EXISTS `staff_mobility` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `mobility_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_staff_id` (`staff_id`),
  KEY `idx_mobility_id` (`mobility_id`),
  CONSTRAINT `staff_mobility_mobility_id_foreign` FOREIGN KEY (`mobility_id`) REFERENCES `mobility` (`id`) ON DELETE SET NULL,
  CONSTRAINT `staff_mobility_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.staff_mobility : ~14 rows (environ)
DELETE FROM `staff_mobility`;
/*!40000 ALTER TABLE `staff_mobility` DISABLE KEYS */;
INSERT INTO `staff_mobility` (`id`, `staff_id`, `mobility_id`) VALUES
	(15, 15, 43),
	(16, 17, 47),
	(17, 20, 43),
	(18, 20, 47),
	(19, 21, 43),
	(20, 22, 47),
	(21, 22, 48),
	(22, 23, 43),
	(23, 23, 47),
	(24, 23, 48),
	(27, 14, 42),
	(31, 27, 47),
	(32, 28, 46),
	(33, 29, 48),
	(34, 30, 41),
	(35, 30, 46);
/*!40000 ALTER TABLE `staff_mobility` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. staff_remunerations
CREATE TABLE IF NOT EXISTS `staff_remunerations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `price` int(11) NOT NULL,
  `nas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `staff_remunerations_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.staff_remunerations : ~9 rows (environ)
DELETE FROM `staff_remunerations`;
/*!40000 ALTER TABLE `staff_remunerations` DISABLE KEYS */;
INSERT INTO `staff_remunerations` (`id`, `staff_id`, `price`, `nas`) VALUES
	(12, 14, 16, '123456789'),
	(13, 15, 17, ''),
	(14, 17, 17, ''),
	(15, 20, 17, ''),
	(16, 21, 17, ''),
	(17, 22, 17, ''),
	(18, 23, 17, ''),
	(22, 27, 15, ''),
	(23, 28, 15, ''),
	(24, 29, 15, ''),
	(25, 30, 15, '');
/*!40000 ALTER TABLE `staff_remunerations` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. status_event
CREATE TABLE IF NOT EXISTS `status_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.status_event : ~4 rows (environ)
DELETE FROM `status_event`;
/*!40000 ALTER TABLE `status_event` DISABLE KEYS */;
INSERT INTO `status_event` (`id`, `created_at`, `updated_at`) VALUES
	(1, '2019-03-15 14:37:47', '2019-03-15 14:37:49'),
	(2, '2019-03-15 14:37:47', '2019-03-15 14:37:49'),
	(3, '2019-03-15 14:37:47', '2019-03-15 14:37:49'),
	(4, '2019-03-15 14:37:47', '2019-03-15 14:37:49');
/*!40000 ALTER TABLE `status_event` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. status_event_translation
CREATE TABLE IF NOT EXISTS `status_event_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status_id` (`status_id`),
  CONSTRAINT `status_event_translation_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `status_event` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.status_event_translation : ~8 rows (environ)
DELETE FROM `status_event_translation`;
/*!40000 ALTER TABLE `status_event_translation` DISABLE KEYS */;
INSERT INTO `status_event_translation` (`id`, `status_id`, `name`, `language_id`) VALUES
	(1, 1, '--', 1),
	(2, 1, '--', 2),
	(3, 2, 'En attente', 1),
	(4, 2, 'Waiting', 2),
	(5, 3, 'Indisponible', 1),
	(6, 3, 'Unavailable', 2),
	(7, 4, 'Confirmé', 1),
	(8, 4, 'Confirmed', 2);
/*!40000 ALTER TABLE `status_event_translation` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  KEY `idx_role_id` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.users : ~16 rows (environ)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `first_name`, `last_name`, `email`, `phone`, `language_code`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(67, 2, 'Andry', 'Hery', 'aa@alternateeve.com', '2543543', 'fr', '2019-02-04 07:57:16', '$2y$10$2wXTz8cEyQZYnlqwCaZFZ.AJJGZFs0YAnk69/w61M5r3uSKNxJJRm', 'gkwe1TCEdqc4lPbiufp0RABmEr9NtGBt4Kk5bVZMYQ9a6lUEMSHGycVurUXi', '2019-02-01 15:55:47', '2019-03-07 11:03:23'),
	(70, 2, 'Thomas', 'Lussiez', 'lussiezthomas06@gmail.com', '5146496664', NULL, '2019-03-14 08:46:28', '$2y$10$AjtorL0RoW.ukfBZfPGbPO12Oml1jZ4TlrMMI9xCrg6Qfmv1NB28e', NULL, '2019-02-04 22:59:03', '2019-02-04 22:59:03'),
	(76, 2, 'SALVA', 'SS', 'salvadu_94@hotmail.fr', '+5142458963', NULL, '2019-02-11 18:43:44', '$2y$10$TjZ69.DfGEBNdiF.Y1lPr.KMhlNKHZPx2qO3cE.YeYgOSSEMibSx.', NULL, '2019-02-11 18:31:59', '2019-02-11 18:43:44'),
	(78, 1, 'Andry', 'ANDRIANAIVO', 'andryhsm@gmail.com', '446307389', 'en', '2019-02-28 14:14:57', '$2y$10$mMUChiHPVtmLtTq/ATJxs.iHuuRIOOXMBcC1DIxXRbQXty/84jUtu', 'qVpex03JdLup8cxgLvf34KhQHSU7axk4e2GPUFdAvAFwvAoiU9568piVIl29', '2019-02-28 14:12:35', '2019-03-14 13:05:42'),
	(79, 2, 'ANDRIANAIVO', 'Mitia', 'andryhsm@yahoo.fr', '242424242', 'fr', '2019-03-04 07:00:26', '$2y$10$cNODse92gnwU0fzlaOOdQesks6Q/HyFr9nb1FmXwozGzWD8mlnotS', 'tb0YuYrCPtX6O0SocatqHirIcNxQc3tcBdmTB2Zst5ZTFI5hGFcWuoEVe0DK', '2019-03-04 06:59:34', '2019-03-04 07:00:26'),
	(80, 1, 'testtest', 'test', 'tets@tet.et', '123123', 'fr', '2019-03-14 08:46:30', '$2y$10$QDHJLwu/2v8h0FTQOol1L.BlAHI.OBVNATvdeIB/IBKo3fU7EbZNm', 'IBOtnlytuPNCt5ZdzwnnL6nUvCi416u6UIZmIrfnLvyTiyCDRYS5dv9nxN80', '2019-03-04 18:25:45', '2019-03-04 18:25:45'),
	(81, 2, 'test', 'test', 'test@test.test', '123', 'fr', '2019-03-14 08:46:31', '$2y$10$OyJwvyalnAEVMvP4Rosnne4AyQQMgWvSM8hKuOZWUPjw1hQkboM/K', NULL, '2019-03-04 18:46:59', '2019-03-04 18:46:59'),
	(82, 2, 'test', 'fdf', 'setst@tet.te', '456871', 'fr', '2019-03-14 08:46:32', '$2y$10$PfutWI4XG9yxK1NUw2S.WuaznUYuHQ0tgUDoj.bJPLsHRKLDdDHR.', NULL, '2019-03-04 19:07:31', '2019-03-04 19:07:31'),
	(84, 1, 'Njato', 'Fens', 'nr@alternateeve.com', '123123123', 'fr', '2019-03-14 08:46:33', '$2y$10$s2kmkJ.qbXOEWD4iZ9rFLe5jHk0U8sIeRFa03Lp5W7y9cRe7XKu1K', 'Hb0jpHYrXoZcNzlxLacKxHJnMFyoWdMUFd3ZCERzdL6JFzVasWcGyE5tkNBY', '2019-03-08 14:02:29', '2019-03-08 14:02:29'),
	(88, 1, '4747', '4747', 'br@alternateeve.com', '474747', 'fr', '2019-03-14 08:46:33', '$2y$10$Y9BjuUrd7k41ie9xIokzv.BjfKqVBm7l6.XXwx51Eo7Ko/8f6Z1Zi', 'Migfpc2pKBITnEQGLlaAJf01mDeUdYfystS9qkCZtb46wbi2IRIS8aM3jjrx', '2019-03-08 14:15:01', '2019-03-08 14:15:01'),
	(89, 1, 'gegeg', 'gegeg', 'ir@alternateeve.com', '898989', 'fr', '2019-03-14 08:46:35', '$2y$10$NYkzmtO6IeXrVakCGPDdqu5BEPu33FuzqLY/BiDfKKyZRjsFCr4vq', 'sorDRu7txnDNQVWnyJ2xhdWN4SlfvEy67M6R4GnIPcuaN6TYfC6EkCvJYIYx', '2019-03-08 14:16:41', '2019-03-08 14:16:41'),
	(90, 1, 'fddfds', 'fdfsf', 'ft@alternateeve.com', '585858', 'fr', '2019-03-14 08:46:35', '$2y$10$/OX7NL5mR8HGN/il/k9oEOfEZKMREXr7CDv2IbNGLTRpBBGhzEuqO', NULL, '2019-03-08 14:26:19', '2019-03-08 14:26:19'),
	(91, 1, 'ANDRIANAIVO', 'Mitia', 'mitia@gmail.com', '11111111', 'fr', '2019-03-14 08:46:36', '$2y$10$zgP3hIYxK7olJktziI/Io.lvHsmwAMxgpgz02yIaZl4TLeLCFl1.a', 'WKn2oPBSdi4T56AmMNaeBvzGCo6X5JFHGty6vwPinx2L3Q2GMrzDI5lINRiV', '2019-03-10 09:26:03', '2019-03-10 09:26:03'),
	(96, 1, 'test', 'test', 'testtest@test.test', '132456', 'fr', NULL, '$2y$10$ex7OFVV.QkxWJ019oHS/LOxB7cTa2DOwchbO6cQ2wIkeRGS31mXRC', NULL, '2019-03-19 18:11:14', '2019-03-19 18:11:14'),
	(97, 1, 'dede', 'dede', 'dede@dedede.de', '1234562145', 'fr', '2019-03-19 19:21:12', '$2y$10$bwPW1x.WqbxFiIm19cwqvelMPEuliWmFM6oJ8aQ37.bfCmW2i9p4a', 'TZrVVnZKkP5FQuov4bHJdhur5lRBwzPNNwyDVfP2kR9kVH0ISmISjekoQu6M', '2019-03-19 18:18:13', '2019-03-19 18:18:13'),
	(98, 1, 'hehe', 'hehe', 'he@he.he', '1548756428', 'fr', NULL, '$2y$10$YsYns4NwQTCB/QBQjtZ8cephXqsscSSzaFuUf9hhiMxhe25J1XHCC', NULL, '2019-03-19 18:32:52', '2019-03-19 18:32:52'),
	(99, 1, 'fgfgfg', 'fgfgfg', 'er@alternateeve.com', '5245254', 'fr', '2019-03-22 09:27:13', '$2y$10$pZctCHhwc4Ujlftf7bgGOuUXMjKJq1XPsiwxnAhPbx4kizn81GKme', NULL, '2019-03-22 08:26:21', '2019-03-22 08:26:21');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Export de la structure de la table hello_staff. user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.user_role : ~2 rows (environ)
DELETE FROM `user_role`;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`, `role_name`, `created_at`, `updated_at`) VALUES
	(1, 'Staff', '2019-01-22 07:28:01', '2019-01-22 07:28:01'),
	(2, 'Agency', '2019-01-22 07:28:01', '2019-01-22 07:28:01');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
