CREATE DATABASE  IF NOT EXISTS `student` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `student`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: student
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
-- Table structure for table `fylke`
--

DROP TABLE IF EXISTS `fylke`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fylke` (
  `idFylke` int(11) NOT NULL AUTO_INCREMENT,
  `Fylkenavn` varchar(45) NOT NULL,
  PRIMARY KEY (`idFylke`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fylke`
--

LOCK TABLES `fylke` WRITE;
/*!40000 ALTER TABLE `fylke` DISABLE KEYS */;
INSERT INTO `fylke` VALUES (1,'Hedmark'),(2,'Oppland'),(3,'Oslo'),(4,'Sør-Trøndelag'),(5,'Akershus');
/*!40000 ALTER TABLE `fylke` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poststed`
--

DROP TABLE IF EXISTS `poststed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `poststed` (
  `idPostnummer` int(11) NOT NULL,
  `Poststed` varchar(45) NOT NULL,
  `Fylke` varchar(45) NOT NULL,
  `Fylke_idFylke` int(11) NOT NULL,
  PRIMARY KEY (`idPostnummer`,`Fylke_idFylke`),
  KEY `fk_Poststed_Fylke1_idx` (`Fylke_idFylke`),
  CONSTRAINT `fk_Poststed_Fylke1` FOREIGN KEY (`Fylke_idFylke`) REFERENCES `fylke` (`idfylke`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poststed`
--

LOCK TABLES `poststed` WRITE;
/*!40000 ALTER TABLE `poststed` DISABLE KEYS */;
INSERT INTO `poststed` VALUES (381,'Oslo','Oslo',3),(2020,'Lillestrøm','Akershus',5),(2320,'Furnes','Hedmark',1),(2380,'Brumunddal','Hedmark',1),(2820,'Gran','Oppland',2);
/*!40000 ALTER TABLE `poststed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student` (
  `idStudent` int(11) NOT NULL AUTO_INCREMENT,
  `Etternavn` varchar(45) NOT NULL,
  `Fornavn` varchar(45) NOT NULL,
  `Adresse` varchar(45) NOT NULL,
  `Telefonnummer` varchar(45) NOT NULL,
  `Poststed_idPostnummer` int(11) NOT NULL,
  `Kjonn` varchar(10) NOT NULL,
  `Alder` int(3) NOT NULL,
  PRIMARY KEY (`idStudent`,`Poststed_idPostnummer`),
  KEY `fk_Student_Poststed_idx` (`Poststed_idPostnummer`),
  CONSTRAINT `fk_Student_Poststed` FOREIGN KEY (`Poststed_idPostnummer`) REFERENCES `poststed` (`idpostnummer`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Larsen','Stian','Stabburvegen 7','90228220',2320,'Male',21),(2,'Thomassen','Alex','Skolevegen 4','41214124',2380,'Female',21),(3,'Finsrud','Øyvind','Apekattveien 23','84176213',2380,'Female',21),(4,'Søby','Jørgen','Grønlandsleiet 2','41274422',381,'Female',21),(5,'Olsowo','Hilde','Biskop Gunnerus Gate 12','98312733',381,'Female',39),(6,'Mohammed','Achmed','Smokkveien 13','93237172',2380,'Female',28),(7,'Larsen','Kevin','Sukkertoppen 3','31823831',2020,'Male',30),(8,'Larsen','Kalle','Teknologiveien 123','69696969',2020,'Male',39);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-26  8:35:08
