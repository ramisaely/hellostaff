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

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
