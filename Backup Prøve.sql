CREATE DATABASE  IF NOT EXISTS `skiklubb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `skiklubb`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: skiklubb
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `medlemsregister`
--

DROP TABLE IF EXISTS `medlemsregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `medlemsregister` (
  `medlemsID` int(11) NOT NULL AUTO_INCREMENT,
  `fornavn` varchar(255) NOT NULL,
  `etternavn` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `Tlf` int(11) NOT NULL,
  `poststed` varchar(255) NOT NULL,
  `Fodt` date NOT NULL,
  `kjonn` varchar(40) NOT NULL,
  `lopID` int(11) NOT NULL,
  PRIMARY KEY (`medlemsID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medlemsregister`
--

LOCK TABLES `medlemsregister` WRITE;
/*!40000 ALTER TABLE `medlemsregister` DISABLE KEYS */;
INSERT INTO `medlemsregister` VALUES (1,'Ole','Olsen','Storgata 1',98758956,'1','1995-06-20','M',0),(2,'Kalle','Olsen','Storgata 1',39213722,'1','1997-06-20','M',0),(3,'Ole','Olsen','Storgata 1',98758956,'3','1995-06-20','M',0),(4,'Anne','Hansen','Skogveien 1',78598693,'3','1996-04-09','K',0);
/*!40000 ALTER TABLE `medlemsregister` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poststed`
--

DROP TABLE IF EXISTS `poststed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `poststed` (
  `postnummerID` int(11) NOT NULL AUTO_INCREMENT,
  `poststed` varchar(50) NOT NULL,
  PRIMARY KEY (`postnummerID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poststed`
--

LOCK TABLES `poststed` WRITE;
/*!40000 ALTER TABLE `poststed` DISABLE KEYS */;
INSERT INTO `poststed` VALUES (1,'Gjøvik'),(2,'Raufoss'),(3,'Hamar'),(4,'Lillehammer');
/*!40000 ALTER TABLE `poststed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultater`
--

DROP TABLE IF EXISTS `resultater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `resultater` (
  `LopID` int(11) NOT NULL AUTO_INCREMENT,
  `loypelengde` int(11) NOT NULL,
  `dato` date NOT NULL,
  `tid` timestamp NOT NULL,
  `plassering` varchar(255) NOT NULL,
  `medlemID` int(11) NOT NULL,
  PRIMARY KEY (`LopID`),
  KEY `medlemID` (`medlemID`),
  CONSTRAINT `resultater_ibfk_1` FOREIGN KEY (`medlemID`) REFERENCES `medlemsregister` (`medlemsid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultater`
--

LOCK TABLES `resultater` WRITE;
/*!40000 ALTER TABLE `resultater` DISABLE KEYS */;
INSERT INTO `resultater` VALUES (1,10,'2017-01-22','2017-01-21 23:31:10','4',1),(2,5,'2017-01-26','2017-01-25 23:15:23','2',1),(3,10,'2017-01-23','2017-01-22 23:34:30','10',2);
/*!40000 ALTER TABLE `resultater` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-15 14:42:39
