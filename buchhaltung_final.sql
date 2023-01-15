-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: buchhaltung
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.1

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `sell_value` float NOT NULL,
  `buy_value` float NOT NULL,
  `current_product` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (5,'Space Keks',0.6,0.3856,1),(6,'Schokolade',1,0.9,1),(7,'Bio Schokolade',1.5,1.2,1),(8,'Schokomilch',0.6,0.5,1),(9,'Vanillemilch',0.6,0.5,1),(10,'Himbeermilch',0.6,0.5,1),(11,'Pfirsichmilch',0.6,0.5,1),(12,'Käsebrötchen',1.3,1.02,1),(13,'Laugenstangen',1.3,1.02,1),(14,'Laugen-Kissen',1.6,1.275,1),(15,'Milchbrötchen',1,0.7225,1),(16,'Schokocrossiants',1.6,1.275,1),(17,'Franzbrötchen',1.6,1.275,1),(18,'Muffins',1.9,1.5725,1),(19,'Cookies',1.6,1.36,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `productId` int NOT NULL,
  `bestBefore` int NOT NULL,
  `bestAfter` int NOT NULL,
  `lost` int NOT NULL,
  `countSold` int NOT NULL,
  `EK` float NOT NULL,
  `VK` float NOT NULL,
  `profit` float NOT NULL,
  `weekStatId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES ('2021-11-05','2021-11-11',5,1296,1161,0,135,0.3856,0.6,28.94,12),('2021-11-05','2021-11-11',6,567,331,0,236,0.9,1,23.6,12),('2021-11-05','2021-11-11',7,115,105,0,10,1.2,1.5,3,12),('2021-11-05','2021-11-11',8,17,10,0,67,0.5,0.6,6.7,12),('2021-11-05','2021-11-11',9,19,0,0,54,0.5,0.6,5.4,12),('2021-11-05','2021-11-11',10,1,0,0,11,0.5,0.6,1.1,12),('2021-11-05','2021-11-11',11,2,0,0,12,0.5,0.6,1.2,12),('2021-11-01','2021-11-04',9,19,19,0,0,0,0,0,9),('2021-11-01','2021-11-04',8,17,17,0,0,0,0,0,9),('2021-11-01','2021-11-04',11,2,2,0,0,0,0,0,9),('2021-11-01','2021-11-04',10,1,1,0,0,0,0,0,9),('2021-11-01','2021-11-04',7,115,115,0,0,0,0,0,9),('2021-11-01','2021-11-04',6,567,567,0,0,0,0,0,9),('2021-11-01','2021-11-04',5,1296,1296,0,0,0,0,0,9),('2022-01-21','2022-01-27',5,15,0,0,0,0.3856,0.6,0,16),('2022-01-21','2022-01-27',6,0,338,0,166,0.9,1,16.6,16),('2022-01-21','2022-01-27',7,0,161,0,21,1.2,1.5,6.3,16),('2022-01-21','2022-01-27',8,0,2,0,48,0.5,0.6,4.8,16),('2022-01-21','2022-01-27',9,0,8,0,12,0.5,0.6,1.2,16),('2022-01-21','2022-01-27',10,0,1,0,9,0.5,0.6,0.9,16),('2022-01-21','2022-01-27',11,0,6,0,4,0.5,0.6,0.4,16),('2021-11-12','2021-12-10',5,1161,583,0,578,0.3856,0.6,123.92,13),('2021-11-12','2021-12-10',6,331,221,0,614,0.9,1,61.4,13),('2021-11-12','2021-12-10',7,105,13,0,92,1.2,1.5,27.6,13),('2021-11-12','2021-12-10',8,10,9,2,224,0.5,0.6,21.4,13),('2021-11-12','2021-12-10',9,0,4,0,86,0.5,0.6,8.6,13),('2021-11-12','2021-12-10',10,0,2,1,42,0.5,0.6,3.7,13),('2021-11-12','2021-12-10',11,0,1,0,44,0.5,0.6,4.4,13),('2022-01-28','2022-02-03',5,0,1697,0,31,0.3856,0.6,6.65,17),('2022-01-28','2022-02-03',6,338,243,0,95,0.9,1,9.5,17),('2022-01-28','2022-02-03',7,161,162,0,-1,1.2,1.5,-0.3,17),('2022-01-28','2022-02-03',8,2,0,0,27,0.5,0.6,2.7,17),('2022-01-28','2022-02-03',9,8,0,0,18,0.5,0.6,1.8,17),('2022-01-28','2022-02-03',10,1,0,0,6,0.5,0.6,0.6,17),('2022-01-28','2022-02-03',11,6,2,0,9,0.5,0.6,0.9,17),('2022-02-04','2022-02-10',5,1697,1515,0,182,0.3856,0.6,39.02,18),('2022-02-04','2022-02-10',6,243,717,0,198,0.9,1,19.8,18),('2022-02-04','2022-02-10',7,162,144,0,18,1.2,1.5,5.4,18),('2022-02-04','2022-02-10',8,0,0,0,50,0.5,0.6,5,18),('2022-02-04','2022-02-10',9,0,0,0,20,0.5,0.6,2,18),('2022-02-04','2022-02-10',10,0,0,0,10,0.5,0.6,1,18),('2022-02-04','2022-02-10',11,2,0,0,12,0.5,0.6,1.2,18),('2022-02-11','2022-03-22',5,1515,769,0,746,0.3856,0.6,159.94,19),('2022-02-11','2022-03-22',6,717,483,0,1074,0.9,1,107.4,19),('2022-02-11','2022-03-22',7,144,79,0,65,1.2,1.5,19.5,19),('2022-02-11','2022-03-22',8,0,33,4,238,0.5,0.6,21.8,19),('2022-02-11','2022-03-22',9,0,10,1,99,0.5,0.6,9.4,19),('2022-02-11','2022-03-22',10,0,5,4,46,0.5,0.6,2.6,19),('2022-02-11','2022-03-22',11,0,5,0,45,0.5,0.6,4.5,19),('2021-12-11','2021-12-16',5,583,499,0,84,0.3856,0.6,18.01,14),('2021-12-11','2021-12-16',6,221,165,0,56,0.9,1,5.6,14),('2021-12-11','2021-12-16',7,13,13,0,0,1.2,1.5,0,14),('2021-12-11','2021-12-16',8,9,6,0,28,0.5,0.6,2.8,14),('2021-12-11','2021-12-16',9,4,0,0,14,0.5,0.6,1.4,14),('2021-12-11','2021-12-16',10,2,7,0,0,0.5,0.6,0,14),('2021-12-11','2021-12-16',11,1,3,0,3,0.5,0.6,0.3,14),('2021-12-17','2022-01-20',5,499,15,0,484,0.3856,0.6,103.77,15),('2021-12-17','2022-01-20',6,165,0,0,165,0.9,1,16.5,15),('2021-12-17','2022-01-20',7,13,0,0,13,1.2,1.5,3.9,15),('2021-12-17','2022-01-20',8,6,0,6,75,0.5,0.6,4.5,15),('2021-12-17','2022-01-20',9,0,0,0,30,0.5,0.6,3,15),('2021-12-17','2022-01-20',10,7,0,0,27,0.5,0.6,2.7,15),('2021-12-17','2022-01-20',11,3,0,2,11,0.5,0.6,0.1,15),('2022-03-23','2022-04-21',5,769,590,0,179,0.3856,0.6,38.38,20),('2022-03-23','2022-04-21',6,483,450,0,33,0.9,1,3.3,20),('2022-03-23','2022-04-21',7,79,57,0,22,1.2,1.5,6.6,20),('2022-03-23','2022-04-21',8,33,0,8,60,0.5,0.6,2,20),('2022-03-23','2022-04-21',9,10,0,0,30,0.5,0.6,3,20),('2022-03-23','2022-04-21',10,5,0,0,10,0.5,0.6,1,20),('2022-03-23','2022-04-21',11,5,0,0,10,0.5,0.6,1,20),('2022-03-23','2022-04-21',12,0,0,0,0,1.02,1.3,0,20),('2022-03-23','2022-04-21',13,0,0,0,0,1.02,1.3,0,20),('2022-03-23','2022-04-21',14,0,0,0,0,1.275,1.6,0,20),('2022-04-22','2022-05-05',5,590,428,0,162,0.3856,0.6,34.73,21),('2022-04-22','2022-05-05',6,450,293,0,157,0.9,1,15.7,21),('2022-04-22','2022-05-05',7,57,57,0,0,1.2,1.5,0,21),('2022-04-22','2022-05-05',8,0,0,0,100,0.5,0.6,10,21),('2022-04-22','2022-05-05',9,0,0,1,39,0.5,0.6,3.4,21),('2022-04-22','2022-05-05',10,0,0,0,15,0.5,0.6,1.5,21),('2022-04-22','2022-05-05',11,0,0,0,15,0.5,0.6,1.5,21),('2022-04-22','2022-05-05',12,0,0,0,0,1.02,1.3,0,21),('2022-04-22','2022-05-05',13,0,0,4,-4,1.02,1.3,-5.2,21),('2022-04-22','2022-05-05',14,0,0,17,-17,1.275,1.6,-27.2,21);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supply`
--

DROP TABLE IF EXISTS `supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` int NOT NULL,
  `amount` int NOT NULL,
  `supplyDate` date NOT NULL,
  `mhd` date NOT NULL,
  `creationDate` date NOT NULL,
  `fileCount` int NOT NULL,
  `author` text NOT NULL,
  `weekStatId` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply`
--

LOCK TABLES `supply` WRITE;
/*!40000 ALTER TABLE `supply` DISABLE KEYS */;
INSERT INTO `supply` VALUES (29,8,25,'2021-11-12','2021-11-18','2021-11-12',1,'Lutz Oeser',13),(30,9,10,'2021-11-12','2021-11-19','2021-11-12',1,'Lutz Oeser',13),(31,10,5,'2021-11-12','2021-11-27','2021-11-12',1,'Lutz Oeser',13),(32,11,5,'2021-11-12','2021-11-27','2021-11-12',1,'Lutz Oeser',13),(33,8,35,'2021-11-02','2021-11-11','2021-11-15',1,'Lutz Oeser',9),(34,9,25,'2021-11-02','2021-11-11','2021-11-15',1,'Lutz Oeser',9),(35,10,5,'2021-11-02','2021-11-11','2021-11-15',1,'Lutz Oeser',9),(36,11,5,'2021-11-02','2021-11-11','2021-11-15',1,'Lutz Oeser',9),(37,8,35,'2021-11-05','2021-11-11','2021-11-15',1,'Lutz Oeser',-1),(38,9,25,'2021-11-05','2021-11-11','2021-11-15',1,'Lutz Oeser',-1),(39,10,5,'2021-11-05','2021-11-11','2021-11-15',1,'Lutz Oeser',-1),(40,11,5,'2021-11-05','2021-11-11','2021-11-15',1,'Lutz Oeser',-1),(41,8,25,'2021-11-09','2021-11-16','2021-11-15',1,'Lutz Oeser',-1),(42,9,10,'2021-11-09','2021-11-16','2021-11-15',1,'Lutz Oeser',-1),(43,10,5,'2021-11-09','2021-11-16','2021-11-15',1,'Lutz Oeser',-1),(44,11,5,'2021-11-09','2021-11-16','2021-11-15',1,'Lutz Oeser',-1),(45,9,19,'2021-11-04','2022-01-01','2021-11-04',0,'System',9),(46,8,17,'2021-11-04','2022-01-01','2021-11-04',0,'System',9),(47,11,2,'2021-11-04','2022-01-01','2021-11-04',0,'System',9),(48,10,1,'2021-11-04','2022-01-01','2021-11-04',0,'System',9),(49,8,25,'2021-11-16','2021-11-25','2021-11-16',1,'Lutz Oeser',13),(50,9,10,'2021-11-16','2021-11-25','2021-11-16',1,'Lutz Oeser',13),(51,10,5,'2021-11-16','2021-11-25','2021-11-16',1,'Lutz Oeser',13),(52,11,5,'2021-11-16','2021-11-25','2021-11-16',1,'Lutz Oeser',13),(53,8,25,'2021-11-19','2021-11-26','2021-11-19',1,'Lutz Oeser',13),(54,9,10,'2021-11-19','2021-11-27','2021-11-19',1,'Lutz Oeser',13),(55,10,5,'2021-11-19','2021-11-27','2021-11-19',1,'Lutz Oeser',13),(56,11,5,'2021-11-19','2021-12-03','2021-11-19',1,'Lutz Oeser',13),(57,8,25,'2021-11-23','2021-11-28','2021-11-24',1,'Lutz Oeser',13),(58,9,10,'2021-11-23','2021-11-28','2021-11-24',1,'Lutz Oeser',13),(59,10,5,'2021-11-23','2021-12-04','2021-11-24',1,'Lutz Oeser',13),(60,11,5,'2021-11-23','2021-12-04','2021-11-24',1,'Lutz Oeser',13),(61,8,25,'2021-11-26','2021-12-02','2021-11-26',1,'Lutz Oeser',13),(62,9,10,'2021-11-26','2021-12-03','2021-11-26',1,'Lutz Oeser',13),(63,10,5,'2021-11-26','2021-12-11','2021-11-26',1,'Lutz Oeser',13),(64,11,5,'2021-11-26','2021-12-11','2021-11-26',1,'Lutz Oeser',13),(65,8,25,'2021-11-30','2021-12-08','2021-12-01',1,'Lutz Oeser',13),(66,9,10,'2021-11-30','2021-12-08','2021-12-01',1,'Lutz Oeser',13),(67,10,5,'2021-11-30','2021-12-10','2021-12-01',1,'Lutz Oeser',13),(68,11,5,'2021-11-30','2021-12-10','2021-12-01',1,'Lutz Oeser',13),(69,6,504,'2021-12-01','2022-09-23','2021-12-01',1,'Lutz Oeser',13),(70,8,25,'2021-12-03','2021-12-12','2021-12-08',1,'Lutz Oeser',13),(71,9,10,'2021-12-03','2021-12-12','2021-12-08',1,'Lutz Oeser',13),(72,10,5,'2021-12-03','2021-12-12','2021-12-08',1,'Lutz Oeser',13),(73,11,5,'2021-12-03','2021-12-12','2021-12-08',1,'Lutz Oeser',13),(74,8,25,'2021-12-07','2021-12-17','2021-12-08',1,'Lutz Oeser',13),(75,9,10,'2021-12-07','2021-12-17','2021-12-08',1,'Lutz Oeser',13),(76,10,5,'2021-12-07','2021-12-17','2021-12-08',1,'Lutz Oeser',13),(77,11,5,'2021-12-07','2021-12-17','2021-12-08',1,'Lutz Oeser',13),(78,8,25,'2021-12-10','2021-12-17','2021-12-16',1,'Lutz Oeser',13),(79,9,10,'2021-12-10','2021-12-17','2021-12-16',1,'Lutz Oeser',13),(80,10,5,'2021-12-10','2021-12-17','2021-12-16',1,'Lutz Oeser',13),(81,11,5,'2021-12-10','2021-12-17','2021-12-16',1,'Lutz Oeser',13),(82,8,25,'2021-12-14','2021-12-21','2021-12-16',1,'Lutz Oeser',14),(83,9,10,'2021-12-14','2021-12-21','2021-12-16',1,'Lutz Oeser',14),(84,10,5,'2021-12-14','2021-12-21','2021-12-16',1,'Lutz Oeser',14),(85,11,5,'2021-12-14','2021-12-21','2021-12-16',1,'Lutz Oeser',14),(86,8,25,'2022-01-11','2022-01-21','2022-01-12',1,'Lutz Oeser',15),(87,9,10,'2022-01-11','2022-01-21','2022-01-12',1,'Lutz Oeser',15),(88,10,5,'2022-01-11','2022-01-21','2022-01-12',1,'Lutz Oeser',15),(89,11,5,'2022-01-11','2022-01-21','2022-01-12',1,'Lutz Oeser',15),(90,8,25,'2022-01-14','2022-01-25','2022-01-14',1,'Lutz Oeser',15),(91,9,10,'2022-01-14','2022-01-25','2022-01-14',1,'Lutz Oeser',15),(92,10,5,'2022-01-14','2022-01-25','2022-01-14',1,'Lutz Oeser',15),(93,11,5,'2022-01-14','2022-01-25','2022-01-14',1,'Lutz Oeser',15),(94,8,25,'2022-01-18','2022-01-28','2022-01-19',1,'Lutz Oeser',15),(95,9,10,'2022-01-18','2022-01-28','2022-01-19',1,'Lutz Oeser',15),(96,10,10,'2022-01-18','2022-01-28','2022-01-19',1,'Lutz Oeser',15),(97,6,504,'2022-01-24','2022-10-24','2022-01-25',1,'Juliane Hennig',16),(98,7,182,'2022-01-24','2022-10-17','2022-01-26',1,'Juliane Hennig',16),(99,8,25,'2022-01-21','2022-02-01','2022-01-26',1,'Juliane Hennig',16),(100,9,10,'2022-01-21','2022-02-01','2022-01-26',1,'Juliane Hennig',16),(101,10,5,'2022-01-21','2022-02-01','2022-01-26',1,'Juliane Hennig',16),(102,11,5,'2022-01-21','2022-02-01','2022-01-26',1,'Juliane Hennig',16),(103,8,25,'2022-01-25','2022-02-04','2022-01-26',1,'Juliane Hennig',16),(104,9,10,'2022-01-25','2022-02-04','2022-01-26',1,'Juliane Hennig',16),(105,10,5,'2022-01-25','2022-02-04','2022-01-26',1,'Juliane Hennig',16),(106,11,5,'2022-01-25','2022-02-04','2022-01-26',1,'Juliane Hennig',16),(107,8,25,'2022-01-28','2022-02-04','2022-01-28',1,'Lutz Oeser',17),(108,9,10,'2022-01-28','2022-02-04','2022-01-28',1,'Lutz Oeser',17),(109,10,5,'2022-01-28','2022-02-04','2022-01-28',1,'Lutz Oeser',17),(110,11,5,'2022-01-28','2022-02-04','2022-01-28',1,'Lutz Oeser',17),(111,5,1728,'2022-02-02','2022-12-03','2022-02-02',1,'Juliane Hennig',17),(112,8,25,'2022-02-04','2022-02-15','2022-02-07',1,'Lutz Oeser',18),(113,9,10,'2022-02-04','2022-02-15','2022-02-07',1,'Lutz Oeser',18),(114,10,5,'2022-02-04','2022-02-15','2022-02-07',1,'Lutz Oeser',18),(115,11,5,'2022-02-04','2022-02-15','2022-02-07',1,'Lutz Oeser',18),(116,8,25,'2022-02-08','2022-02-18','2022-02-11',1,'Lutz Oeser',18),(117,9,10,'2022-02-08','2022-02-18','2022-02-11',1,'Lutz Oeser',18),(118,10,5,'2022-02-08','2022-02-18','2022-02-11',1,'Lutz Oeser',18),(119,11,5,'2022-02-08','2022-02-18','2022-02-11',1,'Lutz Oeser',18),(120,8,25,'2022-02-11','2022-02-22','2022-02-11',1,'Lutz Oeser',19),(121,9,10,'2022-02-11','2022-02-22','2022-02-11',1,'Lutz Oeser',19),(122,10,5,'2022-02-11','2022-02-22','2022-02-11',1,'Lutz Oeser',19),(123,11,5,'2022-02-11','2022-02-22','2022-02-11',1,'Lutz Oeser',19),(124,6,672,'2022-02-10','2022-10-24','2022-02-11',1,'Juliane Hennig',18),(125,8,25,'2022-02-15','2022-02-25','2022-02-16',1,'Lutz Oeser',19),(126,9,10,'2022-02-15','2022-02-25','2022-02-16',1,'Lutz Oeser',19),(127,10,5,'2022-02-15','2022-02-25','2022-02-16',1,'Lutz Oeser',19),(128,11,5,'2022-02-15','2022-02-25','2022-02-16',1,'Lutz Oeser',19),(129,11,5,'2022-02-18','2022-03-04','2022-02-18',1,'Juliane Hennig',19),(130,10,5,'2022-02-18','2022-03-04','2022-02-18',1,'Juliane Hennig',19),(131,8,25,'2022-02-18','2022-03-04','2022-02-21',1,'Juliane Hennig',19),(132,9,10,'2022-02-18','2022-03-04','2022-02-21',1,'Juliane Hennig',19),(133,8,25,'2022-02-25','2022-03-07','2022-02-25',1,'Juliane Hennig',19),(134,9,10,'2022-02-25','2022-03-07','2022-02-25',1,'Juliane Hennig',19),(135,10,5,'2022-02-25','2022-03-06','2022-02-25',1,'Juliane Hennig',19),(136,11,5,'2022-02-25','2022-03-06','2022-02-25',1,'Juliane Hennig',19),(137,8,25,'2022-03-01','2022-03-12','2022-03-02',1,'Juliane Hennig',19),(138,9,10,'2022-03-01','2022-03-12','2022-03-02',1,'Juliane Hennig',19),(139,10,5,'2022-03-01','2022-03-12','2022-03-02',1,'Juliane Hennig',19),(140,11,5,'2022-03-01','2022-03-12','2022-03-02',1,'Juliane Hennig',19),(141,6,840,'2022-03-02','2022-11-20','2022-03-02',1,'Juliane Hennig',19),(142,8,25,'2022-03-08','2022-03-22','2022-03-08',1,'Juliane Hennig',19),(143,9,10,'2022-03-08','2022-03-22','2022-03-08',1,'Juliane Hennig',19),(144,10,5,'2022-03-08','2022-03-22','2022-03-08',1,'Juliane Hennig',19),(145,11,5,'2022-03-08','2022-03-22','2022-03-08',1,'Juliane Hennig',19),(146,8,25,'2022-03-04','2022-03-15','2022-03-11',1,'Lutz Oeser',19),(147,9,10,'2022-03-04','2022-03-15','2022-03-11',1,'Lutz Oeser',19),(148,10,5,'2022-03-04','2022-03-15','2022-03-11',1,'Lutz Oeser',19),(149,11,5,'2022-03-04','2022-03-15','2022-04-10',1,'Lutz Oeser',19),(150,8,25,'2022-03-11','2022-03-22','2022-03-11',1,'Lutz Oeser',19),(151,9,10,'2022-03-11','2022-03-22','2022-03-11',1,'Lutz Oeser',19),(152,10,5,'2022-03-11','2022-03-22','2022-03-11',1,'Lutz Oeser',19),(153,11,5,'2022-03-22','2022-03-22','2022-03-11',1,'Lutz Oeser',19),(154,8,25,'2022-03-15','2022-03-30','2022-03-15',1,'Juliane Hennig',19),(155,9,10,'2022-03-15','2022-03-30','2022-03-15',1,'Juliane Hennig',19),(156,10,5,'2022-03-15','2022-03-30','2022-03-15',1,'Juliane Hennig',19),(157,8,25,'2022-03-18','2022-03-31','2022-03-18',1,'Juliane Hennig',19),(158,9,10,'2022-03-18','2022-03-30','2022-03-18',1,'Juliane Hennig',19),(159,10,5,'2022-03-18','2022-03-31','2022-03-18',1,'Juliane Hennig',19),(160,11,5,'2022-03-18','2022-03-31','2022-04-10',1,'Lutz Oeser',19),(161,8,25,'2022-03-22','2022-03-31','2022-03-22',1,'Juliane Hennig',19),(162,9,10,'2022-03-22','2022-03-31','2022-03-22',1,'Juliane Hennig',19),(163,10,5,'2022-03-22','2022-03-31','2022-03-22',1,'Juliane Hennig',19),(164,11,5,'2022-03-22','2022-03-31','2022-03-22',1,'Juliane Hennig',19),(165,8,25,'2022-03-25','2022-04-05','2022-03-25',1,'Lutz Oeser',20),(166,9,10,'2022-03-25','2022-04-05','2022-03-25',1,'Lutz Oeser',20),(167,10,5,'2022-03-25','2022-04-05','2022-03-25',1,'Lutz Oeser',20),(168,11,5,'2022-03-25','2022-04-05','2022-04-10',1,'Lutz Oeser',20),(169,8,10,'2022-03-29','2022-04-08','2022-03-29',1,'Juliane Hennig',20),(170,9,10,'2022-03-29','2022-04-08','2022-03-29',1,'Juliane Hennig',20),(171,8,25,'2022-04-22','2022-05-03','2022-04-22',1,'Lutz Oeser',21),(172,9,10,'2022-04-22','2022-05-03','2022-04-22',1,'Lutz Oeser',21),(173,8,25,'2022-04-26','2022-05-06','2022-04-27',1,'Lutz Oeser',21),(174,9,10,'2022-04-26','2022-05-06','2022-04-27',1,'Lutz Oeser',21),(175,10,5,'2022-04-26','2022-05-06','2022-04-27',1,'Lutz Oeser',21),(176,11,5,'2022-04-26','2022-05-06','2022-04-27',1,'Lutz Oeser',21),(177,8,25,'2022-04-29','2022-05-10','2022-04-29',1,'Lutz Oeser',21),(178,9,10,'2022-04-29','2022-05-10','2022-04-29',1,'Lutz Oeser',21),(179,10,5,'2022-04-29','2022-05-10','2022-04-29',1,'Lutz Oeser',21),(180,11,5,'2022-04-29','2022-05-10','2022-04-29',1,'Lutz Oeser',21),(181,8,25,'2022-05-03','2022-05-13','2022-05-03',1,'Lutz Oeser',21),(182,9,10,'2022-05-03','2022-05-13','2022-05-03',1,'Lutz Oeser',21),(183,10,5,'2022-05-03','2022-05-13','2022-05-03',1,'Lutz Oeser',21),(184,11,5,'2022-05-03','2022-05-13','2022-05-03',1,'Lutz Oeser',21),(185,8,25,'2022-05-06','2022-05-17','2022-05-06',1,'Lutz Oeser',-1),(186,9,10,'2022-05-06','2022-05-17','2022-05-06',1,'Lutz Oeser',-1),(187,10,5,'2022-05-06','2022-05-17','2022-05-06',1,'Lutz Oeser',-1),(188,11,5,'2022-05-06','2022-05-17','2022-05-06',1,'Lutz Oeser',-1),(189,8,25,'2022-05-10','2022-05-18','2022-05-10',1,'Juliane Hennig',-1),(190,9,10,'2022-05-10','2022-05-18','2022-05-10',1,'Juliane Hennig',-1),(191,10,5,'2022-05-10','2022-05-18','2022-05-10',1,'Juliane Hennig',-1),(192,11,5,'2022-05-10','2022-05-18','2022-05-10',1,'Juliane Hennig',-1),(193,6,504,'2022-05-10','2023-02-20','2022-05-10',1,'Juliane Hennig',-1),(194,8,25,'2022-05-13','2022-05-20','2022-05-13',1,'Lutz Oeser',-1),(195,9,10,'2022-05-13','2022-05-20','2022-05-13',1,'Lutz Oeser',-1),(196,10,5,'2022-05-13','2022-05-20','2022-05-13',1,'Lutz Oeser',-1),(197,11,5,'2022-05-13','2022-05-20','2022-05-13',1,'Lutz Oeser',-1),(198,10,5,'2022-05-17','2022-05-26','2022-05-17',1,'Juliane Hennig',-1),(199,11,5,'2022-05-17','2022-05-26','2022-05-17',1,'Juliane Hennig',-1),(200,8,25,'2022-05-17','2022-05-26','2022-05-17',1,'Juliane Hennig',-1),(201,9,10,'2022-05-17','2022-05-26','2022-05-17',1,'Juliane Hennig',-1),(202,12,280,'2022-05-06','2022-05-19','2022-06-03',7,'Lutz Oeser',-1),(203,13,85,'2022-05-06','2022-05-19','2022-05-19',7,'Lutz Oeser',-1),(204,14,30,'2022-05-06','2022-05-19','2022-06-03',7,'Lutz Oeser',-1),(205,15,40,'2022-05-06','2022-05-19','2022-05-19',7,'Lutz Oeser',-1),(206,16,280,'2022-05-06','2022-05-19','2022-05-19',7,'Lutz Oeser',-1),(207,17,120,'2022-05-06','2022-05-19','2022-05-19',7,'Lutz Oeser',-1),(208,18,35,'2022-05-06','2022-05-19','2022-05-19',7,'Lutz Oeser',-1),(209,19,80,'2022-05-06','2022-05-19','2022-05-19',7,'Lutz Oeser',-1),(210,9,10,'2022-05-20','2022-05-28','2022-05-20',1,'Juliane Hennig',-1),(211,10,5,'2022-05-20','2022-05-28','2022-05-20',1,'Juliane Hennig',-1),(212,11,5,'2022-05-20','2022-05-28','2022-05-20',1,'Juliane Hennig',-1),(213,8,25,'2022-05-20','2022-05-28','2022-05-20',1,'Juliane Hennig',-1),(214,8,25,'2022-05-31','2022-06-10','2022-05-31',1,'Lutz Oeser',-1),(215,9,10,'2022-05-31','2022-06-10','2022-05-31',1,'Lutz Oeser',-1),(216,10,5,'2022-05-31','2022-06-10','2022-05-31',1,'Lutz Oeser',-1),(217,11,5,'2022-05-31','2022-06-10','2022-05-31',1,'Lutz Oeser',-1),(218,12,155,'2022-05-20','2022-06-03','2022-06-03',5,'Lutz Oeser',-1),(219,13,35,'2022-05-20','2022-06-03','2022-06-03',5,'Lutz Oeser',-1),(220,15,10,'2022-05-20','2022-05-30','2022-06-03',2,'Lutz Oeser',-1),(221,16,130,'2022-05-20','2022-06-03','2022-06-03',5,'Lutz Oeser',-1),(222,17,75,'2022-05-20','2022-06-03','2022-06-03',5,'Lutz Oeser',-1),(223,18,25,'2022-05-20','2022-06-03','2022-06-03',5,'Lutz Oeser',-1),(224,19,50,'2022-05-20','2022-06-03','2022-06-03',5,'Lutz Oeser',-1),(225,9,10,'2022-06-03','2022-06-10','2022-06-03',1,'Juliane Hennig',-1),(226,11,5,'2022-06-03','2022-06-10','2022-06-03',1,'Juliane Hennig',-1),(227,10,5,'2022-06-03','2022-06-10','2022-06-03',1,'Juliane Hennig',-1),(228,8,25,'2022-06-13','2022-06-20','2022-06-13',1,'Juliane Hennig',-1),(229,9,10,'2022-06-13','2022-06-20','2022-06-13',1,'Juliane Hennig',-1),(230,10,5,'2022-06-13','2022-06-20','2022-06-13',1,'Juliane Hennig',-1),(231,11,5,'2022-06-13','2022-06-20','2022-06-13',1,'Juliane Hennig',-1),(232,8,25,'2022-06-14','2022-06-23','2022-06-15',1,'Juliane Hennig',-1),(233,9,10,'2022-06-14','2022-06-22','2022-06-15',1,'Juliane Hennig',-1),(234,10,5,'2022-06-14','2022-06-22','2022-06-15',1,'Juliane Hennig',-1),(235,11,5,'2022-06-14','2022-06-22','2022-06-15',1,'Juliane Hennig',-1),(236,8,25,'2022-06-17','2022-06-28','2022-06-17',1,'Lutz Oeser',-1),(237,9,10,'2022-06-17','2022-06-28','2022-06-17',1,'Lutz Oeser',-1),(238,10,5,'2022-06-17','2022-06-28','2022-06-17',1,'Lutz Oeser',-1),(239,11,5,'2022-06-17','2022-06-28','2022-06-17',1,'Lutz Oeser',-1),(240,12,165,'2022-06-08','2022-06-17','2022-06-17',7,'Lutz Oeser',-1),(241,13,35,'2022-06-08','2022-06-17','2022-06-17',7,'Lutz Oeser',-1),(242,16,145,'2022-06-08','2022-06-17','2022-06-17',7,'Lutz Oeser',-1),(243,17,90,'2022-06-08','2022-06-17','2022-06-17',7,'Lutz Oeser',-1),(244,18,35,'2022-06-08','2022-06-17','2022-06-17',7,'Lutz Oeser',-1),(245,19,70,'2022-06-08','2022-06-17','2022-06-17',7,'Lutz Oeser',-1),(246,8,24,'2022-06-21','2022-06-29','2022-06-21',1,'Juliane Hennig',-1),(247,9,10,'2022-06-21','2022-06-29','2022-06-21',1,'Juliane Hennig',-1),(248,10,5,'2022-06-21','2022-06-29','2022-06-21',1,'Juliane Hennig',-1),(249,8,25,'2022-06-24','2022-07-01','2022-06-24',1,'Juliane Hennig',-1),(250,9,10,'2022-06-24','2022-07-01','2022-06-24',1,'Juliane Hennig',-1),(251,10,5,'2022-06-24','2022-07-01','2022-06-24',1,'Juliane Hennig',-1),(252,11,5,'2022-06-24','2022-07-01','2022-06-24',1,'Juliane Hennig',-1),(253,8,25,'2022-06-28','2022-07-08','2022-06-28',1,'Lutz Oeser',-1),(254,9,10,'2022-06-28','2022-07-08','2022-06-28',1,'Lutz Oeser',-1),(255,10,5,'2022-06-28','2022-07-08','2022-06-28',1,'Lutz Oeser',-1),(256,11,5,'2022-06-28','2022-07-08','2022-06-28',1,'Lutz Oeser',-1),(257,5,1728,'2022-06-28','2023-06-10','2022-06-28',1,'Lutz Oeser',-1),(258,12,150,'2022-06-20','2022-06-27','2022-06-28',5,'Lutz Oeser',-1),(259,13,25,'2022-06-20','2022-06-27','2022-06-28',5,'Lutz Oeser',-1),(260,16,125,'2022-06-20','2022-06-27','2022-06-28',5,'Lutz Oeser',-1),(261,17,75,'2022-06-20','2022-06-27','2022-06-28',5,'Lutz Oeser',-1),(262,18,25,'2022-06-20','2022-06-27','2022-06-28',5,'Lutz Oeser',-1),(263,19,50,'2022-06-20','2022-06-27','2022-06-28',5,'Lutz Oeser',-1),(264,8,25,'2022-08-26','2022-09-06','2022-08-29',1,'Lutz Oeser',-1),(265,9,10,'2022-08-26','2022-09-06','2022-08-29',1,'Lutz Oeser',-1),(266,10,5,'2022-08-26','2022-09-06','2022-08-29',1,'Lutz Oeser',-1),(267,11,5,'2022-08-26','2022-09-06','2022-08-29',1,'Lutz Oeser',-1),(268,8,25,'2022-08-30','2022-09-13','2022-09-01',1,'Lutz Oeser',-1),(269,9,10,'2022-08-30','2022-09-13','2022-09-01',1,'Lutz Oeser',-1),(270,10,5,'2022-08-30','2022-09-13','2022-09-01',1,'Lutz Oeser',-1),(271,11,5,'2022-08-30','2022-09-13','2022-09-01',1,'Lutz Oeser',-1),(272,12,60,'2022-08-29','2022-08-31','2022-09-02',2,'Lutz Oeser',-1),(273,13,10,'2022-08-29','2022-08-31','2022-09-02',2,'Lutz Oeser',-1),(274,16,50,'2022-08-29','2022-08-31','2022-09-02',2,'Lutz Oeser',-1),(275,17,30,'2022-08-29','2022-08-31','2022-09-02',2,'Lutz Oeser',-1),(276,18,10,'2022-08-29','2022-08-31','2022-09-02',2,'Lutz Oeser',-1),(277,19,20,'2022-08-29','2022-08-31','2022-09-02',2,'Lutz Oeser',-1),(278,8,25,'2022-09-02','2022-09-09','2022-09-02',1,'Juliane Hennig',-1),(279,9,10,'2022-09-02','2022-09-09','2022-09-02',1,'Juliane Hennig',-1),(280,10,5,'2022-09-02','2022-09-09','2022-09-02',1,'Juliane Hennig',-1),(281,11,5,'2022-09-02','2022-09-09','2022-09-02',1,'Juliane Hennig',-1),(282,6,504,'2022-09-05','2023-04-25','2022-09-05',1,'Lutz Oeser',-1),(283,7,182,'2022-09-05','2023-02-19','2022-09-05',1,'Lutz Oeser',-1),(284,8,25,'2022-09-06','2022-09-13','2022-09-06',1,'Juliane Hennig',-1),(285,9,10,'2022-09-06','2022-09-13','2022-09-06',1,'Juliane Hennig',-1),(286,10,5,'2022-09-06','2022-09-13','2022-09-06',1,'Juliane Hennig',-1),(287,11,5,'2022-09-06','2022-09-13','2022-09-06',1,'Juliane Hennig',-1),(288,8,25,'2022-09-09','2022-09-20','2022-09-09',1,'Lutz Oeser',-1),(289,9,10,'2022-09-09','2022-09-20','2022-09-09',1,'Lutz Oeser',-1),(290,10,5,'2022-09-09','2022-09-20','2022-09-09',1,'Lutz Oeser',-1),(291,11,5,'2022-09-09','2022-09-20','2022-09-09',1,'Lutz Oeser',-1),(292,12,180,'2022-09-01','2022-09-09','2022-09-09',6,'Lutz Oeser',-1),(293,13,30,'2022-09-01','2022-09-09','2022-09-09',6,'Lutz Oeser',-1),(294,16,150,'2022-09-01','2022-09-09','2022-09-09',6,'Lutz Oeser',-1),(295,17,90,'2022-09-01','2022-09-09','2022-09-09',6,'Lutz Oeser',-1),(296,18,30,'2022-09-01','2022-09-09','2022-09-09',6,'Lutz Oeser',-1),(297,19,60,'2022-09-01','2022-09-09','2022-09-09',6,'Lutz Oeser',-1),(298,12,120,'2022-09-12','2022-09-16','2022-09-16',4,'Juliane Hennig',-1),(299,13,20,'2022-09-12','2022-09-16','2022-09-16',4,'Juliane Hennig',-1),(300,16,100,'2022-09-12','2022-09-16','2022-09-16',4,'Juliane Hennig',-1),(301,17,60,'2022-09-12','2022-09-16','2022-09-16',4,'Juliane Hennig',-1),(302,18,20,'2022-09-12','2022-09-16','2022-09-16',4,'Juliane Hennig',-1),(303,19,40,'2022-09-12','2022-09-16','2022-09-16',4,'Juliane Hennig',-1),(304,8,35,'2022-09-16','2022-09-23','2022-09-16',1,'Juliane Hennig',-1),(305,9,25,'2022-09-16','2022-09-23','2022-09-16',1,'Juliane Hennig',-1),(306,11,10,'2022-09-16','2022-09-23','2022-09-16',1,'Juliane Hennig',-1),(307,10,10,'2022-09-16','2022-09-23','2022-09-16',1,'Juliane Hennig',-1),(308,8,25,'2022-09-13','2022-09-20','2022-09-16',1,'Juliane Hennig',-1),(309,9,10,'2022-09-13','2022-09-20','2022-09-16',1,'Juliane Hennig',-1),(310,10,5,'2022-09-13','2022-09-20','2022-09-16',1,'Juliane Hennig',-1),(311,11,5,'2022-09-13','2022-09-20','2022-09-16',1,'Juliane Hennig',-1),(312,8,35,'2022-09-23','2022-09-28','2022-09-23',1,'Juliane Hennig',-1),(313,9,25,'2022-09-23','2022-09-28','2022-09-23',1,'Juliane Hennig',-1),(314,11,10,'2022-09-23','2022-09-28','2022-09-23',1,'Juliane Hennig',-1),(315,10,10,'2022-09-23','2022-09-28','2022-09-23',1,'Juliane Hennig',-1),(316,8,35,'2022-09-20','2022-09-28','2022-09-23',1,'Juliane Hennig',-1),(317,9,15,'2022-09-20','2022-09-28','2022-09-23',1,'Juliane Hennig',-1),(318,10,20,'2022-09-20','2022-09-28','2022-09-23',1,'Juliane Hennig',-1),(319,11,10,'2022-09-20','2022-09-28','2022-09-23',1,'Juliane Hennig',-1),(320,12,160,'2022-09-19','2022-09-24','2022-09-23',4,'Juliane Hennig',-1),(321,13,40,'2022-09-19','2022-09-24','2022-09-23',4,'Juliane Hennig',-1),(322,16,140,'2022-09-19','2022-09-24','2022-09-23',4,'Juliane Hennig',-1),(323,17,60,'2022-09-19','2022-09-24','2022-09-23',4,'Juliane Hennig',-1),(324,18,40,'2022-09-19','2022-09-24','2022-09-23',4,'Juliane Hennig',-1),(325,19,80,'2022-09-19','2022-09-24','2022-09-23',4,'Juliane Hennig',-1),(326,8,35,'2022-09-27','2022-10-07','2022-09-28',1,'Lutz Oeser',-1),(327,9,25,'2022-09-27','2022-10-07','2022-09-28',1,'Lutz Oeser',-1),(328,10,10,'2022-09-27','2022-10-07','2022-09-28',1,'Lutz Oeser',-1),(329,11,10,'2022-09-27','2022-10-07','2022-09-28',1,'Lutz Oeser',-1),(330,8,35,'2022-09-30','2022-10-07','2022-10-05',1,'Juliane Hennig',-1),(331,9,25,'2022-09-30','2022-10-07','2022-10-05',1,'Juliane Hennig',-1),(332,10,10,'2022-09-30','2022-10-07','2022-10-05',1,'Juliane Hennig',-1),(333,11,10,'2022-09-30','2022-10-07','2022-10-05',1,'Juliane Hennig',-1),(334,8,35,'2022-10-04','2022-10-11','2022-10-05',1,'Juliane Hennig',-1),(335,9,25,'2022-10-04','2022-10-11','2022-10-05',1,'Juliane Hennig',-1),(336,10,10,'2022-10-04','2022-10-11','2022-10-05',1,'Juliane Hennig',-1),(337,11,10,'2022-10-04','2022-10-11','2022-10-05',1,'Juliane Hennig',-1),(338,12,160,'2022-09-26','2022-09-30','2022-10-05',4,'Juliane Hennig',-1),(339,13,30,'2022-09-26','2022-09-30','2022-10-05',4,'Juliane Hennig',-1),(340,16,110,'2022-09-26','2022-09-30','2022-10-05',4,'Juliane Hennig',-1),(341,17,60,'2022-09-26','2022-09-30','2022-10-05',4,'Juliane Hennig',-1),(342,18,40,'2022-09-26','2022-09-30','2022-10-05',4,'Juliane Hennig',-1),(343,19,80,'2022-09-26','2022-09-30','2022-10-05',4,'Juliane Hennig',-1),(344,8,35,'2022-10-07','2022-10-18','2022-10-07',1,'Lutz Oeser',-1),(345,9,25,'2022-10-07','2022-10-18','2022-10-07',1,'Lutz Oeser',-1),(346,10,10,'2022-10-07','2022-10-18','2022-10-07',1,'Lutz Oeser',-1),(347,11,10,'2022-10-07','2022-10-18','2022-10-07',1,'Lutz Oeser',-1),(348,6,840,'2022-10-12','2023-07-23','2022-10-12',1,'Lutz Oeser',-1),(349,7,182,'2022-10-12','2023-04-06','2022-10-12',1,'Lutz Oeser',-1),(350,12,160,'2022-10-05','2022-10-10','2022-10-12',4,'Lutz Oeser',-1),(351,13,40,'2022-10-05','2022-10-10','2022-10-12',4,'Lutz Oeser',-1),(352,16,100,'2022-10-05','2022-10-10','2022-10-12',4,'Lutz Oeser',-1),(353,17,60,'2022-10-05','2022-10-10','2022-10-12',4,'Lutz Oeser',-1),(354,18,40,'2022-10-05','2022-10-10','2022-10-12',4,'Lutz Oeser',-1),(355,19,80,'2022-10-05','2022-10-10','2022-10-12',4,'Lutz Oeser',-1);
/*!40000 ALTER TABLE `supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` text NOT NULL,
  `password` text NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Linus Schmidt','$2y$10$OrB/6HmMqg6cXxXnPI2duOfMIJt/gVydf1tY0dDMPUMbSwgjsVJQu'),(2,'Lutz Oeser','$2y$10$EI3fwBqRViLwUqBF.K0Lq.AgjUbvwEnZhokonFk76jRgi5HZBdoLO'),(3,'Otto Trapp','$2y$10$uIfEPR0Q67pjFoxV8YHGaui8.JMbhITsLu6o0Iz0NOBnbHi.yhIRm'),(4,'Lars Schofeld','$2y$10$PbHSNj8FFtrFB56z2uwl6ObVl/qeF.vQCMyqJDi5arIDpEpU/A4ha'),(5,'Axel Kleindienst','$2y$10$Z1PDpLpXDpJ2RQ3QLvKesOB5nLJTNpp3pDO4qDYlGsf9wyNBEYazG'),(6,'Juliane Hennig','$2y$10$GcNXA5OrTVq1U9ZYtgNMEe2kkM.svumjk34cQqk/y7OYJtFTs/H2K'),(7,'Maybritt Andersen','$2y$10$.4NOcUvnnjc4GBiJT0KEiOPR/3ELCrR5mRKvq0.yb4z6gG/.tC7oe');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `week_stats`
--

DROP TABLE IF EXISTS `week_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `week_stats` (
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `coinsRegister` float NOT NULL,
  `billsRegister` float NOT NULL,
  `coinsTransfer` float NOT NULL,
  `billsTransfer` float NOT NULL,
  `author` text NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `diff` float NOT NULL,
  `profit` float NOT NULL,
  `sales` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `week_stats`
--

LOCK TABLES `week_stats` WRITE;
/*!40000 ALTER TABLE `week_stats` DISABLE KEYS */;
INSERT INTO `week_stats` VALUES ('2021-11-01','2021-11-04',297.4,225,153.4,185,'Otto Trapp',9,0,0,0),('2021-11-05','2021-11-11',304.23,240,209.73,200,'Otto Trapp',12,-58.17,69.94,360.23),('2021-11-12','2021-12-10',627.98,780,541.58,760,'Otto Trapp',13,-62.92,251.02,1273.48),('2021-12-11','2021-12-16',159.6,90,75.2,70,'Linus Schmidt',14,9.8,28.11,143.2),('2021-12-17','2022-01-20',294.67,230,253.77,210,'Otto Trapp',15,-140.43,134.47,420.27),('2022-01-21','2022-01-27',160.3,145,114.85,125,'Otto Trapp',16,3.1,30.2,244.4),('2022-01-28','2022-02-03',125.5,85,161.4,0,'Linus Schmidt',17,-3.05,21.85,145.05),('2022-02-04','2022-02-10',256.8,200,183.5,180,'Linus Schmidt',18,18.3,73.42,407.7),('2022-02-11','2022-03-22',767.22,990,717.92,970,'Linus Schmidt',19,-211.98,325.14,1663.92);
/*!40000 ALTER TABLE `week_stats` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-25 19:26:13