-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: hello_staff
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES (58,'Entreprise 1','Vatofotsy',252525,'Antsirabe',NULL,NULL,'00110','Ontario','Canada','2019-03-07-06-26-57-formalisme.PNG','test description entreprise 1',NULL,'0344630738','aa@alternateeve.com','2019-03-07 06:26:57','2019-03-07 06:27:52'),(59,'MiiStaff','3486 Coloniale Avenue',4294967295,'Montreal',NULL,NULL,'H2X2Y4','Quebec','Canada','2019-03-08-00-46-31-Logo_Hellostaff.png','bla',NULL,'5146496664','cedriclasalle@yahoo.com','2019-03-08 00:46:31','2019-03-08 00:46:31');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agency_staff`
--

DROP TABLE IF EXISTS `agency_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency_staff` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency_staff`
--

LOCK TABLES `agency_staff` WRITE;
/*!40000 ALTER TABLE `agency_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `agency_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agency_users`
--

DROP TABLE IF EXISTS `agency_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agency_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_agency_id` (`agency_id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `agency_users_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `agency_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency_users`
--

LOCK TABLES `agency_users` WRITE;
/*!40000 ALTER TABLE `agency_users` DISABLE KEYS */;
INSERT INTO `agency_users` VALUES (118,58,86),(119,59,88);
/*!40000 ALTER TABLE `agency_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `all_language`
--

DROP TABLE IF EXISTS `all_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `all_language` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_language`
--

LOCK TABLES `all_language` WRITE;
/*!40000 ALTER TABLE `all_language` DISABLE KEYS */;
INSERT INTO `all_language` VALUES (1,1,NULL,NULL),(2,1,NULL,NULL),(3,1,NULL,NULL),(4,1,NULL,NULL),(5,1,NULL,NULL),(6,1,NULL,NULL),(7,1,NULL,NULL),(8,1,NULL,NULL),(9,1,NULL,NULL),(10,1,NULL,NULL),(11,1,NULL,NULL),(12,1,NULL,NULL);
/*!40000 ALTER TABLE `all_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `all_language_choice`
--

DROP TABLE IF EXISTS `all_language_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `all_language_choice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_language_choice`
--

LOCK TABLES `all_language_choice` WRITE;
/*!40000 ALTER TABLE `all_language_choice` DISABLE KEYS */;
INSERT INTO `all_language_choice` VALUES (1,1,NULL,NULL),(2,1,NULL,NULL),(3,1,NULL,NULL),(4,1,NULL,NULL);
/*!40000 ALTER TABLE `all_language_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `all_language_choice_translation`
--

DROP TABLE IF EXISTS `all_language_choice_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `all_language_choice_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `all_language_choice_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_all_language_choice_id` (`all_language_choice_id`),
  CONSTRAINT `all_language_choice_translation_all_language_choice_id_foreign` FOREIGN KEY (`all_language_choice_id`) REFERENCES `all_language_choice` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_language_choice_translation`
--

LOCK TABLES `all_language_choice_translation` WRITE;
/*!40000 ALTER TABLE `all_language_choice_translation` DISABLE KEYS */;
INSERT INTO `all_language_choice_translation` VALUES (1,1,'Débutant',1),(2,2,'Intermédiaire',1),(3,3,'Courant',1),(4,4,'Langue maternelle',1),(5,1,'Beginner',2),(6,2,'Intermediate',2),(7,3,'Fluent',2),(8,4,'Native language',2);
/*!40000 ALTER TABLE `all_language_choice_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `all_language_translation`
--

DROP TABLE IF EXISTS `all_language_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `all_language_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `all_language_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_all_language_id` (`all_language_id`),
  CONSTRAINT `all_language_translation_all_language_id_foreign` FOREIGN KEY (`all_language_id`) REFERENCES `all_language` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_language_translation`
--

LOCK TABLES `all_language_translation` WRITE;
/*!40000 ALTER TABLE `all_language_translation` DISABLE KEYS */;
INSERT INTO `all_language_translation` VALUES (1,1,'Français',NULL,1),(2,2,'Anglais',NULL,1),(3,3,'Espagnol',NULL,1),(4,4,'Allemand',NULL,1),(5,5,'Portugais',NULL,1),(6,6,'Italien',NULL,1),(7,7,'Grec',NULL,1),(8,8,'Russe',NULL,1),(9,9,'Japonais',NULL,1),(10,10,'Chinois','(Mandarin/Cantonais)',1),(11,11,'Arabe',NULL,1),(12,12,'Langage des signes',NULL,1),(14,1,'French',NULL,2),(15,2,'English',NULL,2),(16,3,'Spanish',NULL,2),(17,4,'German',NULL,2),(18,5,'Portuguese',NULL,2),(19,6,'Italian',NULL,2),(20,7,'Greek',NULL,2),(21,8,'Russian',NULL,2),(22,9,'Japanese',NULL,2),(23,10,'Chinese','(Mandarin/Cantonais)',2),(24,11,'Arab',NULL,2),(25,12,'Sign language',NULL,2);
/*!40000 ALTER TABLE `all_language_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_option_gender`
--

DROP TABLE IF EXISTS `attribute_option_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_option_gender` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_option_gender`
--

LOCK TABLES `attribute_option_gender` WRITE;
/*!40000 ALTER TABLE `attribute_option_gender` DISABLE KEYS */;
INSERT INTO `attribute_option_gender` VALUES (1,2,25,2),(2,2,26,2),(3,2,27,2),(4,2,28,2),(5,2,29,2),(6,2,30,2),(7,2,31,2),(8,2,32,2),(9,2,33,2),(10,2,34,2),(11,2,35,2),(12,2,36,2),(13,2,37,2),(14,2,38,2),(15,2,39,2),(16,2,40,2),(17,2,41,2),(18,2,42,1),(19,2,43,1),(20,2,44,1),(21,2,45,1),(22,2,46,1),(23,2,47,1),(24,2,48,1),(25,2,49,1),(26,2,50,1),(27,2,51,1),(28,2,52,1),(29,2,53,1),(30,2,54,1),(31,2,55,1),(32,2,56,1),(33,2,57,1),(34,2,58,1),(35,2,59,1),(36,2,60,1),(37,3,61,2),(38,3,62,2),(39,3,63,2),(40,3,64,2),(41,3,65,2),(42,3,66,2),(43,3,67,2),(44,3,68,2),(45,3,69,2),(46,3,70,2),(47,3,71,2),(48,3,72,2),(49,3,73,2),(50,3,74,2),(51,3,75,2),(52,3,76,2),(53,3,77,2),(54,3,78,1),(55,3,79,1),(56,3,80,1),(57,3,81,1),(58,3,82,1),(59,3,83,1),(60,3,84,1),(61,3,85,1),(62,3,86,1),(63,3,87,1),(64,3,88,1),(65,3,89,1),(66,3,90,1),(67,3,91,1),(68,3,92,1),(69,3,93,1),(70,3,94,1),(71,3,95,1),(72,3,96,1),(73,3,97,1),(74,3,98,1),(75,3,99,1);
/*!40000 ALTER TABLE `attribute_option_gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_option_translations`
--

DROP TABLE IF EXISTS `attribute_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_option_id` int(10) unsigned DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_attribute_option_id` (`attribute_option_id`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_option_translations`
--

LOCK TABLES `attribute_option_translations` WRITE;
/*!40000 ALTER TABLE `attribute_option_translations` DISABLE KEYS */;
INSERT INTO `attribute_option_translations` VALUES (1,19,'XS',1),(2,19,'XS',2),(3,20,'S',1),(4,20,'S',2),(5,21,'M',1),(6,21,'M',2),(7,22,'L',1),(8,22,'L',2),(9,23,'XL',1),(10,23,'XL',2),(11,24,'XXL',1),(12,24,'XXL',2),(13,25,'34EU - 24US',1),(14,25,'34EU - 24US',2),(15,26,'35EU - 25US',1),(16,26,'35EU - 25US',2),(17,27,'36EU - 26US',1),(18,27,'36EU - 26US',2),(19,28,'37EU - 27US',1),(20,28,'37EU - 27US',2),(21,29,'38EU - 28US',1),(22,29,'38EU - 28US',2),(23,30,'39EU - 29US',1),(24,30,'39EU - 29US',2),(25,31,'40EU - 30US',1),(26,31,'40EU - 30US',2),(27,32,'41EU - 31US',1),(28,32,'41EU - 31US',2),(29,33,'42EU - 32US',1),(30,33,'42EU - 32US',2),(31,34,'43EU - 33US',1),(32,34,'43EU - 33US',2),(33,35,'44EU - 34US',1),(34,35,'44EU - 34US',2),(35,36,'45EU - 35US',1),(36,36,'45EU - 35US',2),(37,37,'46EU - 36US',1),(38,37,'46EU - 36US',2),(39,38,'47EU - 37US',1),(40,38,'47EU - 37US',2),(41,39,'48EU - 38US',1),(42,39,'48EU - 38US',2),(43,40,'49EU - 39US',1),(44,40,'49EU - 39US',2),(45,41,'50EU - 40US',1),(46,41,'50EU - 40US',2),(47,42,'34EU - 24US',1),(48,42,'34EU - 24US',2),(49,43,'35EU - 25US',1),(50,43,'35EU - 25US',2),(51,44,'36EU - 26US',1),(52,44,'36EU - 26US',2),(53,45,'37EU - 27US',1),(54,45,'37EU - 27US',2),(55,46,'38EU - 28US',1),(56,46,'38EU - 28US',2),(57,47,'39EU - 29US',1),(58,47,'39EU - 29US',2),(59,48,'40EU - 30US',1),(60,48,'40EU - 30US',2),(61,49,'41EU - 31US',1),(62,49,'41EU - 31US',2),(63,50,'42EU - 32US',1),(64,50,'42EU - 32US',2),(65,51,'43EU - 33US',1),(66,51,'43EU - 33US',2),(67,52,'44EU - 34US',1),(68,52,'44EU - 34US',2),(69,53,'45EU - 35US',1),(70,53,'45EU - 35US',2),(71,54,'46EU - 36US',1),(72,54,'46EU - 36US',2),(73,55,'47EU - 37US',1),(74,55,'47EU - 37US',2),(75,56,'48EU - 38US',1),(76,56,'48EU - 38US',2),(77,57,'49EU - 39US',1),(78,57,'49EU - 39US',2),(79,58,'50EU - 40US',1),(80,58,'50EU - 40US',2),(81,59,'51EU - 41US',1),(82,59,'51EU - 41US',2),(83,60,'52EU - 42US',1),(84,60,'52EU - 42US',2),(85,61,'35EU - 4US',1),(86,61,'35EU - 4US',2),(87,62,'35,5EU - 4,5US',1),(88,62,'35,5EU - 4,5US',2),(89,63,'36EU - 5US',1),(90,63,'36EU - 5US',2),(91,64,'36,5EU - 5,5US',1),(92,64,'36,5EU - 5,5US',2),(93,65,'37EU - 5,5US',1),(94,65,'37EU - 5,5US',2),(95,66,'37,5EU - 6US',1),(96,66,'37,5EU - 6US',2),(97,67,'38EU - 6,5US',1),(98,67,'38EU - 6,5US',2),(99,68,'38,5EU - 7US',1),(100,68,'38,5EU - 7US',2),(101,69,'39EU - 7,5US',1),(102,69,'39EU - 7,5US',2),(103,70,'39,5EU - 7,5US',1),(104,70,'39,5EU - 7,5US',2),(105,71,'40EU - 8US',1),(106,71,'40EU - 8US',2),(107,72,'40,5EU - 8,5US',1),(108,72,'40,5EU - 8,5US',2),(109,73,'41EU - 9US',1),(110,73,'41EU - 9US',2),(111,74,'41,5EU - 9,5US',1),(112,74,'41,5EU - 9,5US',2),(113,75,'42EU - 9,5US',1),(114,75,'42EU - 9,5US',2),(115,76,'42,5EU - 10US',1),(116,76,'42,5EU - 10US',2),(117,77,'43EU - 10,5US',1),(118,77,'43EU - 10,5US',2),(119,78,'39EU - 6US',1),(120,78,'39EU - 6US',2),(121,79,'39,5EU - 6,5US',1),(122,79,'39,5EU - 6,5US',2),(123,80,'40EU - 7US',1),(124,80,'40EU - 7US',2),(125,81,'40,5EU - 7,5US',1),(126,81,'40,5EU - 7,5US',2),(127,82,'41EU - 8US',1),(128,82,'41EU - 8US',2),(129,83,'41,5EU - 8US',1),(130,83,'41,5EU - 8US',2),(131,84,'42EU - 8,5US',1),(132,84,'42EU - 8,5US',2),(133,85,'42,5EU - 9US',1),(134,85,'42,5EU - 9US',2),(135,86,'43EU - 9,5US',1),(136,86,'43EU - 9,5US',2),(137,87,'43,5EU - 9,5US',1),(138,87,'43,5EU - 9,5US',2),(139,88,'44EU - 10US',1),(140,88,'44EU - 10US',2),(141,89,'44,5EU - 10,5US',1),(142,89,'44,5EU - 10,5US',2),(143,90,'45EU - 11US',1),(144,90,'45EU - 11US',2),(145,91,'45,5EU - 11,5US',1),(146,91,'45,5EU - 11,5US',2),(147,92,'46EU - 11,5US',1),(148,92,'46EU - 11,5US',2),(149,93,'46,5EU - 12US',1),(150,93,'46,5EU - 12US',2),(151,94,'47EU - 12,5US',1),(152,94,'47EU - 12,5US',2),(153,95,'47,5EU - 13US',1),(154,95,'47,5EU - 13US',2),(155,96,'48EU - 13,5US',1),(156,96,'48EU - 13,5US',2),(157,97,'48,5EU - 14US',1),(158,97,'48,5EU - 14US',2),(159,98,'49EU - 14,5US',1),(160,98,'49EU - 14,5US',2),(161,99,'49,5EU - 15US',1),(162,99,'49,5EU - 15US',2);
/*!40000 ALTER TABLE `attribute_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_options`
--

DROP TABLE IF EXISTS `attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_attribute_id` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_options`
--

LOCK TABLES `attribute_options` WRITE;
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
INSERT INTO `attribute_options` VALUES (19,1,1),(20,1,2),(21,1,3),(22,1,4),(23,1,5),(24,1,6),(25,2,1),(26,2,2),(27,2,3),(28,2,4),(29,2,5),(30,2,6),(31,2,7),(32,2,8),(33,2,9),(34,2,10),(35,2,11),(36,2,12),(37,2,13),(38,2,14),(39,2,15),(40,2,16),(41,2,17),(42,2,18),(43,2,19),(44,2,20),(45,2,21),(46,2,22),(47,2,23),(48,2,24),(49,2,25),(50,2,26),(51,2,27),(52,2,28),(53,2,29),(54,2,30),(55,2,31),(56,2,32),(57,2,33),(58,2,34),(59,2,35),(60,2,36),(61,3,1),(62,3,2),(63,3,3),(64,3,4),(65,3,5),(66,3,6),(67,3,7),(68,3,8),(69,3,9),(70,3,10),(71,3,11),(72,3,12),(73,3,13),(74,3,14),(75,3,15),(76,3,16),(77,3,17),(78,3,18),(79,3,19),(80,3,20),(81,3,21),(82,3,22),(83,3,23),(84,3,24),(85,3,25),(86,3,26),(87,3,27),(88,3,28),(89,3,29),(90,3,30),(91,3,31),(92,3,32),(93,3,33),(94,3,34),(95,3,35),(96,3,36),(97,3,37),(98,3,38),(99,3,39);
/*!40000 ALTER TABLE `attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_translations`
--

DROP TABLE IF EXISTS `attribute_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_attribute_id` (`attribute_id`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'1','2019-01-22 04:28:00','2019-01-22 04:28:00'),(2,'1','2019-01-22 04:28:00','2019-01-22 04:28:00'),(3,'1','2019-01-22 04:28:00','2019-01-22 04:28:00');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (17,58,'Notre event','Nissan','Amborovy','R5T 4T5','Ontario','Les alentours de la ville de Québec','2019-03-08','2019-03-24','Notre event',NULL,'00:00:00','00:00:00','2019-03-07-13-18-24-images.jpg','2019-03-07 13:18:24','2019-03-08 06:46:21'),(18,59,'Grand Prix','Ferrari','3486 Colonial','H2X2Y4','Quebec','Greater Montreal','2019-03-13','2019-03-22','bla bla',NULL,'00:00:00','00:00:00','2019-03-13-23-26-00-GrandPrix1.jpg','2019-03-13 23:26:00','2019-03-13 23:26:00'),(19,58,'Event 1','test','test','t1t1t1','Ontario','Areas around Montreal','2019-03-14','2019-03-30','tetst test',NULL,'00:00:00','00:00:00','2019-03-14-14-32-16-IMG_20190306_122451.jpg','2019-03-14 14:32:16','2019-03-14 14:32:16');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_candidate`
--

DROP TABLE IF EXISTS `event_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_candidate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_staff_id` int(10) unsigned NOT NULL,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_event_staff_id` (`event_staff_id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `event_candidate_event_staff_id_foreign` FOREIGN KEY (`event_staff_id`) REFERENCES `event_staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_candidate_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_candidate`
--

LOCK TABLES `event_candidate` WRITE;
/*!40000 ALTER TABLE `event_candidate` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_manage_by`
--

DROP TABLE IF EXISTS `event_manage_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_manage_by` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_event_id` (`event_id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `event_manage_by_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_manage_by_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_manage_by`
--

LOCK TABLES `event_manage_by` WRITE;
/*!40000 ALTER TABLE `event_manage_by` DISABLE KEYS */;
INSERT INTO `event_manage_by` VALUES (11,17,86),(12,18,88),(13,19,86);
/*!40000 ALTER TABLE `event_manage_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_mobility`
--

DROP TABLE IF EXISTS `event_mobility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_mobility` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `mobility_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_event_id` (`event_id`),
  KEY `idx_mobility_id` (`mobility_id`),
  CONSTRAINT `event_mobility_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_mobility_mobility_id_foreign` FOREIGN KEY (`mobility_id`) REFERENCES `mobility` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_mobility`
--

LOCK TABLES `event_mobility` WRITE;
/*!40000 ALTER TABLE `event_mobility` DISABLE KEYS */;
INSERT INTO `event_mobility` VALUES (8,17,44),(9,18,41),(10,19,42);
/*!40000 ALTER TABLE `event_mobility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_staff`
--

DROP TABLE IF EXISTS `event_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_staff` (
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_staff`
--

LOCK TABLES `event_staff` WRITE;
/*!40000 ALTER TABLE `event_staff` DISABLE KEYS */;
INSERT INTO `event_staff` VALUES (20,17,'Coordinateur de terrain',3,'Ambodibe','E4T 3G4','Ontario','Grand Montréal','linear-gradient(60deg, #F44236, #F48F36)',13,'Notre coordinateur',NULL,4,5,'2019-03-07 13:18:24','2019-03-07 13:18:24'),(21,17,'Equipe de montage/démontage',3,'Anjoma','T4Y 4G4','Colombie-Britannique','Les alentours de Montréal','linear-gradient(239deg, #1DE9B6, #1DC4E9)',13,'Vous devez demonter',NULL,5,3,'2019-03-07 13:18:24','2019-03-07 13:19:47'),(22,17,'Mascotte',4,'Anjoma','T4Y 4G2','Colombie-Britannique','Les alentours de Montréal','linear-gradient(231deg, #899ED4, #A389D4)',17,'Notre mascotte',NULL,2,2,'2019-03-07 13:19:47','2019-03-07 13:19:47');
/*!40000 ALTER TABLE `event_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_staff_date`
--

DROP TABLE IF EXISTS `event_staff_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_staff_date` (
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_staff_date`
--

LOCK TABLES `event_staff_date` WRITE;
/*!40000 ALTER TABLE `event_staff_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_staff_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_staff_jobs`
--

DROP TABLE IF EXISTS `event_staff_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_staff_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_staff_id` int(10) unsigned NOT NULL,
  `job_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_event_staff_id` (`event_staff_id`),
  KEY `idx_job_id` (`job_id`),
  CONSTRAINT `event_staff_jobs_event_staff_id_foreign` FOREIGN KEY (`event_staff_id`) REFERENCES `event_staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_staff_jobs_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_staff_jobs`
--

LOCK TABLES `event_staff_jobs` WRITE;
/*!40000 ALTER TABLE `event_staff_jobs` DISABLE KEYS */;
INSERT INTO `event_staff_jobs` VALUES (36,20,81),(37,21,82),(38,22,86);
/*!40000 ALTER TABLE `event_staff_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_staff_mobility`
--

DROP TABLE IF EXISTS `event_staff_mobility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_staff_mobility` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_staff_id` int(10) unsigned NOT NULL,
  `mobility_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_event_staff_id` (`event_staff_id`),
  KEY `idx_mobility_id` (`mobility_id`),
  CONSTRAINT `event_staff_mobility_event_staff_id_foreign` FOREIGN KEY (`event_staff_id`) REFERENCES `event_staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_staff_mobility_mobility_id_foreign` FOREIGN KEY (`mobility_id`) REFERENCES `mobility` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_staff_mobility`
--

LOCK TABLES `event_staff_mobility` WRITE;
/*!40000 ALTER TABLE `event_staff_mobility` DISABLE KEYS */;
INSERT INTO `event_staff_mobility` VALUES (16,20,41),(17,21,42),(18,22,42);
/*!40000 ALTER TABLE `event_staff_mobility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_statement`
--

DROP TABLE IF EXISTS `event_statement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_statement` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_statement`
--

LOCK TABLES `event_statement` WRITE;
/*!40000 ALTER TABLE `event_statement` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_statement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_statement_question_answer`
--

DROP TABLE IF EXISTS `event_statement_question_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_statement_question_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_statement_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_event_statement_id` (`event_statement_id`),
  CONSTRAINT `event_statement_question_answer_event_statement_id_foreign` FOREIGN KEY (`event_statement_id`) REFERENCES `event_statement` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_statement_question_answer`
--

LOCK TABLES `event_statement_question_answer` WRITE;
/*!40000 ALTER TABLE `event_statement_question_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_statement_question_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_job_id` (`job_id`),
  CONSTRAINT `job_translation_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_translation`
--

LOCK TABLES `job_translation` WRITE;
/*!40000 ALTER TABLE `job_translation` DISABLE KEYS */;
INSERT INTO `job_translation` VALUES (1,77,'Ambassadeur de marque',1),(2,78,'Chef d\'équipe',1),(3,79,'Spécialiste Produit',1),(4,80,'Hôte',1),(5,81,'Coordinateur de terrain',1),(6,82,'Equipe de montage/démontage',1),(7,83,'Dégustation',1),(8,84,'Distribution de dépliants',1),(9,85,'Photographe',1),(10,86,'Mascotte',1),(11,87,'Serveur',1),(12,88,'Plongueur',1),(13,89,'Maître de cérémonie',1),(14,90,'DJ',1),(15,91,'Magicien',1),(16,92,'Acteur',1),(17,93,'Danseur',1),(18,94,'Chanteur',1),(19,95,'Caricaturiste',1),(20,77,'Brand ambassador',2),(21,78,'Team Lead',2),(22,79,'Product Specialist',2),(23,80,'Host',2),(24,81,'In-field Coordinator',2),(25,82,'Set up / tear down team',2),(26,83,'In-store sampling',2),(27,84,'Flyer distributions',2),(28,85,'Photographer',2),(29,86,'Mascot',2),(30,87,'Waiter',2),(31,88,'Diver',2),(32,89,'Animator/ EMCEE',2),(33,90,'DJ',2),(34,91,'Magician',2),(35,92,'Actor',2),(36,93,'Dancer',2),(37,94,'Singer',2),(38,95,'Cartoonist',2);
/*!40000 ALTER TABLE `job_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (77,'megaphone.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(78,'user.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(79,'Group_2254.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(80,'hostess.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(81,'coordinating-people.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(82,'settigns.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(83,'chinese-food-bowl-from-side-view-and-chopsticks.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(84,'folding-map.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(85,'photo-camera.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(86,'github.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(87,'serving-drinks.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(88,'liquid-soap.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(89,'speech.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(90,'dj-playing-records.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(91,'magician.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(92,'theatre-masks.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(93,'black-shoes.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(94,'microphone.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(95,'hand-writing-with-ballpen.svg',1,'2019-01-22 04:28:00','2019-01-22 04:28:00');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'French','fr'),(2,'English','en');
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_09_24_112729_create_staff_jobs_table',1),(4,'2018_09_24_121508_create_staff_languages_table',1),(5,'2018_09_24_121901_create_staff_certifications_table',1),(6,'2018_09_24_130405_create_staff_attributs_table',1),(7,'2018_09_24_134519_create_staff_remunerations_table',1),(8,'2018_09_24_134823_create_staff_mobilities_table',1),(9,'2018_09_25_064012_create_table_language',1),(10,'2018_09_25_071339_create_attributes_table',1),(11,'2018_09_25_071459_create_attribute_translations_table',1),(12,'2018_09_25_071840_create_attribute_options_table',1),(13,'2018_09_25_072019_create_attribute_option_translations_table',1),(14,'2018_09_25_072438_create_staff_attribute_options_table',1),(15,'2018_09_27_121231_create_table_gender',1),(16,'2018_09_27_121300_create_table_attribute_option_gender',1),(17,'2018_11_15_093720_add_smart_serve_to_staff_certifications',1),(18,'2018_11_15_113355_add_not_pronounced_to_staff_attributs',1),(19,'2019_01_02_122602_create_agency_table',1),(20,'2019_01_02_123916_create_agency_users_table',1),(21,'2019_01_02_130410_add_agency_phone_to_agency',1),(22,'2019_01_02_142431_add_agency_mail_to_agency',1),(23,'2019_01_23_100038_create_event_table',2),(24,'2019_02_08_121718_edit_user_id_in_table_users',3),(25,'2019_02_08_125633_edit_agency_id_in_table_agency',3),(26,'2019_02_09_074015_update_agency_users_add_foreign_key',3),(27,'2019_02_09_075103_update_staff_users_foreign_key',3),(28,'2019_02_12_084132_update_table_event',4),(29,'2019_02_12_084345_update_table_event_staff',4),(30,'2019_02_12_084408_update_table_event_staff_date',4),(31,'2019_02_12_111916_create_table_event_manage_by',5),(32,'2019_02_18_150950_update_table_event_staff',6),(33,'2019_02_18_151223_update_table_event_staff_date',6),(34,'2019_02_19_070755_update_table_event_staff_rename_id',6),(35,'2019_02_19_070922_update_table_event_staff_date_rename_id',6),(36,'2019_02_19_141150_update_table_jobs_rename_id',7),(37,'2019_02_19_141415_update_table_job_translation_rename_foreiorereign_key',7),(38,'2019_02_19_141720_create_table_event_staff__jobs',7),(39,'2019_02_20_062853_update_mobility_rename_id',8),(40,'2019_02_20_064611_update_mobility_translation_rename_id',8),(41,'2019_02_20_071325_create_table_event_mobility',8),(42,'2019_02_20_071515_create_event_staff_mobility',8),(43,'2019_03_04_065346_update_users_add_language_code',9),(44,'2019_03_05_115521_update_attributes_column_id',10),(45,'2019_03_05_141200_update_attribute_options_column_id',10),(46,'2019_03_05_141841_update_attribute_option_gender_column_id',10),(47,'2019_03_05_142341_update_attribute_option_translations_column_id',10),(48,'2019_03_05_142816_update_attribute_translations_column_id',10),(49,'2019_03_05_143010_update_gender_column_id',10),(50,'2019_03_05_143151_update_language_column_id',10),(51,'2019_03_05_143319_update_staff_column_id',10),(52,'2019_03_05_143555_update_staff_attribut_column_id',10),(53,'2019_03_05_144142_update_staff_attribute_options_column_id',10),(54,'2019_03_05_144539_update_staff_certifications_column_id',10),(55,'2019_03_05_144759_update_staff_jobs_column_id',10),(56,'2019_03_05_145120_update_staff_language_column_id',10),(57,'2019_03_05_145519_update_staff_mobility_column_id',10),(58,'2019_03_05_145756_update_staff_remuneration_column_id',10),(59,'2019_03_05_145957_update_user_role_column_id',10),(60,'2019_03_08_062431_create_table_all_language',11),(61,'2019_03_08_062924_create_table_all_language_translation',11),(62,'2019_03_08_081405_create_table_all_language_choice',11),(63,'2019_03_08_081447_create_table_all_language_choice_translation',11),(64,'2019_03_08_132621_update_table_staff_add_column_age',11),(65,'2019_03_08_134911_update_table_staff_languages_add_column_all_language',11),(66,'2019_03_12_085827_create_table_event_statement',12),(67,'2019_03_12_091006_create_table_event_statement_question_answer',12),(68,'2019_03_12_091735_update_table_event_statement_question_answer',12),(69,'2019_03_13_112722_update_table_event_statement',13),(70,'2019_03_13_141850_update_table_event_statement_user_id_column',14),(71,'2019_03_13_134126_create_table_event_candidate',15),(72,'2019_03_13_145038_update_table_event_statement_staff_id_column_',15),(73,'2019_03_13_130906_create_agency_staff_table',16);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobility`
--

DROP TABLE IF EXISTS `mobility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobility` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobility`
--

LOCK TABLES `mobility` WRITE;
/*!40000 ALTER TABLE `mobility` DISABLE KEYS */;
INSERT INTO `mobility` VALUES (41,1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(42,1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(43,1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(44,1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(45,1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(46,1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(47,1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(48,1,'2019-01-22 04:28:00','2019-01-22 04:28:00'),(49,1,'2019-01-31 19:00:00','2019-01-31 19:00:00');
/*!40000 ALTER TABLE `mobility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobility_translation`
--

DROP TABLE IF EXISTS `mobility_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobility_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobility_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mobility_id` (`mobility_id`),
  CONSTRAINT `mobility_translation_mobility_id_foreign` FOREIGN KEY (`mobility_id`) REFERENCES `mobility` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobility_translation`
--

LOCK TABLES `mobility_translation` WRITE;
/*!40000 ALTER TABLE `mobility_translation` DISABLE KEYS */;
INSERT INTO `mobility_translation` VALUES (1,41,'Grand Montréal',1),(2,42,'Les alentours de Montréal',1),(3,43,'Ville de Québec',1),(4,44,'Les alentours de la ville de Québec',1),(5,45,'Grand Toronto',1),(6,46,'Les alentours de Toronto',1),(7,47,'Ottawa-Gatineau',1),(8,48,'Grand Vancouver',1),(9,41,'Greater Montreal',2),(10,42,'Areas around Montreal',2),(11,43,'Quebec city',2),(12,44,'Areas around Quebec city',2),(13,45,'Greater Toronto',2),(14,46,'Areas around Toronto',2),(15,47,'Ottawa-Gatineau',2),(16,48,'Greater Vancouver',2),(17,49,'Les alentours de Vancouver',1),(18,49,'Areas around Vancouver',2);
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
INSERT INTO `password_resets` VALUES ('mikianico@gmail.com','$2y$10$AdXa.i3Pa4/ZPQnb9KTx5ONcPO4R3F1Q6ohBIUh1luQgDFVRRxtbe','2019-01-23 06:29:10'),('as@alternateeve.com','$2y$10$rqLuVVsxNA.R.0Uo62weu.yLoQ7D663dSU2wfOaHAk/7xn0E62lzy','2019-01-30 14:07:20'),('ericarisanjy20@gmail.com','$2y$10$jGh96DmC5NGGre9I9nszjuXBR2FtQ.P.j52xgWouOz0lAnLB6oh6u','2019-02-01 06:20:47'),('er@alternateeve.com','$2y$10$C9wx2IiVYhNWziQJRdAOReXmTY7Ce8M9UD1txgcJIkhBF2EpRLU1C','2019-02-01 06:25:33');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (14,NULL,_binary '1','1991-09-18',0,'Antsirabe','Vatofotsy','00110','Our website','2019-02-28-14-12-35-actor.PNG','2019-02-28-14-12-35-cas_d\'utilisation.PNG','2019-02-28-14-12-35-Fanasana.docx'),(16,89,_binary '1','1993-02-03',26,'1111111','1111111111','m1m1m1','Sponsorship','2019-03-08-14-37-08-IMG_20190306_122634.jpg','2019-03-08-14-37-08-IMG_20190306_122313.jpg','2019-03-08-14-37-08-Inscription_Staff_-_Traduction_.docx'),(17,91,_binary '2','1987-10-11',32,'Monteeal','728 rue Agnes','H4C2P8','Réseaux sociaux','2019-03-13-19-21-15-IMG_3590.JPG','2019-03-13-19-21-15-IMG_3564.JPG','2019-03-13-19-21-15-Resume_Aurelie_Saiz.pdf');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_attribut`
--

DROP TABLE IF EXISTS `staff_attribut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_attribut` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `tattoo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `piercing` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `not_pronounced` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `staff_attribut_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_attribut`
--

LOCK TABLES `staff_attribut` WRITE;
/*!40000 ALTER TABLE `staff_attribut` DISABLE KEYS */;
INSERT INTO `staff_attribut` VALUES (12,14,'None','None',_binary '0'),(14,16,'None','None',_binary '0'),(15,17,'1','1',_binary '0');
/*!40000 ALTER TABLE `staff_attribut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_attribute_options`
--

DROP TABLE IF EXISTS `staff_attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_attribute_options` (
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_attribute_options`
--

LOCK TABLES `staff_attribute_options` WRITE;
/*!40000 ALTER TABLE `staff_attribute_options` DISABLE KEYS */;
INSERT INTO `staff_attribute_options` VALUES (34,12,1,21),(35,12,2,47),(36,12,3,81),(37,NULL,NULL,NULL),(38,NULL,NULL,NULL),(39,NULL,NULL,NULL),(40,14,1,21),(41,14,2,27),(42,14,3,63),(43,15,1,20),(44,15,2,27),(45,15,3,67);
/*!40000 ALTER TABLE `staff_attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_certifications`
--

DROP TABLE IF EXISTS `staff_certifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_certifications` (
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_certifications`
--

LOCK TABLES `staff_certifications` WRITE;
/*!40000 ALTER TABLE `staff_certifications` DISABLE KEYS */;
INSERT INTO `staff_certifications` VALUES (12,14,_binary '1',_binary '0',_binary '0',_binary '1',_binary '1',_binary '1',_binary '0'),(14,16,_binary '0',_binary '0',_binary '0',_binary '1',_binary '1','',_binary '0'),(15,17,_binary '0',_binary '0',_binary '0',_binary '1',_binary '1',_binary '1',_binary '0');
/*!40000 ALTER TABLE `staff_certifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_jobs`
--

DROP TABLE IF EXISTS `staff_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `job_id` int(10) unsigned DEFAULT NULL,
  `experience_year` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_staff_id` (`staff_id`),
  KEY `idx_job_id` (`job_id`),
  CONSTRAINT `staff_jobs_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `staff_jobs_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_jobs`
--

LOCK TABLES `staff_jobs` WRITE;
/*!40000 ALTER TABLE `staff_jobs` DISABLE KEYS */;
INSERT INTO `staff_jobs` VALUES (10,14,78,2),(12,16,78,2),(13,16,93,1),(14,17,81,2);
/*!40000 ALTER TABLE `staff_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_languages`
--

DROP TABLE IF EXISTS `staff_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `all_language_id` int(11) NOT NULL,
  `all_language_choice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `staff_languages_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_languages`
--

LOCK TABLES `staff_languages` WRITE;
/*!40000 ALTER TABLE `staff_languages` DISABLE KEYS */;
INSERT INTO `staff_languages` VALUES (19,14,0,0),(20,14,0,0),(22,16,1,4),(23,16,2,3),(24,16,3,1),(25,17,1,4),(26,17,2,3),(27,17,3,2);
/*!40000 ALTER TABLE `staff_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_mobility`
--

DROP TABLE IF EXISTS `staff_mobility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_mobility` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `mobility_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_staff_id` (`staff_id`),
  KEY `idx_mobility_id` (`mobility_id`),
  CONSTRAINT `staff_mobility_mobility_id_foreign` FOREIGN KEY (`mobility_id`) REFERENCES `mobility` (`id`) ON DELETE SET NULL,
  CONSTRAINT `staff_mobility_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_mobility`
--

LOCK TABLES `staff_mobility` WRITE;
/*!40000 ALTER TABLE `staff_mobility` DISABLE KEYS */;
INSERT INTO `staff_mobility` VALUES (14,14,41),(17,16,41),(18,16,46),(19,17,41),(20,17,43);
/*!40000 ALTER TABLE `staff_mobility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_remunerations`
--

DROP TABLE IF EXISTS `staff_remunerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_remunerations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `price` int(11) NOT NULL,
  `nas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `staff_remunerations_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_remunerations`
--

LOCK TABLES `staff_remunerations` WRITE;
/*!40000 ALTER TABLE `staff_remunerations` DISABLE KEYS */;
INSERT INTO `staff_remunerations` VALUES (12,14,16,'123456789'),(14,16,17,''),(15,17,18,'');
/*!40000 ALTER TABLE `staff_remunerations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'Staff','2019-01-22 04:28:01','2019-01-22 04:28:01'),(2,'Agency','2019-01-22 04:28:01','2019-01-22 04:28:01');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
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
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (86,2,'Andry','ANDRIANAIVO','aa@alternateeve.com','0344630738','en','2019-03-07 06:27:29','$2y$10$CacO2VRxkxbK4TF059sZ1.ClWO9CbsvaJxXnh9kR30Lhz9j3s6xPm','PybtBCMimafOjS0W2K0n6f1ICZ9WVRKrWYeORFcLr0yjGqEJ1yaxEGFPL4GC','2019-03-07 06:26:58','2019-03-07 06:27:59'),(88,2,'Cedric','Lasalle','cedriclasalle@yahoo.com','5146496664','en','2019-03-08 00:46:47','$2y$10$Tyj.htAVKNLWm6XvWH8w4OKYLV4bjsZSNVDTBtBeDFvuwDZ0u16eK','G1yjQy4lKVBNNPP5L4GIvy1e9AKFZRMqRaxq9cjpFlJoWMBa3AQGJ0I1dAYc','2019-03-08 00:46:31','2019-03-08 00:46:47'),(89,1,'Njato','Fens','nr@alternateeve.com','11111111','en','2019-03-08 14:46:10','$2y$10$Lex8qoJ2svp/AehLjF2GA.xJHXVSiO/FdmytOALz0fvfljci4MKF6','zX0LO41uFpHOkK8m4zqiVx7maMI02U1UZtPuiZESuUs0zKJGjg38v2JtKeyX','2019-03-08 14:37:08','2019-03-08 14:46:10'),(90,1,'Altee','Tech','randriamorasataangello@gmail.com','123','fr',NULL,'$2y$10$E88sPiCkTLcHhrbEA.szUOKaQY0GH58mShhwGJb1NotdmGNDffLTK',NULL,'2019-03-12 13:51:09','2019-03-12 13:51:09'),(91,1,'Aurélie','Saiz','aurelie.saiz@gmail.com','5146071777','fr','2019-03-13 19:24:34','$2y$10$eKvJxYH74rG7JyTdCBuM2elskFU0WumIGtxVNxzq6QnSMvRI.cbkG',NULL,'2019-03-13 19:21:15','2019-03-13 19:24:34');
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

-- Dump completed on 2019-03-14 14:59:53
