CREATE DATABASE  IF NOT EXISTS `nail_salon` /*!40100 DEFAULT CHARACTER SET cp866 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nail_salon`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: nail_salon
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `IDcat` int NOT NULL AUTO_INCREMENT,
  `namecategory` varchar(30) NOT NULL,
  PRIMARY KEY (`IDcat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=cp866;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Маникюр'),(2,'Педикюр');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `IDcl` int NOT NULL AUTO_INCREMENT,
  `clname` varchar(30) NOT NULL,
  `clphone` varchar(11) NOT NULL,
  PRIMARY KEY (`IDcl`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=cp866;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Мария','89758394091'),(2,'Арина','89907890143'),(3,'Кристина','87902763991'),(4,'Арина','87655110976'),(5,'Роксана','8955601281'),(6,'Марина','89022341876'),(7,'Галина','87653490180'),(8,'Любовь','87639035000'),(9,'Алиса','89112456793'),(10,'Ева','89996702391'),(11,'Александра','89567803398'),(12,'Ирина','89567382942'),(13,'Мишель','89003457429');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `masters`
--

DROP TABLE IF EXISTS `masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `masters` (
  `IDmas` int NOT NULL AUTO_INCREMENT,
  `masname` varchar(30) NOT NULL,
  PRIMARY KEY (`IDmas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=cp866;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `masters`
--

LOCK TABLES `masters` WRITE;
/*!40000 ALTER TABLE `masters` DISABLE KEYS */;
INSERT INTO `masters` VALUES (1,'Елена'),(2,'Ольга'),(3,'Мария'),(4,'Екатерина'),(5,'Оксана');
/*!40000 ALTER TABLE `masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `IDzap` int NOT NULL AUTO_INCREMENT,
  `IDusl` int NOT NULL,
  `IDcl` int NOT NULL,
  `IDmas` int NOT NULL,
  `Timeapp` time NOT NULL,
  `DataApp` date NOT NULL,
  PRIMARY KEY (`IDzap`),
  KEY `IDusl` (`IDusl`),
  KEY `IDcl` (`IDcl`),
  KEY `IDmas` (`IDmas`),
  CONSTRAINT `record_ibfk_1` FOREIGN KEY (`IDusl`) REFERENCES `service` (`IDusl`),
  CONSTRAINT `record_ibfk_2` FOREIGN KEY (`IDcl`) REFERENCES `clients` (`IDcl`),
  CONSTRAINT `record_ibfk_3` FOREIGN KEY (`IDmas`) REFERENCES `masters` (`IDmas`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=cp866;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (1,9,4,3,'13:40:00','2025-06-30'),(2,2,5,4,'15:00:00','2025-06-30'),(3,5,6,5,'17:00:00','2025-06-30'),(4,6,7,5,'17:10:00','2025-06-30'),(5,8,8,4,'08:00:00','2025-07-01'),(6,7,9,1,'10:00:00','2025-07-01'),(7,1,10,2,'10:00:00','2025-07-01'),(8,3,11,3,'11:40:00','2025-07-01'),(9,4,12,2,'13:00:00','2025-07-02'),(10,1,13,5,'14:50:00','2025-07-02'),(11,9,3,5,'15:00:00','2025-07-03'),(12,7,1,1,'15:00:00','2025-07-04'),(13,9,2,3,'12:10:00','2025-07-04'),(14,8,3,2,'13:40:00','2025-07-03');
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `IDusl` int NOT NULL AUTO_INCREMENT,
  `uslname` varchar(30) NOT NULL,
  `usltime` varchar(30) NOT NULL,
  `cost` int NOT NULL,
  `IDcat` int NOT NULL,
  PRIMARY KEY (`IDusl`),
  KEY `IDcat` (`IDcat`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`IDcat`) REFERENCES `category` (`IDcat`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=cp866;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Скоростной маникюр','Два часа',4320,1),(2,'Скоростной педикюр','Час',2880,2),(3,'Наращивание','Три часа',4320,1),(4,'Коррекция маникюра','два часа',3600,1),(5,'Коррекция педикюра','Час',2592,2),(6,'Японский маникюр','Полтора часа',4032,1),(7,'Снятие покрытия','Пол часа',1152,1),(8,'Покрытие на свои ногти','Час',2160,1),(9,'Маникюр без покрытия','Час',1440,1);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `запись`
--

DROP TABLE IF EXISTS `запись`;
/*!50001 DROP VIEW IF EXISTS `запись`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `запись` AS SELECT 
 1 AS `Номер`,
 1 AS `Услуга`,
 1 AS `Цена`,
 1 AS `Мастер`,
 1 AS `Время`,
 1 AS `Дата`,
 1 AS `Клиент`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `услуга`
--

DROP TABLE IF EXISTS `услуга`;
/*!50001 DROP VIEW IF EXISTS `услуга`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `услуга` AS SELECT 
 1 AS `Категория`,
 1 AS `Услуга`,
 1 AS `Цена`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'nail_salon'
--

--
-- Dumping routines for database 'nail_salon'
--
/*!50003 DROP FUNCTION IF EXISTS `getnum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getnum`(category_namecategory varchar(100)) RETURNS int
    DETERMINISTIC
BEGIN
declare Count_service integer;
select COUNT(*) INTO Count_service
FROM service
where IDcat=(select IDcat FROM category where namecategory like category_namecategory);
RETURN (Count_service);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`(IN Param1 INT)
BEGIN
update service s
SET s.cost=cost+s.cost*Param1/100
where IDusl>0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `запись`
--

/*!50001 DROP VIEW IF EXISTS `запись`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `запись` AS select `record`.`IDzap` AS `Номер`,`service`.`uslname` AS `Услуга`,`service`.`cost` AS `Цена`,`masters`.`masname` AS `Мастер`,`record`.`Timeapp` AS `Время`,`record`.`DataApp` AS `Дата`,`clients`.`clname` AS `Клиент` from (((`record` join `clients` on((`record`.`IDcl` = `clients`.`IDcl`))) join `masters` on((`record`.`IDmas` = `masters`.`IDmas`))) join `service` on((`record`.`IDusl` = `service`.`IDusl`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `услуга`
--

/*!50001 DROP VIEW IF EXISTS `услуга`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `услуга` AS select `category`.`namecategory` AS `Категория`,`service`.`uslname` AS `Услуга`,`service`.`cost` AS `Цена` from (`service` join `category` on((`service`.`IDcat` = `category`.`IDcat`))) */;
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

-- Dump completed on 2025-06-21 14:56:28
