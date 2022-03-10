-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: aws-technozi.cqgrbgpjvgqt.us-east-1.rds.amazonaws.com    Database: technozi_prod
-- ------------------------------------------------------
-- Server version	8.0.27

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `vaccine_certificate`
--

DROP TABLE IF EXISTS `vaccine_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccine_certificate` (
  `id` int NOT NULL,
  `batch_no` int DEFAULT NULL,
  `vaccine_type` tinyint DEFAULT NULL,
  `location` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `patient_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccine_certificate`
--

LOCK TABLES `vaccine_certificate` WRITE;
/*!40000 ALTER TABLE `vaccine_certificate` DISABLE KEYS */;
INSERT INTO `vaccine_certificate` VALUES (1,51401,0,'Changi General Hospital','S9999999S','2021-05-10 13:19:05'),(2,51402,0,'Parkway East Hospital','S0447969F','2021-05-10 13:19:05'),(3,51403,0,'Sengkang General Hospital','S1025364J','2021-05-10 13:19:05'),(4,51404,0,'Changi General Hospital','S8326839E','2021-05-10 13:19:05'),(5,51405,0,'Sengkang General Hospital','S6589438F','2021-05-10 13:19:05'),(6,51406,0,'Ng Teng Fong General Hospital','S4836098Z','2021-05-10 13:19:05'),(7,51407,0,'Parkway East Hospital','S1190661C','2021-05-10 13:19:05'),(8,51408,0,'Tan Tock Seng Hospital','S4741352D','2021-05-10 13:19:05'),(9,51409,0,'Singapore General Hospital','S3285296C','2021-05-10 13:19:05'),(10,51410,0,'Tan Tock Seng Hospital','S6310978I','2021-05-10 13:19:05'),(11,51411,0,'Parkway East Hospital','S9060779J','2021-05-10 13:19:05'),(12,51412,0,'Mount Elizabeth Hospital','S5578545G','2021-05-10 13:19:05'),(13,51413,0,'Mount Elizabeth Hospital','S8914926F','2021-05-10 13:19:05'),(14,51414,0,'Singapore General Hospital','S4141834F','2021-05-10 13:19:05'),(15,51415,0,'Raffles Hospital','S6405447C','2021-05-10 13:19:05'),(16,51416,0,'Ng Teng Fong General Hospital','S3976915H','2021-05-10 13:19:05'),(17,51417,0,'Sengkang General Hospital','S3082227G','2021-05-10 13:19:05'),(18,51418,0,'Khoo Teck Puat Hospital','S4388285F','2021-05-10 13:19:05'),(19,51419,0,'Changi General Hospital','S3998061D','2021-05-10 13:19:05'),(20,51420,0,'Tan Tock Seng Hospital','S2389437H','2021-05-10 13:19:05'),(21,51421,1,'Parkway East Hospital','S2853325Z','2021-05-10 13:19:05'),(22,51422,1,'Raffles Hospital','S3951466D','2021-05-10 13:19:05'),(23,51423,1,'Changi General Hospital','S5651217I','2021-05-10 13:19:05'),(24,51424,1,'Khoo Teck Puat Hospital','S2458736C','2021-05-10 13:19:05'),(25,51425,1,'Singapore General Hospital','S5856592Z','2021-05-10 13:19:05'),(26,51426,1,'Raffles Hospital','S8026153E','2021-05-10 13:19:05'),(27,51427,1,'Ng Teng Fong General Hospital','S9690766D','2021-05-10 13:19:05'),(28,51428,1,'Changi General Hospital','S0383688F','2021-05-10 13:19:05'),(29,51429,1,'Sengkang General Hospital','S2951742H','2021-05-10 13:19:05'),(30,51430,1,'Khoo Teck Puat Hospital','S2489776A','2021-05-10 13:19:05'),(31,51431,1,'Changi General Hospital','S1831606D','2021-05-10 13:19:05'),(32,51432,1,'Changi General Hospital','S0142818G','2021-05-10 13:19:05'),(33,51433,1,'Khoo Teck Puat Hospital','S7750321H','2021-05-10 13:19:05'),(34,51434,1,'Singapore General Hospital','S4362743J','2021-05-10 13:19:05'),(35,51435,1,'Tan Tock Seng Hospital','S2564545F','2021-05-10 13:19:05'),(36,51436,1,'Raffles Hospital','S1172378J','2021-05-10 13:19:05'),(37,51437,1,'Khoo Teck Puat Hospital','S6184396E','2021-05-10 13:19:05'),(38,51438,1,'Changi General Hospital','S8002443F','2021-05-10 13:19:05'),(39,51439,1,'Mount Elizabeth Hospital','S0655768F','2021-05-10 13:19:05'),(40,51440,1,'Sengkang General Hospital','S0137182G','2021-05-10 13:19:05'),(41,51441,2,'Sengkang General Hospital','S6175966B','2021-05-10 13:19:05'),(42,51442,2,'Changi General Hospital','S6580150G','2021-05-10 13:19:05'),(43,51443,2,'Changi General Hospital','S4443311G','2021-05-10 13:19:05'),(44,51444,2,'Singapore General Hospital','S6372217J','2021-05-10 13:19:05'),(45,51445,2,'Singapore General Hospital','S8217726D','2021-05-10 13:19:05'),(46,51446,2,'Khoo Teck Puat Hospital','S7254988J','2021-05-10 13:19:05'),(47,51447,2,'Parkway East Hospital','S1449513D','2021-05-10 13:19:05'),(48,51448,2,'Raffles Hospital','S3121891H','2021-05-10 13:19:05'),(49,51449,2,'Ng Teng Fong General Hospital','S2168765J','2021-05-10 13:19:05'),(50,51450,2,'Singapore General Hospital','S4294877B','2021-05-10 13:19:05'),(51,51451,2,'Khoo Teck Puat Hospital','S4356270C','2021-05-10 13:19:05'),(52,51452,2,'Mount Elizabeth Hospital','S1583554J','2021-05-10 13:19:05'),(53,51453,2,'Raffles Hospital','S2218726J','2021-05-10 13:19:05'),(54,51454,2,'Parkway East Hospital','S3750133F','2021-05-10 13:19:05'),(55,51455,2,'Sengkang General Hospital','S9650532I','2021-05-10 13:19:05'),(56,51456,2,'Mount Elizabeth Hospital','S2334365G','2021-05-10 13:19:05'),(57,51457,2,'Raffles Hospital','S9949144B','2021-05-10 13:19:05'),(58,51458,2,'Tan Tock Seng Hospital','S8000740Z','2021-05-10 13:19:05'),(59,51459,2,'Changi General Hospital','S6936552C','2021-05-10 13:19:05'),(60,51460,2,'Raffles Hospital','S4059243A','2021-05-10 13:19:05'),(61,51461,1,'Tan Tock Seng Hospital','S1856440H','2021-05-10 22:01:12'),(62,51462,0,'Changi General Hospital','S3584160T','2021-05-11 11:33:31'),(63,51463,0,'Changi General Hospital','S0184130L','2021-05-11 11:38:05'),(64,51464,0,'Changi General Hospital','S1526654Z','2021-05-11 11:39:02'),(65,51465,0,'Changi General Hospital','S4307147B','2021-05-17 18:09:36'),(66,51466,1,'Changi General Hospital','S8073986D','2021-05-17 20:14:11'),(67,51467,2,'Parkway East Hospital','S1807460Y','2021-05-17 21:38:03'),(68,51468,1,'Mount Elizabeth Hospital','S3073177K','2021-05-17 21:38:17'),(69,51469,1,'Parkway East Hospital','S5891922I','2021-05-17 21:38:26'),(70,51470,2,'Tan Tock Seng Hospital','S7491792A','2021-05-17 21:38:35'),(71,51471,2,'Khoo Teck Puat Hospital','S8130298J','2021-05-17 21:38:44'),(72,51472,1,'Ng Teng Fong General Hospital','S4890520S','2021-05-17 21:38:52'),(73,51473,2,'Sengkang General Hospital','S2776439E','2021-05-17 21:39:01'),(74,51474,0,'Raffles Hospital','S1347361W','2021-05-17 21:39:09'),(75,51475,1,'Parkway East Hospital','S1867485Q','2021-05-17 21:39:18'),(76,51476,2,'Ng Teng Fong General Hospital','S3729753E','2021-05-17 21:39:26'),(77,51477,1,'Tan Tock Seng Hospital','S8821289U','2021-05-17 21:40:10'),(78,51478,2,'Singapore General Hospital','S5264134X','2021-05-17 21:40:25'),(79,51479,2,'Mount Elizabeth Hospital','S6267339G','2021-05-17 21:40:40'),(80,51480,1,'Singapore General Hospital','S2179687M','2021-05-17 21:41:04'),(81,51481,1,'Raffles Hospital','S6714311P','2021-05-17 21:41:13'),(82,51482,2,'Khoo Teck Puat Hospital','S9301062B','2021-05-17 21:41:24'),(83,51483,0,'Raffles Hospital','S7138359V','2021-05-17 21:41:33'),(84,51484,2,'Tan Tock Seng Hospital','S9562729C','2021-05-17 21:42:32'),(85,51485,1,'Khoo Teck Puat Hospital','S2434173Q','2021-05-17 21:42:40'),(86,51486,0,'Ng Teng Fong General Hospital','S6864102K','2021-05-17 21:42:48'),(87,51487,0,'Khoo Teck Puat Hospital','S3798836N','2021-05-17 21:42:55'),(88,51488,1,'Tan Tock Seng Hospital','S4040212F','2021-05-17 21:43:02'),(89,51489,2,'Sengkang General Hospital','S9620953F','2021-05-17 21:43:09'),(90,51490,0,'Khoo Teck Puat Hospital','S3769052Z','2021-05-17 21:43:15'),(91,51491,2,'Tan Tock Seng Hospital','S3524185I','2021-05-17 21:43:23'),(92,51492,2,'Changi General Hospital','S6201853U','2021-05-17 21:43:31'),(93,51493,2,'Singapore General Hospital','S3537328A','2021-05-17 21:43:59'),(94,51494,1,'Raffles Hospital','S2401847G','2021-05-17 21:44:09'),(95,51495,1,'Singapore General Hospital','S7146234D','2021-05-17 21:44:18'),(96,51496,1,'Khoo Teck Puat Hospital','S5825144R','2021-05-17 21:44:30'),(97,51497,0,'Raffles Hospital','S7933953S','2021-05-17 21:44:40'),(98,51498,1,'Tan Tock Seng Hospital','S4444051B','2021-05-17 21:44:49'),(99,51499,2,'Ng Teng Fong General Hospital','S6596211V','2021-05-17 21:47:46'),(100,51500,2,'Sengkang General Hospital','S3302656Z','2021-05-17 21:47:55');
/*!40000 ALTER TABLE `vaccine_certificate` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-10 16:45:23
