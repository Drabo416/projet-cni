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
