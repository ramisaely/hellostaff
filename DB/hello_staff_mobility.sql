-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 04 mars 2019 à 12:47
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

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

-- --------------------------------------------------------

--
-- Structure de la table `mobility`
--

DROP TABLE IF EXISTS `mobility`;
CREATE TABLE IF NOT EXISTS `mobility` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mobility`
--

REPLACE INTO `mobility` (`id`, `created_by`, `created_at`, `updated_at`) VALUES
(41, 1, '2019-01-22 04:28:00', '2019-01-22 04:28:00'),
(42, 1, '2019-01-22 04:28:00', '2019-01-22 04:28:00'),
(43, 1, '2019-01-22 04:28:00', '2019-01-22 04:28:00'),
(44, 1, '2019-01-22 04:28:00', '2019-01-22 04:28:00'),
(45, 1, '2019-01-22 04:28:00', '2019-01-22 04:28:00'),
(46, 1, '2019-01-22 04:28:00', '2019-01-22 04:28:00'),
(47, 1, '2019-01-22 04:28:00', '2019-01-22 04:28:00'),
(48, 1, '2019-01-22 04:28:00', '2019-01-22 04:28:00'),
(49, 1, '2019-01-31 19:00:00', '2019-01-31 19:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `mobility_translation`
--

DROP TABLE IF EXISTS `mobility_translation`;
CREATE TABLE IF NOT EXISTS `mobility_translation` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mobility_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mobility_id` (`mobility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mobility_translation`
--

REPLACE INTO `mobility_translation` (`id`, `mobility_id`, `name`, `language_id`) VALUES
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

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `mobility_translation`
--
ALTER TABLE `mobility_translation`
  ADD CONSTRAINT `mobility_translation_mobility_id_foreign` FOREIGN KEY (`mobility_id`) REFERENCES `mobility` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
