-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: carte
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `individu`
--

DROP TABLE IF EXISTS `individu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individu` (
  `numCNI` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nom` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaiss` date NOT NULL,
  `lieunaiss` text COLLATE utf8mb4_general_ci NOT NULL,
  `heurenaiss` time NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lieuphoto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lieusignature` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `taille` decimal(10,0) NOT NULL,
  `dateenrollement` date NOT NULL,
  `dateemission` date NOT NULL,
  `dateexpiration` date NOT NULL,
  `idprofession` int NOT NULL,
  `idsexe` int NOT NULL,
  `codepays` int NOT NULL,
  `idmere` int DEFAULT NULL,
  `idpere` int DEFAULT NULL,
  PRIMARY KEY (`numCNI`),
  KEY `idprofession` (`idprofession`),
  KEY `idsexe` (`idsexe`),
  KEY `codepays` (`codepays`),
  KEY `FK_mere` (`idmere`),
  KEY `FK_pere` (`idpere`),
  CONSTRAINT `FK_mere` FOREIGN KEY (`idmere`) REFERENCES `mere` (`idmere`),
  CONSTRAINT `FK_pere` FOREIGN KEY (`idpere`) REFERENCES `pere` (`idpere`),
  CONSTRAINT `individu_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`),
  CONSTRAINT `individu_ibfk_2` FOREIGN KEY (`idsexe`) REFERENCES `sexe` (`idsexe`),
  CONSTRAINT `individu_ibfk_3` FOREIGN KEY (`codepays`) REFERENCES `nationalite` (`codepays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individu`
--

LOCK TABLES `individu` WRITE;
/*!40000 ALTER TABLE `individu` DISABLE KEYS */;
INSERT INTO `individu` VALUES ('399ZFS1685563282','mmm','mmmm','2023-06-04','pppp','23:59:00','mmm','/upload/upload1685563280_6477a79030157.jpg','/upload/upload1685563280_6477a790306a8.jpg',15,'2023-05-31','2023-05-31','2024-03-31',1,1,1,5,13);
/*!40000 ALTER TABLE `individu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mere`
--

DROP TABLE IF EXISTS `mere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mere` (
  `idmere` int NOT NULL AUTO_INCREMENT,
  `nommere` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenommere` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaissmere` date NOT NULL,
  `lieunaissmere` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idprofession` int NOT NULL,
  PRIMARY KEY (`idmere`),
  KEY `idprofession` (`idprofession`),
  CONSTRAINT `mere_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mere`
--

LOCK TABLES `mere` WRITE;
/*!40000 ALTER TABLE `mere` DISABLE KEYS */;
INSERT INTO `mere` VALUES (1,'pppp','pppp','2023-06-03','ppppp',1),(2,'mmm','mmmm','2023-05-26','mmmmm',1),(3,'ppp','pppp','2023-05-27','mmmmm',1),(4,'ppp','pppp','2023-05-27','mmmmm',1),(5,'ppp','pppp','2023-05-27','mmmmm',1);
/*!40000 ALTER TABLE `mere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationalite`
--

DROP TABLE IF EXISTS `nationalite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nationalite` (
  `codepays` int NOT NULL AUTO_INCREMENT,
  `libpays` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codepays`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationalite`
--

LOCK TABLES `nationalite` WRITE;
/*!40000 ALTER TABLE `nationalite` DISABLE KEYS */;
INSERT INTO `nationalite` VALUES (1,'ivoirienne'),(2,'française');
/*!40000 ALTER TABLE `nationalite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pere`
--

DROP TABLE IF EXISTS `pere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pere` (
  `idpere` int NOT NULL AUTO_INCREMENT,
  `nompere` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenompere` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaisspere` date NOT NULL,
  `lieunaisspere` text COLLATE utf8mb4_general_ci NOT NULL,
  `idprofession` int NOT NULL,
  PRIMARY KEY (`idpere`),
  KEY `idprofession` (`idprofession`),
  CONSTRAINT `pere_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pere`
--

LOCK TABLES `pere` WRITE;
/*!40000 ALTER TABLE `pere` DISABLE KEYS */;
INSERT INTO `pere` VALUES (1,'ppp','pppp','2023-05-27','mmmm',1),(2,'ppp','pppp','2023-05-27','mmmm',1),(3,'ppp','pppp','2023-05-27','mmmm',1),(4,'ppp','pppp','2023-05-27','mmmm',1),(5,'ppp','pppp','2023-05-27','mmmm',1),(6,'ppp','pppp','2023-05-27','mmmm',1),(7,'ppp','pppp','2023-05-27','mmmm',1),(8,'ppp','pppp','2023-05-27','mmmm',1),(9,'ppp','pppp','2023-05-27','mmmm',1),(10,'mmm','mmmm','2023-05-31','mmmm',1),(11,'ppp','pppp','2023-05-26','mmmm',1),(12,'ppp','pppp','2023-05-26','mmmm',1),(13,'ppp','pppp','2023-05-26','mmmm',1);
/*!40000 ALTER TABLE `pere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professsion`
--

DROP TABLE IF EXISTS `professsion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professsion` (
  `idprofession` int NOT NULL AUTO_INCREMENT,
  `libprofession` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professsion`
--

LOCK TABLES `professsion` WRITE;
/*!40000 ALTER TABLE `professsion` DISABLE KEYS */;
INSERT INTO `professsion` VALUES (1,'professeur'),(2,'etudiant'),(3,'mecanicien'),(4,'secretaire'),(5,'educateur');
/*!40000 ALTER TABLE `professsion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexe`
--

DROP TABLE IF EXISTS `sexe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexe` (
  `idsexe` int NOT NULL AUTO_INCREMENT,
  `libsexe` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idsexe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexe`
--

LOCK TABLES `sexe` WRITE;
/*!40000 ALTER TABLE `sexe` DISABLE KEYS */;
INSERT INTO `sexe` VALUES (1,'Masculin'),(2,'Feminin');
/*!40000 ALTER TABLE `sexe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-31 20:50:44
-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: carte
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `individu`
--

DROP TABLE IF EXISTS `individu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individu` (
  `numCNI` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nom` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaiss` date NOT NULL,
  `lieunaiss` text COLLATE utf8mb4_general_ci NOT NULL,
  `heurenaiss` time NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lieuphoto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lieusignature` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `taille` decimal(10,0) NOT NULL,
  `dateenrollement` date NOT NULL,
  `dateemission` date NOT NULL,
  `dateexpiration` date NOT NULL,
  `idprofession` int NOT NULL,
  `idsexe` int NOT NULL,
  `codepays` int NOT NULL,
  `idmere` int DEFAULT NULL,
  `idpere` int DEFAULT NULL,
  PRIMARY KEY (`numCNI`),
  KEY `idprofession` (`idprofession`),
  KEY `idsexe` (`idsexe`),
  KEY `codepays` (`codepays`),
  KEY `FK_mere` (`idmere`),
  KEY `FK_pere` (`idpere`),
  CONSTRAINT `FK_mere` FOREIGN KEY (`idmere`) REFERENCES `mere` (`idmere`),
  CONSTRAINT `FK_pere` FOREIGN KEY (`idpere`) REFERENCES `pere` (`idpere`),
  CONSTRAINT `individu_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`),
  CONSTRAINT `individu_ibfk_2` FOREIGN KEY (`idsexe`) REFERENCES `sexe` (`idsexe`),
  CONSTRAINT `individu_ibfk_3` FOREIGN KEY (`codepays`) REFERENCES `nationalite` (`codepays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individu`
--

LOCK TABLES `individu` WRITE;
/*!40000 ALTER TABLE `individu` DISABLE KEYS */;
INSERT INTO `individu` VALUES ('399ZFS1685563282','mmm','mmmm','2023-06-04','pppp','23:59:00','mmm','/upload/upload1685563280_6477a79030157.jpg','/upload/upload1685563280_6477a790306a8.jpg',15,'2023-05-31','2023-05-31','2024-03-31',1,1,1,5,13);
/*!40000 ALTER TABLE `individu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mere`
--

DROP TABLE IF EXISTS `mere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mere` (
  `idmere` int NOT NULL AUTO_INCREMENT,
  `nommere` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenommere` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaissmere` date NOT NULL,
  `lieunaissmere` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idprofession` int NOT NULL,
  PRIMARY KEY (`idmere`),
  KEY `idprofession` (`idprofession`),
  CONSTRAINT `mere_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mere`
--

LOCK TABLES `mere` WRITE;
/*!40000 ALTER TABLE `mere` DISABLE KEYS */;
INSERT INTO `mere` VALUES (1,'pppp','pppp','2023-06-03','ppppp',1),(2,'mmm','mmmm','2023-05-26','mmmmm',1),(3,'ppp','pppp','2023-05-27','mmmmm',1),(4,'ppp','pppp','2023-05-27','mmmmm',1),(5,'ppp','pppp','2023-05-27','mmmmm',1);
/*!40000 ALTER TABLE `mere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationalite`
--

DROP TABLE IF EXISTS `nationalite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nationalite` (
  `codepays` int NOT NULL AUTO_INCREMENT,
  `libpays` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codepays`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationalite`
--

LOCK TABLES `nationalite` WRITE;
/*!40000 ALTER TABLE `nationalite` DISABLE KEYS */;
INSERT INTO `nationalite` VALUES (1,'ivoirienne'),(2,'française');
/*!40000 ALTER TABLE `nationalite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pere`
--

DROP TABLE IF EXISTS `pere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pere` (
  `idpere` int NOT NULL AUTO_INCREMENT,
  `nompere` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenompere` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaisspere` date NOT NULL,
  `lieunaisspere` text COLLATE utf8mb4_general_ci NOT NULL,
  `idprofession` int NOT NULL,
  PRIMARY KEY (`idpere`),
  KEY `idprofession` (`idprofession`),
  CONSTRAINT `pere_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pere`
--

LOCK TABLES `pere` WRITE;
/*!40000 ALTER TABLE `pere` DISABLE KEYS */;
INSERT INTO `pere` VALUES (1,'ppp','pppp','2023-05-27','mmmm',1),(2,'ppp','pppp','2023-05-27','mmmm',1),(3,'ppp','pppp','2023-05-27','mmmm',1),(4,'ppp','pppp','2023-05-27','mmmm',1),(5,'ppp','pppp','2023-05-27','mmmm',1),(6,'ppp','pppp','2023-05-27','mmmm',1),(7,'ppp','pppp','2023-05-27','mmmm',1),(8,'ppp','pppp','2023-05-27','mmmm',1),(9,'ppp','pppp','2023-05-27','mmmm',1),(10,'mmm','mmmm','2023-05-31','mmmm',1),(11,'ppp','pppp','2023-05-26','mmmm',1),(12,'ppp','pppp','2023-05-26','mmmm',1),(13,'ppp','pppp','2023-05-26','mmmm',1);
/*!40000 ALTER TABLE `pere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professsion`
--

DROP TABLE IF EXISTS `professsion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professsion` (
  `idprofession` int NOT NULL AUTO_INCREMENT,
  `libprofession` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professsion`
--

LOCK TABLES `professsion` WRITE;
/*!40000 ALTER TABLE `professsion` DISABLE KEYS */;
INSERT INTO `professsion` VALUES (1,'professeur'),(2,'etudiant'),(3,'mecanicien'),(4,'secretaire'),(5,'educateur');
/*!40000 ALTER TABLE `professsion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexe`
--

DROP TABLE IF EXISTS `sexe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexe` (
  `idsexe` int NOT NULL AUTO_INCREMENT,
  `libsexe` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idsexe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexe`
--

LOCK TABLES `sexe` WRITE;
/*!40000 ALTER TABLE `sexe` DISABLE KEYS */;
INSERT INTO `sexe` VALUES (1,'Masculin'),(2,'Feminin');
/*!40000 ALTER TABLE `sexe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-31 20:50:54
-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: carte
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `individu`
--

DROP TABLE IF EXISTS `individu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individu` (
  `numCNI` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nom` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaiss` date NOT NULL,
  `lieunaiss` text COLLATE utf8mb4_general_ci NOT NULL,
  `heurenaiss` time NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lieuphoto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lieusignature` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `taille` decimal(10,0) NOT NULL,
  `dateenrollement` date NOT NULL,
  `dateemission` date NOT NULL,
  `dateexpiration` date NOT NULL,
  `idprofession` int NOT NULL,
  `idsexe` int NOT NULL,
  `codepays` int NOT NULL,
  `idmere` int DEFAULT NULL,
  `idpere` int DEFAULT NULL,
  PRIMARY KEY (`numCNI`),
  KEY `idprofession` (`idprofession`),
  KEY `idsexe` (`idsexe`),
  KEY `codepays` (`codepays`),
  KEY `FK_mere` (`idmere`),
  KEY `FK_pere` (`idpere`),
  CONSTRAINT `FK_mere` FOREIGN KEY (`idmere`) REFERENCES `mere` (`idmere`),
  CONSTRAINT `FK_pere` FOREIGN KEY (`idpere`) REFERENCES `pere` (`idpere`),
  CONSTRAINT `individu_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`),
  CONSTRAINT `individu_ibfk_2` FOREIGN KEY (`idsexe`) REFERENCES `sexe` (`idsexe`),
  CONSTRAINT `individu_ibfk_3` FOREIGN KEY (`codepays`) REFERENCES `nationalite` (`codepays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individu`
--

LOCK TABLES `individu` WRITE;
/*!40000 ALTER TABLE `individu` DISABLE KEYS */;
INSERT INTO `individu` VALUES ('399ZFS1685563282','mmm','mmmm','2023-06-04','pppp','23:59:00','mmm','/upload/upload1685563280_6477a79030157.jpg','/upload/upload1685563280_6477a790306a8.jpg',15,'2023-05-31','2023-05-31','2024-03-31',1,1,1,5,13);
/*!40000 ALTER TABLE `individu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mere`
--

DROP TABLE IF EXISTS `mere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mere` (
  `idmere` int NOT NULL AUTO_INCREMENT,
  `nommere` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenommere` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaissmere` date NOT NULL,
  `lieunaissmere` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idprofession` int NOT NULL,
  PRIMARY KEY (`idmere`),
  KEY `idprofession` (`idprofession`),
  CONSTRAINT `mere_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mere`
--

LOCK TABLES `mere` WRITE;
/*!40000 ALTER TABLE `mere` DISABLE KEYS */;
INSERT INTO `mere` VALUES (1,'pppp','pppp','2023-06-03','ppppp',1),(2,'mmm','mmmm','2023-05-26','mmmmm',1),(3,'ppp','pppp','2023-05-27','mmmmm',1),(4,'ppp','pppp','2023-05-27','mmmmm',1),(5,'ppp','pppp','2023-05-27','mmmmm',1);
/*!40000 ALTER TABLE `mere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationalite`
--

DROP TABLE IF EXISTS `nationalite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nationalite` (
  `codepays` int NOT NULL AUTO_INCREMENT,
  `libpays` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codepays`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationalite`
--

LOCK TABLES `nationalite` WRITE;
/*!40000 ALTER TABLE `nationalite` DISABLE KEYS */;
INSERT INTO `nationalite` VALUES (1,'ivoirienne'),(2,'française');
/*!40000 ALTER TABLE `nationalite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pere`
--

DROP TABLE IF EXISTS `pere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pere` (
  `idpere` int NOT NULL AUTO_INCREMENT,
  `nompere` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenompere` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaisspere` date NOT NULL,
  `lieunaisspere` text COLLATE utf8mb4_general_ci NOT NULL,
  `idprofession` int NOT NULL,
  PRIMARY KEY (`idpere`),
  KEY `idprofession` (`idprofession`),
  CONSTRAINT `pere_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pere`
--

LOCK TABLES `pere` WRITE;
/*!40000 ALTER TABLE `pere` DISABLE KEYS */;
INSERT INTO `pere` VALUES (1,'ppp','pppp','2023-05-27','mmmm',1),(2,'ppp','pppp','2023-05-27','mmmm',1),(3,'ppp','pppp','2023-05-27','mmmm',1),(4,'ppp','pppp','2023-05-27','mmmm',1),(5,'ppp','pppp','2023-05-27','mmmm',1),(6,'ppp','pppp','2023-05-27','mmmm',1),(7,'ppp','pppp','2023-05-27','mmmm',1),(8,'ppp','pppp','2023-05-27','mmmm',1),(9,'ppp','pppp','2023-05-27','mmmm',1),(10,'mmm','mmmm','2023-05-31','mmmm',1),(11,'ppp','pppp','2023-05-26','mmmm',1),(12,'ppp','pppp','2023-05-26','mmmm',1),(13,'ppp','pppp','2023-05-26','mmmm',1);
/*!40000 ALTER TABLE `pere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professsion`
--

DROP TABLE IF EXISTS `professsion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professsion` (
  `idprofession` int NOT NULL AUTO_INCREMENT,
  `libprofession` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professsion`
--

LOCK TABLES `professsion` WRITE;
/*!40000 ALTER TABLE `professsion` DISABLE KEYS */;
INSERT INTO `professsion` VALUES (1,'professeur'),(2,'etudiant'),(3,'mecanicien'),(4,'secretaire'),(5,'educateur');
/*!40000 ALTER TABLE `professsion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexe`
--

DROP TABLE IF EXISTS `sexe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexe` (
  `idsexe` int NOT NULL AUTO_INCREMENT,
  `libsexe` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idsexe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexe`
--

LOCK TABLES `sexe` WRITE;
/*!40000 ALTER TABLE `sexe` DISABLE KEYS */;
INSERT INTO `sexe` VALUES (1,'Masculin'),(2,'Feminin');
/*!40000 ALTER TABLE `sexe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-31 20:51:13
-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: carte
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `individu`
--

DROP TABLE IF EXISTS `individu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individu` (
  `numCNI` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nom` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaiss` date NOT NULL,
  `lieunaiss` text COLLATE utf8mb4_general_ci NOT NULL,
  `heurenaiss` time NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lieuphoto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lieusignature` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `taille` decimal(10,0) NOT NULL,
  `dateenrollement` date NOT NULL,
  `dateemission` date NOT NULL,
  `dateexpiration` date NOT NULL,
  `idprofession` int NOT NULL,
  `idsexe` int NOT NULL,
  `codepays` int NOT NULL,
  `idmere` int DEFAULT NULL,
  `idpere` int DEFAULT NULL,
  PRIMARY KEY (`numCNI`),
  KEY `idprofession` (`idprofession`),
  KEY `idsexe` (`idsexe`),
  KEY `codepays` (`codepays`),
  KEY `FK_mere` (`idmere`),
  KEY `FK_pere` (`idpere`),
  CONSTRAINT `FK_mere` FOREIGN KEY (`idmere`) REFERENCES `mere` (`idmere`),
  CONSTRAINT `FK_pere` FOREIGN KEY (`idpere`) REFERENCES `pere` (`idpere`),
  CONSTRAINT `individu_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`),
  CONSTRAINT `individu_ibfk_2` FOREIGN KEY (`idsexe`) REFERENCES `sexe` (`idsexe`),
  CONSTRAINT `individu_ibfk_3` FOREIGN KEY (`codepays`) REFERENCES `nationalite` (`codepays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individu`
--

LOCK TABLES `individu` WRITE;
/*!40000 ALTER TABLE `individu` DISABLE KEYS */;
INSERT INTO `individu` VALUES ('399ZFS1685563282','mmm','mmmm','2023-06-04','pppp','23:59:00','mmm','/upload/upload1685563280_6477a79030157.jpg','/upload/upload1685563280_6477a790306a8.jpg',15,'2023-05-31','2023-05-31','2024-03-31',1,1,1,5,13);
/*!40000 ALTER TABLE `individu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mere`
--

DROP TABLE IF EXISTS `mere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mere` (
  `idmere` int NOT NULL AUTO_INCREMENT,
  `nommere` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenommere` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaissmere` date NOT NULL,
  `lieunaissmere` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idprofession` int NOT NULL,
  PRIMARY KEY (`idmere`),
  KEY `idprofession` (`idprofession`),
  CONSTRAINT `mere_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mere`
--

LOCK TABLES `mere` WRITE;
/*!40000 ALTER TABLE `mere` DISABLE KEYS */;
INSERT INTO `mere` VALUES (1,'pppp','pppp','2023-06-03','ppppp',1),(2,'mmm','mmmm','2023-05-26','mmmmm',1),(3,'ppp','pppp','2023-05-27','mmmmm',1),(4,'ppp','pppp','2023-05-27','mmmmm',1),(5,'ppp','pppp','2023-05-27','mmmmm',1);
/*!40000 ALTER TABLE `mere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationalite`
--

DROP TABLE IF EXISTS `nationalite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nationalite` (
  `codepays` int NOT NULL AUTO_INCREMENT,
  `libpays` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codepays`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationalite`
--

LOCK TABLES `nationalite` WRITE;
/*!40000 ALTER TABLE `nationalite` DISABLE KEYS */;
INSERT INTO `nationalite` VALUES (1,'ivoirienne'),(2,'française');
/*!40000 ALTER TABLE `nationalite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pere`
--

DROP TABLE IF EXISTS `pere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pere` (
  `idpere` int NOT NULL AUTO_INCREMENT,
  `nompere` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenompere` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaisspere` date NOT NULL,
  `lieunaisspere` text COLLATE utf8mb4_general_ci NOT NULL,
  `idprofession` int NOT NULL,
  PRIMARY KEY (`idpere`),
  KEY `idprofession` (`idprofession`),
  CONSTRAINT `pere_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pere`
--

LOCK TABLES `pere` WRITE;
/*!40000 ALTER TABLE `pere` DISABLE KEYS */;
INSERT INTO `pere` VALUES (1,'ppp','pppp','2023-05-27','mmmm',1),(2,'ppp','pppp','2023-05-27','mmmm',1),(3,'ppp','pppp','2023-05-27','mmmm',1),(4,'ppp','pppp','2023-05-27','mmmm',1),(5,'ppp','pppp','2023-05-27','mmmm',1),(6,'ppp','pppp','2023-05-27','mmmm',1),(7,'ppp','pppp','2023-05-27','mmmm',1),(8,'ppp','pppp','2023-05-27','mmmm',1),(9,'ppp','pppp','2023-05-27','mmmm',1),(10,'mmm','mmmm','2023-05-31','mmmm',1),(11,'ppp','pppp','2023-05-26','mmmm',1),(12,'ppp','pppp','2023-05-26','mmmm',1),(13,'ppp','pppp','2023-05-26','mmmm',1);
/*!40000 ALTER TABLE `pere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professsion`
--

DROP TABLE IF EXISTS `professsion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professsion` (
  `idprofession` int NOT NULL AUTO_INCREMENT,
  `libprofession` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professsion`
--

LOCK TABLES `professsion` WRITE;
/*!40000 ALTER TABLE `professsion` DISABLE KEYS */;
INSERT INTO `professsion` VALUES (1,'professeur'),(2,'etudiant'),(3,'mecanicien'),(4,'secretaire'),(5,'educateur');
/*!40000 ALTER TABLE `professsion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexe`
--

DROP TABLE IF EXISTS `sexe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexe` (
  `idsexe` int NOT NULL AUTO_INCREMENT,
  `libsexe` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idsexe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexe`
--

LOCK TABLES `sexe` WRITE;
/*!40000 ALTER TABLE `sexe` DISABLE KEYS */;
INSERT INTO `sexe` VALUES (1,'Masculin'),(2,'Feminin');
/*!40000 ALTER TABLE `sexe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-31 20:51:34
-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: carte
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `individu`
--

DROP TABLE IF EXISTS `individu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individu` (
  `numCNI` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nom` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaiss` date NOT NULL,
  `lieunaiss` text COLLATE utf8mb4_general_ci NOT NULL,
  `heurenaiss` time NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lieuphoto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lieusignature` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `taille` decimal(10,0) NOT NULL,
  `dateenrollement` date NOT NULL,
  `dateemission` date NOT NULL,
  `dateexpiration` date NOT NULL,
  `idprofession` int NOT NULL,
  `idsexe` int NOT NULL,
  `codepays` int NOT NULL,
  `idmere` int DEFAULT NULL,
  `idpere` int DEFAULT NULL,
  PRIMARY KEY (`numCNI`),
  KEY `idprofession` (`idprofession`),
  KEY `idsexe` (`idsexe`),
  KEY `codepays` (`codepays`),
  KEY `FK_mere` (`idmere`),
  KEY `FK_pere` (`idpere`),
  CONSTRAINT `FK_mere` FOREIGN KEY (`idmere`) REFERENCES `mere` (`idmere`),
  CONSTRAINT `FK_pere` FOREIGN KEY (`idpere`) REFERENCES `pere` (`idpere`),
  CONSTRAINT `individu_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`),
  CONSTRAINT `individu_ibfk_2` FOREIGN KEY (`idsexe`) REFERENCES `sexe` (`idsexe`),
  CONSTRAINT `individu_ibfk_3` FOREIGN KEY (`codepays`) REFERENCES `nationalite` (`codepays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individu`
--

LOCK TABLES `individu` WRITE;
/*!40000 ALTER TABLE `individu` DISABLE KEYS */;
INSERT INTO `individu` VALUES ('399ZFS1685563282','mmm','mmmm','2023-06-04','pppp','23:59:00','mmm','/upload/upload1685563280_6477a79030157.jpg','/upload/upload1685563280_6477a790306a8.jpg',15,'2023-05-31','2023-05-31','2024-03-31',1,1,1,5,13);
/*!40000 ALTER TABLE `individu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mere`
--

DROP TABLE IF EXISTS `mere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mere` (
  `idmere` int NOT NULL AUTO_INCREMENT,
  `nommere` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenommere` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaissmere` date NOT NULL,
  `lieunaissmere` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idprofession` int NOT NULL,
  PRIMARY KEY (`idmere`),
  KEY `idprofession` (`idprofession`),
  CONSTRAINT `mere_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mere`
--

LOCK TABLES `mere` WRITE;
/*!40000 ALTER TABLE `mere` DISABLE KEYS */;
INSERT INTO `mere` VALUES (1,'pppp','pppp','2023-06-03','ppppp',1),(2,'mmm','mmmm','2023-05-26','mmmmm',1),(3,'ppp','pppp','2023-05-27','mmmmm',1),(4,'ppp','pppp','2023-05-27','mmmmm',1),(5,'ppp','pppp','2023-05-27','mmmmm',1);
/*!40000 ALTER TABLE `mere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationalite`
--

DROP TABLE IF EXISTS `nationalite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nationalite` (
  `codepays` int NOT NULL AUTO_INCREMENT,
  `libpays` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codepays`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationalite`
--

LOCK TABLES `nationalite` WRITE;
/*!40000 ALTER TABLE `nationalite` DISABLE KEYS */;
INSERT INTO `nationalite` VALUES (1,'ivoirienne'),(2,'française');
/*!40000 ALTER TABLE `nationalite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pere`
--

DROP TABLE IF EXISTS `pere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pere` (
  `idpere` int NOT NULL AUTO_INCREMENT,
  `nompere` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenompere` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaisspere` date NOT NULL,
  `lieunaisspere` text COLLATE utf8mb4_general_ci NOT NULL,
  `idprofession` int NOT NULL,
  PRIMARY KEY (`idpere`),
  KEY `idprofession` (`idprofession`),
  CONSTRAINT `pere_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pere`
--

LOCK TABLES `pere` WRITE;
/*!40000 ALTER TABLE `pere` DISABLE KEYS */;
INSERT INTO `pere` VALUES (1,'ppp','pppp','2023-05-27','mmmm',1),(2,'ppp','pppp','2023-05-27','mmmm',1),(3,'ppp','pppp','2023-05-27','mmmm',1),(4,'ppp','pppp','2023-05-27','mmmm',1),(5,'ppp','pppp','2023-05-27','mmmm',1),(6,'ppp','pppp','2023-05-27','mmmm',1),(7,'ppp','pppp','2023-05-27','mmmm',1),(8,'ppp','pppp','2023-05-27','mmmm',1),(9,'ppp','pppp','2023-05-27','mmmm',1),(10,'mmm','mmmm','2023-05-31','mmmm',1),(11,'ppp','pppp','2023-05-26','mmmm',1),(12,'ppp','pppp','2023-05-26','mmmm',1),(13,'ppp','pppp','2023-05-26','mmmm',1);
/*!40000 ALTER TABLE `pere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professsion`
--

DROP TABLE IF EXISTS `professsion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professsion` (
  `idprofession` int NOT NULL AUTO_INCREMENT,
  `libprofession` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professsion`
--

LOCK TABLES `professsion` WRITE;
/*!40000 ALTER TABLE `professsion` DISABLE KEYS */;
INSERT INTO `professsion` VALUES (1,'professeur'),(2,'etudiant'),(3,'mecanicien'),(4,'secretaire'),(5,'educateur');
/*!40000 ALTER TABLE `professsion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexe`
--

DROP TABLE IF EXISTS `sexe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexe` (
  `idsexe` int NOT NULL AUTO_INCREMENT,
  `libsexe` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idsexe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexe`
--

LOCK TABLES `sexe` WRITE;
/*!40000 ALTER TABLE `sexe` DISABLE KEYS */;
INSERT INTO `sexe` VALUES (1,'Masculin'),(2,'Feminin');
/*!40000 ALTER TABLE `sexe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-31 20:53:19
-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: carte
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `individu`
--

DROP TABLE IF EXISTS `individu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individu` (
  `numCNI` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nom` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaiss` date NOT NULL,
  `lieunaiss` text COLLATE utf8mb4_general_ci NOT NULL,
  `heurenaiss` time NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lieuphoto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lieusignature` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `taille` decimal(10,0) NOT NULL,
  `dateenrollement` date NOT NULL,
  `dateemission` date NOT NULL,
  `dateexpiration` date NOT NULL,
  `idprofession` int NOT NULL,
  `idsexe` int NOT NULL,
  `codepays` int NOT NULL,
  `idmere` int DEFAULT NULL,
  `idpere` int DEFAULT NULL,
  PRIMARY KEY (`numCNI`),
  KEY `idprofession` (`idprofession`),
  KEY `idsexe` (`idsexe`),
  KEY `codepays` (`codepays`),
  KEY `FK_mere` (`idmere`),
  KEY `FK_pere` (`idpere`),
  CONSTRAINT `FK_mere` FOREIGN KEY (`idmere`) REFERENCES `mere` (`idmere`),
  CONSTRAINT `FK_pere` FOREIGN KEY (`idpere`) REFERENCES `pere` (`idpere`),
  CONSTRAINT `individu_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`),
  CONSTRAINT `individu_ibfk_2` FOREIGN KEY (`idsexe`) REFERENCES `sexe` (`idsexe`),
  CONSTRAINT `individu_ibfk_3` FOREIGN KEY (`codepays`) REFERENCES `nationalite` (`codepays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individu`
--

LOCK TABLES `individu` WRITE;
/*!40000 ALTER TABLE `individu` DISABLE KEYS */;
INSERT INTO `individu` VALUES ('399ZFS1685563282','mmm','mmmm','2023-06-04','pppp','23:59:00','mmm','/upload/upload1685563280_6477a79030157.jpg','/upload/upload1685563280_6477a790306a8.jpg',15,'2023-05-31','2023-05-31','2024-03-31',1,1,1,5,13);
/*!40000 ALTER TABLE `individu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mere`
--

DROP TABLE IF EXISTS `mere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mere` (
  `idmere` int NOT NULL AUTO_INCREMENT,
  `nommere` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenommere` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaissmere` date NOT NULL,
  `lieunaissmere` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idprofession` int NOT NULL,
  PRIMARY KEY (`idmere`),
  KEY `idprofession` (`idprofession`),
  CONSTRAINT `mere_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mere`
--

LOCK TABLES `mere` WRITE;
/*!40000 ALTER TABLE `mere` DISABLE KEYS */;
INSERT INTO `mere` VALUES (1,'pppp','pppp','2023-06-03','ppppp',1),(2,'mmm','mmmm','2023-05-26','mmmmm',1),(3,'ppp','pppp','2023-05-27','mmmmm',1),(4,'ppp','pppp','2023-05-27','mmmmm',1),(5,'ppp','pppp','2023-05-27','mmmmm',1);
/*!40000 ALTER TABLE `mere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationalite`
--

DROP TABLE IF EXISTS `nationalite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nationalite` (
  `codepays` int NOT NULL AUTO_INCREMENT,
  `libpays` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codepays`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationalite`
--

LOCK TABLES `nationalite` WRITE;
/*!40000 ALTER TABLE `nationalite` DISABLE KEYS */;
INSERT INTO `nationalite` VALUES (1,'ivoirienne'),(2,'française');
/*!40000 ALTER TABLE `nationalite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pere`
--

DROP TABLE IF EXISTS `pere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pere` (
  `idpere` int NOT NULL AUTO_INCREMENT,
  `nompere` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenompere` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaisspere` date NOT NULL,
  `lieunaisspere` text COLLATE utf8mb4_general_ci NOT NULL,
  `idprofession` int NOT NULL,
  PRIMARY KEY (`idpere`),
  KEY `idprofession` (`idprofession`),
  CONSTRAINT `pere_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pere`
--

LOCK TABLES `pere` WRITE;
/*!40000 ALTER TABLE `pere` DISABLE KEYS */;
INSERT INTO `pere` VALUES (1,'ppp','pppp','2023-05-27','mmmm',1),(2,'ppp','pppp','2023-05-27','mmmm',1),(3,'ppp','pppp','2023-05-27','mmmm',1),(4,'ppp','pppp','2023-05-27','mmmm',1),(5,'ppp','pppp','2023-05-27','mmmm',1),(6,'ppp','pppp','2023-05-27','mmmm',1),(7,'ppp','pppp','2023-05-27','mmmm',1),(8,'ppp','pppp','2023-05-27','mmmm',1),(9,'ppp','pppp','2023-05-27','mmmm',1),(10,'mmm','mmmm','2023-05-31','mmmm',1),(11,'ppp','pppp','2023-05-26','mmmm',1),(12,'ppp','pppp','2023-05-26','mmmm',1),(13,'ppp','pppp','2023-05-26','mmmm',1);
/*!40000 ALTER TABLE `pere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professsion`
--

DROP TABLE IF EXISTS `professsion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professsion` (
  `idprofession` int NOT NULL AUTO_INCREMENT,
  `libprofession` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professsion`
--

LOCK TABLES `professsion` WRITE;
/*!40000 ALTER TABLE `professsion` DISABLE KEYS */;
INSERT INTO `professsion` VALUES (1,'professeur'),(2,'etudiant'),(3,'mecanicien'),(4,'secretaire'),(5,'educateur');
/*!40000 ALTER TABLE `professsion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexe`
--

DROP TABLE IF EXISTS `sexe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexe` (
  `idsexe` int NOT NULL AUTO_INCREMENT,
  `libsexe` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idsexe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexe`
--

LOCK TABLES `sexe` WRITE;
/*!40000 ALTER TABLE `sexe` DISABLE KEYS */;
INSERT INTO `sexe` VALUES (1,'Masculin'),(2,'Feminin');
/*!40000 ALTER TABLE `sexe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-31 20:53:41
-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: carte
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'drabom123@gmail.com','123456');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `individu`
--

DROP TABLE IF EXISTS `individu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individu` (
  `numCNI` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nom` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaiss` date NOT NULL,
  `lieunaiss` text COLLATE utf8mb4_general_ci NOT NULL,
  `heurenaiss` time NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lieuphoto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lieusignature` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `taille` decimal(10,0) NOT NULL,
  `dateenrollement` date NOT NULL,
  `dateemission` datetime DEFAULT NULL,
  `dateexpiration` date NOT NULL,
  `idprofession` int NOT NULL,
  `idsexe` int NOT NULL,
  `codepays` int NOT NULL,
  `idmere` int DEFAULT NULL,
  `idpere` int DEFAULT NULL,
  PRIMARY KEY (`numCNI`),
  KEY `idprofession` (`idprofession`),
  KEY `idsexe` (`idsexe`),
  KEY `codepays` (`codepays`),
  KEY `FK_mere` (`idmere`),
  KEY `FK_pere` (`idpere`),
  CONSTRAINT `FK_mere` FOREIGN KEY (`idmere`) REFERENCES `mere` (`idmere`),
  CONSTRAINT `FK_pere` FOREIGN KEY (`idpere`) REFERENCES `pere` (`idpere`),
  CONSTRAINT `individu_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`),
  CONSTRAINT `individu_ibfk_2` FOREIGN KEY (`idsexe`) REFERENCES `sexe` (`idsexe`),
  CONSTRAINT `individu_ibfk_3` FOREIGN KEY (`codepays`) REFERENCES `nationalite` (`codepays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individu`
--

LOCK TABLES `individu` WRITE;
/*!40000 ALTER TABLE `individu` DISABLE KEYS */;
INSERT INTO `individu` VALUES ('126RSJ1685696893','toure','mohamed','2023-06-03','Bouake','10:01:00','1234','/upload/upload1685696891_6479b17b9e0e8.jpeg','/upload/upload1685696891_6479b17b9e30b.jpeg',2,'2023-06-02','2023-06-02 09:08:13','2024-04-02',2,1,1,25,32),('362KNG1685696804','Ahmed','zeinabou','2023-06-03','Bouake','10:01:00','13456','/upload/upload1685696804_6479b1241e6e9.jpeg','/upload/upload1685696804_6479b1241ea27.jpeg',2,'2023-06-02','2023-06-02 09:06:44','2024-04-02',2,2,1,24,31),('462IYM1685696431','dfes','csdf','2023-06-09','dzr','10:59:00','123456','/upload/upload1685696430_6479afae9c24d.jpeg','/upload/upload1685696430_6479afae9c626.jpeg',180,'2023-06-02','2023-06-02 09:00:31','2024-04-02',1,1,1,22,29),('481TSL1685697403','Mensah','luc','2023-06-03','Bouake','10:01:00','1234','/upload/upload1685697402_6479b37ae73a9.jpeg','/upload/upload1685697402_6479b37ae75de.jpeg',2,'2023-06-02','2023-06-02 09:16:43','2024-04-02',3,1,1,26,33),('515BMR1685696591','Drabo','Mohamed','2023-06-03','Bouake','10:01:00','1234','/upload/upload1685696588_6479b04c218a7.jpeg','/upload/upload1685696588_6479b04c21b69.jpeg',786,'2023-06-02','2023-06-02 09:03:11','2024-04-02',1,1,1,23,30),('629XJF1685699886','drogba','didier','2023-06-09','abidjan','09:58:00','12345','/upload/upload1685699885_6479bd2df1351.jpeg','/upload/upload1685699885_6479bd2df161b.jpeg',187,'2023-06-02','2023-06-02 09:58:06','2024-04-02',1,1,1,27,34);
/*!40000 ALTER TABLE `individu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mere`
--

DROP TABLE IF EXISTS `mere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mere` (
  `idmere` int NOT NULL AUTO_INCREMENT,
  `nommere` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenommere` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaissmere` date NOT NULL,
  `lieunaissmere` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idprofession` int NOT NULL,
  PRIMARY KEY (`idmere`),
  KEY `idprofession` (`idprofession`),
  CONSTRAINT `mere_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mere`
--

LOCK TABLES `mere` WRITE;
/*!40000 ALTER TABLE `mere` DISABLE KEYS */;
INSERT INTO `mere` VALUES (22,'dzadf','dzef','2023-06-10','mmmm',1),(23,'dzadf','ssde','2023-06-03','bouake',1),(24,'dzadf','ssde','2023-06-03','bouake',1),(25,'dzadf','ssde','2023-06-03','bouake',1),(26,'dzadf','ssde','2023-06-03','bouake',1),(27,'ghjkk','dfghh','2023-06-15','bouhh',1);
/*!40000 ALTER TABLE `mere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationalite`
--

DROP TABLE IF EXISTS `nationalite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nationalite` (
  `codepays` int NOT NULL AUTO_INCREMENT,
  `libpays` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codepays`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationalite`
--

LOCK TABLES `nationalite` WRITE;
/*!40000 ALTER TABLE `nationalite` DISABLE KEYS */;
INSERT INTO `nationalite` VALUES (1,'ivoirienne'),(2,'française');
/*!40000 ALTER TABLE `nationalite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pere`
--

DROP TABLE IF EXISTS `pere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pere` (
  `idpere` int NOT NULL AUTO_INCREMENT,
  `nompere` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenompere` text COLLATE utf8mb4_general_ci NOT NULL,
  `datenaisspere` date NOT NULL,
  `lieunaisspere` text COLLATE utf8mb4_general_ci NOT NULL,
  `idprofession` int NOT NULL,
  PRIMARY KEY (`idpere`),
  KEY `idprofession` (`idprofession`),
  CONSTRAINT `pere_ibfk_1` FOREIGN KEY (`idprofession`) REFERENCES `professsion` (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pere`
--

LOCK TABLES `pere` WRITE;
/*!40000 ALTER TABLE `pere` DISABLE KEYS */;
INSERT INTO `pere` VALUES (29,'sazde','zda','2023-06-09','dzad',1),(30,'DRABO','aziz','2023-06-03','bouake',1),(31,'ahmed','mohamed','2023-06-03','bouake',1),(32,'ahmed','mohamed','2023-06-03','bouake',1),(33,'ahmed','mohamed','2023-06-03','bouake',1),(34,'drogba','ghhh','2023-06-07','ghjk',1);
/*!40000 ALTER TABLE `pere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professsion`
--

DROP TABLE IF EXISTS `professsion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professsion` (
  `idprofession` int NOT NULL AUTO_INCREMENT,
  `libprofession` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idprofession`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professsion`
--

LOCK TABLES `professsion` WRITE;
/*!40000 ALTER TABLE `professsion` DISABLE KEYS */;
INSERT INTO `professsion` VALUES (1,'professeur'),(2,'etudiant'),(3,'mecanicien'),(4,'secretaire'),(5,'educateur');
/*!40000 ALTER TABLE `professsion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexe`
--

DROP TABLE IF EXISTS `sexe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexe` (
  `idsexe` int NOT NULL AUTO_INCREMENT,
  `libsexe` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idsexe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexe`
--

LOCK TABLES `sexe` WRITE;
/*!40000 ALTER TABLE `sexe` DISABLE KEYS */;
INSERT INTO `sexe` VALUES (1,'Masculin'),(2,'Feminin');
/*!40000 ALTER TABLE `sexe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-02 10:07:29
