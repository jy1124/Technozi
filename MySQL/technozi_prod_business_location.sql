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
-- Table structure for table `business_location`
--

DROP TABLE IF EXISTS `business_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_location` (
  `id` int NOT NULL,
  `location` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_location`
--

LOCK TABLES `business_location` WRITE;
/*!40000 ALTER TABLE `business_location` DISABLE KEYS */;
INSERT INTO `business_location` VALUES (1,'Libero Est Congue Corporation'),(2,'Ut Nec Urna Associates'),(3,'Sem LLP'),(4,'Facilisi LLP'),(5,'Dui Cum LLP'),(6,'Egestas Aliquam Institute'),(7,'Molestie Associates'),(8,'Fringilla Donec Feugiat PC'),(9,'Eleifend Egestas Corporation'),(10,'Dui PC'),(11,'Luctus Aliquet Odio Corporation'),(12,'Neque Et Nunc Foundation'),(13,'KFC PTE LTD'),(14,'BURGERKING PTE LTD'),(15,'Ultricies Ligula LLC'),(16,'Lacus LLC'),(17,'Lectus Ltd'),(18,'Habitant Corp.'),(19,'Egestas Sed Pharetra Limited'),(20,'Blandit Limited'),(21,'Amet Metus Corp.'),(22,'Consectetuer Mauris Id PC'),(23,'Mollis Non Foundation'),(24,'Tempor Corporation'),(25,'Semper LLP'),(26,'Magna Ut Associates'),(27,'Vulputate Posuere Vulputate LLP'),(28,'Magna A LLC'),(29,'Nibh Incorporated'),(30,'Pede Corp.'),(31,'MACDONALD PTE LTD'),(32,'Arcu Morbi Sit LLP'),(33,'Justo Faucibus Foundation'),(34,'Orci Phasellus Dapibus Limited'),(35,'Porttitor Eros Nec Corp.'),(36,'Vivamus Rhoncus Donec Consulting'),(37,'Eget Magna Foundation'),(38,'Vestibulum Accumsan Neque Limited'),(39,'Nec Orci Donec Institute'),(40,'Lorem Ut Aliquam PC'),(41,'Vestibulum Institute'),(42,'Fringilla Porttitor Industries'),(43,'Consequat Nec Company'),(44,'Euismod In Dolor Industries'),(45,'Nibh Lacinia Ltd'),(46,'Dui Suspendisse Associates'),(47,'Erat Company'),(48,'Aenean Egestas Hendrerit Foundation'),(49,'Luctus Et Ultrices Associates'),(50,'Fusce Mollis Duis Institute'),(51,'Mollis Company'),(52,'Velit In Company'),(53,'Iaculis Incorporated'),(54,'Elementum Industries'),(55,'Vitae Nibh Donec Corp.'),(56,'Ac Urna Ut Institute'),(57,'Ut PC'),(58,'Elit Ltd'),(59,'At Velit Cras Limited'),(60,'Magna Et Consulting'),(61,'Condimentum Donec At Corp.'),(62,'Scelerisque Scelerisque Inc.'),(63,'Neque Corporation'),(64,'Penatibus Et Associates'),(65,'Auctor Associates'),(66,'Nec Corporation'),(67,'Tellus LLC'),(68,'Lacinia Foundation'),(69,'Amet Ornare Associates'),(70,'Laoreet Corporation'),(71,'Sapien Molestie Institute'),(72,'Nulla Aliquet Limited'),(73,'Aliquet Vel Industries'),(74,'Sit Amet Incorporated'),(75,'Sed Incorporated'),(76,'Non Institute'),(77,'Nunc Inc.'),(78,'Eu Tellus Eu Associates'),(79,'Lacinia Orci Institute'),(80,'Mauris A Nunc LLC'),(81,'Aliquet Magna A Corp.'),(82,'Felis PC'),(83,'Vestibulum LLP'),(84,'Rhoncus Nullam Associates'),(85,'Eu Corporation'),(86,'Viverra Maecenas Iaculis Inc.'),(87,'Egestas Blandit Industries'),(88,'Semper Auctor Mauris Associates'),(89,'Ligula Nullam Enim Associates'),(90,'Vestibulum Inc.'),(91,'Orci Donec Company'),(92,'Ullamcorper Eu LLP'),(93,'Amet Consectetuer Corporation'),(94,'Porttitor Interdum Sed LLC'),(95,'Egestas Blandit Nam Company'),(96,'Nulla LLC'),(97,'Faucibus Leo In Consulting'),(98,'Auctor Velit Inc.'),(99,'Ante Ipsum Inc.'),(100,'Penatibus Institute'),(101,'Lobortis Ltd'),(102,'Eget Limited'),(103,'Tincidunt Orci Quis Industries'),(104,'Felis Adipiscing Fringilla Associates'),(105,'Aenean Industries'),(106,'Volutpat Ltd'),(107,'Sed Turpis Nec Ltd'),(108,'Vitae Aliquet Nec Corp.'),(109,'Eget Corp.'),(110,'Egestas Ligula Nullam Corp.'),(111,'Neque Inc.'),(112,'Aliquam Fringilla LLC'),(113,'Rutrum Urna LLC'),(114,'Pede Sagittis Incorporated'),(115,'Blandit At Foundation'),(116,'Dolor Nulla Industries'),(117,'Ligula Aliquam Ltd'),(118,'Mi LLP'),(119,'Nisi Industries'),(120,'Dui Quis Limited'),(121,'Eu LLC'),(122,'Sollicitudin LLP'),(123,'Erat Vivamus Ltd'),(124,'Adipiscing Institute'),(125,'Ligula Aenean Foundation'),(126,'Accumsan Laoreet Ipsum LLC'),(127,'Cras Vulputate Foundation'),(128,'Erat Eget Foundation'),(129,'Dui Quis Ltd'),(130,'Nonummy Ultricies Ornare Limited'),(131,'Viverra Donec Tempus Foundation'),(132,'In Consequat Enim Corporation'),(133,'Nulla Interdum Foundation'),(134,'Odio Company'),(135,'Libero Limited'),(136,'Risus In Mi Corporation'),(137,'Bibendum LLP'),(138,'Mauris LLP'),(139,'Integer PC'),(140,'Libero Mauris Aliquam Associates'),(141,'Dui Lectus Incorporated'),(142,'Erat Eget Tincidunt Industries'),(143,'Nec Mollis Incorporated'),(144,'Sagittis Augue Eu Foundation'),(145,'Malesuada Id Industries'),(146,'Turpis Ltd'),(147,'Dictum Augue Malesuada Associates'),(148,'Dapibus Ligula Corporation'),(149,'Lectus Sit Industries'),(150,'Donec Nibh Enim Corp.'),(151,'Arcu LLC'),(152,'Eu Tempor Erat Limited'),(153,'Donec Non Justo Industries'),(154,'Vitae Nibh Limited'),(155,'A Associates'),(156,'Massa Vestibulum Accumsan Foundation'),(157,'Eu Lacus Quisque PC'),(158,'Nam Corp.'),(159,'Faucibus Orci Luctus Corporation'),(160,'Sem LLC'),(161,'Leo Cras Corp.'),(162,'Leo In Industries'),(163,'Proin Velit Sed Industries'),(164,'Pharetra Felis Foundation'),(165,'Luctus Felis Consulting'),(166,'Vel Faucibus Industries'),(167,'Imperdiet Dictum Magna Industries'),(168,'Arcu Company'),(169,'Duis Mi Foundation'),(170,'Hymenaeos Mauris Ut Ltd'),(171,'Risus Inc.'),(172,'Sit Amet Massa Industries'),(173,'Cursus Associates'),(174,'Donec Consulting'),(175,'Est Nunc Inc.'),(176,'Nisl PC'),(177,'Purus Corporation'),(178,'Pede Blandit Congue Institute'),(179,'Risus Morbi Corp.'),(180,'Nulla Integer LLC'),(181,'Mollis Phasellus Libero Corp.'),(182,'Tellus Faucibus Foundation'),(183,'Integer In Corp.'),(184,'Fringilla Corp.'),(185,'A Ultricies Ltd'),(186,'Tincidunt Nibh PC'),(187,'Nunc Sed Pede PC'),(188,'Nunc Laoreet Limited'),(189,'Feugiat Nec LLP'),(190,'Ornare Lectus Consulting'),(191,'Aliquam Eu Limited'),(192,'Porttitor Scelerisque Neque Incorporated'),(193,'Ante Ipsum Foundation'),(194,'Cursus PC'),(195,'Donec Est Nunc Corporation'),(196,'Neque LLC'),(197,'Nec Euismod Company'),(198,'Dis Parturient Incorporated'),(199,'Mus Associates'),(200,'Placerat Inc.'),(201,'Semper PC'),(202,'Velit Justo Nec Incorporated'),(203,'Et Corporation'),(204,'Suscipit Est Inc.'),(205,'Urna Nunc Quis Inc.'),(206,'Facilisis Magna Associates'),(207,'Lobortis Quam Corporation'),(208,'Ante Blandit Foundation'),(209,'Nam Consequat PC'),(210,'Aliquet Molestie Tellus Industries'),(211,'Non LLC'),(212,'Ligula Donec Luctus Inc.'),(213,'Dignissim Tempor Arcu Industries'),(214,'Feugiat Tellus Lorem Ltd'),(215,'In Limited'),(216,'Pede Inc.'),(217,'Ac Inc.'),(218,'Malesuada Fames Ac Foundation'),(219,'Ultrices Associates'),(220,'Cursus Nunc Mauris Foundation'),(221,'Lorem Luctus Ut LLC'),(222,'Leo Elementum Inc.'),(223,'Parturient Inc.'),(224,'Egestas Nunc Incorporated'),(225,'Risus At Fringilla Corp.'),(226,'Dis Parturient Montes LLC'),(227,'Facilisis Company'),(228,'Urna Convallis Erat Consulting'),(229,'Erat Incorporated'),(230,'Mollis Phasellus Libero Consulting'),(231,'Risus At Fringilla Corporation'),(232,'Nunc Mauris Corporation'),(233,'In Ornare Sagittis LLC'),(234,'Gravida Sagittis Consulting'),(235,'Nam Industries'),(236,'Non Luctus Sit Incorporated'),(237,'Consectetuer Adipiscing Inc.'),(238,'Eu Associates'),(239,'Ac PC'),(240,'Vulputate Risus Incorporated'),(241,'Donec Feugiat Metus Corporation'),(242,'Donec PC'),(243,'Accumsan Sed Corp.'),(244,'Mauris Company'),(245,'Nibh Enim Institute'),(246,'Senectus Et Netus LLP'),(247,'Id PC'),(248,'Pellentesque Tellus Sem Company'),(249,'Fermentum Convallis Industries'),(250,'Nibh Inc.'),(251,'ARNOLDS PTE LTD');
/*!40000 ALTER TABLE `business_location` ENABLE KEYS */;
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

-- Dump completed on 2022-03-10 16:45:49
