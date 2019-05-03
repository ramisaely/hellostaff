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

-- Export de la structure de la table hello_staff. job_translation
DROP TABLE IF EXISTS `job_translation`;
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

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
