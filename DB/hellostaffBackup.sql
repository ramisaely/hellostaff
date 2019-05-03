-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: hellostaff
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
  `main_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agency_phone_unique` (`phone`),
  UNIQUE KEY `agency_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES (58,'Entreprise 1','Vatofotsy',252525,'Antsirabe',NULL,NULL,'00110','Ontario','Canada','2019-03-07-06-26-57-formalisme.PNG','test description entreprise 1',NULL,'0344630738','aa@alternateeve.com','2019-03-07 06:26:57','2019-03-07 06:27:52',''),(59,'Thomas Lussiez','3486 Coloniale Avenue',4294967295,'Montreal',NULL,NULL,'H2X2Y4','Quebec','Canada','2019-03-08-00-46-31-Logo_Hellostaff.png','bla bla',NULL,'5146496664','cedriclasalle@yahoo.com','2019-03-08 00:46:31','2019-04-05 14:44:57',''),(61,'TEst','test@gmail.com',NULL,'Montreal',NULL,NULL,'H2V2K2','Québec','Canada','2019-03-15-14-25-10-Logo_Alternateeve.png','Alternateeve Technology est un laboratoire de développement web, mobile, Big data & IoT, spécialisé dans l’accompagnement technique de startup.\r\nNotre spécialité est la conception sur mesure. Nous proposons également une expertise en recherche appliquée logicielle ainsi qu’un service de programmeurs et de CTO à la demande. Nous offrons des solutions pour toutes les étapes d’un projet. Qu’il s’agisse de passer de l’idée à l’exécution ou fournir des ressources techniques à la demande.\r\n​Toutes les expertises pour réaliser un projet web dans son ensemble sont disponibles à l’interne (Designer UI/UX, Gestionnaires de projets, CTO, Développeurs back et front end). Nous nous positionnons également comme une équipe technique semi-intégrée afin d’assurer le développement et la pérennité des projets de certains de nos clients.',NULL,'+1 514-316-8994','contact@alternateeve.com','2019-03-15 14:25:10','2019-03-15 14:25:10',''),(62,'Mytest entreprise','2424',424242,'2424',NULL,NULL,'m2m2m2','Ontario','Canada','2019-03-18-13-37-09-cas_d\'utilisation.PNG','test test',NULL,'725768','ft@alternateeve.com','2019-03-18 13:37:09','2019-03-18 13:37:09',''),(63,'Alternateeve','434 Avenue de Rothesay',123456,'Saint-Lambert',NULL,NULL,'H2V2K2','Québec','Canada','2019-03-18-14-30-29-Logo_Alternateeve.png','Alternateeve Technology est un laboratoire de développement web, mobile, Big data & IoT, spécialisé dans l’accompagnement technique de startup.\r\nNotre spécialité est la conception sur mesure. Nous proposons également une expertise en recherche appliquée logicielle ainsi qu’un service de programmeurs et de CTO à la demande. Nous offrons des solutions pour toutes les étapes d’un projet. Qu’il s’agisse de passer de l’idée à l’exécution ou fournir des ressources techniques à la demande.\r\n​Toutes les expertises pour réaliser un projet web dans son ensemble sont disponibles à l’interne (Designer UI/UX, Gestionnaires de projets, CTO, Développeurs back et front end). Nous nous positionnons également comme une équipe technique semi-intégrée afin d’assurer le développement et la pérennité des projets de certains de nos clients.',NULL,'514-316-8994','hello@alternateeve.com','2019-03-18 14:30:29','2019-03-18 14:30:29',''),(64,'Alternateeve','434 Avenue de Rothesay',123456,'Saint-Lambert',NULL,NULL,'H2V2K2','Québec','Canada','2019-03-18-14-33-17-Favicon_Alternateeve.png','Alternateeve Technology est un laboratoire de développement web, mobile, Big data & IoT, spécialisé dans l’accompagnement technique de startup.\r\nNotre spécialité est la conception sur mesure. Nous proposons également une expertise en recherche appliquée logicielle ainsi qu’un service de programmeurs et de CTO à la demande. Nous offrons des solutions pour toutes les étapes d’un projet. Qu’il s’agisse de passer de l’idée à l’exécution ou fournir des ressources techniques à la demande.\r\n​Toutes les expertises pour réaliser un projet web dans son ensemble sont disponibles à l’interne (Designer UI/UX, Gestionnaires de projets, CTO, Développeurs back et front end). Nous nous positionnons également comme une équipe technique semi-intégrée afin d’assurer le développement et la pérennité des projets de certains de nos clients.',NULL,'5146923002','db@alternateeve.com','2019-03-18 14:33:17','2019-03-18 14:33:17',''),(65,'123','1595 rachel est',123,'montreal',NULL,NULL,'h2j4k2','Québec','Canada','2019-04-03-15-59-18-logo_(_teste_hello_staff_).png','inpnipjpojpjojpjoijoinonolhn',NULL,'4385213074','am@alternateeve.com','2019-04-03 15:59:18','2019-04-03 15:59:18',''),(66,'helloyou','1595 rachel est',123,'montreal',NULL,NULL,'h2j4k2','Québec','Canada','2019-04-03-16-16-28-logo_(_teste_hello_staff_).png','inpnipjpojpjojpjoijoinonolhncx svd',NULL,'438 521 3074','alisonmgnt@gmail.com','2019-04-03 16:16:28','2019-04-03 16:16:28',''),(67,'Test','290 avenue Laurier ouest apt3',123,'Montreal',NULL,NULL,'H2V2K2','Québec','Canada','2019-04-03-16-20-52-Capture_d’écran_2019-04-03_à_11.15.53.png','Création entreprise test',NULL,'0661958206','as@alternateeve.com','2019-04-03 16:20:52','2019-04-03 16:20:52',''),(68,'Our company','910 C Mahafaly',3445,'Antsirabe','123456789012345','1234567890123456','U7I8O9','Quebec','Canada','2019-04-10-15-13-38-2955114.jpg','I don\'t want to describe our company',NULL,'+261349821554','aj@alternateeve.com','2019-04-10 15:13:38','2019-04-10 15:13:38','');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency_staff`
--

LOCK TABLES `agency_staff` WRITE;
/*!40000 ALTER TABLE `agency_staff` DISABLE KEYS */;
INSERT INTO `agency_staff` VALUES (1,59,16,'2019-03-14 16:10:19','2019-03-14 16:10:19'),(6,59,17,'2019-04-04 18:33:40','2019-04-04 18:33:40'),(7,59,30,'2019-04-05 14:09:49','2019-04-05 14:09:49'),(9,59,29,'2019-04-05 20:07:08','2019-04-05 20:07:08'),(17,59,38,'2019-04-11 15:17:32','2019-04-11 15:17:32'),(18,59,21,'2019-04-12 14:04:55','2019-04-12 14:04:55'),(19,59,27,'2019-04-12 14:40:08','2019-04-12 14:40:08'),(21,59,24,'2019-04-15 01:36:06','2019-04-15 01:36:06'),(39,58,41,'2019-04-17 13:43:33','2019-04-17 13:43:33'),(40,58,39,'2019-04-17 14:03:01','2019-04-17 14:03:01');
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
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency_users`
--

LOCK TABLES `agency_users` WRITE;
/*!40000 ALTER TABLE `agency_users` DISABLE KEYS */;
INSERT INTO `agency_users` VALUES (122,62,94),(123,62,95),(124,63,96),(125,64,97),(134,65,103),(135,66,104),(136,67,105),(168,68,124),(173,59,88),(174,59,131),(175,58,86);
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
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `attributes` VALUES (1,'1','vetement.JPG','2019-01-22 07:28:00','2019-01-22 07:28:00'),(2,'1','pantalons.JPG','2019-01-22 07:28:00','2019-01-22 07:28:00'),(3,'1','chassure.JPG','2019-01-22 07:28:00','2019-01-22 07:28:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (18,59,'Grand Prix','Ferrari','3486 Colonial','H2X2Y4','Quebec','Greater Montreal','2019-03-13','2019-03-22','bla bla',NULL,'00:00:00','00:00:00','2019-03-13-23-26-00-GrandPrix1.jpg','2019-03-13 23:26:00','2019-03-13 23:26:00'),(20,59,'Tournois de Tennis',NULL,'13 fairmount','H2X2Y4','Quebec','Greater Montreal','2019-03-25','2019-03-29','bla bla.',NULL,'00:00:00','00:00:00','2019-04-02-19-40-48-TENNISQC_LOGO_Tournois-COUL-RGB.jpg','2019-03-25 22:50:43','2019-04-02 19:40:48'),(22,59,'tournois de danse','Thomas Lussiez','45 street','H2X2Y4','Québec','Grand Montréal','2019-04-01','2019-04-01','bla bla',NULL,'00:00:00','00:00:00','2019-04-01-20-22-34-dansefemme.jpg','2019-04-01 20:22:34','2019-04-01 20:22:34'),(23,58,'Rock Concert','BelleVIlle','Podium','g4g4g4','Ontario','Les alentours de la ville de Québec','2019-04-11','2019-04-20','description',NULL,'00:00:00','00:00:00','2019-04-02-13-13-01-rock.jpg','2019-04-02 13:13:01','2019-04-02 13:13:01'),(24,59,'Patinage Artistique',NULL,'34 street','H2X2Y4','Québec','Grand Montréal','2019-04-10','2019-04-10','bla bla',NULL,'00:00:00','00:00:00','2019-04-02-19-36-20-patinagephoto.jpg','2019-04-02 19:36:20','2019-04-02 19:41:44'),(26,58,'Fety party','Etudiant','Antsirabe','k4k4k4','Ontario','Quebec city','2019-04-19','2019-04-27','test',NULL,'00:00:00','00:00:00','2019-04-03-14-47-21-event_img.jpg','2019-04-03 14:47:21','2019-04-03 14:47:21'),(29,59,'Tournois de pétanque','Thomas Lussiez','8 street','H2X2Y4','Québec','Ville de Québec','2019-04-03','2019-04-28','bla bla',NULL,'00:00:00','00:00:00','2019-04-03-20-51-07-petanque.jpg','2019-04-03 20:51:07','2019-04-05 15:05:11'),(30,59,'Festival Mural',NULL,'123 Street','H2X 2Y4','Quebec','Greater Montreal','2019-06-04','2019-06-16','bla bla',NULL,'00:00:00','00:00:00','2019-04-10-16-56-51-muralist_botkin.jpg','2019-04-10 16:56:51','2019-04-15 20:13:06'),(31,59,'Tournois de Pillou','Thomas Lussiez','123 Street','H2X2Y4','Québec','Grand Montréal','2019-04-13','2019-04-21','Ceci est tournois de pillou.',NULL,'00:00:00','00:00:00','2019-04-12-15-36-52-Pilou.jpg','2019-04-12 15:36:52','2019-04-12 15:57:44'),(32,58,'Swimming event','Teenager','on the beach','B8A5C4','Québec','Les alentours de Montréal','2019-04-01','2019-05-31','No description! We may swim!',NULL,'00:00:00','00:00:00','2019-04-15-07-07-44-fakaravaatoll.jpg','2019-04-15 07:07:44','2019-04-15 07:07:44'),(33,58,'Independancy day','all people','Capital city','A1T0A1','Québec','Grand Montréal','2019-06-26','2019-06-26','This is the day from which our nation have taken a freedom officialy and democratically!',NULL,'00:00:00','00:00:00','2019-04-15-11-35-02-fireworks2.jpg','2019-04-15 11:35:02','2019-04-15 11:39:17'),(34,59,'Mariage de Joe','Thomas Lussiez','23 street','H2X2Y4','Québec','Grand Montréal','2019-04-17','2019-04-18','c’est le mariage de Joe.',NULL,'00:00:00','00:00:00','2019-04-15-14-18-43-mariagele-mariage-rempart-efficace-contre-depression_exact1024x768_l.jpg','2019-04-15 14:18:43','2019-04-15 19:52:30');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_assessment`
--

DROP TABLE IF EXISTS `event_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_assessment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `agency_id` int(10) unsigned NOT NULL,
  `event_staff_id` int(10) unsigned NOT NULL,
  `rating` double NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_assessment`
--

LOCK TABLES `event_assessment` WRITE;
/*!40000 ALTER TABLE `event_assessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_assessment` ENABLE KEYS */;
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
  `status_event_id` int(11) NOT NULL,
  `agency_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_event_staff_id` (`event_staff_id`),
  KEY `idx_staff_id` (`staff_id`),
  KEY `idx_agency_id` (`agency_id`),
  CONSTRAINT `event_candidate_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_candidate_event_staff_id_foreign` FOREIGN KEY (`event_staff_id`) REFERENCES `event_staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_candidate_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_candidate`
--

LOCK TABLES `event_candidate` WRITE;
/*!40000 ALTER TABLE `event_candidate` DISABLE KEYS */;
INSERT INTO `event_candidate` VALUES (1,34,23,1,59),(2,30,18,1,58),(3,34,21,1,59),(4,38,21,4,59),(5,30,16,1,58),(6,29,28,1,58),(8,41,38,1,59),(9,41,27,4,59),(11,45,38,1,59);
/*!40000 ALTER TABLE `event_candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_facture`
--

DROP TABLE IF EXISTS `event_facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_facture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_staff_id` int(10) unsigned NOT NULL,
  `staff_id` int(10) unsigned NOT NULL,
  `event_staff_date_id` int(10) unsigned NOT NULL,
  `range_done` int(11) NOT NULL,
  `expense` int(11) NOT NULL,
  `remuneration` int(11) NOT NULL,
  `additional_info` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `net_total` int(11) NOT NULL,
  `start_hour_done` int(11) NOT NULL,
  `end_hour_done` int(11) NOT NULL,
  `startDate_event` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_event_staff_id` (`event_staff_id`),
  KEY `idx_staff_id` (`staff_id`),
  KEY `idx_event_staff_date_id` (`event_staff_date_id`),
  CONSTRAINT `event_facture_event_staff_date_id_foreign` FOREIGN KEY (`event_staff_date_id`) REFERENCES `event_staff_date` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_facture_event_staff_id_foreign` FOREIGN KEY (`event_staff_id`) REFERENCES `event_staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_facture_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_facture`
--

LOCK TABLES `event_facture` WRITE;
/*!40000 ALTER TABLE `event_facture` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_facture` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_manage_by`
--

LOCK TABLES `event_manage_by` WRITE;
/*!40000 ALTER TABLE `event_manage_by` DISABLE KEYS */;
INSERT INTO `event_manage_by` VALUES (12,18,88),(16,22,88),(17,23,86),(19,20,88),(20,24,88),(22,26,86),(29,29,88),(41,31,88),(42,31,131),(43,32,86),(46,33,86),(49,34,88),(50,34,131),(51,30,88),(52,30,108),(53,30,120);
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_mobility`
--

LOCK TABLES `event_mobility` WRITE;
/*!40000 ALTER TABLE `event_mobility` DISABLE KEYS */;
INSERT INTO `event_mobility` VALUES (9,18,41),(13,22,41),(14,23,44),(16,20,41),(17,24,41),(19,26,43),(26,29,43),(31,31,41),(32,32,42),(35,33,41),(37,34,41),(38,30,41);
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
  `distance` double DEFAULT NULL,
  `per_diem` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_event_id` (`event_id`),
  CONSTRAINT `event_staff_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_staff`
--

LOCK TABLES `event_staff` WRITE;
/*!40000 ALTER TABLE `event_staff` DISABLE KEYS */;
INSERT INTO `event_staff` VALUES (27,23,'Spécialiste Produit',4,'test','k4k4k4','Ontario','Les alentours de la ville de Québec','linear-gradient(60deg, #F44236, #F48F36)',17,'test',NULL,14,14,'2019-04-02 13:13:01','2019-04-02 13:13:01'),(28,23,'Chef d\'équipe',3,'yryery','o4o4o4','Ontario','Ville de Québec','linear-gradient(231deg, #899ED4, #A389D4)',12,'test',NULL,15,15,'2019-04-02 13:13:01','2019-04-12 15:01:21'),(29,26,'Product Specialist',4,'test','m2l4l2','Ontario','Quebec city','linear-gradient(231deg, #899ED4, #A389D4)',12,'test',NULL,NULL,NULL,'2019-04-03 14:47:21','2019-04-12 15:00:19'),(30,26,'Team Lead',3,'test','i1k4k1','British Colombia','Greater Toronto','linear-gradient(60deg, #F44236, #F48F36)',16,'test',NULL,NULL,NULL,'2019-04-03 14:47:21','2019-04-11 13:53:16'),(34,29,'Chef d\'équipe',1,'3486 Coloniale Avenue','H2X2Y4','Québec','Ville de Québec','linear-gradient(239deg, #1DE9B6, #1DC4E9)',20,'bla bla',NULL,NULL,NULL,'2019-04-03 20:51:07','2019-04-17 13:51:21'),(35,29,'Dégustation',5,'8 street','H2X2Y4','Québec','Ville de Québec','linear-gradient(231deg, #899ED4, #A389D4)',20,'bla bla',NULL,NULL,NULL,'2019-04-03 20:51:07','2019-04-03 20:51:07'),(36,29,'Photographe',1,'8 street','H2X2Y4','Québec','Ville de Québec','linear-gradient(60deg, #F44236, #F48F36)',25,'bla bla',NULL,NULL,NULL,'2019-04-03 21:31:55','2019-04-03 21:31:55'),(37,29,'Spécialiste Produit',1,'34 street','H2X2Y4','Québec','Ville de Québec','linear-gradient(67deg, #1FA548, #21FFAA)',20,'bla bla',NULL,NULL,NULL,'2019-04-05 15:00:55','2019-04-05 18:43:31'),(38,30,'Brand ambassador',3,'123 Street','H2X2Y4','Quebec','Greater Montreal','linear-gradient(239deg, #1DE9B6, #1DC4E9)',12,'bla bla',NULL,NULL,NULL,'2019-04-10 16:56:51','2019-04-12 15:17:47'),(41,31,'Ambassadeur de marque',1,'3486 Coloniale Avenue','H2X2Y4','Québec','Grand Montréal','linear-gradient(239deg, #1DE9B6, #1DC4E9)',20,'Tu dois jouer au pillou!',NULL,1,19,'2019-04-12 15:36:52','2019-04-12 15:57:44'),(42,32,'Chef d\'équipe',3,'On the beach','B8A5C4','Québec','Grand Montréal','linear-gradient(239deg, #1DE9B6, #1DC4E9)',12,'Team lead description',NULL,10,340,'2019-04-15 07:07:44','2019-04-15 07:09:49'),(43,32,'Coordinateur de terrain',10,'On the beach','B8A5C4','Québec','Grand Montréal','linear-gradient(231deg, #899ED4, #A389D4)',12,'Other post description',NULL,9,140,'2019-04-15 07:07:44','2019-04-15 08:36:34'),(44,33,'Coordinateur de terrain',5,'Capital city','Q1M0A1','Québec','Grand Montréal','linear-gradient(239deg, #1DE9B6, #1DC4E9)',300,'Area coordinate description',NULL,12.58,3000,'2019-04-15 11:35:02','2019-04-15 11:39:17'),(45,34,'Ambassadeur de marque',3,'3486 Coloniale Avenue','h2x2y4','Québec','Grand Montréal','linear-gradient(239deg, #1DE9B6, #1DC4E9)',19,'Tu dois travailler.',NULL,NULL,20,'2019-04-15 14:18:43','2019-04-17 14:37:21'),(46,34,'Hôte',2,'3486 Coloniale Avenue','H2X2Y4','Québec','Grand Montréal','linear-gradient(231deg, #899ED4, #A389D4)',20,'tu vas travailler',NULL,NULL,20,'2019-04-15 14:18:43','2019-04-15 14:18:43'),(47,34,'Equipe de montage/démontage',4,'4 street','H2X2Y4','Québec','Grand Montréal','linear-gradient(60deg, #F44236, #F48F36)',20,'bb',NULL,0.3,20,'2019-04-15 19:52:30','2019-04-15 19:52:30');
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_staff_date`
--

LOCK TABLES `event_staff_date` WRITE;
/*!40000 ALTER TABLE `event_staff_date` DISABLE KEYS */;
INSERT INTO `event_staff_date` VALUES (26,27,'01:00:00','02:00:00','linear-gradient(60deg, #F44236, #F48F36)','2019-04-02 13:13:01','2019-04-02 13:13:01','2019-04-17','2019-04-17'),(27,27,'01:00:00','04:00:00','linear-gradient(60deg, #F44236, #F48F36)','2019-04-02 13:13:01','2019-04-02 13:13:01','2019-04-18','2019-04-18'),(28,28,'01:00:00','04:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-02 13:13:01','2019-04-02 13:13:01','2019-04-19','2019-04-19'),(29,29,'01:00:00','02:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-03 14:47:21','2019-04-03 14:47:21','2019-04-22','2019-04-22'),(30,29,'01:00:00','19:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-03 14:47:21','2019-04-03 14:47:21','2019-04-23','2019-04-23'),(31,30,'01:00:00','19:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-03 14:47:21','2019-04-03 14:47:21','2019-04-26','2019-04-26'),(39,34,'01:00:00','02:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-03 20:51:07','2019-04-05 15:05:11','2019-04-02','2019-04-02'),(40,35,'10:00:00','17:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-03 20:51:07','2019-04-05 15:05:11','2019-04-04','2019-04-04'),(41,35,'10:00:00','18:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-03 21:31:55','2019-04-05 15:05:11','2019-04-02','2019-04-02'),(42,36,'10:00:00','18:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-03 21:31:55','2019-04-05 15:05:11','2019-04-02','2019-04-02'),(43,37,'03:00:00','04:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-05 15:00:55','2019-04-05 15:05:11','2019-04-05','2019-04-05'),(44,38,'07:00:00','16:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-10 16:56:51','2019-04-15 20:13:06','2019-06-04','2019-06-04'),(45,38,'07:00:00','16:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-10 16:56:51','2019-04-15 20:13:06','2019-06-05','2019-06-05'),(46,38,'07:00:00','16:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-10 16:56:51','2019-04-15 20:13:06','2019-06-06','2019-06-06'),(52,41,'10:00:00','20:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-12 15:36:52','2019-04-12 15:57:44','2019-04-13','2019-04-13'),(53,42,'01:00:00','02:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 07:07:44','2019-04-15 07:07:44','2019-04-01','2019-04-01'),(54,42,'01:00:00','02:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 07:07:44','2019-04-15 07:07:44','2019-04-03','2019-04-03'),(55,42,'01:00:00','02:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 07:07:44','2019-04-15 07:07:44','2019-04-30','2019-04-30'),(56,42,'01:00:00','02:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 07:07:44','2019-04-15 07:07:44','2019-05-31','2019-05-31'),(57,42,'01:00:00','02:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 07:07:44','2019-04-15 07:07:44','2019-04-17','2019-04-17'),(58,43,'01:00:00','02:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 07:07:44','2019-04-15 07:07:44','2019-05-10','2019-05-10'),(59,43,'01:00:00','02:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 07:07:44','2019-04-15 07:07:44','2019-05-17','2019-05-17'),(60,43,'01:00:00','02:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 07:07:44','2019-04-15 07:07:44','2019-05-24','2019-05-24'),(61,43,'01:00:00','02:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 07:07:44','2019-04-15 07:07:44','2019-05-31','2019-05-31'),(62,43,'01:00:00','02:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 07:07:44','2019-04-15 07:07:44','2019-04-05','2019-04-05'),(63,43,'01:00:00','02:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 07:07:44','2019-04-15 07:07:44','2019-04-12','2019-04-12'),(64,43,'01:00:00','02:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 07:07:44','2019-04-15 07:07:44','2019-04-19','2019-04-19'),(65,43,'01:00:00','02:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 07:07:44','2019-04-15 07:07:44','2019-04-26','2019-04-26'),(66,43,'01:00:00','02:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 07:07:44','2019-04-15 07:07:44','2019-05-03','2019-05-03'),(67,44,'18:00:00','20:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 11:35:02','2019-04-15 11:39:17','2019-06-26','2019-06-26'),(68,45,'10:00:00','21:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 14:18:43','2019-04-15 19:52:30','2019-04-17','2019-04-17'),(69,45,'10:00:00','21:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 14:18:43','2019-04-15 19:52:30','2019-04-18','2019-04-18'),(70,46,'10:00:00','21:00:00','linear-gradient(231deg, #899ED4, #A389D4)','2019-04-15 14:18:43','2019-04-15 19:52:30','2019-04-17','2019-04-17'),(71,46,'10:00:00','21:00:00','linear-gradient(231deg, #899ED4, #A389D4)','2019-04-15 14:18:43','2019-04-15 19:52:30','2019-04-18','2019-04-18'),(72,47,'10:00:00','19:00:00','linear-gradient(239deg, #1DE9B6, #1DC4E9)','2019-04-15 19:52:30','2019-04-15 19:52:30','2019-04-18','2019-04-18');
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_staff_jobs`
--

LOCK TABLES `event_staff_jobs` WRITE;
/*!40000 ALTER TABLE `event_staff_jobs` DISABLE KEYS */;
INSERT INTO `event_staff_jobs` VALUES (43,27,79),(44,28,78),(45,29,79),(46,30,78),(63,34,78),(64,35,83),(65,36,85),(66,37,79),(75,41,77),(76,42,78),(77,43,81),(80,44,81),(83,45,77),(84,46,80),(85,47,82),(86,38,77);
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_staff_mobility`
--

LOCK TABLES `event_staff_mobility` WRITE;
/*!40000 ALTER TABLE `event_staff_mobility` DISABLE KEYS */;
INSERT INTO `event_staff_mobility` VALUES (23,27,44),(24,28,43),(25,29,43),(26,30,45),(43,34,43),(44,35,43),(45,36,43),(46,37,43),(55,41,41),(56,42,41),(57,43,41),(60,44,41),(63,45,41),(64,46,41),(65,47,41),(66,38,41);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_statement`
--

LOCK TABLES `event_statement` WRITE;
/*!40000 ALTER TABLE `event_statement` DISABLE KEYS */;
INSERT INTO `event_statement` VALUES (1,30,'2019-04-15 19:09:45','2019-04-15 19:09:45',59,21);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_statement_question_answer`
--

LOCK TABLES `event_statement_question_answer` WRITE;
/*!40000 ALTER TABLE `event_statement_question_answer` DISABLE KEYS */;
INSERT INTO `event_statement_question_answer` VALUES (1,1,'2019-04-15 19:09:45','2019-04-15 19:09:45','Peux-tu me dire à combien de personnes tu as parlé aujourd’hui ?',NULL);
/*!40000 ALTER TABLE `event_statement_question_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_statement_question_answer_file`
--

DROP TABLE IF EXISTS `event_statement_question_answer_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_statement_question_answer_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_answer_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_question_answer_id` (`question_answer_id`),
  CONSTRAINT `event_statement_question_answer_file_question_answer_id_foreign` FOREIGN KEY (`question_answer_id`) REFERENCES `event_statement_question_answer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_statement_question_answer_file`
--

LOCK TABLES `event_statement_question_answer_file` WRITE;
/*!40000 ALTER TABLE `event_statement_question_answer_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_statement_question_answer_file` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_09_24_112729_create_staff_jobs_table',1),(4,'2018_09_24_121508_create_staff_languages_table',1),(5,'2018_09_24_121901_create_staff_certifications_table',1),(6,'2018_09_24_130405_create_staff_attributs_table',1),(7,'2018_09_24_134519_create_staff_remunerations_table',1),(8,'2018_09_24_134823_create_staff_mobilities_table',1),(9,'2018_09_25_064012_create_table_language',1),(10,'2018_09_25_071339_create_attributes_table',1),(11,'2018_09_25_071459_create_attribute_translations_table',1),(12,'2018_09_25_071840_create_attribute_options_table',1),(13,'2018_09_25_072019_create_attribute_option_translations_table',1),(14,'2018_09_25_072438_create_staff_attribute_options_table',1),(15,'2018_09_27_121231_create_table_gender',1),(16,'2018_09_27_121300_create_table_attribute_option_gender',1),(17,'2018_11_15_093720_add_smart_serve_to_staff_certifications',1),(18,'2018_11_15_113355_add_not_pronounced_to_staff_attributs',1),(19,'2019_01_02_122602_create_agency_table',1),(20,'2019_01_02_123916_create_agency_users_table',1),(21,'2019_01_02_130410_add_agency_phone_to_agency',1),(22,'2019_01_02_142431_add_agency_mail_to_agency',1),(23,'2019_01_23_100038_create_event_table',2),(24,'2019_02_08_121718_edit_user_id_in_table_users',3),(25,'2019_02_08_125633_edit_agency_id_in_table_agency',3),(26,'2019_02_09_074015_update_agency_users_add_foreign_key',3),(27,'2019_02_09_075103_update_staff_users_foreign_key',3),(28,'2019_02_12_084132_update_table_event',4),(29,'2019_02_12_084345_update_table_event_staff',4),(30,'2019_02_12_084408_update_table_event_staff_date',4),(31,'2019_02_12_111916_create_table_event_manage_by',5),(32,'2019_02_18_150950_update_table_event_staff',6),(33,'2019_02_18_151223_update_table_event_staff_date',6),(34,'2019_02_19_070755_update_table_event_staff_rename_id',6),(35,'2019_02_19_070922_update_table_event_staff_date_rename_id',6),(36,'2019_02_19_141150_update_table_jobs_rename_id',7),(37,'2019_02_19_141415_update_table_job_translation_rename_foreiorereign_key',7),(38,'2019_02_19_141720_create_table_event_staff__jobs',7),(39,'2019_02_20_062853_update_mobility_rename_id',8),(40,'2019_02_20_064611_update_mobility_translation_rename_id',8),(41,'2019_02_20_071325_create_table_event_mobility',8),(42,'2019_02_20_071515_create_event_staff_mobility',8),(43,'2019_03_04_065346_update_users_add_language_code',9),(44,'2019_03_05_115521_update_attributes_column_id',10),(45,'2019_03_05_141200_update_attribute_options_column_id',10),(46,'2019_03_05_141841_update_attribute_option_gender_column_id',10),(47,'2019_03_05_142341_update_attribute_option_translations_column_id',10),(48,'2019_03_05_142816_update_attribute_translations_column_id',10),(49,'2019_03_05_143010_update_gender_column_id',10),(50,'2019_03_05_143151_update_language_column_id',10),(51,'2019_03_05_143319_update_staff_column_id',10),(52,'2019_03_05_143555_update_staff_attribut_column_id',10),(53,'2019_03_05_144142_update_staff_attribute_options_column_id',10),(54,'2019_03_05_144539_update_staff_certifications_column_id',10),(55,'2019_03_05_144759_update_staff_jobs_column_id',10),(56,'2019_03_05_145120_update_staff_language_column_id',10),(57,'2019_03_05_145519_update_staff_mobility_column_id',10),(58,'2019_03_05_145756_update_staff_remuneration_column_id',10),(59,'2019_03_05_145957_update_user_role_column_id',10),(60,'2019_03_08_062431_create_table_all_language',11),(61,'2019_03_08_062924_create_table_all_language_translation',11),(62,'2019_03_08_081405_create_table_all_language_choice',11),(63,'2019_03_08_081447_create_table_all_language_choice_translation',11),(64,'2019_03_08_132621_update_table_staff_add_column_age',11),(65,'2019_03_08_134911_update_table_staff_languages_add_column_all_language',11),(66,'2019_03_12_085827_create_table_event_statement',12),(67,'2019_03_12_091006_create_table_event_statement_question_answer',12),(68,'2019_03_12_091735_update_table_event_statement_question_answer',12),(69,'2019_03_13_112722_update_table_event_statement',13),(70,'2019_03_13_141850_update_table_event_statement_user_id_column',14),(71,'2019_03_13_134126_create_table_event_candidate',15),(72,'2019_03_13_145038_update_table_event_statement_staff_id_column_',15),(73,'2019_03_13_130906_create_agency_staff_table',16),(74,'2019_03_15_133221_create_table_status_event',17),(75,'2019_03_15_133400_create_table_status_event_translation',17),(76,'2019_03_15_135043_update_table_event_candidate',17),(77,'2019_03_15_135719_update_table_event_candidate_plus',17),(78,'2019_03_18_074923_update_event_candidate_add_agency_id',17),(79,'2019_03_18_133620_create_table_event_statement_question_answer_file',18),(80,'2019_03_20_115838_update_table_staff_attribut',18),(81,'2019_03_21_125635_create_event_assessment_table',18),(82,'2019_03_22_064253_update_table_attributes_add_image',19),(83,'2019_03_27_091153_create_event_facture_table',20),(84,'2019_03_27_121134_update_table_event_assesment_column_rating',20),(85,'2019_04_03_122816_update_table_event_staff_nullable_distance_and_perdiem',21),(86,'2019_04_15_072857_add_column_main_user_to_agency_table',22);
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
INSERT INTO `password_resets` VALUES ('mikianico@gmail.com','$2y$10$AdXa.i3Pa4/ZPQnb9KTx5ONcPO4R3F1Q6ohBIUh1luQgDFVRRxtbe','2019-01-23 06:29:10'),('ericarisanjy20@gmail.com','$2y$10$jGh96DmC5NGGre9I9nszjuXBR2FtQ.P.j52xgWouOz0lAnLB6oh6u','2019-02-01 06:20:47'),('er@alternateeve.com','$2y$10$C9wx2IiVYhNWziQJRdAOReXmTY7Ce8M9UD1txgcJIkhBF2EpRLU1C','2019-02-01 06:25:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (14,NULL,_binary '1','1991-09-18',0,'Antsirabe','Vatofotsy','00110','Our website','2019-02-28-14-12-35-actor.PNG','2019-02-28-14-12-35-cas_d\'utilisation.PNG','2019-02-28-14-12-35-Fanasana.docx'),(16,89,_binary '1','1993-02-03',26,'1111111','1111111111','m1m1m1','Sponsorship','2019-03-08-14-37-08-IMG_20190306_122634.jpg','2019-03-08-14-37-08-IMG_20190306_122313.jpg','2019-03-08-14-37-08-Inscription_Staff_-_Traduction_.docx'),(17,91,_binary '2','1987-10-11',32,'Monteeal','728 rue Agnes','H4C2P8','Réseaux sociaux','2019-03-13-19-21-15-IMG_3590.JPG','2019-03-13-19-21-15-IMG_3564.JPG','2019-03-13-19-21-15-Resume_Aurelie_Saiz.pdf'),(18,100,_binary '1','1991-02-02',28,'Antsirabe','Mahazoarivo','l1l4l1','Parrainage','2019-03-19-18-40-22-actor.PNG','2019-03-19-18-40-22-classe_auth.PNG','2019-03-19-18-40-22-Fanasana.docx'),(20,106,_binary '2','1991-02-02',28,'Antsirabe','Mahazoarivo','e1a2e1','Parrainage','2019-04-03-19-04-03-images.jpg','2019-04-03-19-04-03-images.png','2019-04-03-19-04-03-Fanasana.docx'),(21,109,_binary '1','1994-04-27',25,'Montreal','600 boulevard Maisonneuve','H3a3j2','Réseaux sociaux','2019-04-03-22-02-42-D266679B-5FFE-4ED7-A382-B87291B4703D.jpeg','2019-04-17-13-57-37-Ali14102452_10210258845248152_6880622419674438918_n.jpg',''),(22,110,_binary '2','1992-01-01',27,'Sainte foy','787 avenue chevremont','G1v1t5','Bouche-à-oreille','2019-04-04-15-20-05-887CA0F0-1498-4819-AC78-A9BFE0B97B33.jpeg','',''),(23,111,_binary '2','1987-01-01',32,'Toronto','20 sammon avenue','M4J1Y7','Notre site web','2019-04-04-16-15-42-91FC7933-8016-4E7F-9D5E-C0DE79E9A220.jpeg','2019-04-04-16-15-42-C880ACFB-338A-4014-ACDC-E4B3C484959A.jpeg','2019-04-04-16-15-42-Michael_Jesus_-_Actor_CV.pdf'),(24,112,_binary '2','1994-01-01',25,'Montréal','3486 coloniale','H2X2y4','Amis','2019-04-04-16-28-31-1B8EC9E0-AB33-42C4-9E8D-4085C647798F.jpeg','2019-04-04-16-28-31-67E9CA2C-3B77-4B00-B44B-1EE2B4D881BB.jpeg',''),(25,113,_binary '1','1991-01-01',28,'Montreal','3700 rue saint antoine ouest','H4c0b1','Amis','2019-04-04-16-31-10-9437CA70-DEC4-4F50-A72F-FF65F9AF8DE5.jpeg','2019-04-04-16-31-10-B9460D0B-EE8B-486A-AC19-484111DFBBEB.jpeg',''),(26,114,_binary '1','1989-01-01',30,'Montreal','1810 rue iberville','H2k3c3','Prefer not to disclose.','2019-04-04-16-43-31-23A9E1AE-6770-4287-8B60-0E9A6A45BB8D.jpeg','2019-04-04-16-43-31-3183B1AE-A23C-42CD-87D4-8177B5259769.jpeg','2019-04-04-16-43-31-Michael_Jesus_-_Model_CV.pdf'),(27,115,_binary '1','1987-01-01',32,'Toronto','20 street','H2x2y4','Social networks','2019-04-04-16-49-57-9FCE2B14-591C-4227-BD58-CECACC9D11B4.jpeg','2019-04-04-16-49-57-53851E46-8494-4FA7-9872-837FCAA024E6.jpeg',''),(28,116,_binary '1','1985-01-01',34,'Vancouver','910 west pender street','V6C1L6','Our website','2019-04-04-17-08-12-C78F5AB2-BD56-49A6-83FA-F22F276073E9.jpeg','',''),(29,117,_binary '2','1995-01-01',24,'Quebec','50 rue saint louis','G1r3z2','Friends','2019-04-04-17-27-13-7D3196C2-52CC-4B7F-9FE4-F6DF40A7DC84.jpeg','',''),(30,118,_binary '1','1994-01-01',25,'Ottawa','25 street','H2x2y4','Amis','2019-04-05-14-08-51-12909510_10153570485787781_9180838032319677887_o.jpg','2019-04-04-18-22-05-D48842E2-5DB7-4B3B-938E-4BFC9FC2CA6E.jpeg',''),(31,119,_binary '1','1990-01-01',29,'Antsirabe','Avaratsena','g4g4g4','Sponsorship','2019-04-04-18-48-23-images.jpg','2019-04-04-18-48-23-images.png','2019-04-04-18-48-23-Avancement_HelloStaff.docx'),(34,125,_binary '2','1993-01-01',26,'Toronto','3486 street','H2X2Y4','Amis','2019-04-10-15-54-23-MadissonPortrait.PNG','',''),(35,126,_binary '1','1989-01-01',30,'Ottawa','12345 street','H3x2y5','Parrainage','2019-04-10-16-03-20-C79BE082-B6B8-46AF-8AFC-37CD672E7754.png','',''),(36,127,_binary '1','1979-01-01',40,'Tadoussac','12345 street tadou','H2X2y4','Amis','2019-04-10-16-27-17-11800133_10206068504566313_7006567953213361436_n.jpg','2019-04-10-16-27-17-10312472_10205458033864927_6718119908550012036_n.jpg','2019-04-10-16-27-17-ThomasLussiez-CV.pdf'),(37,128,_binary '1','1973-01-01',46,'Montréal','345 avenue','H2x2y4','Parrainage','2019-04-10-16-39-03-51602E26-4BA8-43B7-8C3B-038F6C9B3C5B.jpeg','2019-04-10-16-39-03-AA4DE480-2D73-4B28-90B8-44E477526867.jpeg',''),(38,129,_binary '1','1992-01-01',27,'Laval','123 Street','H2x2y4','Parrainage','2019-04-10-21-07-42-16711526_10154547735002762_9127275134924247528_n.jpg','2019-04-10-21-07-42-12592695_10153557929622762_3123089064530166718_n.jpg','2019-04-10-21-07-42-ThomasLussiez-CV.pdf'),(39,130,_binary '1','1990-01-01',29,'Laval','1616 on sen fou','H7N4K6','Bouche-à-oreille','2019-04-10-22-16-11-9d-FnXGH_400x400.jpg','',''),(40,132,_binary '1','1998-07-06',21,'Antsirabe','lot 12A110','110','Bouche-à-oreille','2019-04-15-14-14-42-_MG_3909_(2).JPG','2019-04-15-14-14-42-_MG_9233a.jpg','2019-04-15-14-14-42-1coursInternet.pdf'),(41,133,_binary '1','1999-03-26',20,'Antsirabe','Vatofotsy lot 0910 C 83 Mahafaly','110','Bouche-à-oreille','2019-04-15-14-46-02-P1000019.JPG','2019-04-15-14-46-02-P1310576.JPG','2019-04-15-14-46-02-CV_Caius.docx'),(42,134,_binary '1','1993-09-01',26,'Montréal','12 grifintown','H2X2Y4','Amis','2019-04-16-19-27-40-yacine.jpeg','2019-04-16-19-27-40-13415550_10154939886057729_7200513989413130337_o.jpg','2019-04-16-19-27-40-ThomasLussiez-CV.pdf'),(43,135,_binary '1','1969-01-01',50,'La gaule','123 La gaule','H2X2Y4','Friends','2019-04-16-19-50-12-vercingetorix2.jpg','2019-04-16-19-50-12-Vercingetorixchristophelambert1.jpg','2019-04-16-19-50-12-ThomasLussiez-CV.pdf');
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
  `height` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_staff_id` (`staff_id`),
  CONSTRAINT `staff_attribut_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_attribut`
--

LOCK TABLES `staff_attribut` WRITE;
/*!40000 ALTER TABLE `staff_attribut` DISABLE KEYS */;
INSERT INTO `staff_attribut` VALUES (12,14,'None','None',_binary '0',NULL),(14,16,'None','None',_binary '0',NULL),(15,17,'1','1',_binary '0',NULL),(16,18,'3','3',_binary '0',NULL),(18,20,'3','3',_binary '0','5\'2\" = 1.57m'),(19,21,'3','3',_binary '0','5\'11'),(20,22,'2','3',_binary '0','5\'6\" = 1.68m'),(21,23,'3','3',_binary '0','5\'7'),(22,24,'3','3',_binary '0','5\'10\" = 1.78m'),(23,25,'3','3',_binary '0','5\'11\" = 1.80m'),(24,26,'1','3',_binary '0','5\'11\" = 1.80m'),(25,27,'1','3',_binary '0',''),(26,28,'3','3',_binary '0','6\'1\" = 1.85m'),(27,29,'3','3',_binary '0',''),(28,30,'3','1',_binary '0','6\'8'),(29,31,'2','2',_binary '0','5\'1\" = 1.55m'),(32,34,'3','3',_binary '0','5\'8'),(33,35,'3','3',_binary '0','6\'3\" = 1.90m'),(34,36,'3','3',_binary '0','5\'2\" = 1.57m'),(35,37,'3','3',_binary '0',NULL),(36,38,'3','3',_binary '0','5\'9\" = 1.75m'),(37,39,'3','3',_binary '0',''),(38,40,'3','3',_binary '0','5\'5\" = 1.65m'),(39,41,'3','3',_binary '0','6\'1\" = 1.85m'),(40,42,'3','3',_binary '0','5\'8\" = 1.73m'),(41,43,'3','3',_binary '0','5\'10\" = 1.78m');
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
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_attribute_options`
--

LOCK TABLES `staff_attribute_options` WRITE;
/*!40000 ALTER TABLE `staff_attribute_options` DISABLE KEYS */;
INSERT INTO `staff_attribute_options` VALUES (34,12,1,21),(35,12,2,47),(36,12,3,81),(37,NULL,NULL,NULL),(38,NULL,NULL,NULL),(39,NULL,NULL,NULL),(40,14,1,21),(41,14,2,27),(42,14,3,63),(43,15,1,20),(44,15,2,27),(45,15,3,67),(46,16,1,21),(47,16,2,27),(48,16,3,62),(52,18,1,21),(53,18,2,28),(54,18,3,64),(55,19,1,21),(56,19,2,31),(57,19,3,86),(58,20,1,20),(59,20,2,45),(60,20,3,65),(61,21,1,20),(62,21,2,27),(63,21,3,63),(64,22,1,NULL),(65,22,2,NULL),(66,22,3,NULL),(67,23,1,22),(68,23,2,31),(69,23,3,71),(70,24,1,22),(71,24,2,31),(72,24,3,77),(73,25,1,NULL),(74,25,2,NULL),(75,25,3,NULL),(76,26,1,23),(77,26,2,34),(78,26,3,90),(79,27,1,NULL),(80,27,2,NULL),(81,27,3,NULL),(82,28,1,23),(83,28,2,29),(84,28,3,66),(85,29,1,20),(86,29,2,27),(87,29,3,63),(94,32,1,NULL),(95,32,2,NULL),(96,32,3,NULL),(97,33,1,NULL),(98,33,2,NULL),(99,33,3,NULL),(100,34,1,NULL),(101,34,2,NULL),(102,34,3,NULL),(103,35,1,NULL),(104,35,2,NULL),(105,35,3,NULL),(106,36,1,NULL),(107,36,2,NULL),(108,36,3,NULL),(109,37,1,NULL),(110,37,2,NULL),(111,37,3,NULL),(112,38,1,NULL),(113,38,2,NULL),(114,38,3,NULL),(115,39,1,NULL),(116,39,2,NULL),(117,39,3,NULL),(118,40,1,NULL),(119,40,2,NULL),(120,40,3,NULL),(121,41,1,NULL),(122,41,2,NULL),(123,41,3,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_certifications`
--

LOCK TABLES `staff_certifications` WRITE;
/*!40000 ALTER TABLE `staff_certifications` DISABLE KEYS */;
INSERT INTO `staff_certifications` VALUES (12,14,_binary '1',_binary '0',_binary '0',_binary '1',_binary '1',_binary '1',_binary '0'),(14,16,_binary '0',_binary '0',_binary '0',_binary '1',_binary '1','',_binary '0'),(15,17,_binary '0',_binary '0',_binary '0',_binary '1',_binary '1',_binary '1',_binary '0'),(16,18,_binary '0',_binary '0',_binary '0',_binary '1',_binary '1',_binary '1',_binary '0'),(18,20,_binary '0',_binary '0',_binary '0',_binary '1',_binary '0',_binary '0',_binary '0'),(19,21,_binary '0',_binary '0',_binary '0',_binary '0',_binary '1',_binary '0',_binary '0'),(20,22,_binary '0',_binary '0',_binary '0',_binary '1',_binary '1',_binary '0',_binary '0'),(21,23,_binary '1',_binary '0',_binary '0',_binary '0',_binary '1',_binary '0',_binary '0'),(22,24,_binary '0',_binary '0',_binary '0',_binary '0',_binary '1',_binary '0',_binary '0'),(23,25,_binary '1',_binary '0',_binary '1',_binary '1',_binary '1',_binary '0',_binary '0'),(24,26,_binary '0',_binary '0',_binary '0',_binary '1',_binary '1',_binary '0',_binary '0'),(25,27,_binary '0',_binary '0',_binary '1',_binary '1',_binary '1',_binary '1',_binary '0'),(26,28,_binary '0',_binary '0',_binary '0',_binary '1',_binary '1',_binary '1',_binary '0'),(27,29,_binary '0',_binary '0',_binary '0',_binary '0',_binary '0',_binary '0',_binary '0'),(28,30,_binary '1',_binary '1',_binary '1',_binary '1',_binary '1',_binary '0',_binary '0'),(29,31,_binary '0',_binary '0',_binary '0',_binary '1',_binary '0',_binary '0',_binary '0'),(32,34,_binary '0',_binary '0',_binary '0',_binary '0',_binary '1',_binary '0',_binary '0'),(33,35,_binary '1',_binary '0',_binary '1',_binary '1',_binary '1',_binary '0',_binary '1'),(34,36,_binary '0',_binary '0',_binary '1',_binary '1',_binary '1',_binary '0',_binary '0'),(35,37,_binary '1',_binary '0',_binary '1',_binary '1',_binary '1',_binary '0',_binary '0'),(36,38,_binary '0',_binary '0',_binary '0',_binary '0',_binary '1',_binary '1',_binary '0'),(37,39,_binary '0',_binary '0',_binary '0',_binary '1',_binary '1',_binary '1',_binary '0'),(38,40,_binary '0',_binary '0',_binary '1',_binary '0',_binary '0',_binary '0',_binary '0'),(39,41,_binary '1',_binary '0',_binary '0',_binary '0',_binary '0',_binary '0',_binary '0'),(40,42,_binary '0',_binary '0',_binary '0',_binary '0',_binary '1',_binary '0',_binary '0'),(41,43,_binary '0',_binary '0',_binary '1',_binary '1',_binary '1',_binary '1',_binary '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_jobs`
--

LOCK TABLES `staff_jobs` WRITE;
/*!40000 ALTER TABLE `staff_jobs` DISABLE KEYS */;
INSERT INTO `staff_jobs` VALUES (10,14,78,2),(12,16,78,2),(13,16,93,3),(14,17,81,2),(15,18,78,1),(17,20,78,2),(18,20,95,1),(19,21,77,3),(20,21,78,3),(21,21,79,0),(22,22,77,2),(23,22,80,3),(24,22,84,0),(25,22,86,1),(26,22,87,3),(27,23,78,3),(28,23,79,3),(29,23,81,1),(30,23,89,2),(31,23,92,3),(32,24,77,3),(33,24,80,2),(34,24,84,2),(35,24,87,0),(36,25,77,3),(37,25,80,0),(38,25,87,0),(39,25,89,1),(40,25,92,3),(41,26,77,0),(42,26,80,0),(43,26,82,0),(44,26,91,0),(45,27,77,0),(46,27,78,3),(47,27,79,3),(48,27,80,1),(49,27,82,1),(50,27,86,2),(51,27,95,3),(52,28,77,3),(53,28,78,3),(54,28,79,3),(55,28,81,3),(56,28,85,3),(57,28,93,3),(58,29,77,1),(59,29,79,2),(60,29,82,3),(61,29,88,3),(62,30,77,3),(63,30,78,2),(64,30,79,3),(65,30,80,3),(66,30,81,1),(67,30,82,0),(68,30,85,0),(69,30,89,0),(70,30,93,3),(71,31,78,1),(72,31,79,2),(74,34,77,3),(75,34,78,2),(76,34,80,3),(77,34,81,1),(78,34,83,2),(79,34,85,0),(80,35,77,3),(81,35,86,1),(82,35,87,3),(83,35,90,0),(84,35,92,2),(85,35,93,3),(86,35,94,0),(87,36,77,0),(88,36,81,3),(89,36,82,2),(90,36,84,0),(91,36,89,0),(92,36,95,2),(93,37,77,3),(94,37,79,3),(95,37,89,3),(96,37,92,3),(97,37,94,0),(98,38,77,3),(99,38,80,0),(100,38,85,1),(101,38,88,3),(102,38,93,1),(103,39,82,3),(104,40,78,1),(105,41,94,2),(106,42,77,3),(107,42,79,3),(108,42,87,0),(109,42,91,1),(110,43,85,0),(111,43,89,3),(112,43,91,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_languages`
--

LOCK TABLES `staff_languages` WRITE;
/*!40000 ALTER TABLE `staff_languages` DISABLE KEYS */;
INSERT INTO `staff_languages` VALUES (19,14,0,0),(20,14,0,0),(25,17,1,4),(26,17,2,3),(27,17,3,2),(28,16,2,2),(29,16,6,8),(30,18,1,3),(31,18,2,2),(34,20,1,3),(35,20,2,4),(36,21,1,4),(37,21,2,3),(38,21,11,3),(39,22,1,4),(40,22,2,3),(41,22,4,2),(42,22,8,2),(43,23,1,1),(44,23,2,4),(45,23,3,3),(46,24,1,4),(47,24,2,2),(48,24,3,1),(49,25,1,4),(50,25,2,3),(51,26,1,4),(52,27,1,4),(53,27,2,3),(54,28,2,4),(55,29,1,4),(56,30,1,4),(57,30,2,4),(58,31,1,2),(59,31,2,1),(64,34,2,4),(65,35,1,4),(66,35,2,4),(67,35,12,4),(68,36,1,4),(69,36,2,3),(70,37,1,4),(71,37,2,3),(72,38,1,4),(73,38,2,3),(74,38,3,2),(75,39,1,4),(76,39,7,3),(77,40,1,3),(78,40,2,2),(79,40,3,1),(80,41,1,2),(81,41,2,2),(82,41,4,1),(83,42,1,4),(84,42,2,3),(85,42,6,3),(86,42,11,4),(87,43,1,1),(88,43,2,4),(89,43,6,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_mobility`
--

LOCK TABLES `staff_mobility` WRITE;
/*!40000 ALTER TABLE `staff_mobility` DISABLE KEYS */;
INSERT INTO `staff_mobility` VALUES (14,14,41),(17,16,41),(18,16,46),(19,17,41),(20,17,43),(21,18,47),(24,20,42),(25,20,46),(26,21,41),(27,22,43),(28,23,45),(29,23,46),(30,24,42),(31,25,41),(32,25,42),(33,25,43),(34,25,44),(35,25,45),(36,25,46),(37,25,47),(38,26,41),(39,26,43),(40,26,45),(41,27,45),(42,28,48),(43,28,49),(44,29,43),(45,29,44),(46,30,47),(47,31,43),(48,31,47),(49,23,48),(52,34,45),(53,34,46),(54,35,41),(55,35,43),(56,35,45),(57,35,47),(58,36,44),(59,37,41),(60,37,42),(61,37,43),(62,37,44),(63,37,45),(64,37,46),(65,37,47),(66,38,42),(67,39,42),(68,40,42),(69,41,49),(70,42,41),(71,42,42),(72,42,45),(73,42,46),(74,43,48),(75,43,49);
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_remunerations`
--

LOCK TABLES `staff_remunerations` WRITE;
/*!40000 ALTER TABLE `staff_remunerations` DISABLE KEYS */;
INSERT INTO `staff_remunerations` VALUES (12,14,16,'123456789'),(14,16,17,''),(15,17,18,''),(16,18,15,''),(18,20,15,''),(19,21,18,''),(20,22,16,''),(21,23,20,''),(22,24,15,''),(23,25,17,''),(24,26,19,''),(25,27,20,''),(26,28,15,''),(27,29,13,''),(28,30,19,''),(29,31,17,''),(32,34,18,''),(33,35,19,'934567345'),(34,36,13,'934013763'),(35,37,20,''),(36,38,20,''),(37,39,12,''),(38,40,15,''),(39,41,15,''),(40,42,18,'999999999'),(41,43,12,'999999989');
/*!40000 ALTER TABLE `staff_remunerations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_event`
--

DROP TABLE IF EXISTS `status_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_event`
--

LOCK TABLES `status_event` WRITE;
/*!40000 ALTER TABLE `status_event` DISABLE KEYS */;
INSERT INTO `status_event` VALUES (1,'2019-03-15 14:37:47','2019-03-15 14:37:49'),(2,'2019-03-15 14:37:47','2019-03-15 14:37:49'),(3,'2019-03-15 14:37:47','2019-03-15 14:37:49'),(4,'2019-03-15 14:37:47','2019-03-15 14:37:49');
/*!40000 ALTER TABLE `status_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_event_translation`
--

DROP TABLE IF EXISTS `status_event_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_event_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status_id` (`status_id`),
  CONSTRAINT `status_event_translation_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `status_event` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_event_translation`
--

LOCK TABLES `status_event_translation` WRITE;
/*!40000 ALTER TABLE `status_event_translation` DISABLE KEYS */;
INSERT INTO `status_event_translation` VALUES (1,1,'--',1),(2,1,'--',2),(3,2,'En attente',1),(4,2,'Waiting',2),(5,3,'Indisponible',1),(6,3,'Unavailable',2),(7,4,'Confirmé',1),(8,4,'Confirmed',2);
/*!40000 ALTER TABLE `status_event_translation` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (86,2,'Andry','ANDRIANAIVO','aa@alternateeve.com','0344630738','fr','2019-04-05 00:00:00','$2y$10$CacO2VRxkxbK4TF059sZ1.ClWO9CbsvaJxXnh9kR30Lhz9j3s6xPm','QvU4GJJRuDz7mfSenEU0d3T1juGcUtaBm6AWPrs1ZZsdrBE7da80IcwORGsY','2019-03-07 06:26:58','2019-04-12 07:11:27'),(88,2,'Lasalle','Cédric','cedriclasalle@yahoo.com','5146496664','fr','2019-04-05 00:00:00','$2y$10$jUfoHLD1zfMF6VOdXk5wAuzLi2dh0AKt.6vjeWZe4iN8GjG4TnjPy','LEDRx8Fjd8U8DNgOeupMgM4ZeOSwsZEZKVcbTe0zQfrdlqXFx4idQymKrvFb','2019-03-08 00:46:31','2019-04-11 15:25:19'),(89,1,'Njato','Fens','nr@alternateeve.com','11111111','fr','2019-04-05 00:00:00','$2y$10$Lex8qoJ2svp/AehLjF2GA.xJHXVSiO/FdmytOALz0fvfljci4MKF6','VJkXRgaJPY9DUdw5Gynz2YUrY70QHhO9PVbqztNe3Lj2xA0Hc1PfV242qST0','2019-03-08 14:37:08','2019-03-15 15:53:23'),(90,1,'Altee','Tech','randriamorasataangello@gmail.com','123','fr','2019-04-05 00:00:00','$2y$10$E88sPiCkTLcHhrbEA.szUOKaQY0GH58mShhwGJb1NotdmGNDffLTK',NULL,'2019-03-12 13:51:09','2019-03-12 13:51:09'),(91,1,'Aurélie','Saiz','aurelie.saiz@gmail.com','5146071777','fr','2019-04-05 00:00:00','$2y$10$eKvJxYH74rG7JyTdCBuM2elskFU0WumIGtxVNxzq6QnSMvRI.cbkG','Y0PYYzphhb3eJZ3AjFL4FIq83cbOFSQeFDD2hgQXNsIvP5VmmGYuORujQl54','2019-03-13 19:21:15','2019-03-13 19:24:34'),(94,2,'tets','feno','ft@alternateeve.com','52534534634','fr','2019-04-05 00:00:00','$2y$10$m3AS0UKDgRnsM3lK8baaH.yaxDfTGlyUVKIgon4RjiBg.b3t8ijEe','90ueN3AXmt9uMVCyuY8wuEGcqM7hHFaQZliQYfyt4bHOc8SWhteIHJGLFjIc','2019-03-18 13:37:09','2019-03-18 13:37:09'),(95,2,'shksfksfh','stjshkshk','re@alternateeve.com','2753753','fr','2019-04-05 00:00:00','$2y$10$a0eIx10Qr.5v7SkbEj3qUuWNSLhYqB6bbnKSC0jz3ALVuDDj5UVDe',NULL,'2019-03-18 13:37:09','2019-03-18 13:37:09'),(96,2,'Aurelie','SAiz','as@alternateeve.com','5146071776','fr','2019-04-05 00:00:00','$2y$10$ddmX7fsB4QS7x2bhbL/1U.n.heHU7zSL3q308whjTWADDmxuJOfsO','GI6tfzPfZImUsC2ybA5LI0qcdCNwJHqSxyzPtewJeREkdetYyRTOWHQM2RIV','2019-03-18 14:30:29','2019-03-18 18:51:47'),(97,2,'David','Boitard','db@alternateeve.com','514607 1776','fr','2019-04-05 00:00:00','$2y$10$Yh2CyxetxefALZ6To6q63.fi8eoMM3olyFrXnyGb9XXe/ewmsxTWS','0b1PvIrNCPjeRFIwHrYgEZMB2etAZIvTD2dvrJVhqYpLi6znKe6tRAatPPri','2019-03-18 14:33:18','2019-03-18 14:33:18'),(100,1,'Mitia','Hery','andryhsm@gmail.com','344565879','fr','2019-04-05 00:00:00','$2y$10$y2cSM6ewdV2LMqXHNvdvh.aJ6QTJJLixQmoPvqFZRAcn3Z3pvQYAq','WQNV3X1ldllT7XqAhbm6xu7WaO2bMmVaD0w348bIaqILBvo0Xjm952F75YLw','2019-03-19 18:40:22','2019-03-19 18:40:58'),(102,2,'Thierry','Henry','thierryhenry@gmail.com','5146493030','fr','2019-04-05 00:00:00','$2y$10$0fXE7RWc.BwHW9AQn2ub4uYzpjeQYH8I/SvLyi8R.JymPm0zxsxNu',NULL,'2019-04-02 19:55:09','2019-04-02 19:55:09'),(103,2,'Alison','Magnant','am@alternateeve.com','4385213074','fr','2019-04-05 00:00:00','$2y$10$ASV.Zy0c2bURPo3CNQ90M.p7n0w7VC.E4UkRiEMBRqJ5HvBVx/N3e',NULL,'2019-04-03 15:59:18','2019-04-03 15:59:18'),(104,2,'alison','magnant','alisonmgnt@gmail.com','4385213076','fr','2019-04-05 00:00:00','$2y$10$/uTXu.G6hJN4IJRQ1FSk6uxNocCtsEGebtttI77mlMNccvGLbt4Ou',NULL,'2019-04-03 16:16:28','2019-04-03 16:16:28'),(105,2,'Aurelie','Saiz','rd@alternateeve.com','0684376652','fr','2019-04-05 00:00:00','$2y$10$YJ8Qp64mTILBEsdWEk3S.uefSohl.0QRwmtwUrgP4LSGQSQ10AEYK',NULL,'2019-04-03 16:20:52','2019-04-03 16:20:52'),(106,1,'Mitia','Iriina','andryhsm@yahoo.fr','123456789458','fr','2019-04-05 00:00:00','$2y$10$1Ch1l/hab94IOE5m9fp4XeqqsR9KU.sf9JCONSBCWmfdaWBPfW4eS',NULL,'2019-04-03 19:04:03','2019-04-03 19:04:03'),(108,2,'Lama','Serge','sergelama@yahoo.com','5145505678','en','2019-04-05 00:00:00','$2y$10$.RqyeaNVMdTd6/8JgjIKD.r0F1.Qhy.XAXa9pga4thrEgBFFQ.QgS',NULL,'2019-04-03 21:02:13','2019-04-09 14:01:36'),(109,1,'Ali','Marocain','ali.marocain@gmail.com','5140000001','fr','2019-04-05 00:00:00','$2y$10$Lex8qoJ2svp/AehLjF2GA.xJHXVSiO/FdmytOALz0fvfljci4MKF6','Rz4RHtvMgBixQy3aXrlkTFyr2TyxwSQjMC5bB1TnxlfDql6jIFPY4FTXul1y','2019-04-03 22:02:43','2019-04-03 22:02:43'),(110,1,'Marianne','Gosselin','Marianne.gosselin.hs@gmail.com','5140000002','fr','2019-04-05 00:00:00','$2y$10$ZWuLPW5z8DuqOmMmOh331eZMDkPjI7NnLu46HgKoxfCPCV9d5ejPy','UkP67THX7Kp8ULgFUemiX7LqLV2m9m4iVDN89itPbE3DVWWZsUotyRm2qGdh','2019-04-04 15:20:05','2019-04-04 15:20:05'),(111,1,'Heidi','Filici','heidi.filici.hs@gmail.com','6470000001','fr','2019-04-05 00:00:00','$2y$10$/uwCspvQBPkpJEbAf2pI8OXWkAv8wAE2PCkwmvg7LzgG3g5NC.sJy','1h9BojcHXJmXjEpDKFjYD6cvti00FS90v2BObuSPgvYCxRyRqQQFPzoikcN1','2019-04-04 16:15:42','2019-04-04 16:15:42'),(112,1,'Jeannette','Mamie','Jeanette.mamie.hs@gmail.com','5145550000','fr','2019-04-05 00:00:00','$2y$10$p2nIotnyyUYQWCc.J7/E3uxedPx3IbNzoOtfoIDr0Dl6uCKO4dJYW','a9tdYJYYnmJ6tq2Nm5ZbbWS1zK4ZlihFJ3AsY4LXf0Llab5D3GTEUXjDyuBN','2019-04-04 16:28:31','2019-04-04 16:28:31'),(113,1,'Florent','Deschenes','florent.deschenes.hs@gmail.com','5140000004','fr','2019-04-05 00:00:00','$2y$10$bgQ6C/aTsRHMbpIPnciOEODsD97yFLjCqkI/CmqTzpLj0NP3CMuMe','4Pbjv5lERvaPSLvXAZ1lzm2Up4n4wGUgETIVb5mgoOGEtXc7YjzQtHp3C1a5','2019-04-04 16:31:10','2019-04-04 16:31:10'),(114,1,'Morgan','Buchoux','morgan.buchoux.hs@gmail.com','5140000005','en','2019-04-05 00:00:00','$2y$10$bwETHQyzWT9hslmB0O2NHeuqxI61LDYuqAA9EVCinKY32zedWEG4K','FfjglKQGnmURVYH09Uurj0S9VTSVCvit9n5IjsYMyqd5LnYsfSvs6vkKqrjT','2019-04-04 16:43:31','2019-04-04 16:43:31'),(115,1,'Alex','Tiramisu','Alex.tiramisu.hs@gmail.com','6471234567','en','2019-04-05 00:00:00','$2y$10$4YYe6jYnTOgr9a.AQSYi5.PZ8yvHW.Y8Wk8xZhXJY52ILxpyRMisW','Ts1im0Sx0xbcbej5TCIXQpIYiUnoXfJ2wyVhIxBDYSAGqQMS0EYDaFapL4VU','2019-04-04 16:49:57','2019-04-04 16:49:57'),(116,1,'Heytoi','Vapala','heytoi.vapala.hs@gmail.com','2500000001','en','2019-04-05 00:00:00','$2y$10$nJ8MMKB4sj1OZFM2koxJnurhi5Y3VGhAFoPrWpOGl/jMC2DZtCCdq','qqb505EOrmUf9P2tGhVZz426O3aN7Xk4gGD5Q1NK4itdsqYs8TchlD7EwU8u','2019-04-04 17:08:13','2019-04-04 17:08:13'),(117,1,'Jaimepalé','Quenelles','jaimepale.quenelles.hs@gmail.com','4180000001','en','2019-04-05 00:00:00','$2y$10$RK8tt9BKwJL1b4Z8qXu4detlsTZNIGfELRc.HOu3Fs57zPcjUQ6YG','W6YsEzHJyTSJpNfNcY4ka2jgyiKyA3tTzrYcKyw5ucuYDc7GJMVQEPWLFBD6','2019-04-04 17:27:13','2019-04-04 17:27:13'),(118,1,'Etienne','Ouistiti','Etienne.ouistiti@yahoo.com','4181234567','fr','2019-04-05 00:00:00','$2y$10$lC5pwSa/FXzvI3FINTsnx.QtVLmBIcv/uhIJ.XK1GcTGpWZtpE6oe','dGa0zqb5EBUsOaFtLqviFPXE7pmZxUdEVGjHTbxIhxfYDAFTRy2HOekDS00v','2019-04-04 18:22:05','2019-04-05 14:07:08'),(119,1,'Nomena','Hery','nomens@gmail.com','1235452789453','en','2019-04-05 00:00:00','$2y$10$gpkvBKL994KxGnUBu3daCeDS0z.JmmbItWzsm4EdZPeruCzg9DiB6','UxWs9PdPkdxTfbleI0B5APJ1cUyWxkQGMerYwDUd0103HfD1eqCmKCxvxqPw','2019-04-04 18:48:23','2019-04-04 18:48:23'),(120,2,'Dion','Céline','celinedion@yahoo.com','5144561092','en','2019-04-05 00:00:00','$2y$10$4gGlhMJtkW63VqYlD.APAOV0OId6p5vv4/EgRJLffEqxD/JGQc7lO',NULL,'2019-04-05 14:39:49','2019-04-09 14:01:36'),(124,2,'Eric','ARISANJY','er@alternateeve.com','+261','en','2019-04-05 00:00:00','$2y$10$oQY.KSiRe6tP5CStSchrsuUfz0g1aapC/m.yZFCJy9DxFpbgpFqRi',NULL,'2019-04-10 15:13:38','2019-04-10 15:13:38'),(125,1,'Madisson','Toulala','madisson.toulala1993@gmail.com','4381239083','fr','2019-04-05 00:00:00','$2y$10$FZJQU8taa5cuyBqPPHkMeeH25APoGJcrIbDnPTz4NtL815F0VF6BO','NUDMYDcwuTp8RlVo2YO37bZcs45Kcm13Kla5hViYp3AHEiBNnOdUMPmMXuni','2019-04-10 15:54:23','2019-04-10 15:54:23'),(126,1,'Jean-Léandre','Ouagadougou','Jeanleandreouagadougou123@gmail.com','4380912549','fr','2019-04-05 00:00:00','$2y$10$KAUkxKVMUE/QQfVqPcTIKeA6L8BaoaqIHfAEMXeA7fXVc2.C7Gpla','FlTKqxkPpGd4OhVc77ADkIpEhXK9E0gUzqLD69a5ujsHXSJoWEfxJAA3WO6v','2019-04-10 16:03:20','2019-04-10 16:03:20'),(127,1,'Pascal','Aqouic','pascalaqouic12345@gmail.com','4380101011','fr','2019-04-05 00:00:00','$2y$10$L3ywQS./jGdQeN5UrMGn0OBxme1QJkaB98ZRj9hiXin/spnB0nzqK','af675DRBqjyhrawOt32Zg1dw0Iy4MbwvixQRAnCLFP7f1GbQKXxA70HF3uob','2019-04-10 16:27:17','2019-04-10 16:27:17'),(128,1,'Francis','Pellerin','Francispellerinhs12345678@gmail.com','4381298701','fr','2019-04-05 00:00:00','$2y$10$ukicL6ub2k03I6wzlhkyhuqdo68SQ5btKaz72b0dpFYRZNkuBYXuW','O8eGqDyZE0rcEdE5E21rnBTcJb3u38rutZddvmNB7IxyxMb0uJW4r0tOdP9U','2019-04-10 16:39:03','2019-04-10 16:39:03'),(129,1,'Benjamin','Amama','benjaminamama.hs@gmail.com','418123401','fr','2019-04-05 00:00:00','$2y$10$NLajKS65FW4pgdVQQLhSleTDMa40kMWBMHNL4QhfnXTFJj/wAcSd.','V9zLIpToSnG8LQtpqPMid7n25cbEJST2cCOrK6kBNWoJ7SgbYI5YVfB2NgqD','2019-04-10 21:07:42','2019-04-10 21:07:42'),(130,1,'Jean','Michmich','jean.michmich.hs@gmail.com','5140000010','fr','2019-04-05 00:00:00','$2y$10$XGQ8.TCkqtVJ5U52aOxvWe8/ZUMLh3PBKae0UUeZeVuFA6vpaoEGS','vb786wUpwQMIrjpPFZCzNKiMjHpOXSm5YyPTJbIQR3B3N83K40gGvGi3YWlW','2019-04-10 22:16:11','2019-04-10 22:16:11'),(131,2,'Lagaffe','Gaston','gastonlagaffe@gmail.com','5146540909','fr','2019-04-05 00:00:00','$2y$10$kuTIRJyjPD0DB744Ci2M2uMhYokI5xbKtyH.KbgWU00/0kpGGwrhq',NULL,'2019-04-11 15:25:20','2019-04-11 15:25:20'),(132,1,'Rado Nirina','Ramisaely','ramisaely@gmail.com','0340161634','fr','2019-04-05 00:00:00','$2y$10$le39yVMeDbzwa7ktJQNXde3f9PxrPhXaKB5i2tVQ27BSMD8gy6ZHW','zyHbk1KtWpNUpzZa1zHH4dC6OdgkuJMJ4V5VlUU7Jy7dpdKGoLKrphobykXD','2019-04-15 14:14:42','2019-04-15 14:14:42'),(133,1,'Caius Paul Landon','BETKOU','caiusbetkou@gmail.com','0324909407','fr','2019-04-05 00:00:00','$2y$10$pHVADlkg/msLnrNatsHwB.tksN.DDZAktGvqMIUi2o8tAobAFrzgO','iaPokCkvgk3gbQ4lrcLyuE2FDf3zEtp0VuNfyihm09fmLaxC56tGUXAElWUD','2019-04-15 14:46:02','2019-04-15 14:46:02'),(134,1,'Yacine','Marma','wylancyprien25@yahoo.com','5143451090','fr','2019-04-05 00:00:00','$2y$10$Dj1eVThrgJt8RZQXBTWcY.4chladBK9x4uJIXEj5QzPKt5EJl5SZW','KkafEP9vWfAaZyoktFPdgcc14cFzZoAgLUSOU6aDQtyEtirkx7UXhvhmSJuW','2019-04-16 19:27:40','2019-04-16 19:27:40'),(135,1,'Jules','Vercingetorix','mariobalotelli06@yahoo.com','4389012345','en','2019-04-05 00:00:00','$2y$10$bkhzxd1JwelPr53js7n9DebzuQk5qI08EXSaI0uDLTwCgk8xulMI6','6pKLh86K2BVLCFqV7tsb2Yw5OyzCnIiyaaaqSkCzZr345N3hgX4hInabAQWT','2019-04-16 19:50:12','2019-04-16 19:50:12');
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

-- Dump completed on 2019-04-18  6:39:51
