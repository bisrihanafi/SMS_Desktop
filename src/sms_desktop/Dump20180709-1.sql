-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: Hanafi
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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

DROP DATABASE Hanafi;
CREATE DATABASE Hanafi;
USE Hanafi;

--
-- Table structure for table `UserAc`
--

DROP TABLE IF EXISTS UserAc;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE UserAc (
  Nama varchar(50) NOT NULL,
  Password varchar(45) DEFAULT NULL,
  PRIMARY KEY (Nama)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserAc`
--

LOCK TABLES UserAc WRITE;
/*!40000 ALTER TABLE `UserAc` DISABLE KEYS */;
INSERT INTO UserAc VALUES ('Bisri','2'),('Budi','0'),('Hanafi','1');
/*!40000 ALTER TABLE `UserAc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */
--
-- Table structure for table `Pesan`
--
DROP TABLE IF EXISTS Pesan;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE Pesan (
  Count int(11) NOT NULL AUTO_INCREMENT,
  Pengirim varchar(50) NOT NULL,
  Penerima varchar(50) NOT NULL,
  IsiPesan longtext,
  Hapus char(1) DEFAULT NULL,
  PRIMARY KEY (Count),
  KEY fk_Pesan_UserAc_idx (Pengirim),
  KEY fk_Pesan_UserAc1_idx (Penerima),
  CONSTRAINT fk_Pesan_UserAc FOREIGN KEY (Pengirim) REFERENCES UserAc (Nama) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_Pesan_UserAc1 FOREIGN KEY (Penerima) REFERENCES UserAc (Nama) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pesan`
--

LOCK TABLES Pesan WRITE;
/*!40000 ALTER TABLE `Pesan` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pesan` ENABLE KEYS */;
UNLOCK TABLES;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-09  8:43:12
