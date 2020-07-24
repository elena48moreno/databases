CREATE DATABASE  IF NOT EXISTS `aeropuerto_sevilla` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `aeropuerto_sevilla`;
-- MariaDB dump 10.17  Distrib 10.4.12-MariaDB, for Linux (x86_64)
--
-- Host: 192.168.1.1    Database: aeropuerto_sevilla
-- ------------------------------------------------------
-- Server version	10.1.44-MariaDB-0ubuntu0.18.04.1

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
-- Table structure for table `aviones`
--

DROP TABLE IF EXISTS `aviones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aviones` (
  `id_avion` int(11) NOT NULL,
  `modelo` varchar(20) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `id_compañia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_avion`),
  KEY `fk_aviones_compañia` (`id_compañia`),
  CONSTRAINT `fk_aviones_compañia` FOREIGN KEY (`id_compañia`) REFERENCES `compañias` (`id_compañia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aviones`
--

LOCK TABLES `aviones` WRITE;
/*!40000 ALTER TABLE `aviones` DISABLE KEYS */;
/*!40000 ALTER TABLE `aviones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billetes`
--

DROP TABLE IF EXISTS `billetes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billetes` (
  `id_billete` varchar(30) NOT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  `clase` varchar(10) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_vuelo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_billete`),
  KEY `fk_billetes_clientes` (`id_cliente`),
  CONSTRAINT `fk_billetes_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billetes`
--

LOCK TABLES `billetes` WRITE;
/*!40000 ALTER TABLE `billetes` DISABLE KEYS */;
/*!40000 ALTER TABLE `billetes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id_cliente` int(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(130) NOT NULL,
  `contraseña` varchar(130) DEFAULT NULL,
  `nombre` varchar(15) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `matricula` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`),
  KEY `cliente_email` (`email`),
  KEY `mat` (`matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'gperezpi18asr@ikzubirimanteo.com','150080c71194b20e307ef461603280f0ca1d5e3ffe90389dc557dcaaf18e7f78ef3e7d3dc3d3056f12e93e5ff6c6f67504e7cdf91b53152fd490a933816551bd','german','perez','7bd91932812096836d91af14aa19aaa16753de06247a6daaaf5f0ffb5e942be770a40ca15432b4d24df6707043de3621c33d8ae0a18a906dbb7ec5f55a7cdcf1'),(2,'joninsausti20@gmail.com','e94909fd3f3910f172b1cb2d98c20584f1787048ab2a0811aa814608045abc71dfcd5e24f47bf811bf28c8f2467b02a5a00ce8f3f6a70d3910ae99d547c3baba','jon','insausti','225e358c04e36893668f4cef0d6dc6f3597c339933b43cd3b96308e24164dcf72edc05c968bb0a805b2af9848eaea3826cffeab95a6f947d53b3ad6aee774634'),(3,'prueba@aeropuertosevilla.es','0439434dae91c10c3bc073af1e76addf8f57a30ce0a7de0438b3aaad34b85200d41d01078f2ee786b3130b4ed4e39e3e26090da5d9f87420454dfdd182761cce','Prueba','Prueba','a45827bfd28695733c85dfde4ff668b257e02fd3af1546755fc931d8bbbbd78d88fcd19a922cc7da9b47bb35f530d4aeea42d25914ee5e906d05c303c7bd4b54'),(4,'mberasaluzeeg@zubirimanteo.com','95dfc2af575ad791675100effa89540047b16a79657d730d70fd84623fc3dcc30014d64cd222301732d56ab71eb3fbbd694449ce237d7dd26271b53cb4e8109b','Maria','Berasaluze','fd464f73d02dd5a72aa6c39ce64c730653ccc43e12f0b8283df5938ac72332afa95f61099cb5c50eb9354cbd468fec1814fd71d9e85ee7035daabc0af51b56b6');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compañias`
--

DROP TABLE IF EXISTS `compañias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compañias` (
  `id_compañia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_compañia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compañias`
--

LOCK TABLES `compañias` WRITE;
/*!40000 ALTER TABLE `compañias` DISABLE KEYS */;
/*!40000 ALTER TABLE `compañias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_parking`
--

DROP TABLE IF EXISTS `historico_parking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_parking` (
  `id_historico` int(11) NOT NULL,
  `id_plaza` int(11) DEFAULT NULL,
  `matricula` varchar(130) DEFAULT NULL,
  `inicio_reserva` datetime DEFAULT NULL,
  `fin_reserva` datetime DEFAULT NULL,
  `date_update` datetime DEFAULT NULL,
  `cur_user` varchar(15) DEFAULT NULL,
  `cur_host` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_historico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_parking`
--

LOCK TABLES `historico_parking` WRITE;
/*!40000 ALTER TABLE `historico_parking` DISABLE KEYS */;
INSERT INTO `historico_parking` VALUES (1,1,'7bd91932812096836d91af14aa19aaa16753de06247a6daaaf5f0ffb5e942be770a40ca15432b4d24df6707043de3621c33d8ae0a18a906dbb7ec5f55a7cdcf1','2020-02-07 00:00:00','2020-02-11 00:00:00','2020-02-07 00:00:00','elena','elena@10.10.10.3'),(2,1,'7bd91932812096836d91af14aa19aaa16753de06247a6daaaf5f0ffb5e942be770a40ca15432b4d24df6707043de3621c33d8ae0a18a906dbb7ec5f55a7cdcf1','2020-02-07 00:00:00','2020-02-11 00:00:00','2020-02-07 00:00:00','elena','elena@10.10.10.3'),(3,2,'fd464f73d02dd5a72aa6c39ce64c730653ccc43e12f0b8283df5938ac72332afa95f61099cb5c50eb9354cbd468fec1814fd71d9e85ee7035daabc0af51b56b6','2020-02-08 00:00:00','2020-02-08 00:00:00','2020-02-08 00:00:00','web_user','web_user@localhost'),(4,2,'fd464f73d02dd5a72aa6c39ce64c730653ccc43e12f0b8283df5938ac72332afa95f61099cb5c50eb9354cbd468fec1814fd71d9e85ee7035daabc0af51b56b6','2020-02-08 00:00:00','2020-02-08 00:00:00','2020-02-08 00:00:00','elena','elena@10.10.10.3'),(5,2,'fd464f73d02dd5a72aa6c39ce64c730653ccc43e12f0b8283df5938ac72332afa95f61099cb5c50eb9354cbd468fec1814fd71d9e85ee7035daabc0af51b56b6','2020-02-08 00:00:00','2020-02-08 00:00:00','2020-02-08 00:00:00','elena','elena@10.10.10.3'),(6,1,'7bd91932812096836d91af14aa19aaa16753de06247a6daaaf5f0ffb5e942be770a40ca15432b4d24df6707043de3621c33d8ae0a18a906dbb7ec5f55a7cdcf1','2020-02-07 00:00:00','2020-02-11 00:00:00','2020-02-08 00:00:00','elena','elena@10.10.10.3'),(7,1,'7bd91932812096836d91af14aa19aaa16753de06247a6daaaf5f0ffb5e942be770a40ca15432b4d24df6707043de3621c33d8ae0a18a906dbb7ec5f55a7cdcf1','2020-02-07 00:00:00','2020-02-11 00:00:00','2020-02-08 00:00:00','elena','elena@10.10.10.3'),(8,1,'7bd91932812096836d91af14aa19aaa16753de06247a6daaaf5f0ffb5e942be770a40ca15432b4d24df6707043de3621c33d8ae0a18a906dbb7ec5f55a7cdcf1','2020-02-07 00:00:00','2020-02-11 00:00:00','2020-02-08 00:00:00','elena','elena@10.10.10.3'),(9,1,'7bd91932812096836d91af14aa19aaa16753de06247a6daaaf5f0ffb5e942be770a40ca15432b4d24df6707043de3621c33d8ae0a18a906dbb7ec5f55a7cdcf1','2020-02-07 00:00:00','2020-02-11 00:00:00','2020-02-08 00:00:00','elena','elena@10.10.10.3'),(10,2,'fd464f73d02dd5a72aa6c39ce64c730653ccc43e12f0b8283df5938ac72332afa95f61099cb5c50eb9354cbd468fec1814fd71d9e85ee7035daabc0af51b56b6','2020-02-08 00:00:00','2020-02-08 00:00:00','2020-02-08 00:00:00','elena','elena@10.10.10.3'),(11,2,'fd464f73d02dd5a72aa6c39ce64c730653ccc43e12f0b8283df5938ac72332afa95f61099cb5c50eb9354cbd468fec1814fd71d9e85ee7035daabc0af51b56b6','2020-02-08 00:00:00','2020-02-08 00:00:00','2020-02-08 00:00:00','elena','elena@10.10.10.3'),(12,3,'7bd91932812096836d91af14aa19aaa16753de06247a6daaaf5f0ffb5e942be770a40ca15432b4d24df6707043de3621c33d8ae0a18a906dbb7ec5f55a7cdcf1','2020-02-09 13:44:00','2020-03-11 17:41:00','2020-02-09 00:00:00','web_user','web_user@localhost'),(13,4,'225e358c04e36893668f4cef0d6dc6f3597c339933b43cd3b96308e24164dcf72edc05c968bb0a805b2af9848eaea3826cffeab95a6f947d53b3ad6aee774634','2020-02-09 17:58:00','2020-02-09 01:22:00','2020-02-09 00:00:00','web_user','web_user@localhost'),(14,2,'fd464f73d02dd5a72aa6c39ce64c730653ccc43e12f0b8283df5938ac72332afa95f61099cb5c50eb9354cbd468fec1814fd71d9e85ee7035daabc0af51b56b6','2020-02-08 07:30:00','2020-02-08 09:30:00','2020-02-09 00:00:00','root','root@localhost');
/*!40000 ALTER TABLE `historico_parking` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`elena`@`%`*/ /*!50003 TRIGGER precio_reserva_trg AFTER INSERT ON historico_parking FOR EACH ROW
BEGIN
DECLARE num_reservas int;
DECLARE precio_total decimal(5,2);
DECLARE precio_dias decimal(5,2);
DECLARE precio_horas decimal(5,2);
DECLARE precio_minutos decimal(5,2);
DECLARE num_dias int;
DECLARE num_horas int;
DECLARE num_minutos int;	
DECLARE max_id int;
DECLARE vUser varchar(15);
SELECT count(*) INTO num_reservas FROM historico_parking where matricula=new.matricula;
SELECT SUBSTRING_INDEX(user(), '@', 1) into vUser;
SELECT max(id_historico) INTO max_id FROM historico_parking;
SELECT
FLOOR(HOUR(TIMEDIFF(new.fin_reserva, new.inicio_reserva)) / 24),
MOD(HOUR(TIMEDIFF(new.fin_reserva, new.inicio_reserva)), 24),
MINUTE(TIMEDIFF(new.fin_reserva, new.inicio_reserva)) INTO num_dias, num_horas, num_minutos;

IF max_id IS NULL THEN SET max_id = 0;
END IF;

SET max_id = max_id+1;
SET precio_dias = num_dias * 15;
SET precio_horas = num_horas * 1.50;
SET precio_minutos = num_minutos * 0.35;
SET precio_total = precio_dias + precio_horas + precio_minutos;

IF vUser='web_user' THEN SET precio_total = precio_total * 0.95;
END IF;

IF num_reservas >= 2 THEN SET precio_total = precio_total * 0.90;
END IF;

IF num_dias > 15 THEN SET precio_total = precio_total * 0.80;
END IF;

INSERT INTO tickets (id_ticket, matricula, fecha_entrada, fecha_salida, precio) 
VALUES (max_id, new.matricula, new.inicio_reserva, new.fin_reserva, precio_total);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `historico_tickets`
--

DROP TABLE IF EXISTS `historico_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_tickets` (
  `id_historico` int(11) NOT NULL,
  `id_ticket` int(11) DEFAULT NULL,
  `matricula` varchar(130) DEFAULT NULL,
  `fecha_entrada` datetime DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  `fecha_expiracion` date DEFAULT NULL,
  PRIMARY KEY (`id_historico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_tickets`
--

LOCK TABLES `historico_tickets` WRITE;
/*!40000 ALTER TABLE `historico_tickets` DISABLE KEYS */;
INSERT INTO `historico_tickets` VALUES (1,1,'225e358c04e36893668f4cef0d6dc6f3597c339933b43cd3b96308e24164dcf72edc05c968bb0a805b2af9848eaea3826cffeab95a6f947d53b3ad6aee774634','2020-01-30 22:10:11','2020-02-05 13:54:01',112.55,'2020-02-07');
/*!40000 ALTER TABLE `historico_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plazas`
--

DROP TABLE IF EXISTS `plazas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plazas` (
  `id_plaza` int(11) NOT NULL,
  `matricula` varchar(130) DEFAULT NULL,
  `inicio_reserva` datetime DEFAULT NULL,
  `fin_reserva` datetime DEFAULT NULL,
  PRIMARY KEY (`id_plaza`),
  UNIQUE KEY `plazas_idx` (`id_plaza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plazas`
--

LOCK TABLES `plazas` WRITE;
/*!40000 ALTER TABLE `plazas` DISABLE KEYS */;
INSERT INTO `plazas` VALUES (1,'7bd91932812096836d91af14aa19aaa16753de06247a6daaaf5f0ffb5e942be770a40ca15432b4d24df6707043de3621c33d8ae0a18a906dbb7ec5f55a7cdcf1','2020-02-07 23:12:00','2020-02-11 12:20:00'),(2,NULL,NULL,NULL),(3,'7bd91932812096836d91af14aa19aaa16753de06247a6daaaf5f0ffb5e942be770a40ca15432b4d24df6707043de3621c33d8ae0a18a906dbb7ec5f55a7cdcf1','2020-02-09 13:44:00','2020-03-11 17:41:00'),(4,'225e358c04e36893668f4cef0d6dc6f3597c339933b43cd3b96308e24164dcf72edc05c968bb0a805b2af9848eaea3826cffeab95a6f947d53b3ad6aee774634','2020-02-09 17:58:00','2020-02-09 01:22:00'),(5,NULL,NULL,NULL),(6,NULL,NULL,NULL),(7,NULL,NULL,NULL),(8,NULL,NULL,NULL),(9,NULL,NULL,NULL),(10,NULL,NULL,NULL),(11,NULL,NULL,NULL),(12,NULL,NULL,NULL),(13,NULL,NULL,NULL),(14,NULL,NULL,NULL),(15,NULL,NULL,NULL),(16,NULL,NULL,NULL),(17,NULL,NULL,NULL),(18,NULL,NULL,NULL),(19,NULL,NULL,NULL),(20,NULL,NULL,NULL),(21,NULL,NULL,NULL),(22,NULL,NULL,NULL),(23,NULL,NULL,NULL),(24,NULL,NULL,NULL),(25,NULL,NULL,NULL),(26,NULL,NULL,NULL),(27,NULL,NULL,NULL),(28,NULL,NULL,NULL),(29,NULL,NULL,NULL),(30,NULL,NULL,NULL),(31,NULL,NULL,NULL),(32,NULL,NULL,NULL),(33,NULL,NULL,NULL),(34,NULL,NULL,NULL),(35,NULL,NULL,NULL),(36,NULL,NULL,NULL),(37,NULL,NULL,NULL),(38,NULL,NULL,NULL),(39,NULL,NULL,NULL),(40,NULL,NULL,NULL),(41,NULL,NULL,NULL),(42,NULL,NULL,NULL),(43,NULL,NULL,NULL),(44,NULL,NULL,NULL),(45,NULL,NULL,NULL),(46,NULL,NULL,NULL),(47,NULL,NULL,NULL),(48,NULL,NULL,NULL),(49,NULL,NULL,NULL),(50,NULL,NULL,NULL),(51,NULL,NULL,NULL),(52,NULL,NULL,NULL),(53,NULL,NULL,NULL),(54,NULL,NULL,NULL),(55,NULL,NULL,NULL),(56,NULL,NULL,NULL),(57,NULL,NULL,NULL),(58,NULL,NULL,NULL),(59,NULL,NULL,NULL),(60,NULL,NULL,NULL),(61,NULL,NULL,NULL),(62,NULL,NULL,NULL),(63,NULL,NULL,NULL),(64,NULL,NULL,NULL),(65,NULL,NULL,NULL),(66,NULL,NULL,NULL),(67,NULL,NULL,NULL),(68,NULL,NULL,NULL),(69,NULL,NULL,NULL),(70,NULL,NULL,NULL),(71,NULL,NULL,NULL),(72,NULL,NULL,NULL),(73,NULL,NULL,NULL),(74,NULL,NULL,NULL),(75,NULL,NULL,NULL),(76,NULL,NULL,NULL),(77,NULL,NULL,NULL),(78,NULL,NULL,NULL),(79,NULL,NULL,NULL),(80,NULL,NULL,NULL),(81,NULL,NULL,NULL),(82,NULL,NULL,NULL),(83,NULL,NULL,NULL),(84,NULL,NULL,NULL),(85,NULL,NULL,NULL),(86,NULL,NULL,NULL),(87,NULL,NULL,NULL),(88,NULL,NULL,NULL),(89,NULL,NULL,NULL),(90,NULL,NULL,NULL),(91,NULL,NULL,NULL),(92,NULL,NULL,NULL),(93,NULL,NULL,NULL),(94,NULL,NULL,NULL),(95,NULL,NULL,NULL),(96,NULL,NULL,NULL),(97,NULL,NULL,NULL),(98,NULL,NULL,NULL),(99,NULL,NULL,NULL),(100,NULL,NULL,NULL),(101,NULL,NULL,NULL),(102,NULL,NULL,NULL),(103,NULL,NULL,NULL),(104,NULL,NULL,NULL),(105,NULL,NULL,NULL),(106,NULL,NULL,NULL),(107,NULL,NULL,NULL),(108,NULL,NULL,NULL),(109,NULL,NULL,NULL),(110,NULL,NULL,NULL),(111,NULL,NULL,NULL),(112,NULL,NULL,NULL),(113,NULL,NULL,NULL),(114,NULL,NULL,NULL),(115,NULL,NULL,NULL),(116,NULL,NULL,NULL),(117,NULL,NULL,NULL),(118,NULL,NULL,NULL),(119,NULL,NULL,NULL),(120,NULL,NULL,NULL),(121,NULL,NULL,NULL),(122,NULL,NULL,NULL),(123,NULL,NULL,NULL),(124,NULL,NULL,NULL),(125,NULL,NULL,NULL),(126,NULL,NULL,NULL),(127,NULL,NULL,NULL),(128,NULL,NULL,NULL),(129,NULL,NULL,NULL),(130,NULL,NULL,NULL),(131,NULL,NULL,NULL),(132,NULL,NULL,NULL),(133,NULL,NULL,NULL),(134,NULL,NULL,NULL),(135,NULL,NULL,NULL),(136,NULL,NULL,NULL),(137,NULL,NULL,NULL),(138,NULL,NULL,NULL),(139,NULL,NULL,NULL),(140,NULL,NULL,NULL),(141,NULL,NULL,NULL),(142,NULL,NULL,NULL),(143,NULL,NULL,NULL),(144,NULL,NULL,NULL),(145,NULL,NULL,NULL),(146,NULL,NULL,NULL),(147,NULL,NULL,NULL),(148,NULL,NULL,NULL),(149,NULL,NULL,NULL),(150,NULL,NULL,NULL),(151,NULL,NULL,NULL),(152,NULL,NULL,NULL),(153,NULL,NULL,NULL),(154,NULL,NULL,NULL),(155,NULL,NULL,NULL),(156,NULL,NULL,NULL),(157,NULL,NULL,NULL),(158,NULL,NULL,NULL),(159,NULL,NULL,NULL),(160,NULL,NULL,NULL),(161,NULL,NULL,NULL),(162,NULL,NULL,NULL),(163,NULL,NULL,NULL),(164,NULL,NULL,NULL),(165,NULL,NULL,NULL),(166,NULL,NULL,NULL),(167,NULL,NULL,NULL),(168,NULL,NULL,NULL),(169,NULL,NULL,NULL),(170,NULL,NULL,NULL),(171,NULL,NULL,NULL),(172,NULL,NULL,NULL),(173,NULL,NULL,NULL),(174,NULL,NULL,NULL),(175,NULL,NULL,NULL),(176,NULL,NULL,NULL),(177,NULL,NULL,NULL),(178,NULL,NULL,NULL),(179,NULL,NULL,NULL),(180,NULL,NULL,NULL),(181,NULL,NULL,NULL),(182,NULL,NULL,NULL),(183,NULL,NULL,NULL),(184,NULL,NULL,NULL),(185,NULL,NULL,NULL),(186,NULL,NULL,NULL),(187,NULL,NULL,NULL),(188,NULL,NULL,NULL),(189,NULL,NULL,NULL),(190,NULL,NULL,NULL),(191,NULL,NULL,NULL),(192,NULL,NULL,NULL),(193,NULL,NULL,NULL),(194,NULL,NULL,NULL),(195,NULL,NULL,NULL),(196,NULL,NULL,NULL),(197,NULL,NULL,NULL),(198,NULL,NULL,NULL),(199,NULL,NULL,NULL),(200,NULL,NULL,NULL),(201,NULL,NULL,NULL),(202,NULL,NULL,NULL),(203,NULL,NULL,NULL),(204,NULL,NULL,NULL),(205,NULL,NULL,NULL),(206,NULL,NULL,NULL),(207,NULL,NULL,NULL),(208,NULL,NULL,NULL),(209,NULL,NULL,NULL),(210,NULL,NULL,NULL),(211,NULL,NULL,NULL),(212,NULL,NULL,NULL),(213,NULL,NULL,NULL),(214,NULL,NULL,NULL),(215,NULL,NULL,NULL),(216,NULL,NULL,NULL),(217,NULL,NULL,NULL),(218,NULL,NULL,NULL),(219,NULL,NULL,NULL),(220,NULL,NULL,NULL),(221,NULL,NULL,NULL),(222,NULL,NULL,NULL),(223,NULL,NULL,NULL),(224,NULL,NULL,NULL),(225,NULL,NULL,NULL),(226,NULL,NULL,NULL),(227,NULL,NULL,NULL),(228,NULL,NULL,NULL),(229,NULL,NULL,NULL),(230,NULL,NULL,NULL),(231,NULL,NULL,NULL),(232,NULL,NULL,NULL),(233,NULL,NULL,NULL),(234,NULL,NULL,NULL),(235,NULL,NULL,NULL),(236,NULL,NULL,NULL),(237,NULL,NULL,NULL),(238,NULL,NULL,NULL),(239,NULL,NULL,NULL),(240,NULL,NULL,NULL),(241,NULL,NULL,NULL),(242,NULL,NULL,NULL),(243,NULL,NULL,NULL),(244,NULL,NULL,NULL),(245,NULL,NULL,NULL),(246,NULL,NULL,NULL),(247,NULL,NULL,NULL),(248,NULL,NULL,NULL),(249,NULL,NULL,NULL),(250,NULL,NULL,NULL),(251,NULL,NULL,NULL),(252,NULL,NULL,NULL),(253,NULL,NULL,NULL),(254,NULL,NULL,NULL),(255,NULL,NULL,NULL),(256,NULL,NULL,NULL),(257,NULL,NULL,NULL),(258,NULL,NULL,NULL),(259,NULL,NULL,NULL),(260,NULL,NULL,NULL),(261,NULL,NULL,NULL),(262,NULL,NULL,NULL),(263,NULL,NULL,NULL),(264,NULL,NULL,NULL),(265,NULL,NULL,NULL),(266,NULL,NULL,NULL),(267,NULL,NULL,NULL),(268,NULL,NULL,NULL),(269,NULL,NULL,NULL),(270,NULL,NULL,NULL),(271,NULL,NULL,NULL),(272,NULL,NULL,NULL),(273,NULL,NULL,NULL),(274,NULL,NULL,NULL),(275,NULL,NULL,NULL),(276,NULL,NULL,NULL),(277,NULL,NULL,NULL),(278,NULL,NULL,NULL),(279,NULL,NULL,NULL),(280,NULL,NULL,NULL),(281,NULL,NULL,NULL),(282,NULL,NULL,NULL),(283,NULL,NULL,NULL),(284,NULL,NULL,NULL),(285,NULL,NULL,NULL),(286,NULL,NULL,NULL),(287,NULL,NULL,NULL),(288,NULL,NULL,NULL),(289,NULL,NULL,NULL),(290,NULL,NULL,NULL),(291,NULL,NULL,NULL),(292,NULL,NULL,NULL),(293,NULL,NULL,NULL),(294,NULL,NULL,NULL),(295,NULL,NULL,NULL),(296,NULL,NULL,NULL),(297,NULL,NULL,NULL),(298,NULL,NULL,NULL),(299,NULL,NULL,NULL),(300,NULL,NULL,NULL),(301,NULL,NULL,NULL),(302,NULL,NULL,NULL),(303,NULL,NULL,NULL),(304,NULL,NULL,NULL),(305,NULL,NULL,NULL),(306,NULL,NULL,NULL),(307,NULL,NULL,NULL),(308,NULL,NULL,NULL),(309,NULL,NULL,NULL),(310,NULL,NULL,NULL),(311,NULL,NULL,NULL),(312,NULL,NULL,NULL),(313,NULL,NULL,NULL),(314,NULL,NULL,NULL),(315,NULL,NULL,NULL),(316,NULL,NULL,NULL),(317,NULL,NULL,NULL),(318,NULL,NULL,NULL),(319,NULL,NULL,NULL),(320,NULL,NULL,NULL),(321,NULL,NULL,NULL),(322,NULL,NULL,NULL),(323,NULL,NULL,NULL),(324,NULL,NULL,NULL),(325,NULL,NULL,NULL),(326,NULL,NULL,NULL),(327,NULL,NULL,NULL),(328,NULL,NULL,NULL),(329,NULL,NULL,NULL),(330,NULL,NULL,NULL),(331,NULL,NULL,NULL),(332,NULL,NULL,NULL),(333,NULL,NULL,NULL),(334,NULL,NULL,NULL),(335,NULL,NULL,NULL),(336,NULL,NULL,NULL),(337,NULL,NULL,NULL),(338,NULL,NULL,NULL),(339,NULL,NULL,NULL),(340,NULL,NULL,NULL),(341,NULL,NULL,NULL),(342,NULL,NULL,NULL),(343,NULL,NULL,NULL),(344,NULL,NULL,NULL),(345,NULL,NULL,NULL),(346,NULL,NULL,NULL),(347,NULL,NULL,NULL),(348,NULL,NULL,NULL),(349,NULL,NULL,NULL),(350,NULL,NULL,NULL),(351,NULL,NULL,NULL),(352,NULL,NULL,NULL),(353,NULL,NULL,NULL),(354,NULL,NULL,NULL),(355,NULL,NULL,NULL),(356,NULL,NULL,NULL),(357,NULL,NULL,NULL),(358,NULL,NULL,NULL),(359,NULL,NULL,NULL),(360,NULL,NULL,NULL),(361,NULL,NULL,NULL),(362,NULL,NULL,NULL),(363,NULL,NULL,NULL),(364,NULL,NULL,NULL),(365,NULL,NULL,NULL),(366,NULL,NULL,NULL),(367,NULL,NULL,NULL),(368,NULL,NULL,NULL),(369,NULL,NULL,NULL),(370,NULL,NULL,NULL),(371,NULL,NULL,NULL),(372,NULL,NULL,NULL),(373,NULL,NULL,NULL),(374,NULL,NULL,NULL),(375,NULL,NULL,NULL),(376,NULL,NULL,NULL),(377,NULL,NULL,NULL),(378,NULL,NULL,NULL),(379,NULL,NULL,NULL),(380,NULL,NULL,NULL),(381,NULL,NULL,NULL),(382,NULL,NULL,NULL),(383,NULL,NULL,NULL),(384,NULL,NULL,NULL),(385,NULL,NULL,NULL),(386,NULL,NULL,NULL),(387,NULL,NULL,NULL),(388,NULL,NULL,NULL),(389,NULL,NULL,NULL),(390,NULL,NULL,NULL),(391,NULL,NULL,NULL),(392,NULL,NULL,NULL),(393,NULL,NULL,NULL),(394,NULL,NULL,NULL),(395,NULL,NULL,NULL),(396,NULL,NULL,NULL),(397,NULL,NULL,NULL),(398,NULL,NULL,NULL),(399,NULL,NULL,NULL),(400,NULL,NULL,NULL);
/*!40000 ALTER TABLE `plazas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`elena`@`%`*/ /*!50003 TRIGGER parking_historico_trg AFTER UPDATE ON plazas FOR EACH ROW
BEGIN
DECLARE max_id int;
DECLARE vDate date;
DECLARE vUser varchar(15);
DECLARE vHost varchar(20);
SELECT max(id_historico) INTO max_id FROM historico_parking;
SELECT CURDATE() INTO vDate;
SELECT SUBSTRING_INDEX(user(), '@', 1) into vUser;
SELECT SUBSTRING_INDEX(user(), '@', 2) into vHost;
IF max_id IS NULL THEN SET max_id = 0;
END IF;
IF old.matricula IS NOT NULL THEN
SET max_id = max_id+1;
INSERT INTO historico_parking (id_historico, id_plaza, matricula, inicio_reserva, fin_reserva, date_update, 
cur_user, cur_host) 
VALUES (max_id, old.id_plaza, old.matricula, old.inicio_reserva, old.fin_reserva, vDate, vUser, vHost);
END IF;
IF new.matricula IS NOT NULL THEN
SET max_id = max_id+1;
INSERT INTO historico_parking (id_historico, id_plaza, matricula, inicio_reserva, fin_reserva, date_update, 
cur_user, cur_host) 
VALUES (max_id, new.id_plaza, new.matricula, new.inicio_reserva, new.fin_reserva, vDate, vUser, vHost);
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id_ticket` int(11) NOT NULL,
  `matricula` varchar(130) DEFAULT NULL,
  `fecha_entrada` datetime DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_ticket`),
  UNIQUE KEY `matricula` (`matricula`),
  UNIQUE KEY `matricula_2` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (13,'7bd91932812096836d91af14aa19aaa16753de06247a6daaaf5f0ffb5e942be770a40ca15432b4d24df6707043de3621c33d8ae0a18a906dbb7ec5f55a7cdcf1','2020-02-09 13:44:00','2020-03-11 17:41:00',464.98),(14,'225e358c04e36893668f4cef0d6dc6f3597c339933b43cd3b96308e24164dcf72edc05c968bb0a805b2af9848eaea3826cffeab95a6f947d53b3ad6aee774634','2020-02-09 17:58:00','2020-02-09 01:22:00',34.77),(15,'fd464f73d02dd5a72aa6c39ce64c730653ccc43e12f0b8283df5938ac72332afa95f61099cb5c50eb9354cbd468fec1814fd71d9e85ee7035daabc0af51b56b6','2020-02-08 07:30:00','2020-02-08 09:30:00',3.00);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`elena`@`%`*/ /*!50003 TRIGGER `aeropuerto_sevilla`.`tickets_AFTER_DELETE` AFTER DELETE ON `tickets` FOR EACH ROW
BEGIN
DECLARE max_id int;
DECLARE vDate date;
SELECT max(id_historico) INTO max_id FROM historico_tickets;
SELECT CURDATE() INTO vDate;
IF max_id IS NULL THEN SET max_id = 0;
END IF;
SET max_id = max_id+1;
INSERT INTO historico_tickets (id_historico, id_ticket, matricula, fecha_entrada, fecha_salida, precio, fecha_expiracion) 
VALUES (max_id, old.id_ticket, old.matricula, old.fecha_entrada, old.fecha_salida, old.precio, vDate);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `vuelos`
--

DROP TABLE IF EXISTS `vuelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vuelos` (
  `id_vuelo` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_vuelo` date DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  `ciudad_origen` varchar(15) DEFAULT NULL,
  `ciudad_destino` varchar(15) DEFAULT NULL,
  `id_avion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_vuelo`),
  KEY `id_avion` (`id_avion`),
  CONSTRAINT `vuelos_ibfk_1` FOREIGN KEY (`id_avion`) REFERENCES `aviones` (`id_avion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelos`
--

LOCK TABLES `vuelos` WRITE;
/*!40000 ALTER TABLE `vuelos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vuelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'aeropuerto_sevilla'
--

--
-- Dumping routines for database 'aeropuerto_sevilla'
--
/*!50003 DROP PROCEDURE IF EXISTS `insert_plazas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elena`@`%` PROCEDURE `insert_plazas`()
BEGIN
        DECLARE crs INT DEFAULT 1;

        WHILE crs <= 400 DO
            INSERT INTO plazas (id_plaza, matricula, inicio_reserva, fin_reserva) VALUES (crs, null, null, null);
            SET crs = crs + 1;
        END WHILE;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-11 11:23:17
