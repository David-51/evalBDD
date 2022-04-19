-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (arm64)
--
-- Host: localhost    Database: cinemas_manager
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` varchar(36) NOT NULL DEFAULT (uuid()),
  `employee_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES ('e172f72c-c038-11ec-bc78-aa030e3c0461','e172aa9c-c038-11ec-bc78-aa030e3c0461');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemas`
--

DROP TABLE IF EXISTS `cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemas` (
  `id` varchar(36) NOT NULL DEFAULT (uuid()),
  `name` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemas`
--

LOCK TABLES `cinemas` WRITE;
/*!40000 ALTER TABLE `cinemas` DISABLE KEYS */;
INSERT INTO `cinemas` VALUES ('e1725164-c038-11ec-bc78-aa030e3c0461','the magnific'),('e172529a-c038-11ec-bc78-aa030e3c0461','the Holywood'),('e17252f4-c038-11ec-bc78-aa030e3c0461','the Bolywood'),('e172531c-c038-11ec-bc78-aa030e3c0461','the Merval Studio'),('e1725344-c038-11ec-bc78-aa030e3c0461','the Desnay Studio');
/*!40000 ALTER TABLE `cinemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` varchar(36) NOT NULL DEFAULT (uuid()),
  `firstname` varchar(60) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cinema_id` varchar(60) DEFAULT NULL,
  `permission` varchar(20) NOT NULL DEFAULT 'level1',
  `password` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `cinema_id` (`cinema_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('e172a736-c038-11ec-bc78-aa030e3c0461','John','DO','john@example.com','e1725164-c038-11ec-bc78-aa030e3c0461','employee','$2y$10$a8oRYdNo7e.eFTdaFGADUuXRMAAr3YS/DLiRIQN4ZKemJ7d74SC3.'),('e172a8b2-c038-11ec-bc78-aa030e3c0461','Jack','RABBIT','jack@example.com','e172529a-c038-11ec-bc78-aa030e3c0461','employee','$2y$10$hfxcRijVCYo8maEbUGhZf.qfWo7emWek2rcdLKh0oT5ZZXezmYmlq'),('e172a98e-c038-11ec-bc78-aa030e3c0461','John','SNOW','snow@example.com','e17252f4-c038-11ec-bc78-aa030e3c0461','employee','$2y$10$L2HyNRsgBATiO0vZNpO0z.9KGFiqWpfxayuHO4TOueKrhjOshMetu'),('e172aa1a-c038-11ec-bc78-aa030e3c0461','Jesse','PINCKMAN','jesse@example.com','e172531c-c038-11ec-bc78-aa030e3c0461','employee','$2y$10$HjiqrluhJ2egqCuCY9pvruWINGpPdnwS2QyDf86pqUvDmC3L43etq'),('e172aa9c-c038-11ec-bc78-aa030e3c0461','Dexter','MORGAN','dexter@example.com','e1725344-c038-11ec-bc78-aa030e3c0461','employee','$2y$10$LQFfuOChQ9Zk8J.lLJSL5urGSJEV.cWmyDvSGCIWxLjLih7Rqsn7e');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` varchar(36) NOT NULL DEFAULT (uuid()),
  `title` varchar(255) NOT NULL,
  `synopsis` text NOT NULL,
  `duration` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES ('e173910a-c038-11ec-bc78-aa030e3c0461','Gemini Man','Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?',115),('e17391d2-c038-11ec-bc78-aa030e3c0461','Seul contre tous','Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?',122),('e173922c-c038-11ec-bc78-aa030e3c0461','Bad Boys','Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?',113),('e1739254-c038-11ec-bc78-aa030e3c0461','Focus','Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?',104),('e173927c-c038-11ec-bc78-aa030e3c0461','After earth','Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?',100),('e173929a-c038-11ec-bc78-aa030e3c0461','Sept vies','Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?',123),('e17392c2-c038-11ec-bc78-aa030e3c0461','Fury','Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?',124),('e17392e0-c038-11ec-bc78-aa030e3c0461','Troie','Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?',196),('e17392fe-c038-11ec-bc78-aa030e3c0461','Fight Club','Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?',132),('e173931c-c038-11ec-bc78-aa030e3c0461','Ocean\'s Eleven','Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?',130),('e173933a-c038-11ec-bc78-aa030e3c0461','Ocean\'s Twelve','Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?',126),('e1739362-c038-11ec-bc78-aa030e3c0461','Ocean\'s Thirteen','Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?',113),('e1739380-c038-11ec-bc78-aa030e3c0461','Ocean\'s Twelve','Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?',126),('e173939e-c038-11ec-bc78-aa030e3c0461','Une nuit en enfer','Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?',108),('e17393c6-c038-11ec-bc78-aa030e3c0461','ac metus vitae velit egestas','mattis semper, dui lectus rutrum urna, nec luctus',136),('e17393e4-c038-11ec-bc78-aa030e3c0461','mi tempor lorem, eget mollis','Phasellus nulla. Integer vulputate, risus a',114),('e1739402-c038-11ec-bc78-aa030e3c0461','hendrerit consectetuer, cursus et, magna.','id risus quis diam luctus',193),('e173942a-c038-11ec-bc78-aa030e3c0461','erat volutpat. Nulla dignissim. Maecenas','arcu. Sed et',116),('e1739448-c038-11ec-bc78-aa030e3c0461','sem, consequat nec, mollis vitae,','eu sem. Pellentesque ut',120),('e1739466-c038-11ec-bc78-aa030e3c0461','felis. Donec tempor, est ac','feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus',131),('e173948e-c038-11ec-bc78-aa030e3c0461','eu neque pellentesque massa lobortis','Suspendisse aliquet molestie tellus. Aenean',106),('e17394ac-c038-11ec-bc78-aa030e3c0461','risus. Quisque libero lacus, varius','orci. Phasellus dapibus',162),('e17394ca-c038-11ec-bc78-aa030e3c0461','quam, elementum at, egestas a,','dolor sit amet, consectetuer',139),('e17394f2-c038-11ec-bc78-aa030e3c0461','turpis. Aliquam adipiscing lobortis risus.','libero nec ligula consectetuer rhoncus. Nullam velit dui, semper',117),('e1739510-c038-11ec-bc78-aa030e3c0461','libero nec ligula consectetuer rhoncus.','sem',124),('e173952e-c038-11ec-bc78-aa030e3c0461','Etiam imperdiet dictum magna. Ut','magnis dis parturient montes,',170),('e1739556-c038-11ec-bc78-aa030e3c0461','Phasellus dolor elit, pellentesque a,','tortor nibh sit amet orci. Ut sagittis lobortis',133),('e1739574-c038-11ec-bc78-aa030e3c0461','sit amet ornare lectus justo','torquent per conubia',131),('e173959c-c038-11ec-bc78-aa030e3c0461','risus a ultricies adipiscing, enim','sapien, gravida non, sollicitudin a, malesuada id,',104),('e17395ba-c038-11ec-bc78-aa030e3c0461','dolor dapibus gravida. Aliquam tincidunt,','Fusce aliquam, enim nec tempus scelerisque,',146),('e17395d8-c038-11ec-bc78-aa030e3c0461','Curabitur dictum. Phasellus in felis.','id, libero. Donec consectetuer mauris id sapien. Cras',155),('e1739600-c038-11ec-bc78-aa030e3c0461','Duis risus odio, auctor vitae,','a nunc. In at pede.',130),('e173961e-c038-11ec-bc78-aa030e3c0461','nascetur ridiculus mus. Proin vel','at, velit. Pellentesque ultricies dignissim',163),('e173963c-c038-11ec-bc78-aa030e3c0461','est. Nunc ullamcorper, velit in','leo, in',146),('e1739664-c038-11ec-bc78-aa030e3c0461','dolor dapibus gravida. Aliquam tincidunt,','Fusce aliquam, enim nec tempus scelerisque,',146),('e1739682-c038-11ec-bc78-aa030e3c0461','Curabitur dictum. Phasellus in felis.','id, libero. Donec consectetuer mauris id sapien. Cras',155),('e17396a0-c038-11ec-bc78-aa030e3c0461','Duis risus odio, auctor vitae,','a nunc. In at pede.',130),('e17396be-c038-11ec-bc78-aa030e3c0461','nascetur ridiculus mus. Proin vel','at, velit. Pellentesque ultricies dignissim',163),('e17396dc-c038-11ec-bc78-aa030e3c0461','est. Nunc ullamcorper, velit in','leo, in',146),('e17396fa-c038-11ec-bc78-aa030e3c0461','ullamcorper, velit in aliquet lobortis,','commodo tincidunt nibh. Phasellus nulla.',123),('e1739718-c038-11ec-bc78-aa030e3c0461','Donec non justo. Proin non','Donec egestas. Duis ac arcu. Nunc mauris. Morbi non',117),('e1739740-c038-11ec-bc78-aa030e3c0461','faucibus orci luctus et ultrices','dignissim. Maecenas ornare egestas ligula.',135),('e173975e-c038-11ec-bc78-aa030e3c0461','Phasellus elit pede, malesuada vel,','nonummy ultricies ornare, elit elit fermentum risus, at',97),('e173977c-c038-11ec-bc78-aa030e3c0461','Suspendisse aliquet, sem ut cursus','erat. Sed nunc est, mollis non, cursus non, egestas a,',123),('e173979a-c038-11ec-bc78-aa030e3c0461','arcu. Vestibulum ante ipsum primis','elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis',143);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `id` varchar(36) NOT NULL DEFAULT (uuid()),
  `name` varchar(60) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES ('e173e362-c038-11ec-bc78-aa030e3c0461','main',920),('e173e402-c038-11ec-bc78-aa030e3c0461','student',760),('e173e434-c038-11ec-bc78-aa030e3c0461','childs',590);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` varchar(36) NOT NULL DEFAULT (uuid()),
  `cinema_id` varchar(36) NOT NULL,
  `places` int NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `cinema_id` (`cinema_id`),
  CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES ('e173406a-c038-11ec-bc78-aa030e3c0461','e1725164-c038-11ec-bc78-aa030e3c0461',350,'Chicago'),('e17341c8-c038-11ec-bc78-aa030e3c0461','e1725164-c038-11ec-bc78-aa030e3c0461',500,'New York'),('e1734290-c038-11ec-bc78-aa030e3c0461','e1725164-c038-11ec-bc78-aa030e3c0461',250,'Whashington'),('e173431c-c038-11ec-bc78-aa030e3c0461','e172529a-c038-11ec-bc78-aa030e3c0461',600,'Philadelphie'),('e1734394-c038-11ec-bc78-aa030e3c0461','e172529a-c038-11ec-bc78-aa030e3c0461',350,'Forth Worth'),('e1734416-c038-11ec-bc78-aa030e3c0461','e172529a-c038-11ec-bc78-aa030e3c0461',450,'Dallas'),('e173448e-c038-11ec-bc78-aa030e3c0461','e17252f4-c038-11ec-bc78-aa030e3c0461',650,'Bombay'),('e17344fc-c038-11ec-bc78-aa030e3c0461','e17252f4-c038-11ec-bc78-aa030e3c0461',250,'Nagpur'),('e173456a-c038-11ec-bc78-aa030e3c0461','e17252f4-c038-11ec-bc78-aa030e3c0461',300,'New Delhi'),('e17345e2-c038-11ec-bc78-aa030e3c0461','e172531c-c038-11ec-bc78-aa030e3c0461',450,'Wakanda'),('e1734646-c038-11ec-bc78-aa030e3c0461','e172531c-c038-11ec-bc78-aa030e3c0461',845,'Thanos'),('e17346c8-c038-11ec-bc78-aa030e3c0461','e172531c-c038-11ec-bc78-aa030e3c0461',240,'Xandar'),('e1734736-c038-11ec-bc78-aa030e3c0461','e1725344-c038-11ec-bc78-aa030e3c0461',240,'Agra'),('e17347cc-c038-11ec-bc78-aa030e3c0461','e1725344-c038-11ec-bc78-aa030e3c0461',240,'Corona'),('e173483a-c038-11ec-bc78-aa030e3c0461','e1725344-c038-11ec-bc78-aa030e3c0461',240,'Arendelle');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(36) NOT NULL DEFAULT (uuid()),
  `movie_id` varchar(36) DEFAULT NULL,
  `room_id` varchar(36) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sessions_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('e17476d8-c038-11ec-bc78-aa030e3c0461','e173910a-c038-11ec-bc78-aa030e3c0461','e173406a-c038-11ec-bc78-aa030e3c0461','2022-04-25 14:00:00');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` varchar(36) NOT NULL DEFAULT (uuid()),
  `session_id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `price_id` varchar(36) NOT NULL,
  `number` int NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `user_id` (`user_id`),
  KEY `price_id` (`price_id`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`price_id`) REFERENCES `prices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES ('e174c886-c038-11ec-bc78-aa030e3c0461','e17476d8-c038-11ec-bc78-aa030e3c0461','e17428b8-c038-11ec-bc78-aa030e3c0461','e173e402-c038-11ec-bc78-aa030e3c0461',5,'2022-04-20 01:31:47',1);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_places` BEFORE INSERT ON `tickets` FOR EACH ROW BEGIN
        IF PlaceLeft(NEW.session_id, NEW.number) != 1 THEN SIGNAL sqlstate '45000' set message_text = "No enough places";
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(36) NOT NULL DEFAULT (uuid()),
  `firstname` varchar(60) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('e17427c8-c038-11ec-bc78-aa030e3c0461','john','Doe','john.doe@example.com','$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a'),('e174287c-c038-11ec-bc78-aa030e3c0461','jack','Sparrow','jack@example.com','$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a'),('e17428b8-c038-11ec-bc78-aa030e3c0461','Bruce','Wayne','bruce@example.com','$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a'),('e17428e0-c038-11ec-bc78-aa030e3c0461','Frodon','baggins','frodon@example.com','$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a'),('e1742908-c038-11ec-bc78-aa030e3c0461','Sauron','the magic daemon','sauron@example.com','$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a'),('e1742930-c038-11ec-bc78-aa030e3c0461','gandalf','the magician','gandalf@example.com','$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a'),('e1742958-c038-11ec-bc78-aa030e3c0461','ragnar','lothbrokes','ragnar@example.com','$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a'),('e1742976-c038-11ec-bc78-aa030e3c0461','kirk','hammett','kirk@example.com','$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a'),('e174299e-c038-11ec-bc78-aa030e3c0461','Alexi','Laiho','alexi@example.com','$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a'),('e17429c6-c038-11ec-bc78-aa030e3c0461','david','moi','david@example.com','$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a'),('e17429e4-c038-11ec-bc78-aa030e3c0461','Jeff','Loomis','jeff@example.com','$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a'),('e1742a02-c038-11ec-bc78-aa030e3c0461','Warrel','Dane','warrel@example.com','$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a'),('e1742a2a-c038-11ec-bc78-aa030e3c0461','Danny','Ocean','Danny@example.com','$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a'),('e1742a52-c038-11ec-bc78-aa030e3c0461','Rusty','Ryan','Rusty@example.com','$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a'),('e1742a70-c038-11ec-bc78-aa030e3c0461','Jordan','Belfort','Jordan@example.com','$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_place_left`
--

DROP TABLE IF EXISTS `view_place_left`;
/*!50001 DROP VIEW IF EXISTS `view_place_left`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_place_left` AS SELECT 
 1 AS `id`,
 1 AS `place_left`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_place_left`
--

/*!50001 DROP VIEW IF EXISTS `view_place_left`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_place_left` AS select `sessions`.`id` AS `id`,(select ((select `rooms`.`places` from (`rooms` join `sessions`) where (`rooms`.`id` = `sessions`.`room_id`)) - (select ifnull((select sum(`tickets`.`number`) from (`tickets` join `sessions`) where (`tickets`.`session_id` = `sessions`.`id`)),0))) AS `place_left`) AS `place_left` from `sessions` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-20  1:49:26
