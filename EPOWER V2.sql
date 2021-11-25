-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: efficientpowerusagesystem
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `carbon_footprint`
--

DROP TABLE IF EXISTS `carbon_footprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carbon_footprint` (
  `cf_level` char(1) NOT NULL,
  `co2_emissions_minimum` int DEFAULT NULL,
  `co2_emissions_maximum` int DEFAULT NULL,
  `impact` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cf_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carbon_footprint`
--

LOCK TABLES `carbon_footprint` WRITE;
/*!40000 ALTER TABLE `carbon_footprint` DISABLE KEYS */;
INSERT INTO `carbon_footprint` VALUES ('A',0,10,'Safe'),('B',11,15,'Moderate'),('C',16,50,'Unsafe'),('D',51,820,'Detrimental');
/*!40000 ALTER TABLE `carbon_footprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hp_user`
--

DROP TABLE IF EXISTS `hp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hp_user` (
  `username` varchar(20) NOT NULL,
  `hp_level` int DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `hp_level` (`hp_level`),
  CONSTRAINT `hp_user_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  CONSTRAINT `hp_user_ibfk_2` FOREIGN KEY (`hp_level`) REFERENCES `hydro_power` (`hp_level`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hp_user`
--

LOCK TABLES `hp_user` WRITE;
/*!40000 ALTER TABLE `hp_user` DISABLE KEYS */;
INSERT INTO `hp_user` VALUES ('dhanushbhat',4),('rahulgowdak',4),('ndinakara',5),('niranjanapdatta',5),('rekhavaishnav',5),('sahana',5);
/*!40000 ALTER TABLE `hp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hydro_power`
--

DROP TABLE IF EXISTS `hydro_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hydro_power` (
  `hp_level` int NOT NULL,
  `hp_minimum` int DEFAULT NULL,
  `hp_maximum` int DEFAULT NULL,
  `hp_cost` float DEFAULT NULL,
  `cf_level` char(1) DEFAULT NULL,
  PRIMARY KEY (`hp_level`),
  KEY `FK_hp_cf_level` (`cf_level`),
  CONSTRAINT `FK_hp_cf_level` FOREIGN KEY (`cf_level`) REFERENCES `carbon_footprint` (`cf_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hydro_power`
--

LOCK TABLES `hydro_power` WRITE;
/*!40000 ALTER TABLE `hydro_power` DISABLE KEYS */;
INSERT INTO `hydro_power` VALUES (1,0,30,3.6,'C'),(2,31,100,4.95,'C'),(3,101,200,6.5,'C'),(4,201,300,7.55,'C'),(5,301,999,8.65,'C');
/*!40000 ALTER TABLE `hydro_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `np_user`
--

DROP TABLE IF EXISTS `np_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `np_user` (
  `username` varchar(20) DEFAULT NULL,
  `np_level` int DEFAULT NULL,
  KEY `username` (`username`),
  KEY `np_level` (`np_level`),
  CONSTRAINT `np_user_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  CONSTRAINT `np_user_ibfk_2` FOREIGN KEY (`np_level`) REFERENCES `nuclear_power` (`np_level`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `np_user`
--

LOCK TABLES `np_user` WRITE;
/*!40000 ALTER TABLE `np_user` DISABLE KEYS */;
INSERT INTO `np_user` VALUES ('deependrarathi',4),('somsinghthakur',2),('banmeetkalra',4),('sanchita',3),('sanjeevthakur',4),('devyanshsaklani',4),('adityasukhwal',4);
/*!40000 ALTER TABLE `np_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuclear_power`
--

DROP TABLE IF EXISTS `nuclear_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuclear_power` (
  `np_level` int NOT NULL,
  `np_minimum` int DEFAULT NULL,
  `np_maximum` int DEFAULT NULL,
  `np_cost` float DEFAULT NULL,
  `cf_level` char(1) DEFAULT NULL,
  PRIMARY KEY (`np_level`),
  KEY `FK_np_cf_level` (`cf_level`),
  CONSTRAINT `FK_np_cf_level` FOREIGN KEY (`cf_level`) REFERENCES `carbon_footprint` (`cf_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuclear_power`
--

LOCK TABLES `nuclear_power` WRITE;
/*!40000 ALTER TABLE `nuclear_power` DISABLE KEYS */;
INSERT INTO `nuclear_power` VALUES (1,0,50,4.75,'A'),(2,51,150,6.5,'A'),(3,151,300,7.35,'A'),(4,301,999,8.6,'A');
/*!40000 ALTER TABLE `nuclear_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommended_power_usage`
--

DROP TABLE IF EXISTS `recommended_power_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommended_power_usage` (
  `members` int NOT NULL,
  `optimum_power_usage` int NOT NULL,
  PRIMARY KEY (`members`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommended_power_usage`
--

LOCK TABLES `recommended_power_usage` WRITE;
/*!40000 ALTER TABLE `recommended_power_usage` DISABLE KEYS */;
INSERT INTO `recommended_power_usage` VALUES (1,50),(2,90),(3,130),(4,170),(5,220),(6,260),(7,290);
/*!40000 ALTER TABLE `recommended_power_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renewable_power`
--

DROP TABLE IF EXISTS `renewable_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `renewable_power` (
  `rp_level` int NOT NULL,
  `rp_minimum` int DEFAULT NULL,
  `rp_maximum` int DEFAULT NULL,
  `rp_cost` float DEFAULT NULL,
  `cf_level` char(1) DEFAULT NULL,
  PRIMARY KEY (`rp_level`),
  KEY `FK_rp_cf_level` (`cf_level`),
  CONSTRAINT `FK_rp_cf_level` FOREIGN KEY (`cf_level`) REFERENCES `carbon_footprint` (`cf_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renewable_power`
--

LOCK TABLES `renewable_power` WRITE;
/*!40000 ALTER TABLE `renewable_power` DISABLE KEYS */;
INSERT INTO `renewable_power` VALUES (1,0,50,3.2,'B'),(2,51,150,3.9,'B'),(3,151,300,4.9,'B'),(4,301,999,6.2,'B');
/*!40000 ALTER TABLE `renewable_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_user`
--

DROP TABLE IF EXISTS `rp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_user` (
  `username` varchar(20) DEFAULT NULL,
  `rp_level` int DEFAULT NULL,
  KEY `username` (`username`),
  KEY `rp_level` (`rp_level`),
  CONSTRAINT `rp_user_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  CONSTRAINT `rp_user_ibfk_2` FOREIGN KEY (`rp_level`) REFERENCES `renewable_power` (`rp_level`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_user`
--

LOCK TABLES `rp_user` WRITE;
/*!40000 ALTER TABLE `rp_user` DISABLE KEYS */;
INSERT INTO `rp_user` VALUES ('aarongeorge',4);
/*!40000 ALTER TABLE `rp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thermal_power`
--

DROP TABLE IF EXISTS `thermal_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thermal_power` (
  `tp_level` int NOT NULL,
  `tp_minimum` int DEFAULT NULL,
  `tp_maximum` int DEFAULT NULL,
  `tp_cost` float DEFAULT NULL,
  `cf_level` char(1) DEFAULT NULL,
  PRIMARY KEY (`tp_level`),
  KEY `FK_tp_cf_level` (`cf_level`),
  CONSTRAINT `FK_tp_cf_level` FOREIGN KEY (`cf_level`) REFERENCES `carbon_footprint` (`cf_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thermal_power`
--

LOCK TABLES `thermal_power` WRITE;
/*!40000 ALTER TABLE `thermal_power` DISABLE KEYS */;
INSERT INTO `thermal_power` VALUES (1,0,30,0.4,'D'),(2,31,100,1.6,'D'),(3,101,200,3.6,'D'),(4,201,300,5.75,'D'),(5,301,999,6.8,'D');
/*!40000 ALTER TABLE `thermal_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_user`
--

DROP TABLE IF EXISTS `tp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_user` (
  `username` varchar(20) DEFAULT NULL,
  `tp_level` int DEFAULT NULL,
  KEY `username` (`username`),
  KEY `tp_level` (`tp_level`),
  CONSTRAINT `tp_user_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  CONSTRAINT `tp_user_ibfk_2` FOREIGN KEY (`tp_level`) REFERENCES `thermal_power` (`tp_level`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_user`
--

LOCK TABLES `tp_user` WRITE;
/*!40000 ALTER TABLE `tp_user` DISABLE KEYS */;
INSERT INTO `tp_user` VALUES ('preshitmadvi',3),('poojasoneja',3),('jaydeendeen',5),('nahakhimanshu',4);
/*!40000 ALTER TABLE `tp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `members` int NOT NULL,
  `city` varchar(20) NOT NULL,
  `power_usage` int DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('aarongeorge','20ed059357b2c6ebf502f99ab96201e27f06fa6f',4,'Ahmedabad',600),('adityasukhwal','f9a4f4d991345a54bd62227eb8c79d7475a0d4fd',4,'Jaipur',322),('banmeetkalra','4811c9bae2dcfb1d9d96344d95a1a9bfe6432df4',5,'Kolkata',342),('deependrarathi','f06f404779bca263f70819132031dc3fe3c24a23',6,'Jaipur',832),('devyanshsaklani','90a2aae5782fdff851e7ba4cc0396b27fd0d7142',5,'Kolkata',620),('dhanushbhat','272b8c8658a578cdb80580bd83ac45e0ca52d857',4,'Bangalore',235),('jaydeendeen','81851c7294ae2a6903fb475e032c03563c2732d1',7,'Chennai',532),('nahakhimanshu','3d3cf05bdd28e66f4abb1a5648a958a5904fb5f3',5,'Mumbai',220),('ndinakara','c327f17fcabe8478e74f98dfbff89fdb55f25002',5,'Bangalore',600),('niranjanapdatta','957cf9faf3fd31ac5b9866d82e1b949e75b31e56',5,'Bangalore',430),('poojasoneja','a9fa4e2c3013c17ae3ab0ed813d58e2e7a9e81f5',4,'Delhi',130),('preshitmadvi','36dfb112a52160bc92fbcf76317068f3adadb04b',1,'Mumbai',120),('rahulgowdak','49b0d1b30456292df1c916226d0f2f7b731f0e00',3,'Bangalore',250),('rekhavaishnav','bb4c8a45ae036befb1417004ce3bae4f2281ed9c',5,'Bangalore',480),('sahana','9125b0237e2d60aab6c8987b007166275506f2e2',7,'Bangalore',900),('sanchita','703932168a53afa1da1d3357ec6548af9b411794',3,'Kolkata',220),('sanjeevthakur','010f70c7b7ef927db7a81ff408bfa9ce81dde84b',4,'Jaipur',430),('somsinghthakur','b707488e2487160218125b2fea80a1373992852f',2,'Kolkata',75);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-20  1:07:32
