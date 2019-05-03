-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: hello_staff
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency` (
  `agency_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`agency_id`),
  UNIQUE KEY `agency_phone_unique` (`phone`),
  UNIQUE KEY `agency_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES (11,'Nom','adresse@gmail.com',9845345,'Ville',NULL,NULL,'34453','Ontario','Canada','2019-01-08-07-48-29-Penguins.jpg','fdsfsd',NULL,'9456875','courriel@cour.cr','2019-01-08 07:48:29','2019-01-08 07:48:29'),(14,'Nom','adresse@gmail.com',98453455,'Ville',NULL,NULL,'34453','Ontario','Canada','2019-01-08-08-10-42-Penguins.jpg','yuyuiyiu',NULL,'945687589','courriel@cour.crm','2019-01-08 08:10:42','2019-01-08 08:10:42'),(19,'Nom','2adresse@gmail.com',984,'Ville',NULL,NULL,'34453','Ontario','Canada','2019-01-08-09-26-50-Hydrangeas.jpg','23',NULL,'94568758912','23courriel@cour.crm','2019-01-08 09:26:50','2019-01-08 09:26:50');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agency_users`
--

DROP TABLE IF EXISTS `agency_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency_users`
--

LOCK TABLES `agency_users` WRITE;
/*!40000 ALTER TABLE `agency_users` DISABLE KEYS */;
INSERT INTO `agency_users` VALUES (1,6,4),(2,7,5),(3,8,6),(4,9,7),(5,10,8),(6,11,9),(7,19,11);
/*!40000 ALTER TABLE `agency_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_option_gender`
--

DROP TABLE IF EXISTS `attribute_option_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_option_gender` (
  `attribute_option_gender_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned DEFAULT NULL,
  `attribute_option_id` int(10) unsigned DEFAULT NULL,
  `gender_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_option_gender_id`),
  KEY `idx_attribute_id` (`attribute_id`),
  KEY `idx_attribute_option_id` (`attribute_option_id`),
  CONSTRAINT `attribute_option_gender_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_option_gender_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`attribute_option_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_option_gender`
--

LOCK TABLES `attribute_option_gender` WRITE;
/*!40000 ALTER TABLE `attribute_option_gender` DISABLE KEYS */;
INSERT INTO `attribute_option_gender` VALUES (1,3,39,2),(2,3,40,2),(3,3,41,2),(4,3,42,2),(5,3,43,2),(6,3,44,2),(7,3,45,2),(8,3,46,2),(9,3,47,2),(10,3,48,2),(11,3,49,2),(12,3,50,2),(13,3,51,2),(14,3,52,2),(15,3,53,2),(16,3,54,2),(17,3,55,2),(18,3,56,1),(19,3,57,1),(20,3,58,1),(21,3,59,1),(22,3,60,1),(23,3,61,1),(24,3,62,1),(25,3,63,1),(26,3,64,1),(27,3,65,1),(28,3,66,1),(29,3,67,1),(30,3,68,1),(31,3,69,1),(32,3,70,1),(33,3,71,1),(34,3,72,1),(35,3,73,1),(36,3,74,1),(37,3,75,1),(38,3,76,1),(39,3,77,1);
/*!40000 ALTER TABLE `attribute_option_gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_option_translations`
--

DROP TABLE IF EXISTS `attribute_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_option_translations` (
  `attribute_option_translation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_option_id` int(10) unsigned DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_option_translation_id`),
  KEY `idx_attribute_option_id` (`attribute_option_id`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`attribute_option_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_option_translations`
--

LOCK TABLES `attribute_option_translations` WRITE;
/*!40000 ALTER TABLE `attribute_option_translations` DISABLE KEYS */;
INSERT INTO `attribute_option_translations` VALUES (37,19,'XS',1),(38,19,'XS',2),(39,20,'S',1),(40,20,'S',2),(41,21,'M',1),(42,21,'M',2),(43,22,'L',1),(44,22,'L',2),(45,23,'XL',1),(46,23,'XL',2),(47,24,'XXL',1),(48,24,'XXL',2),(49,25,'26',1),(50,25,'26',2),(51,26,'28',1),(52,26,'28',2),(53,27,'29',1),(54,27,'29',2),(55,28,'30',1),(56,28,'30',2),(57,29,'31',1),(58,29,'31',2),(59,30,'32',1),(60,30,'32',2),(61,31,'33',1),(62,31,'33',2),(63,32,'34',1),(64,32,'34',2),(65,33,'36',1),(66,33,'36',2),(67,34,'38',1),(68,34,'38',2),(69,35,'40',1),(70,35,'40',2),(71,36,'42',1),(72,36,'42',2),(73,37,'44',1),(74,37,'44',2),(75,38,'46',1),(76,38,'46',2),(77,39,'35EU - 4US',1),(78,39,'35EU - 4US',2),(79,40,'35,5EU - 4,5US',1),(80,40,'35,5EU - 4,5US',2),(81,41,'36EU - 5US',1),(82,41,'36EU - 5US',2),(83,42,'36,5EU - 5,5US',1),(84,42,'36,5EU - 5,5US',2),(85,43,'37EU - 5,5US',1),(86,43,'37EU - 5,5US',2),(87,44,'37,5EU - 6US',1),(88,44,'37,5EU - 6US',2),(89,45,'38EU - 6,5US',1),(90,45,'38EU - 6,5US',2),(91,46,'38,5EU - 7US',1),(92,46,'38,5EU - 7US',2),(93,47,'39EU - 7,5US',1),(94,47,'39EU - 7,5US',2),(95,48,'39,5EU - 7,5US',1),(96,48,'39,5EU - 7,5US',2),(97,49,'40EU - 8US',1),(98,49,'40EU - 8US',2),(99,50,'40,5EU - 8,5US',1),(100,50,'40,5EU - 8,5US',2),(101,51,'41EU - 9US',1),(102,51,'41EU - 9US',2),(103,52,'41,5EU - 9,5US',1),(104,52,'41,5EU - 9,5US',2),(105,53,'42EU - 9,5US',1),(106,53,'42EU - 9,5US',2),(107,54,'42,5EU - 10US',1),(108,54,'42,5EU - 10US',2),(109,55,'43EU - 10,5US',1),(110,55,'43EU - 10,5US',2),(111,56,'39EU - 6US',1),(112,56,'39EU - 6US',2),(113,57,'39,5EU - 6,5US',1),(114,57,'39,5EU - 6,5US',2),(115,58,'40EU - 7US',1),(116,58,'40EU - 7US',2),(117,59,'40,5EU - 7,5US',1),(118,59,'40,5EU - 7,5US',2),(119,60,'41EU - 8US',1),(120,60,'41EU - 8US',2),(121,61,'41,5EU - 8US',1),(122,61,'41,5EU - 8US',2),(123,62,'42EU - 8,5US',1),(124,62,'42EU - 8,5US',2),(125,63,'42,5EU - 9US',1),(126,63,'42,5EU - 9US',2),(127,64,'43EU - 9,5US',1),(128,64,'43EU - 9,5US',2),(129,65,'43,5EU - 9,5US',1),(130,65,'43,5EU - 9,5US',2),(131,66,'44EU - 10US',1),(132,66,'44EU - 10US',2),(133,67,'44,5EU - 10,5US',1),(134,67,'44,5EU - 10,5US',2),(135,68,'45EU - 11US',1),(136,68,'45EU - 11US',2),(137,69,'45,5EU - 11,5US',1),(138,69,'45,5EU - 11,5US',2),(139,70,'46EU - 11,5US',1),(140,70,'46EU - 11,5US',2),(141,71,'46,5EU - 12US',1),(142,71,'46,5EU - 12US',2),(143,72,'47EU - 12,5US',1),(144,72,'47EU - 12,5US',2),(145,73,'47,5EU - 13US',1),(146,73,'47,5EU - 13US',2),(147,74,'48EU - 13,5US',1),(148,74,'48EU - 13,5US',2),(149,75,'48,5EU - 14US',1),(150,75,'48,5EU - 14US',2),(151,76,'49EU - 14,5US',1),(152,76,'49EU - 14,5US',2),(153,77,'49,5EU - 15US',1),(154,77,'49,5EU - 15US',2);
/*!40000 ALTER TABLE `attribute_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_options`
--

DROP TABLE IF EXISTS `attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_options` (
  `attribute_option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`attribute_option_id`),
  KEY `idx_attribute_id` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_options`
--

LOCK TABLES `attribute_options` WRITE;
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
INSERT INTO `attribute_options` VALUES (19,1,1),(20,1,2),(21,1,3),(22,1,4),(23,1,5),(24,1,6),(25,2,1),(26,2,2),(27,2,3),(28,2,4),(29,2,5),(30,2,6),(31,2,7),(32,2,8),(33,2,9),(34,2,10),(35,2,11),(36,2,12),(37,2,13),(38,2,14),(39,3,1),(40,3,2),(41,3,3),(42,3,4),(43,3,5),(44,3,6),(45,3,7),(46,3,8),(47,3,9),(48,3,10),(49,3,11),(50,3,12),(51,3,13),(52,3,14),(53,3,15),(54,3,16),(55,3,17),(56,3,18),(57,3,19),(58,3,20),(59,3,21),(60,3,22),(61,3,23),(62,3,24),(63,3,25),(64,3,26),(65,3,27),(66,3,28),(67,3,29),(68,3,30),(69,3,31),(70,3,32),(71,3,33),(72,3,34),(73,3,35),(74,3,36),(75,3,37),(76,3,38),(77,3,39);
/*!40000 ALTER TABLE `attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_translations`
--

DROP TABLE IF EXISTS `attribute_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_translations` (
  `attribute_translation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_translation_id`),
  KEY `idx_attribute_id` (`attribute_id`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_translations`
--

LOCK TABLES `attribute_translations` WRITE;
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
INSERT INTO `attribute_translations` VALUES (1,1,'Veste/Chemises',1),(2,1,'Jacket/Shirts',2),(3,2,'Pantalons',1),(4,2,'Pants',2),(5,3,'Chaussures',1),(6,3,'Shoes',2);
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'1','2018-09-25 11:54:20','2018-09-25 11:54:20'),(2,'1','2018-09-25 11:54:38','2018-09-25 11:54:38'),(3,'1','2018-09-25 11:54:38','2018-09-25 11:54:38');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender` (
  `gender_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'Homme'),(2,'Femme');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_translation`
--

DROP TABLE IF EXISTS `job_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_translation` (
  `job_translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`job_translation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_translation`
--

LOCK TABLES `job_translation` WRITE;
/*!40000 ALTER TABLE `job_translation` DISABLE KEYS */;
INSERT INTO `job_translation` VALUES (1,77,'Ambassadeur de marque',1),(2,78,'Chef d\'équipe',1),(3,79,'Spécialiste Produit',1),(4,80,'Hôte',1),(5,81,'Coordinateur de terrain',1),(6,82,'Equipe de montage/démontage',1),(7,83,'Dégustation',1),(8,84,'Distribution de dépliants',1),(9,85,'Photographe',1),(10,86,'Mascotte',1),(11,87,'Serveur',1),(12,88,'Plongueur',1),(13,89,'Maître de cérémonie',1),(14,90,'DJ',1),(15,91,'Magicien',1),(16,92,'Acteur',1),(17,93,'Danseur',1),(18,94,'Chanteur',1),(19,95,'Caricaturiste',1),(20,77,'Brand ambassador',2),(21,78,'Leader',2),(22,79,'Product Specialist',2),(23,80,'Host',2),(24,81,'Field coordinator',2),(25,82,'Assembly / disassembly team',2),(26,83,'Tasting',2),(27,84,'Distribution of leaflets',2),(28,85,'Photographer',2),(29,86,'Mascot',2),(30,87,'Waiter',2),(31,88,'Diver',2),(32,89,'Master of Ceremonies',2),(33,90,'DJ',2),(34,91,'Magician',2),(35,92,'Actor',2),(36,93,'Dancer',2),(37,94,'Singer',2),(38,95,'Cartoonist',2);
/*!40000 ALTER TABLE `job_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (77,'megaphone.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(78,'user.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(79,'Group_2254.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(80,'hostess.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(81,'coordinating-people.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(82,'settings.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(83,'chinese-food-bowl-from-side-view-and-chopsticks.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(84,'folding-map.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(85,'photo-camera.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(86,'github.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(87,'serving-drinks.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(88,'liquid-soap.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(89,'speech.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(90,'dj-playing-records.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(91,'magician.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(92,'theatre-masks.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(93,'black-shoes.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(94,'microphone.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29'),(95,'hand-writing-with-ballpen.svg',1,'2018-09-27 07:25:29','2018-09-27 07:25:29');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `language_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'French','fr'),(2,'English','en'),(3,'French','fr'),(4,'English','en'),(5,'French','fr'),(6,'English','en');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_09_24_112729_create_staff_jobs_table',1),(4,'2018_09_24_121508_create_staff_languages_table',1),(5,'2018_09_24_121901_create_staff_certifications_table',1),(6,'2018_09_24_130405_create_staff_attributs_table',1),(7,'2018_09_24_134519_create_staff_remunerations_table',1),(8,'2018_09_24_134823_create_staff_mobilities_table',1),(9,'2018_09_25_064012_create_table_language',2),(11,'2018_09_25_071339_create_attributes_table',3),(12,'2018_09_25_071459_create_attribute_translations_table',4),(13,'2018_09_25_071840_create_attribute_options_table',5),(14,'2018_09_25_072019_create_attribute_option_translations_table',6),(15,'2018_09_25_072438_create_staff_attribute_options_table',7),(16,'2018_09_27_121231_create_table_gender',8),(17,'2018_09_27_121300_create_table_attribute_option_gender',8),(18,'2018_11_15_093720_add_smart_serve_to_staff_certifications',9),(19,'2018_11_15_113355_add_not_pronounced_to_staff_attributs',9),(20,'2019_01_02_122602_create_agency_table',10),(21,'2019_01_02_123916_create_agency_users_table',11),(23,'2019_01_02_132939_add_agency_mail_to_agency',12);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobility`
--

DROP TABLE IF EXISTS `mobility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobility` (
  `mobility_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`mobility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobility`
--

LOCK TABLES `mobility` WRITE;
/*!40000 ALTER TABLE `mobility` DISABLE KEYS */;
INSERT INTO `mobility` VALUES (41,1,'2018-09-27 05:40:40','2018-09-27 05:40:40'),(42,1,'2018-09-27 05:40:40','2018-09-27 05:40:40'),(43,1,'2018-09-27 05:40:40','2018-09-27 05:40:40'),(44,1,'2018-09-27 05:40:40','2018-09-27 05:40:40'),(45,1,'2018-09-27 05:40:40','2018-09-27 05:40:40'),(46,1,'2018-09-27 05:40:40','2018-09-27 05:40:40'),(47,1,'2018-09-27 05:40:40','2018-09-27 05:40:40'),(48,1,'2018-09-27 05:40:40','2018-09-27 05:40:40');
/*!40000 ALTER TABLE `mobility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobility_translation`
--

DROP TABLE IF EXISTS `mobility_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobility_translation` (
  `mobility_translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `mobility_id` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`mobility_translation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobility_translation`
--

LOCK TABLES `mobility_translation` WRITE;
/*!40000 ALTER TABLE `mobility_translation` DISABLE KEYS */;
INSERT INTO `mobility_translation` VALUES (1,41,'Montréal centre',1),(2,42,'Est de Montréal',1),(3,43,'Ouest de Montréal',1),(4,44,'Rive-Sud de Montréal',1),(5,45,'Rive nord de Montréal',1),(6,46,'Région de Québec',1),(7,47,'Reste du Québec',1),(8,48,'Hors Québec',1),(9,41,'Montreal center',2),(10,42,'East of Montreal',2),(11,43,'West of Montreal',2),(12,44,'South Shore of Montreal',2),(13,45,'North Shore of Montreal',2),(14,46,'Quebec Region',2),(15,47,'Rest of Quebec',2),(16,48,'Outside Quebec',2);
/*!40000 ALTER TABLE `mobility_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
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
  CONSTRAINT `staff_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_attribut`
--

DROP TABLE IF EXISTS `staff_attribut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_attribut` (
  `staff_attribut_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `tattoo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `piercing` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `not_pronounced` blob NOT NULL,
  PRIMARY KEY (`staff_attribut_id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `staff_attribut_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_attribut`
--

LOCK TABLES `staff_attribut` WRITE;
/*!40000 ALTER TABLE `staff_attribut` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_attribut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_attribute_options`
--

DROP TABLE IF EXISTS `staff_attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_attribute_options` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_attribute_options`
--

LOCK TABLES `staff_attribute_options` WRITE;
/*!40000 ALTER TABLE `staff_attribute_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_certifications`
--

DROP TABLE IF EXISTS `staff_certifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_certifications` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_certifications`
--

LOCK TABLES `staff_certifications` WRITE;
/*!40000 ALTER TABLE `staff_certifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_certifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_jobs`
--

DROP TABLE IF EXISTS `staff_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_jobs` (
  `staff_job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `job_id` int(10) unsigned DEFAULT NULL,
  `experience_year` int(11) NOT NULL,
  PRIMARY KEY (`staff_job_id`),
  KEY `idx_staff_id` (`staff_id`),
  KEY `idx_job_id` (`job_id`),
  CONSTRAINT `staff_jobs_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE SET NULL,
  CONSTRAINT `staff_jobs_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_jobs`
--

LOCK TABLES `staff_jobs` WRITE;
/*!40000 ALTER TABLE `staff_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_languages`
--

DROP TABLE IF EXISTS `staff_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_languages` (
  `staff_language_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`staff_language_id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `staff_languages_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_languages`
--

LOCK TABLES `staff_languages` WRITE;
/*!40000 ALTER TABLE `staff_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_mobility`
--

DROP TABLE IF EXISTS `staff_mobility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_mobility` (
  `staff_mobility_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `mobility_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`staff_mobility_id`),
  KEY `idx_staff_id` (`staff_id`),
  KEY `idx_mobility_id` (`mobility_id`),
  CONSTRAINT `staff_mobility_mobility_id_foreign` FOREIGN KEY (`mobility_id`) REFERENCES `mobility` (`mobility_id`) ON DELETE SET NULL,
  CONSTRAINT `staff_mobility_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_mobility`
--

LOCK TABLES `staff_mobility` WRITE;
/*!40000 ALTER TABLE `staff_mobility` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_mobility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_remunerations`
--

DROP TABLE IF EXISTS `staff_remunerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_remunerations` (
  `staff_remuneration_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `price` int(11) NOT NULL,
  `nas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`staff_remuneration_id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `staff_remunerations_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_remunerations`
--

LOCK TABLES `staff_remunerations` WRITE;
/*!40000 ALTER TABLE `staff_remunerations` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_remunerations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'Staff',NULL,NULL),(2,'Agency',NULL,NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  KEY `idx_role_id` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`role_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,2,'ddgds','efze','gabon@ganbon.com','6573562',NULL,'$2y$10$UEZspCzm2I3QaProgIGvFuyn5xCUslyOMnsHCRwirRhYer2wLnmJm','FEcMgBGKQPQpcJaNqz3HSBfMyXGlv2oq4EemoeYj5oo7CGOvYvyXX1xY2zb6','2019-01-07 08:44:25','2019-01-07 08:44:25'),(5,2,'xvcds','dfds','tiery@tiery.com','67567465',NULL,'$2y$10$4/MRJnKnuM.uvC48l6wtieIk7.tmv.rr1KJzivkf7rSS02qwmDfXK','Tm9hkEWq8AZ2WHBEk9lxQ9lgNT4bwspqQSg69wD6u8EVdVls3jbBvN8oHbCw','2019-01-07 09:20:08','2019-01-07 09:20:08'),(6,2,'njatomanana','randrianasolo','randrianasolo.njatofens@fmaim.com','6466516156516',NULL,'$2y$10$XXtztuMP/134H8UbNl2/8uuie.iApbhOByIU4fZnmEcUeoLq67XeK','51xvChOJx8KlgF13r7XJSuJcioMyQiZQfrxdZpKCVX0rBSIA9221WyO8elyO','2019-01-07 09:28:19','2019-01-07 09:28:19'),(7,2,'fzeze','azfzaeazz','to@gmail.com','63',NULL,'$2y$10$1KPSDOgUTgMEA8mgV2yiVe7jyQAyIH8qafEWGLu5Rb4NnR4CUfiry',NULL,'2019-01-07 09:31:08','2019-01-07 09:31:08'),(8,2,'Arisanjy','Eric','ericarisanjy20@gmail.com','0346732413','2019-01-07 10:26:42','$2y$10$x5g8VjaNyau70kgcqNTxZ.FB.0KWwLVFAkhT1Oqsg4SUurvc9Ki/m','sQS2ZTNzBKwBlNDOhhi8zUCgGouVMmtrbAyCWFARPje643x6CEEM5StrYyT7','2019-01-07 10:26:01','2019-01-07 10:26:42'),(9,2,'Prenom','Nom','cour@gmail.com','45454545',NULL,'$2y$10$yQDakh9dsBh05H2p2IYtd.Xxl7po9eGSnerIcBIup.0sPUW2kFOV6',NULL,'2019-01-08 07:48:29','2019-01-08 07:48:29'),(11,2,'Prenom','Nom','23courier@gmail.com','45454545566634',NULL,'$2y$10$cjdHYsoF8Xu1PvJe2CYCAuwPAQVsaEVVRw7lZU9r21/UwSaXe.44.',NULL,'2019-01-08 09:26:51','2019-01-08 09:26:51');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-08 12:24:09
