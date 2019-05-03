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

-- Export de la structure de la table hello_staff. all_language
CREATE TABLE IF NOT EXISTS `all_language` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table hello_staff.all_language : ~12 rows (environ)
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

-- Export de données de la table hello_staff.all_language_translation : ~24 rows (environ)
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

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
