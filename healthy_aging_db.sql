CREATE DATABASE  IF NOT EXISTS `puebla` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `puebla`;
-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (x86_64)
--
-- Host: localhost    Database: puebla
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `2019_ques`
--

DROP TABLE IF EXISTS `2019_ques`;
/*!50001 DROP VIEW IF EXISTS `2019_ques`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `2019_ques` AS SELECT 
 1 AS `q_cat`,
 1 AS `data_type`,
 1 AS `q_topic`,
 1 AS `question`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `age`
--

DROP TABLE IF EXISTS `age`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age` (
  `age_id_PK` int NOT NULL,
  `age` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`age_id_PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `age`
--

LOCK TABLES `age` WRITE;
/*!40000 ALTER TABLE `age` DISABLE KEYS */;
INSERT INTO `age` VALUES (1,'50_to_64'),(2,'65_and_older'),(3,'age_overall');
/*!40000 ALTER TABLE `age` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `age_demog`
--

DROP TABLE IF EXISTS `age_demog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age_demog` (
  `age_demog_id_PK` int NOT NULL,
  `age_id_FK` int DEFAULT NULL,
  `demog_id_FK` int DEFAULT NULL,
  PRIMARY KEY (`age_demog_id_PK`),
  KEY `age_id_FK_idx` (`age_id_FK`),
  KEY `demog_id_FK_idx` (`demog_id_FK`),
  CONSTRAINT `age_id_FK` FOREIGN KEY (`age_id_FK`) REFERENCES `age` (`age_id_PK`),
  CONSTRAINT `demog_id_FK` FOREIGN KEY (`demog_id_FK`) REFERENCES `demog` (`demog_id_PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `age_demog`
--

LOCK TABLES `age_demog` WRITE;
/*!40000 ALTER TABLE `age_demog` DISABLE KEYS */;
INSERT INTO `age_demog` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,2,1),(10,2,2),(11,2,3),(12,2,4),(13,2,5),(14,2,6),(15,2,7),(16,2,8),(17,3,1),(18,3,2),(19,3,3),(20,3,4),(21,3,5),(22,3,6),(23,3,7),(24,3,8);
/*!40000 ALTER TABLE `age_demog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `all_ques_and_demog`
--

DROP TABLE IF EXISTS `all_ques_and_demog`;
/*!50001 DROP VIEW IF EXISTS `all_ques_and_demog`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_ques_and_demog` AS SELECT 
 1 AS `year`,
 1 AS `loc_desc`,
 1 AS `q_cat`,
 1 AS `q_topic`,
 1 AS `question`,
 1 AS `demog_cat`,
 1 AS `demog_spec`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data` (
  `response_id_PK` int NOT NULL,
  `year_loc_id_FK` int DEFAULT NULL,
  `age_demog_id_FK` int DEFAULT NULL,
  `q_id_FK` int DEFAULT NULL,
  `data_value` decimal(3,1) DEFAULT NULL,
  `low_conf_lim` decimal(3,1) DEFAULT NULL,
  `high_conf_lim` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`response_id_PK`),
  KEY `q_id_FK_idx` (`q_id_FK`),
  KEY `age_demog_id_FK_idx` (`age_demog_id_FK`),
  KEY `year_loc_id_FK` (`year_loc_id_FK`),
  CONSTRAINT `age_demog_id_FK` FOREIGN KEY (`age_demog_id_FK`) REFERENCES `age_demog` (`age_demog_id_PK`),
  CONSTRAINT `q_id_FK` FOREIGN KEY (`q_id_FK`) REFERENCES `questions` (`q_id_PK`),
  CONSTRAINT `year_loc_id_FK` FOREIGN KEY (`year_loc_id_FK`) REFERENCES `year_loc` (`year_loc_id_PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES (1,57,17,5,18.0,16.4,19.8),(2,57,17,10,26.3,24.2,28.6),(3,57,17,10,33.9,27.9,40.6),(4,57,17,10,16.4,14.4,18.7),(5,57,17,14,36.5,34.3,38.8),(6,57,17,14,36.2,33.5,39.1),(7,57,17,27,16.7,15.5,18.1),(8,57,17,32,30.2,28.2,32.3),(9,57,17,38,82.4,80.5,84.2),(10,57,17,38,4.4,4.1,4.7),(11,57,17,38,4.7,4.3,5.1),(12,57,17,39,21.8,20.4,23.2),(13,57,17,39,37.5,35.2,39.9),(14,57,17,39,94.6,93.4,95.5),(15,58,17,5,46.6,44.3,48.9),(16,58,17,5,25.2,23.1,27.4),(17,58,17,10,83.9,81.2,86.2),(18,58,17,10,16.3,15.1,17.6),(19,58,17,10,10.9,9.5,12.3),(20,58,17,14,84.1,82.4,85.7),(21,58,17,14,28.6,26.3,30.9),(22,58,17,14,15.9,14.3,17.6),(23,58,17,14,27.5,25.1,30.0),(24,58,17,27,4.5,4.1,4.8),(25,58,17,27,64.7,62.6,66.9),(26,58,17,32,66.1,64.3,67.8),(27,58,17,38,32.3,27.9,36.9),(28,58,17,38,17.6,16.4,19.0),(29,58,17,38,23.2,19.4,27.4),(30,58,17,38,10.6,9.8,11.5),(31,58,17,39,31.5,29.5,33.5),(32,58,17,39,4.3,4.1,4.6),(33,59,17,5,78.1,74.8,81.1),(34,59,17,5,32.9,21.0,47.4),(35,59,17,5,24.0,14.7,36.8),(36,59,17,10,49.6,47.1,52.1),(37,59,17,10,11.6,10.2,13.2),(38,59,17,10,43.6,42.2,45.0),(39,59,17,10,9.0,7.8,10.4),(40,59,17,14,21.9,19.9,24.1),(41,59,17,14,6.6,5.8,7.5),(42,59,17,14,14.4,12.9,16.1),(43,59,17,14,15.3,14.0,16.6),(44,59,17,14,49.6,47.4,51.7),(45,59,17,14,11.3,10.2,12.7),(46,59,17,27,22.7,20.0,25.6),(47,59,17,27,24.9,22.1,27.9),(48,59,17,32,6.0,5.2,6.9),(49,59,17,32,9.2,5.7,14.5),(50,59,17,32,16.5,11.3,23.5),(51,59,17,32,83.0,73.7,89.4),(52,59,17,32,70.2,68.3,72.1),(53,59,17,38,41.2,39.5,43.0),(54,59,17,38,82.3,80.5,84.0),(55,59,17,38,21.8,18.7,25.2),(56,59,17,38,39.3,36.9,41.7),(57,59,17,38,95.5,94.7,96.2),(58,59,17,39,54.9,53.1,56.6),(59,59,17,39,16.7,14.7,18.9),(60,59,17,39,35.3,26.7,45.0),(61,59,17,39,75.7,71.5,79.5),(62,60,17,5,27.1,19.3,36.5),(63,60,17,5,32.5,18.3,50.7),(64,60,17,5,49.2,32.1,66.4),(65,60,17,10,62.7,61.8,63.6),(66,60,17,10,4.3,4.2,4.5),(67,60,17,10,6.8,5.5,8.3),(68,60,17,14,61.0,60.2,61.8),(69,60,17,14,73.8,67.4,79.4),(70,60,17,14,15.3,12.9,17.9),(71,60,17,14,14.0,13.5,14.5),(72,60,17,27,33.8,33.1,34.6),(73,60,17,27,27.6,26.5,28.8),(74,60,17,32,36.2,25.1,49.0),(75,60,17,32,91.8,81.1,96.7),(76,60,17,38,59.5,56.7,62.2),(77,60,17,38,16.3,15.7,16.9),(78,60,17,38,60.2,55.2,65.0),(79,60,17,39,80.0,79.4,80.6),(80,60,17,39,81.6,71.3,88.8),(81,60,17,39,5.8,5.5,6.0),(82,60,17,39,17.0,10.3,26.7),(83,60,17,39,5.4,3.3,7.5),(84,61,17,5,39.5,38.1,40.9),(85,61,17,10,16.2,15.1,17.4),(86,61,17,14,94.9,94.3,95.3),(87,61,17,27,6.6,6.2,7.0),(88,61,17,38,56.1,54.9,57.4),(89,61,17,39,16.4,15.6,17.3),(90,57,18,5,23.6,21.1,26.2),(91,57,18,10,18.2,15.3,21.6),(92,57,18,10,39.6,31.1,48.7),(93,57,18,14,37.4,33.7,41.1),(94,57,18,14,37.9,34.8,41.1),(95,57,18,14,19.5,16.6,22.8),(96,57,18,27,16.7,15.0,18.6),(97,57,18,32,31.0,28.2,33.9),(98,57,18,38,4.7,4.3,5.1),(99,57,18,38,5.2,4.6,5.7),(100,57,18,39,24.3,22.3,26.4),(101,57,18,39,96.3,95.2,97.2),(102,58,18,5,30.0,27.0,33.2),(103,58,18,5,12.7,10.8,15.0),(104,58,18,10,88.2,85.4,90.5),(105,58,18,10,21.2,19.4,23.1),(106,58,18,14,16.8,14.6,19.2),(107,58,18,14,83.2,80.8,85.4),(108,58,18,14,30.5,27.5,33.6),(109,58,18,14,31.5,28.3,34.8),(110,58,18,27,67.1,64.3,69.9),(111,58,18,32,69.4,67.0,71.6),(112,58,18,32,29.2,27.4,31.2),(113,58,18,38,25.2,20.4,30.7),(114,58,18,38,37.6,31.9,43.6),(115,58,18,38,11.9,10.7,13.2),(116,58,18,39,31.0,28.2,33.8),(117,58,18,39,4.6,4.3,5.0),(118,59,18,5,77.4,73.1,81.2),(119,59,18,5,42.1,37.3,47.0),(120,59,18,5,32.0,18.4,49.5),(121,59,18,5,27.7,16.8,42.0),(122,59,18,5,43.5,33.6,53.9),(123,59,18,10,11.6,9.7,13.7),(124,59,18,10,50.6,47.3,53.9),(125,59,18,10,48.3,46.3,50.3),(126,59,18,14,13.2,11.5,15.1),(127,59,18,14,10.8,9.2,12.7),(128,59,18,14,26.5,23.6,29.5),(129,59,18,14,19.0,17.2,21.0),(130,59,18,14,47.7,44.8,50.5),(131,59,18,27,23.8,20.4,27.6),(132,59,18,32,4.5,2.9,7.1),(133,59,18,32,79.0,62.5,89.5),(134,59,18,32,3.1,2.3,4.0),(135,59,18,38,22.4,18.7,26.8),(136,59,18,38,82.2,79.7,84.4),(137,59,18,38,96.6,95.5,97.4),(138,59,18,39,74.4,68.8,79.3),(139,59,18,39,35.6,26.5,45.8),(140,59,18,39,69.7,67.1,72.2),(141,59,18,39,19.9,11.3,32.6),(142,59,18,39,57.8,55.5,60.1),(143,60,18,5,61.9,41.5,78.9),(144,60,18,5,52.5,35.2,69.2),(145,60,18,10,66.8,65.6,68.0),(146,60,18,10,4.5,4.2,4.7),(147,60,18,10,2.9,2.1,3.9),(148,60,18,10,66.2,62.6,69.5),(149,60,18,14,13.3,12.7,14.0),(150,60,18,14,62.5,61.4,63.6),(151,60,18,14,80.1,72.8,85.9),(152,60,18,14,14.4,11.7,17.6),(153,60,18,27,34.4,33.4,35.5),(154,60,18,32,5.9,5.6,6.2),(155,60,18,32,92.6,68.1,98.7),(156,60,18,38,19.6,18.7,20.4),(157,60,18,38,21.2,20.4,22.0),(158,60,18,38,63.5,60.0,66.9),(159,60,18,39,80.0,79.1,80.8),(160,60,18,39,5.4,5.1,5.7),(161,60,18,39,7.2,4.0,10.4),(162,60,18,39,44.2,26.3,63.8),(163,61,18,5,41.3,39.4,43.3),(164,61,18,10,20.0,18.2,21.9),(165,61,18,27,43.9,42.2,45.7),(166,61,18,38,59.2,57.4,60.9),(167,61,18,39,20.4,19.2,21.8),(168,57,19,5,12.0,10.1,14.3),(169,57,19,10,14.6,12.1,17.6),(170,57,19,10,44.2,34.3,54.6),(171,57,19,10,27.7,19.6,37.5),(172,57,19,14,35.0,30.9,39.4),(173,57,19,14,35.1,31.9,38.4),(174,57,19,14,34.7,32.1,37.5),(175,57,19,27,16.7,15.0,18.7),(176,57,19,27,83.3,81.3,85.0),(177,57,19,32,29.4,26.4,32.6),(178,57,19,38,4.0,3.6,4.5),(179,57,19,38,4.2,3.6,4.8),(180,57,19,39,92.6,90.5,94.3),(181,57,19,39,19.0,17.1,21.0),(182,58,19,5,20.2,17.4,23.3),(183,58,19,10,80.0,75.6,83.8),(184,58,19,10,10.8,9.3,12.5),(185,58,19,10,8.8,7.1,10.8),(186,58,19,14,14.8,12.7,17.3),(187,58,19,14,21.6,18.3,25.3),(188,58,19,14,85.2,82.7,87.3),(189,58,19,14,25.7,22.4,29.2),(190,58,19,27,61.9,58.5,65.1),(191,58,19,32,62.2,59.5,64.7),(192,58,19,32,30.3,28.3,32.3),(193,58,19,38,19.5,14.1,26.3),(194,58,19,38,23.4,17.7,30.2),(195,58,19,38,9.2,8.0,10.6),(196,58,19,39,36.9,34.0,39.9),(197,58,19,39,32.0,29.2,35.0),(198,58,19,39,4.0,3.6,4.3),(199,59,19,5,79.2,74.0,83.6),(200,59,19,5,33.9,28.2,40.0),(201,59,19,10,38.4,36.4,40.5),(202,59,19,10,48.6,44.8,52.4),(203,59,19,10,6.3,4.8,8.3),(204,59,19,10,11.8,9.5,14.6),(205,59,19,10,84.7,80.4,88.1),(206,59,19,14,13.6,10.7,17.1),(207,59,19,14,17.1,14.4,20.2),(208,59,19,14,9.4,7.8,11.2),(209,59,19,14,51.6,48.3,54.8),(210,59,19,14,18.3,15.8,21.0),(211,59,19,14,11.2,9.6,13.0),(212,59,19,27,26.4,21.9,31.5),(213,59,19,27,28.8,25.9,32.0),(214,59,19,32,70.8,67.8,73.7),(215,59,19,32,13.3,7.2,23.1),(216,59,19,32,9.3,7.8,10.9),(217,59,19,32,86.6,77.4,92.4),(218,59,19,38,94.3,93.0,95.5),(219,59,19,38,82.4,79.7,84.9),(220,59,19,38,20.9,16.1,26.6),(221,59,19,39,13.0,8.8,18.7),(222,59,19,39,77.6,71.0,83.1),(223,59,19,39,35.1,21.6,51.6),(224,59,19,39,14.4,10.1,20.2),(225,59,19,39,51.6,49.0,54.2),(226,60,19,5,34.8,25.8,45.1),(227,60,19,10,11.6,9.1,14.8),(228,60,19,10,4.2,4.0,4.4),(229,60,19,10,62.8,58.3,67.0),(230,60,19,14,14.7,14.0,15.5),(231,60,19,14,66.8,55.4,76.5),(232,60,19,14,58.0,56.9,59.1),(233,60,19,14,59.3,58.1,60.5),(234,60,19,14,63.6,52.0,73.9),(235,60,19,14,16.3,12.6,20.9),(236,60,19,27,33.1,32.0,34.3),(237,60,19,32,6.1,5.8,6.5),(238,60,19,32,90.9,83.0,95.3),(239,60,19,38,54.7,50.2,59.1),(240,60,19,38,12.4,11.6,13.2),(241,60,19,39,80.1,79.2,81.0),(242,60,19,39,26.8,19.1,36.2),(243,60,19,39,6.3,5.9,6.6),(244,60,19,39,3.1,1.6,4.6),(245,61,19,5,37.4,35.4,39.4),(246,61,19,10,12.3,11.0,13.6),(247,61,19,14,93.4,92.6,94.1),(248,61,19,27,32.8,31.3,34.4),(249,61,19,38,52.8,51.0,54.6),(250,61,19,39,12.0,11.0,13.1),(251,57,20,5,15.2,10.4,21.5),(252,57,20,10,6.2,4.2,8.3),(253,57,20,10,29.0,22.3,36.7),(254,57,20,14,39.7,31.1,49.0),(255,57,20,14,45.2,36.8,53.9),(256,57,20,14,40.9,31.0,51.6),(257,57,20,14,40.6,33.5,48.1),(258,57,20,32,97.3,94.3,98.8),(259,57,20,38,5.9,4.3,7.5),(260,57,20,38,94.8,90.8,97.1),(261,57,20,39,42.1,35.0,49.6),(262,58,20,10,12.5,9.9,15.8),(263,58,20,14,40.3,33.6,47.3),(264,58,20,27,4.8,3.9,5.8),(265,58,20,32,51.9,39.4,64.2),(266,58,20,39,4.0,2.5,5.4),(267,59,20,10,39.3,30.0,49.4),(268,59,20,14,9.5,5.3,16.5),(269,59,20,27,45.4,28.3,63.8),(270,59,20,27,62.6,43.4,78.4),(271,59,20,32,65.1,51.0,77.0),(272,59,20,38,42.8,31.9,54.5),(273,59,20,38,31.4,20.3,45.1),(274,59,20,38,98.2,92.3,99.6),(275,59,20,39,52.1,40.9,63.1),(276,60,20,5,24.4,15.5,36.3),(277,60,20,5,42.3,22.1,65.3),(278,60,20,5,50.3,29.3,71.2),(279,60,20,10,52.3,47.8,56.7),(280,60,20,10,5.2,4.7,5.7),(281,60,20,14,18.6,16.2,21.2),(282,60,20,14,47.4,44.7,50.1),(283,60,20,27,36.0,32.0,40.3),(284,60,20,32,72.7,69.5,75.6),(285,60,20,32,91.1,75.0,97.2),(286,60,20,32,38.6,24.2,55.5),(287,60,20,38,62.4,58.7,66.0),(288,60,20,38,12.4,10.8,14.1),(289,60,20,39,74.3,71.9,76.5),(290,60,20,39,5.9,3.2,8.6),(291,60,20,39,27.3,24.4,30.5),(292,60,20,39,86.6,80.0,91.2),(293,61,20,5,41.1,37.7,44.6),(294,61,20,10,37.6,30.3,45.5),(295,61,20,14,96.0,92.8,97.8),(296,61,20,27,7.5,5.4,9.6),(297,61,20,38,45.2,38.1,52.5),(298,61,20,39,61.5,54.2,68.4),(299,57,21,5,20.0,17.9,22.3),(300,57,21,10,35.1,28.3,42.6),(301,57,21,10,29.4,26.7,32.2),(302,57,21,10,7.6,6.8,8.4),(303,57,21,14,34.3,31.8,36.9),(304,57,21,14,31.4,28.6,34.4),(305,57,21,27,19.1,17.7,20.5),(306,57,21,27,15.3,14.0,16.6),(307,57,21,32,94.9,93.6,96.0),(308,57,21,38,82.6,80.5,84.4),(309,57,21,38,4.5,4.0,5.0),(310,57,21,38,4.3,4.0,4.6),(311,57,21,39,94.7,93.8,95.5),(312,57,21,39,20.5,19.1,22.0),(313,57,21,39,32.9,30.3,35.6),(314,58,21,5,47.1,44.7,49.5),(315,58,21,5,24.9,22.7,27.2),(316,58,21,10,10.5,9.2,12.1),(317,58,21,10,17.9,16.5,19.3),(318,58,21,14,15.2,13.6,16.9),(319,58,21,14,84.8,83.1,86.4),(320,58,21,14,22.9,20.6,25.3),(321,58,21,27,4.3,4.0,4.6),(322,58,21,27,68.5,66.3,70.7),(323,58,21,32,68.6,66.8,70.3),(324,58,21,38,31.6,27.2,36.4),(325,58,21,38,70.1,65.7,74.2),(326,58,21,38,17.1,15.8,18.4),(327,58,21,39,30.3,28.3,32.4),(328,58,21,39,4.4,4.1,4.7),(329,59,21,5,78.2,74.9,81.3),(330,59,21,5,47.9,33.0,63.2),(331,59,21,10,14.2,12.4,16.2),(332,59,21,10,8.5,7.3,9.9),(333,59,21,10,11.4,10.0,13.0),(334,59,21,10,50.1,47.4,52.7),(335,59,21,14,15.1,13.5,16.8),(336,59,21,14,6.6,5.7,7.4),(337,59,21,14,21.9,19.8,24.1),(338,59,21,14,11.1,9.9,12.4),(339,59,21,14,48.7,46.5,50.8),(340,59,21,27,18.9,16.5,21.6),(341,59,21,27,23.1,20.4,26.0),(342,59,21,32,70.8,68.7,72.7),(343,59,21,32,6.1,5.3,7.1),(344,59,21,38,95.4,94.5,96.2),(345,59,21,38,39.3,36.9,41.8),(346,59,21,38,83.7,81.9,85.3),(347,59,21,38,41.2,39.4,43.1),(348,59,21,38,16.3,14.7,18.1),(349,59,21,39,17.5,16.1,19.0),(350,59,21,39,31.4,19.3,46.8),(351,59,21,39,55.4,53.6,57.2),(352,59,21,39,15.7,13.8,17.7),(353,59,21,39,75.4,71.1,79.2),(354,60,21,10,64.8,64.0,65.7),(355,60,21,14,64.4,63.5,65.3),(356,60,21,14,13.4,12.9,13.9),(357,60,21,27,24.2,22.9,25.5),(358,60,21,32,87.4,61.0,96.9),(359,60,21,32,81.2,80.6,81.8),(360,60,21,38,16.8,16.2,17.5),(361,60,21,38,50.5,49.8,51.2),(362,60,21,39,18.8,18.2,19.4),(363,61,21,5,35.2,34.5,36.0),(364,61,21,10,37.2,35.8,38.7),(365,61,21,14,95.3,94.7,95.8),(366,61,21,27,6.0,5.6,6.4),(367,61,21,39,46.5,45.2,47.8),(368,57,22,27,33.4,18.1,53.2),(369,58,22,32,62.8,45.5,77.2),(370,58,22,39,6.0,3.5,8.5),(371,59,22,10,54.3,39.9,68.1),(372,59,22,14,47.2,25.7,69.8),(373,59,22,38,73.5,50.5,88.3),(374,60,22,10,46.9,39.5,54.5),(375,60,22,14,33.9,27.5,40.9),(376,60,22,14,48.2,37.8,58.8),(377,60,22,27,43.5,30.3,57.7),(378,60,22,32,69.8,64.1,74.9),(379,60,22,38,58.5,52.0,64.7),(380,60,22,38,16.7,11.6,23.5),(381,60,22,39,30.2,25.1,35.9),(382,61,22,5,54.2,47.7,60.6),(383,61,22,10,35.5,28.2,43.6),(384,61,22,14,91.0,87.4,93.6),(385,61,22,27,9.4,6.8,12.0),(386,61,22,38,49.9,43.4,56.4),(387,61,22,39,54.4,48.3,60.3),(388,57,23,5,44.0,39.0,49.2),(389,57,23,5,15.6,12.8,18.9),(390,57,23,10,20.3,16.3,25.1),(391,57,23,14,44.5,37.8,51.4),(392,57,23,14,37.9,32.9,43.3),(393,57,23,27,19.6,14.8,25.4),(394,57,23,27,29.9,23.8,36.8),(395,57,23,32,93.1,89.9,95.3),(396,57,23,38,4.2,3.5,5.0),(397,57,23,38,82.0,73.2,88.4),(398,57,23,38,5.7,4.2,7.2),(399,57,23,39,46.4,40.7,52.1),(400,57,23,39,34.4,28.0,41.5),(401,57,23,39,88.3,82.5,92.4),(402,58,23,10,20.2,12.1,31.9),(403,58,23,10,48.2,36.9,59.7),(404,58,23,27,6.0,3.4,8.5),(405,58,23,32,41.4,32.4,51.0),(406,58,23,38,16.9,11.8,23.5),(407,58,23,39,4.2,3.2,5.2),(408,59,23,5,33.5,19.0,52.0),(409,59,23,10,47.8,35.3,60.7),(410,59,23,14,24.0,14.9,36.2),(411,59,23,38,36.3,25.2,49.1),(412,59,23,39,40.0,27.9,53.5),(413,60,23,10,6.8,5.5,8.3),(414,60,23,10,88.3,85.6,90.5),(415,60,23,10,47.6,37.2,58.2),(416,60,23,10,35.2,32.5,38.1),(417,60,23,14,15.3,13.0,18.0),(418,60,23,14,74.0,67.5,79.6),(419,60,23,14,11.4,8.3,15.6),(420,60,23,14,52.2,49.4,55.1),(421,60,23,27,49.8,45.1,54.5),(422,60,23,32,57.7,40.3,73.5),(423,60,23,32,74.5,68.5,79.7),(424,60,23,32,95.2,86.7,98.3),(425,60,23,38,43.7,36.8,50.8),(426,60,23,38,59.5,56.6,62.2),(427,60,23,38,60.1,55.1,64.9),(428,60,23,38,19.5,17.6,21.6),(429,60,23,39,76.3,58.2,88.2),(430,60,23,39,63.5,60.9,66.1),(431,60,23,39,25.5,20.3,31.5),(432,61,23,5,44.4,40.8,48.0),(433,61,23,10,12.6,10.2,15.6),(434,61,23,14,93.4,92.1,94.5),(435,61,23,27,8.1,7.2,9.1),(436,61,23,38,45.6,42.5,48.7),(437,61,23,39,44.1,41.2,47.1),(438,57,24,14,46.1,23.7,70.1),(439,57,24,32,93.5,70.3,98.9),(440,58,24,32,58.8,47.2,69.6),(441,58,24,38,23.4,15.9,32.9),(442,58,24,39,2.5,1.3,3.6),(443,59,24,5,32.4,23.5,42.7),(444,59,24,5,35.2,19.9,54.3),(445,59,24,5,18.1,10.4,29.6),(446,59,24,32,7.2,4.4,11.6),(447,59,24,32,16.1,10.2,24.3),(448,59,24,39,35.8,25.3,47.8),(449,60,24,10,56.1,43.1,68.4),(450,60,24,14,8.2,4.7,14.2),(451,60,24,27,20.3,13.0,30.2),(452,60,24,32,88.5,82.6,92.6),(453,60,24,38,29.8,23.1,37.4),(454,60,24,39,11.5,7.4,17.4),(455,61,24,5,19.1,13.5,26.4),(456,61,24,10,44.9,37.3,52.8),(457,61,24,14,95.6,92.0,97.6),(458,61,24,27,6.8,4.4,9.3),(459,61,24,38,59.6,52.5,66.3),(460,61,24,39,35.9,29.8,42.6);
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demog`
--

DROP TABLE IF EXISTS `demog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demog` (
  `demog_id_PK` int NOT NULL,
  `demog_spec` varchar(15) DEFAULT NULL,
  `demog_cat` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`demog_id_PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demog`
--

LOCK TABLES `demog` WRITE;
/*!40000 ALTER TABLE `demog` DISABLE KEYS */;
INSERT INTO `demog` VALUES (1,'overall','overall'),(2,'female','gender'),(3,'male','gender'),(4,'black','race'),(5,'white','race'),(6,'native_am_ak','race'),(7,'hispanic','race'),(8,'asian','race');
/*!40000 ALTER TABLE `demog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `high_risk_demographics`
--

DROP TABLE IF EXISTS `high_risk_demographics`;
/*!50001 DROP VIEW IF EXISTS `high_risk_demographics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `high_risk_demographics` AS SELECT 
 1 AS `loc_desc`,
 1 AS `q_cat`,
 1 AS `question`,
 1 AS `demog_spec`,
 1 AS `avg_risk`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `loc_id_PK` int NOT NULL,
  `loc_abbr` varchar(15) DEFAULT NULL,
  `loc_desc` varchar(45) DEFAULT NULL,
  `loc_cat` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`loc_id_PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'AL','Alabama','state'),(2,'AK','Alaska','state'),(3,'AZ','Arizona','state'),(4,'AR','Arkansas','state'),(5,'CA','California','state'),(6,'CO','Colorado','state'),(7,'CT','Connecticut','state'),(8,'DE','Delaware','state'),(9,'FL','Florida','state'),(10,'GA','Georgia','state'),(11,'HI','Hawaii','state'),(12,'ID','Idaho','state'),(13,'IL','Illinois','state'),(14,'IN','Indiana','state'),(15,'IA','Iowa','state'),(16,'KS','Kansas','state'),(17,'KY','Kentucky','state'),(18,'LA','Louisiana','state'),(19,'ME','Maine','state'),(20,'MD','Maryland','state'),(21,'MA','Massachusetts','state'),(22,'MI','Michigan','state'),(23,'MN','Minnesota','state'),(24,'MS','Mississippi','state'),(25,'MO','Missouri','state'),(26,'MT','Montana','state'),(27,'NE','Nebraska','state'),(28,'NV','Nevada','state'),(29,'NH','New Hampshire','state'),(30,'NJ','New Jersey','state'),(31,'NM','New Mexico','state'),(32,'NY','New York','state'),(33,'NC','North Carolina','state'),(34,'ND','North Dakota','state'),(35,'OH','Ohio','state'),(36,'OK','Oklahoma','state'),(37,'OR','Oregon','state'),(38,'PA','Pennsylvania','state'),(39,'RI','Rhode Island','state'),(40,'SC','South Carolina','state'),(41,'SD','South Dakota','state'),(42,'TN','Tennessee','state'),(43,'TX','Texas','state'),(44,'UT','Utah','state'),(45,'VT','Vermont','state'),(46,'VA','Virginia','state'),(47,'WA','Washington','state'),(48,'WV','West Virginia','state'),(49,'WI','Wisconsin','state'),(50,'WY','Wyoming','state'),(51,'DC','District of Columbia','non_state'),(52,'GU','Guam','non_state'),(53,'PR','Puerto Rico','non_state'),(54,'VI','Virgin Islands','non_state'),(55,'SOU','South','region'),(56,'NRE','Northeast','region'),(57,'MDW','Midwest','region'),(58,'WEST','West','region'),(59,'US','United States, DC & Territories','all_usa');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `q_id_PK` int NOT NULL,
  `q_cat` varchar(45) DEFAULT NULL,
  `data_type` varchar(15) DEFAULT NULL,
  `q_topic` varchar(110) DEFAULT NULL,
  `question` varchar(170) DEFAULT NULL,
  PRIMARY KEY (`q_id_PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Caregiving','Percentage','Provide care for a friend or family member in past month','Percentage of older adults who provided care for a friend or family member within the past month'),(2,'Caregiving','Percentage','Expect to provide care for someone in the next two years','Percentage of older adults currently not providing care who expect to provide care for someone with health problems in the next two years'),(3,'Caregiving','Percentage','Duration of caregiving among older adults','Percentage of older adults who provided care to a friend or family member for six months or more'),(4,'Caregiving','Percentage','Intensity of caregiving among older adults','Average of 20 or more hours of care per week provided to a friend or family member'),(5,'Caregiving','Percentage','Provide care for someone with cognitive impairment within the past month','Percentage of older adults who provided care for someone with dementia or other cognitive impairment within the past month'),(6,'Cognitive Decline','Percentage','Subjective cognitive decline or memory loss among older adults','Percentage of older adults who reported subjective cognitive decline or memory loss that is happening more often or is getting worse in the preceding 12 months'),(7,'Cognitive Decline','Percentage','Functional difficulties associated with subjective cognitive decline or memory loss among older adults','Percentage of older adults who reported subjective cognitive decline or memory loss that interferes with their ability to engage in social activities or household chores'),(8,'Cognitive Decline','Percentage','Need assistance with day-to-day activities because of subjective cognitive decline or memory loss','Percentage of older adults who reported that as a result of subjective cognitive decline or memory loss that they need assistance with day-to-day activities'),(9,'Cognitive Decline','Percentage','Talked with health care professional about subjective cognitive decline or memory loss','Percentage of older adults with subjective cognitive decline or memory loss who reported talking with a health care professional about it'),(10,'Mental Health','Percentage','Frequent mental distress','Percentage of older adults who are experiencing frequent mental distress'),(11,'Mental Health','Percentage','Lifetime diagnosis of depression','Percentage of older adults with a lifetime diagnosis of depression'),(12,'Nutrition/Physical Activity/Obesity','Percentage','Eating 2 or more fruits daily','Percentage of older adults who are eating 2 or more fruits daily'),(13,'Nutrition/Physical Activity/Obesity','Percentage','Eating 3 or more vegetables daily','Percentage of older adults who are eating 3 or more vegetables daily'),(14,'Nutrition/Physical Activity/Obesity','Percentage','Obesity','Percentage of older adults who are currently obese, with a body mass index (BMI) of 30 or more'),(15,'Nutrition/Physical Activity/Obesity','Percentage','No leisure-time physical activity within past month','Percentage of older adults who have not had any leisure time physical activity in the past month'),(16,'Overall Health','Percentage','Taking medication for high blood pressure','Percentage of older adults who have been told they have high blood pressure who report currently taking medication for their high blood pressure'),(17,'Overall Health','Mean','Physically unhealthy days (mean number of days)','Physically unhealthy days (mean number of days in past month)'),(18,'Overall Health','Percentage','Self-rated health (fair to poor health)','Percentage of older adults who self-reported that their health is \"fair\"\" or \"\"poor\"\"\"'),(19,'Overall Health','Percentage','Self-rated health (good to excellent health)','Percentage of older adults who self-reported that their health is \"good\"\"'),(20,'Overall Health','Mean','Recent activity limitations in past month','Mean number of days with activity limitations in the past month'),(21,'Overall Health','Percentage','Arthritis among older adults','Percentage of older adults ever told they have arthritis'),(22,'Overall Health','Percentage','Severe joint pain among older adults with arthritis','Severe joint pain due to arthritis among older adults with doctor-diagnosed arthritis'),(23,'Overall Health','Percentage','Fair or poor health among older adults with arthritis','Fair or poor health among older adults with doctor-diagnosed arthritis'),(24,'Overall Health','Percentage','Disability status, including sensory or mobility limitations','Percentage of older adults who report having a disability (includes limitations related to sensory or mobility impairments or a physical, mental, or emotional condition)'),(25,'Overall Health','Percentage','Fall with injury within last year','Percentage of older adults who have fallen and sustained an injury within last year'),(26,'Overall Health','Percentage','Oral health:  tooth retention','Percentage of older adults who report having lost 5 or fewer teeth due to decay or gum disease'),(27,'Overall Health','Percentage','Prevalence of sufficient sleep','Percentage of older adults getting sufficient sleep (>6 hours)'),(28,'Screenings and Vaccines','Percentage','Ever had pneumococcal vaccine','Percentage of at risk adults (have diabetes, asthma, cardiovascular disease or currently smoke) who ever had a pneumococcal vaccine'),(29,'Screenings and Vaccines','Percentage','Cholesterol checked in past 5 years','Percentage of older adults who had a cholesterol screening within the past 5 years'),(30,'Screenings and Vaccines','Percentage','Influenza vaccine within past year','Percentage of older adults who reported influenza vaccine within the past year'),(31,'Screenings and Vaccines','Percentage','Diabetes screening within past 3 years','Percentage of older adults without diabetes who reported a blood sugar or diabetes test within 3 years'),(32,'Screenings and Vaccines','Percentage','High blood pressure ever','Percentage of older adults who have ever been told by a health professional that they have high blood pressure'),(33,'Screenings and Vaccines','Percentage','Up-to-date with recommended vaccines and screenings - Men','Percentage of older adult men who are up to date with select clinical preventive services'),(34,'Screenings and Vaccines','Percentage','Up-to-date with recommended vaccines and screenings - Women','Percentage of older adult women who are up to date with select clinical preventive services'),(35,'Screenings and Vaccines','Percentage','Mammogram within past 2 years','Percentage of older adult women who have received a mammogram within the past 2 years'),(36,'Screenings and Vaccines','Percentage','Colorectal cancer screening','Percentage of older adults who had either a home blood stool test within the past year or a sigmoidoscopy or colonoscopy within the past 10 years'),(37,'Screenings and Vaccines','Percentage','Pap test within past 3 years','Percentage of older adult women with an intact cervix who had a Pap test within the past 3 years'),(38,'Smoking and Alcohol Use','Percentage','Current smoking','Percentage of older adults who have smoked at least 100 cigarettes in their entire life and still smoke every day or some days'),(39,'Smoking and Alcohol Use','Percentage','Binge drinking within past 30 days','Percentage of older adults who reported binge drinking within the past 30 days');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `regional_health_trends`
--

DROP TABLE IF EXISTS `regional_health_trends`;
/*!50001 DROP VIEW IF EXISTS `regional_health_trends`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `regional_health_trends` AS SELECT 
 1 AS `loc_cat`,
 1 AS `loc_desc`,
 1 AS `q_cat`,
 1 AS `question`,
 1 AS `demog_spec`,
 1 AS `avg_data_value`,
 1 AS `category_avg`,
 1 AS `percent_diff_from_category_avg`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `total_usa_data`
--

DROP TABLE IF EXISTS `total_usa_data`;
/*!50001 DROP VIEW IF EXISTS `total_usa_data`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_usa_data` AS SELECT 
 1 AS `q_cat`,
 1 AS `q_topic`,
 1 AS `question`,
 1 AS `demog_cat`,
 1 AS `demog_spec`,
 1 AS `data_value`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `usa_data_values`
--

DROP TABLE IF EXISTS `usa_data_values`;
/*!50001 DROP VIEW IF EXISTS `usa_data_values`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `usa_data_values` AS SELECT 
 1 AS `question`,
 1 AS `min_value`,
 1 AS `max_value`,
 1 AS `average_value`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `usa_key_values`
--

DROP TABLE IF EXISTS `usa_key_values`;
/*!50001 DROP VIEW IF EXISTS `usa_key_values`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `usa_key_values` AS SELECT 
 1 AS `question`,
 1 AS `min_value`,
 1 AS `max_value`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `year`
--

DROP TABLE IF EXISTS `year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `year` (
  `year_id_PK` int NOT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`year_id_PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year`
--

LOCK TABLES `year` WRITE;
/*!40000 ALTER TABLE `year` DISABLE KEYS */;
INSERT INTO `year` VALUES (1,2019),(2,2020),(3,2021);
/*!40000 ALTER TABLE `year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `year_loc`
--

DROP TABLE IF EXISTS `year_loc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `year_loc` (
  `year_loc_id_PK` int NOT NULL,
  `year_id_FK` int DEFAULT NULL,
  `loc_id_FK` int DEFAULT NULL,
  PRIMARY KEY (`year_loc_id_PK`),
  KEY `year_id_FK_idx` (`year_id_FK`),
  KEY `loc_id_FK_idx` (`loc_id_FK`),
  CONSTRAINT `loc_id_FK` FOREIGN KEY (`loc_id_FK`) REFERENCES `location` (`loc_id_PK`),
  CONSTRAINT `year_id_FK` FOREIGN KEY (`year_id_FK`) REFERENCES `year` (`year_id_PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year_loc`
--

LOCK TABLES `year_loc` WRITE;
/*!40000 ALTER TABLE `year_loc` DISABLE KEYS */;
INSERT INTO `year_loc` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,2,19),(21,2,20),(22,2,21),(23,2,22),(24,2,23),(25,2,24),(26,2,25),(27,2,26),(28,2,27),(29,2,28),(30,2,29),(31,2,30),(32,2,31),(33,2,32),(34,2,33),(35,2,34),(36,2,35),(37,2,36),(38,2,37),(39,2,38),(40,3,38),(41,3,39),(42,3,40),(43,3,41),(44,3,42),(45,3,43),(46,3,44),(47,3,45),(48,3,46),(49,3,47),(50,3,48),(51,3,49),(52,3,50),(53,3,51),(54,3,52),(55,3,53),(56,3,54),(57,3,55),(58,3,56),(59,3,57),(60,3,58),(61,3,59);
/*!40000 ALTER TABLE `year_loc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'puebla'
--
/*!50003 DROP FUNCTION IF EXISTS `get_percent_smoking_responders_above_50` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_percent_smoking_responders_above_50`(
    loc_reg_input VARCHAR(10)
) RETURNS decimal(5,2)
    DETERMINISTIC
BEGIN
    DECLARE total_responders INT;
    DECLARE responders_above_50 INT;
    DECLARE proportion DECIMAL(5,2);

    -- Count the total number of responders for the "Current smoking" topic in the given region
    SELECT COUNT(DISTINCT d.response_id_PK)
    INTO total_responders
    FROM data d
    JOIN year_loc yl ON d.year_loc_id_FK = yl.year_loc_id_PK
    JOIN location loc ON yl.loc_id_FK = loc.loc_id_PK
    JOIN questions q ON d.q_id_FK = q.q_id_PK
    WHERE loc.loc_cat = 'region' 
      AND loc.loc_desc = loc_reg_input
      AND q.q_topic = 'Current smoking';

    SELECT COUNT(DISTINCT d.response_id_PK)
    INTO responders_above_50
    FROM data d
    JOIN year_loc yl ON d.year_loc_id_FK = yl.year_loc_id_PK
    JOIN location loc ON yl.loc_id_FK = loc.loc_id_PK
    JOIN questions q ON d.q_id_FK = q.q_id_PK
    WHERE loc.loc_cat = 'region' 
      AND loc.loc_desc = loc_reg_input
      AND q.q_topic = 'Current smoking'
      AND d.data_value >= 50;

    IF total_responders > 0 THEN
        SET proportion = (responders_above_50 / total_responders) * 100;
    ELSE
        SET proportion = 0;
    END IF;

    RETURN proportion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `comparing_race_by_topic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `comparing_race_by_topic`(
    IN selected_topic VARCHAR(255)
)
BEGIN
    SELECT 
        q.q_topic AS topic,
        y.year AS data_year,
        dm.demog_spec AS race,
        ROUND(AVG(d.data_value), 2) AS average_value,
        ROUND(AVG(d.low_conf_lim), 2) AS low_confidence_limit,
        ROUND(AVG(d.high_conf_lim), 2) AS high_confidence_limit,
        COUNT(*) AS data_points
    FROM 
        data d
    JOIN questions q ON d.q_id_FK = q.q_id_PK
    JOIN year_loc yl ON d.year_loc_id_FK = yl.year_loc_id_PK
    JOIN year y ON yl.year_id_FK = y.year_id_PK
    JOIN age_demog ad ON d.age_demog_id_FK = ad.age_demog_id_PK
    JOIN demog dm ON ad.demog_id_FK = dm.demog_id_PK
    WHERE 
        q.q_topic LIKE selected_topic
        AND dm.demog_cat = 'race'
    GROUP BY 
        q.q_topic, 
        y.year, 
        race
    ORDER BY 
        topic, 
        data_year, 
        race;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_highest_avg_topic_for_region` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_highest_avg_topic_for_region`(
    IN loc_reg_input VARCHAR(10)
)
BEGIN
    SELECT 
        q.q_topic AS Top_Topic, 
        AVG(d.data_value) AS avg_for_topic
    FROM data d
    JOIN year_loc yl ON d.year_loc_id_FK = yl.year_loc_id_PK
    JOIN location loc ON yl.loc_id_FK = loc.loc_id_PK
    JOIN questions q ON d.q_id_FK = q.q_id_PK
    WHERE loc.loc_cat = 'region' 
      AND loc.loc_desc = loc_reg_input
    GROUP BY q.q_topic
    ORDER BY avg_for_topic DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_second_highest_avg_topic_for_region_race` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_second_highest_avg_topic_for_region_race`(
    IN loc_reg_input VARCHAR(10),   -- The region
    IN race_input VARCHAR(50)       -- The race (e.g., 'black', 'white', etc.)
)
BEGIN
    -- Select the second-highest average data_value for the given region and race
    SELECT q.q_topic AS top_topic, AVG(d.data_value) AS avg_for_topic
    FROM data d
    JOIN year_loc yl ON d.year_loc_id_FK = yl.year_loc_id_PK
    JOIN location loc ON yl.loc_id_FK = loc.loc_id_PK
    JOIN questions q ON d.q_id_FK = q.q_id_PK
    JOIN age_demog ad ON d.age_demog_id_FK = ad.age_demog_id_PK
    JOIN demog dem ON ad.demog_id_FK = dem.demog_id_PK
    WHERE loc.loc_cat = 'region'
      AND loc.loc_desc = loc_reg_input
      AND dem.demog_spec = race_input
    GROUP BY q.q_topic
    ORDER BY avg_for_topic DESC
    LIMIT 1 OFFSET 1;  -- Skip the highest (OFFSET 1) and get the second-highest
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `2019_ques`
--

/*!50001 DROP VIEW IF EXISTS `2019_ques`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `2019_ques` AS select `q`.`q_cat` AS `q_cat`,`q`.`data_type` AS `data_type`,`q`.`q_topic` AS `q_topic`,`q`.`question` AS `question` from (((((((`data` `d` join `year_loc` `yl` on((`d`.`year_loc_id_FK` = `yl`.`year_loc_id_PK`))) join `year` `y` on((`yl`.`year_id_FK` = `y`.`year_id_PK`))) join `location` `l` on((`yl`.`loc_id_FK` = `l`.`loc_id_PK`))) join `questions` `q` on((`d`.`q_id_FK` = `q`.`q_id_PK`))) join `age_demog` `ad` on((`d`.`age_demog_id_FK` = `ad`.`age_demog_id_PK`))) join `age` `a` on((`ad`.`age_id_FK` = `a`.`age_id_PK`))) join `demog` on((`ad`.`demog_id_FK` = `demog`.`demog_id_PK`))) where (`y`.`year` = 2019) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_ques_and_demog`
--

/*!50001 DROP VIEW IF EXISTS `all_ques_and_demog`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_ques_and_demog` AS select distinct `y`.`year` AS `year`,`l`.`loc_desc` AS `loc_desc`,`q`.`q_cat` AS `q_cat`,`q`.`q_topic` AS `q_topic`,`q`.`question` AS `question`,`demog`.`demog_cat` AS `demog_cat`,`demog`.`demog_spec` AS `demog_spec` from (((((((`data` `d` join `year_loc` `yl` on((`d`.`year_loc_id_FK` = `yl`.`year_loc_id_PK`))) join `year` `y` on((`yl`.`year_id_FK` = `y`.`year_id_PK`))) join `location` `l` on((`yl`.`loc_id_FK` = `l`.`loc_id_PK`))) join `questions` `q` on((`d`.`q_id_FK` = `q`.`q_id_PK`))) join `age_demog` `ad` on((`d`.`age_demog_id_FK` = `ad`.`age_demog_id_PK`))) join `age` `a` on((`ad`.`age_id_FK` = `a`.`age_id_PK`))) join `demog` on((`ad`.`demog_id_FK` = `demog`.`demog_id_PK`))) order by `q`.`q_cat`,`q`.`q_topic`,`demog`.`demog_cat`,`demog`.`demog_spec` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `high_risk_demographics`
--

/*!50001 DROP VIEW IF EXISTS `high_risk_demographics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `high_risk_demographics` AS select `high_health_risk`.`loc_desc` AS `loc_desc`,`high_health_risk`.`q_cat` AS `q_cat`,`high_health_risk`.`question` AS `question`,`high_health_risk`.`demog_spec` AS `demog_spec`,avg(`high_health_risk`.`adjusted_avg_value`) AS `avg_risk` from (select `q`.`q_cat` AS `q_cat`,`q`.`question` AS `question`,`demog`.`demog_spec` AS `demog_spec`,`l`.`loc_desc` AS `loc_desc`,(case when (`q`.`q_cat` = 'Overall Health') then (100 - `d`.`data_value`) else `d`.`data_value` end) AS `adjusted_avg_value` from (((((((`data` `d` join `year_loc` `yl` on((`d`.`year_loc_id_FK` = `yl`.`year_loc_id_PK`))) join `year` `y` on((`yl`.`year_id_FK` = `y`.`year_id_PK`))) join `location` `l` on((`yl`.`loc_id_FK` = `l`.`loc_id_PK`))) join `questions` `q` on((`d`.`q_id_FK` = `q`.`q_id_PK`))) join `age_demog` `ad` on((`d`.`age_demog_id_FK` = `ad`.`age_demog_id_PK`))) join `age` `a` on((`ad`.`age_id_FK` = `a`.`age_id_PK`))) join `demog` on((`ad`.`demog_id_FK` = `demog`.`demog_id_PK`))) where (`q`.`q_cat` in ('Nutrition/Physical Activity/Obesity','Screenings and Vaccines','Mental Health','Smoking and Alcohol Use','Overall Health'))) `high_health_risk` group by `high_health_risk`.`loc_desc`,`high_health_risk`.`q_cat`,`high_health_risk`.`question`,`high_health_risk`.`demog_spec` having (avg(`high_health_risk`.`adjusted_avg_value`) > 50) order by `high_health_risk`.`q_cat`,`high_health_risk`.`question`,`avg_risk` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `regional_health_trends`
--

/*!50001 DROP VIEW IF EXISTS `regional_health_trends`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `regional_health_trends` AS with `health_metrics` as (select `l`.`loc_cat` AS `loc_cat`,`l`.`loc_desc` AS `loc_desc`,`q`.`q_cat` AS `q_cat`,`q`.`question` AS `question`,`demog`.`demog_spec` AS `demog_spec`,avg(`d`.`data_value`) AS `avg_data_value` from (((((`data` `d` join `year_loc` `yl` on((`d`.`year_loc_id_FK` = `yl`.`year_loc_id_PK`))) join `location` `l` on((`yl`.`loc_id_FK` = `l`.`loc_id_PK`))) join `questions` `q` on((`d`.`q_id_FK` = `q`.`q_id_PK`))) join `age_demog` `ad` on((`d`.`age_demog_id_FK` = `ad`.`age_demog_id_PK`))) join `demog` on((`ad`.`demog_id_FK` = `demog`.`demog_id_PK`))) where ((`l`.`loc_cat` in ('region','all_usa')) and (`demog`.`demog_spec` <> 'overall') and (`q`.`q_cat` in ('Overall Health','Mental Health','Nutrition/Physical Activity/Obesity'))) group by `l`.`loc_cat`,`l`.`loc_desc`,`q`.`q_cat`,`q`.`question`,`demog`.`demog_spec`) select `hm1`.`loc_cat` AS `loc_cat`,`hm1`.`loc_desc` AS `loc_desc`,`hm1`.`q_cat` AS `q_cat`,`hm1`.`question` AS `question`,`hm1`.`demog_spec` AS `demog_spec`,`hm1`.`avg_data_value` AS `avg_data_value`,(select avg(`hm2`.`avg_data_value`) from `health_metrics` `hm2` where (`hm2`.`q_cat` = `hm1`.`q_cat`)) AS `category_avg`,round((((`hm1`.`avg_data_value` - (select avg(`hm2`.`avg_data_value`) from `health_metrics` `hm2` where (`hm2`.`q_cat` = `hm1`.`q_cat`))) / (select avg(`hm2`.`avg_data_value`) from `health_metrics` `hm2` where (`hm2`.`q_cat` = `hm1`.`q_cat`))) * 100),2) AS `percent_diff_from_category_avg` from `health_metrics` `hm1` having (abs(`percent_diff_from_category_avg`) > 10) order by `hm1`.`q_cat`,abs(`percent_diff_from_category_avg`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_usa_data`
--

/*!50001 DROP VIEW IF EXISTS `total_usa_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_usa_data` AS select `q`.`q_cat` AS `q_cat`,`q`.`q_topic` AS `q_topic`,`q`.`question` AS `question`,`demog`.`demog_cat` AS `demog_cat`,`demog`.`demog_spec` AS `demog_spec`,`d`.`data_value` AS `data_value` from (((((((`data` `d` join `year_loc` `yl` on((`d`.`year_loc_id_FK` = `yl`.`year_loc_id_PK`))) join `year` `y` on((`yl`.`year_id_FK` = `y`.`year_id_PK`))) join `location` `l` on((`yl`.`loc_id_FK` = `l`.`loc_id_PK`))) join `questions` `q` on((`d`.`q_id_FK` = `q`.`q_id_PK`))) join `age_demog` `ad` on((`d`.`age_demog_id_FK` = `ad`.`age_demog_id_PK`))) join `age` `a` on((`ad`.`age_id_FK` = `a`.`age_id_PK`))) join `demog` on((`ad`.`demog_id_FK` = `demog`.`demog_id_PK`))) where (`l`.`loc_desc` = 'United States, DC & Territories') order by `q`.`q_cat`,`q`.`q_topic`,`demog`.`demog_cat`,`demog`.`demog_spec` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usa_data_values`
--

/*!50001 DROP VIEW IF EXISTS `usa_data_values`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usa_data_values` AS select `q`.`question` AS `question`,min(`d`.`data_value`) AS `min_value`,max(`d`.`data_value`) AS `max_value`,avg(`d`.`data_value`) AS `average_value` from (((((((`data` `d` join `year_loc` `yl` on((`d`.`year_loc_id_FK` = `yl`.`year_loc_id_PK`))) join `year` `y` on((`yl`.`year_id_FK` = `y`.`year_id_PK`))) join `location` `l` on((`yl`.`loc_id_FK` = `l`.`loc_id_PK`))) join `questions` `q` on((`d`.`q_id_FK` = `q`.`q_id_PK`))) join `age_demog` `ad` on((`d`.`age_demog_id_FK` = `ad`.`age_demog_id_PK`))) join `age` `a` on((`ad`.`age_id_FK` = `a`.`age_id_PK`))) join `demog` on((`ad`.`demog_id_FK` = `demog`.`demog_id_PK`))) where (`l`.`loc_desc` = 'United States, DC & Territories') group by `q`.`question` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usa_key_values`
--

/*!50001 DROP VIEW IF EXISTS `usa_key_values`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usa_key_values` AS select `all_usa_data`.`question` AS `question`,min(`all_usa_data`.`data_value`) AS `min_value`,max(`all_usa_data`.`data_value`) AS `max_value` from (select `q`.`q_cat` AS `q_cat`,`q`.`q_topic` AS `q_topic`,`q`.`question` AS `question`,`demog`.`demog_cat` AS `demog_cat`,`demog`.`demog_spec` AS `demog_spec`,`d`.`data_value` AS `data_value` from (((((((`data` `d` join `year_loc` `yl` on((`d`.`year_loc_id_FK` = `yl`.`year_loc_id_PK`))) join `year` `y` on((`yl`.`year_id_FK` = `y`.`year_id_PK`))) join `location` `l` on((`yl`.`loc_id_FK` = `l`.`loc_id_PK`))) join `questions` `q` on((`d`.`q_id_FK` = `q`.`q_id_PK`))) join `age_demog` `ad` on((`d`.`age_demog_id_FK` = `ad`.`age_demog_id_PK`))) join `age` `a` on((`ad`.`age_id_FK` = `a`.`age_id_PK`))) join `demog` on((`ad`.`demog_id_FK` = `demog`.`demog_id_PK`))) where (`l`.`loc_desc` = 'United States, DC & Territories') order by `q`.`q_cat`,`q`.`q_topic`,`demog`.`demog_cat`,`demog`.`demog_spec`) `all_usa_data` group by `all_usa_data`.`question` */;
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

-- Dump completed on 2024-12-10  0:21:56
