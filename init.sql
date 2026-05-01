-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: estateadvance
-- ------------------------------------------------------
-- Server version	9.6.0

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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '78c1f1f4-1e36-11f1-b9e5-a0806983c4bb:1-508';

--
-- Table structure for table `assignmentbuilding`
--

DROP TABLE IF EXISTS `assignmentbuilding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignmentbuilding` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staffid` bigint NOT NULL,
  `buildingid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_building` (`staffid`),
  KEY `fk_building_user` (`buildingid`),
  CONSTRAINT `fk_building_user` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`),
  CONSTRAINT `fk_user_building` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentbuilding`
--

LOCK TABLES `assignmentbuilding` WRITE;
/*!40000 ALTER TABLE `assignmentbuilding` DISABLE KEYS */;
INSERT INTO `assignmentbuilding` VALUES (4,3,4,NULL,NULL,NULL,NULL),(5,2,7,'2026-04-16 00:27:58',NULL,'admin',NULL),(6,3,7,'2026-04-16 00:27:58',NULL,'admin',NULL),(7,3,8,'2026-04-16 00:27:58',NULL,'admin',NULL),(8,4,8,'2026-04-16 00:27:58',NULL,'admin',NULL),(9,2,9,'2026-04-16 00:27:58',NULL,'admin',NULL),(10,4,9,'2026-04-16 00:27:58',NULL,'admin',NULL),(11,2,10,'2026-04-16 00:27:58',NULL,'admin',NULL),(12,3,10,'2026-04-16 00:27:58',NULL,'admin',NULL),(13,4,10,'2026-04-16 00:27:58',NULL,'admin',NULL),(14,4,11,'2026-04-16 00:27:58',NULL,'admin',NULL),(17,3,13,'2026-04-16 00:27:58',NULL,'admin',NULL),(18,4,13,'2026-04-16 00:27:58',NULL,'admin',NULL),(19,2,14,'2026-04-16 00:27:58',NULL,'admin',NULL),(20,2,15,'2026-04-16 00:27:58',NULL,'admin',NULL),(21,4,15,'2026-04-16 00:27:58',NULL,'admin',NULL),(22,3,16,'2026-04-16 00:27:58',NULL,'admin',NULL),(23,4,16,'2026-04-16 00:27:58',NULL,'admin',NULL),(24,2,17,'2026-04-16 00:27:58',NULL,'admin',NULL),(25,3,17,'2026-04-16 00:27:58',NULL,'admin',NULL),(26,3,18,'2026-04-16 00:27:58',NULL,'admin',NULL),(27,4,18,'2026-04-16 00:27:58',NULL,'admin',NULL),(28,2,19,'2026-04-16 00:27:58',NULL,'admin',NULL),(29,4,19,'2026-04-16 00:27:58',NULL,'admin',NULL),(30,2,20,'2026-04-16 00:27:58',NULL,'admin',NULL),(31,3,20,'2026-04-16 00:27:58',NULL,'admin',NULL),(32,4,20,'2026-04-16 00:27:58',NULL,'admin',NULL),(33,4,21,'2026-04-16 00:27:58',NULL,'admin',NULL),(34,2,22,'2026-04-16 00:27:58',NULL,'admin',NULL),(35,3,22,'2026-04-16 00:27:58',NULL,'admin',NULL),(36,3,23,'2026-04-16 00:27:58',NULL,'admin',NULL),(37,4,23,'2026-04-16 00:27:58',NULL,'admin',NULL),(38,2,24,'2026-04-16 00:27:58',NULL,'admin',NULL),(39,2,25,'2026-04-16 00:27:58',NULL,'admin',NULL),(40,4,25,'2026-04-16 00:27:58',NULL,'admin',NULL),(41,3,26,'2026-04-16 00:27:58',NULL,'admin',NULL),(42,4,26,'2026-04-16 00:27:58',NULL,'admin',NULL),(43,2,27,'2026-04-16 00:27:58',NULL,'admin',NULL),(44,3,27,'2026-04-16 00:27:58',NULL,'admin',NULL),(45,3,28,'2026-04-16 00:27:58',NULL,'admin',NULL),(46,4,28,'2026-04-16 00:27:58',NULL,'admin',NULL),(47,2,29,'2026-04-16 00:27:58',NULL,'admin',NULL),(48,4,29,'2026-04-16 00:27:58',NULL,'admin',NULL),(49,2,30,'2026-04-16 00:27:58',NULL,'admin',NULL),(50,3,30,'2026-04-16 00:27:58',NULL,'admin',NULL),(51,4,30,'2026-04-16 00:27:58',NULL,'admin',NULL),(52,4,31,'2026-04-16 00:27:58',NULL,'admin',NULL),(53,2,32,'2026-04-16 00:27:58',NULL,'admin',NULL),(54,3,32,'2026-04-16 00:27:58',NULL,'admin',NULL),(55,3,33,'2026-04-16 00:27:58',NULL,'admin',NULL),(56,4,33,'2026-04-16 00:27:58',NULL,'admin',NULL),(57,2,34,'2026-04-16 00:27:58',NULL,'admin',NULL),(58,2,35,'2026-04-16 00:27:58',NULL,'admin',NULL),(59,4,35,'2026-04-16 00:27:58',NULL,'admin',NULL),(60,3,36,'2026-04-16 00:27:58',NULL,'admin',NULL),(61,4,36,'2026-04-16 00:27:58',NULL,'admin',NULL),(65,2,12,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `assignmentbuilding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignmentcustomer`
--

DROP TABLE IF EXISTS `assignmentcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignmentcustomer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staffid` bigint NOT NULL,
  `customerid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_customer` (`staffid`),
  KEY `fk_customer_user` (`customerid`),
  CONSTRAINT `fk_customer_user` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_user_customer` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentcustomer`
--

LOCK TABLES `assignmentcustomer` WRITE;
/*!40000 ALTER TABLE `assignmentcustomer` DISABLE KEYS */;
INSERT INTO `assignmentcustomer` VALUES (13,3,4,NULL,NULL,NULL,NULL),(14,4,4,NULL,NULL,NULL,NULL),(18,3,1,NULL,NULL,NULL,NULL),(19,4,1,NULL,NULL,NULL,NULL),(20,5,1,NULL,NULL,NULL,NULL),(21,2,7,NULL,NULL,NULL,NULL),(22,2,12,NULL,NULL,NULL,NULL),(23,2,18,NULL,NULL,NULL,NULL),(24,3,18,NULL,NULL,NULL,NULL),(25,4,18,NULL,NULL,NULL,NULL),(26,5,18,NULL,NULL,NULL,NULL),(27,2,23,NULL,NULL,NULL,NULL),(28,2,11,NULL,NULL,NULL,NULL),(29,2,6,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `assignmentcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `structure` varchar(255) DEFAULT NULL,
  `numberofbasement` int DEFAULT NULL,
  `floorarea` int DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `rentprice` int DEFAULT NULL,
  `rentpricedescription` text,
  `servicefee` varchar(255) DEFAULT NULL,
  `carfee` varchar(255) DEFAULT NULL,
  `motofee` varchar(255) DEFAULT NULL,
  `overtimefee` varchar(255) DEFAULT NULL,
  `waterfee` varchar(255) DEFAULT NULL,
  `electricityfee` varchar(255) DEFAULT NULL,
  `deposit` varchar(255) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `renttime` varchar(255) DEFAULT NULL,
  `decorationtime` varchar(255) DEFAULT NULL,
  `brokeragefee` decimal(13,2) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `linkofbuilding` varchar(255) DEFAULT NULL,
  `map` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `managername` varchar(255) DEFAULT NULL,
  `managerphone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'Nam Giao Building Tower','59 phan xích long','Phường 2','QUAN_1',NULL,2,500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NGUYEN_CAN,TANG_TRET',NULL,NULL,NULL,NULL,NULL,'2026-04-26 16:08:49',NULL,'nguyenvanb',NULL,NULL),(2,'ACM Tower','96 cao thắng','Phường 4','QUAN_2',NULL,2,650,NULL,NULL,18,'18 triệu/m2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NGUYEN_CAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Chú Thuận','0173546263'),(3,'Alpha 2 Building Tower','153 nguyễn đình chiểu','Phường 6','QUAN_1',NULL,1,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NOI_THAT',NULL,NULL,NULL,NULL,NULL,'2026-04-26 16:09:27',NULL,'nguyenvanb',NULL,NULL),(4,'IDD 1 Building','111 Lý Chính Thắng','Phường 7','QUAN_4',NULL,1,200,NULL,NULL,12,'12 triệu/m2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET,NGUYEN_CAN,NOI_THAT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Anh Long','017345253'),(7,'Techcombank Tower','Mạc Thị Bưởi','Bến Nghé','QUAN_1',NULL,3,1000,'Đông Nam','Hạng A',35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET,NOI_THAT',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Nguyễn Văn A','0901234567'),(8,'Vincom Center 2','Đồng Khởi','Bến Nghé','QUAN_1',NULL,6,1200,'Nam','Hạng A',40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Trần Thị B','0912345678'),(9,'Saigon Centre Tower 2','Lê Lợi','Bến Nghé','QUAN_1',NULL,4,1500,'Tây Bắc','Hạng A',45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET,NGUYEN_CAN',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Lê Văn C','0923456789'),(10,'Deutsches Haus','Lê Duẩn','Bến Nghé','QUAN_1',NULL,4,1100,'Đông Bắc','Hạng A+',50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NOI_THAT',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Phạm Thị D','0934567890'),(11,'Diamond Plaza','Lê Duẩn','Bến Nghé','QUAN_1',NULL,2,800,'Tây Nam','Hạng B',25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET,NOI_THAT',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Hoàng Văn E','0945678901'),(12,'AB Tower','Lê Lai','Phạm Ngũ Lão','QUAN_1',NULL,3,750,'Đông','Hạng B',22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NOI_THAT',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58','2026-04-16 17:01:16','admin','nguyenvana','Nguyễn Văn F','0956789012'),(13,'Centec Tower','Nguyễn Thị Minh Khai','Phường 6','QUAN_1',NULL,3,900,'Bắc','Hạng B+',28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NGUYEN_CAN',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Trần Thị G','0967890123'),(14,'CJ Tower','Lê Thánh Tôn','Bến Nghé','QUAN_1',NULL,3,650,'Tây','Hạng B',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Lê Văn H','0978901234'),(15,'Lim Tower','Tôn Đức Thắng','Bến Nghé','QUAN_1',NULL,2,850,'Đông Nam','Hạng B+',26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET,NOI_THAT',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Phạm Thị I','0989012345'),(16,'mPlaza Saigon','Lê Duẩn','Bến Nghé','QUAN_1',NULL,3,1300,'Nam','Hạng A',42,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NOI_THAT',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Hoàng Văn K','0990123456'),(17,'The Vista','Xa Lộ Hà Nội','An Phú','QUAN_2',NULL,2,600,'Đông','Hạng C',15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NGUYEN_CAN',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Nguyễn Văn L','0902345678'),(18,'Thảo Điền Pearl','Quốc Hương','Thảo Điền','QUAN_2',NULL,2,700,'Bắc','Hạng B',18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET,NOI_THAT',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Trần Thị M','0913456789'),(19,'Cantavil Premier','Xa Lộ Hà Nội','An Phú','QUAN_2',NULL,2,550,'Tây Bắc','Hạng C',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Lê Văn N','0924567890'),(20,'Estella Heights','Xa Lộ Hà Nội','An Phú','QUAN_2',NULL,1,800,'Đông Bắc','Hạng B',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NOI_THAT',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Phạm Thị O','0935678901'),(21,'Sala Sarimi','Mai Chí Thọ','An Lợi Đông','QUAN_2',NULL,2,900,'Nam','Hạng A',30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET,NGUYEN_CAN',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Hoàng Văn P','0946789012'),(22,'Masteri Thảo Điền','Xa Lộ Hà Nội','Thảo Điền','QUAN_2',NULL,1,650,'Tây Nam','Hạng B',17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NOI_THAT',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Nguyễn Văn Q','0957890123'),(23,'Lexington Residence','Mai Chí Thọ','An Phú','QUAN_2',NULL,1,500,'Đông Nam','Hạng C',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Trần Thị R','0968901234'),(24,'The Sun Avenue','Mai Chí Thọ','An Phú','QUAN_2',NULL,2,750,'Tây','Hạng B',19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NOI_THAT',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Lê Văn S','0979012345'),(25,'Waterina Suites','Tạ Hiện','Thạnh Mỹ Lợi','QUAN_2',NULL,1,400,'Nam','Hạng B+',22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NGUYEN_CAN',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Phạm Thị T','0980123456'),(26,'Empire City','Mai Chí Thọ','Thủ Thiêm','QUAN_2',NULL,3,1500,'Bắc','Hạng A',35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET,NOI_THAT',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Hoàng Văn U','0991234567'),(27,'Leman Luxury','Nguyễn Đình Chiểu','Phường 6','QUAN_3',NULL,4,850,'Đông','Hạng B+',25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET,NOI_THAT',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Nguyễn Văn V','0903456789'),(28,'Centec Tower 2','Nguyễn Thị Minh Khai','Phường 6','QUAN_3',NULL,3,900,'Tây','Hạng B',24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NOI_THAT',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Trần Thị X','0914567890'),(29,'Robot Tower','Điện Biên Phủ','Phường 4','QUAN_3',NULL,2,450,'Bắc','Hạng C',15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Lê Văn Y','0925678901'),(30,'Lim Tower 2','Cách Mạng Tháng 8','Phường 6','QUAN_3',NULL,3,700,'Nam','Hạng B',21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NGUYEN_CAN',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Phạm Thị Z','0936789012'),(31,'Pax Sky','Nguyễn Đình Chiểu','Phường 6','QUAN_3',NULL,2,550,'Đông Nam','Hạng C',16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NOI_THAT',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Hoàng Văn W','0947890123'),(32,'HM Town','Nguyễn Thị Minh Khai','Phường 5','QUAN_3',NULL,2,600,'Tây Bắc','Hạng B',18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Nguyễn Văn AA','0958901234'),(33,'IDD Building','Lý Chính Thắng','Phường 7','QUAN_3',NULL,2,400,'Đông Bắc','Hạng C',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NOI_THAT',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Trần Thị BB','0969012345'),(34,'Cienco 4','Nguyễn Đình Chiểu','Phường 6','QUAN_3',NULL,2,850,'Tây Nam','Hạng B+',22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Lê Văn CC','0970123456'),(35,'RomeA Center','Nguyễn Đình Chiểu','Phường 6','QUAN_3',NULL,2,650,'Đông','Hạng B',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET,NOI_THAT',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Phạm Thị DD','0981234567'),(36,'Bảo Minh Tower','Nam Kỳ Khởi Nghĩa','Phường 7','QUAN_3',NULL,2,750,'Bắc','Hạng B',19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NGUYEN_CAN',NULL,NULL,NULL,NULL,'2026-04-16 00:27:58',NULL,'admin',NULL,'Hoàng Văn EE','0992345678');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `demand` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Luc Van Hai','0905671231','hailv@gmail.com',NULL,NULL,NULL,1,NULL,'2026-04-26 23:00:15',NULL,'nguyenvana'),(4,'Nguyễn Văn An','0901111222','an.nguyen@gmail.com',NULL,NULL,NULL,1,NULL,'2026-04-26 22:54:07',NULL,'nguyenvana'),(5,'Trần Thị Bình','0912222333','binh.tran@gmail.com',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(6,'Lê Hoàng Cường','0923333444','cuong.le@gmail.com',NULL,NULL,NULL,1,NULL,'2026-04-26 23:01:27',NULL,'nguyenvana'),(7,'Phạm Thị Dung','0934444555','dung.pham@gmail.com',NULL,NULL,NULL,1,NULL,'2026-04-26 23:00:32',NULL,'nguyenvana'),(8,'Hoàng Thái Sơn','0945555666','son.hoang@gmail.com',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(9,'Vũ Mỹ Linh','0956666777','linh.vu@gmail.com',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(10,'Võ Thành Đạt','0967777888','dat.vo@gmail.com',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(11,'Đặng Thu Hà','0978888999','ha.dang@gmail.com',NULL,NULL,NULL,1,NULL,'2026-04-26 23:01:23',NULL,'nguyenvana'),(12,'Bùi Quang Huy','0989999000','huy.bui@gmail.com',NULL,NULL,NULL,1,NULL,'2026-04-26 23:00:37',NULL,'nguyenvana'),(13,'Đỗ Thị Lan','0990000111','lan.do@gmail.com',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(14,'Hồ Anh Tú','0901234123','tu.ho@gmail.com',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(15,'Ngô Văn Minh','0912345234','minh.ngo@gmail.com',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(16,'Dương Ánh Tuyết','0923456345','tuyet.duong@gmail.com',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(17,'Lý Trọng Đức','0934567456','duc.ly@gmail.com',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(18,'Phan Hồng Ngọc','0945678567','ngoc.phan@gmail.com',NULL,NULL,NULL,1,NULL,'2026-04-26 23:01:13',NULL,'nguyenvana'),(19,'Trịnh Tuấn Cảnh','0956789678','canh.trinh@gmail.com',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(20,'Đinh Gia Bảo','0967890789','bao.dinh@gmail.com',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(21,'Lâm Kim Liên','0978901890','kim.lam@gmail.com',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(22,'Phùng Bảo Châu','0989012901','chau.phung@gmail.com',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(23,'Nguyễn Mai Phương','0990123012','phuong.mai@gmail.com','','','DANG_XL',1,NULL,'2026-04-26 23:01:19',NULL,'nguyenvana');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentarea`
--

DROP TABLE IF EXISTS `rentarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentarea` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` int DEFAULT NULL,
  `buildingid` bigint DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rentarea_building` (`buildingid`),
  CONSTRAINT `rentarea_building` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentarea`
--

LOCK TABLES `rentarea` WRITE;
/*!40000 ALTER TABLE `rentarea` DISABLE KEYS */;
INSERT INTO `rentarea` VALUES (3,200,2,NULL,NULL,NULL,NULL),(4,300,2,NULL,NULL,NULL,NULL),(5,400,2,NULL,NULL,NULL,NULL),(9,100,4,NULL,NULL,NULL,NULL),(10,400,4,NULL,NULL,NULL,NULL),(11,250,4,NULL,NULL,NULL,NULL),(25,100,7,'2026-04-16 00:27:58',NULL,'admin',NULL),(26,200,7,'2026-04-16 00:27:58',NULL,'admin',NULL),(27,150,8,'2026-04-16 00:27:58',NULL,'admin',NULL),(28,300,8,'2026-04-16 00:27:58',NULL,'admin',NULL),(29,250,9,'2026-04-16 00:27:58',NULL,'admin',NULL),(30,400,9,'2026-04-16 00:27:58',NULL,'admin',NULL),(31,600,9,'2026-04-16 00:27:58',NULL,'admin',NULL),(32,120,10,'2026-04-16 00:27:58',NULL,'admin',NULL),(33,180,10,'2026-04-16 00:27:58',NULL,'admin',NULL),(34,100,11,'2026-04-16 00:27:58',NULL,'admin',NULL),(35,300,11,'2026-04-16 00:27:58',NULL,'admin',NULL),(36,80,12,'2026-04-16 00:27:58',NULL,'admin',NULL),(37,150,12,'2026-04-16 00:27:58',NULL,'admin',NULL),(38,200,13,'2026-04-16 00:27:58',NULL,'admin',NULL),(39,450,13,'2026-04-16 00:27:58',NULL,'admin',NULL),(40,100,14,'2026-04-16 00:27:58',NULL,'admin',NULL),(41,150,14,'2026-04-16 00:27:58',NULL,'admin',NULL),(42,250,14,'2026-04-16 00:27:58',NULL,'admin',NULL),(43,300,15,'2026-04-16 00:27:58',NULL,'admin',NULL),(44,500,15,'2026-04-16 00:27:58',NULL,'admin',NULL),(45,400,16,'2026-04-16 00:27:58',NULL,'admin',NULL),(46,800,16,'2026-04-16 00:27:58',NULL,'admin',NULL),(47,150,17,'2026-04-16 00:27:58',NULL,'admin',NULL),(48,200,18,'2026-04-16 00:27:58',NULL,'admin',NULL),(49,300,18,'2026-04-16 00:27:58',NULL,'admin',NULL),(50,100,19,'2026-04-16 00:27:58',NULL,'admin',NULL),(51,150,19,'2026-04-16 00:27:58',NULL,'admin',NULL),(52,200,20,'2026-04-16 00:27:58',NULL,'admin',NULL),(53,400,20,'2026-04-16 00:27:58',NULL,'admin',NULL),(54,350,21,'2026-04-16 00:27:58',NULL,'admin',NULL),(55,120,22,'2026-04-16 00:27:58',NULL,'admin',NULL),(56,220,22,'2026-04-16 00:27:58',NULL,'admin',NULL),(57,80,23,'2026-04-16 00:27:58',NULL,'admin',NULL),(58,100,23,'2026-04-16 00:27:58',NULL,'admin',NULL),(59,150,24,'2026-04-16 00:27:58',NULL,'admin',NULL),(60,300,24,'2026-04-16 00:27:58',NULL,'admin',NULL),(61,200,25,'2026-04-16 00:27:58',NULL,'admin',NULL),(62,500,26,'2026-04-16 00:27:58',NULL,'admin',NULL),(63,1000,26,'2026-04-16 00:27:58',NULL,'admin',NULL),(64,150,27,'2026-04-16 00:27:58',NULL,'admin',NULL),(65,250,27,'2026-04-16 00:27:58',NULL,'admin',NULL),(66,300,28,'2026-04-16 00:27:58',NULL,'admin',NULL),(67,600,28,'2026-04-16 00:27:58',NULL,'admin',NULL),(68,100,29,'2026-04-16 00:27:58',NULL,'admin',NULL),(69,200,30,'2026-04-16 00:27:58',NULL,'admin',NULL),(70,400,30,'2026-04-16 00:27:58',NULL,'admin',NULL),(71,150,31,'2026-04-16 00:27:58',NULL,'admin',NULL),(72,300,31,'2026-04-16 00:27:58',NULL,'admin',NULL),(73,120,32,'2026-04-16 00:27:58',NULL,'admin',NULL),(74,180,32,'2026-04-16 00:27:58',NULL,'admin',NULL),(75,80,33,'2026-04-16 00:27:58',NULL,'admin',NULL),(76,160,33,'2026-04-16 00:27:58',NULL,'admin',NULL),(77,250,34,'2026-04-16 00:27:58',NULL,'admin',NULL),(78,500,34,'2026-04-16 00:27:58',NULL,'admin',NULL),(79,200,35,'2026-04-16 00:27:58',NULL,'admin',NULL),(80,350,35,'2026-04-16 00:27:58',NULL,'admin',NULL),(81,100,36,'2026-04-16 00:27:58',NULL,'admin',NULL),(82,200,36,'2026-04-16 00:27:58',NULL,'admin',NULL),(83,400,36,'2026-04-16 00:27:58',NULL,'admin',NULL),(104,100,1,NULL,NULL,NULL,NULL),(105,200,1,NULL,NULL,NULL,NULL),(106,300,1,NULL,NULL,NULL,NULL),(107,300,3,NULL,NULL,NULL,NULL),(108,400,3,NULL,NULL,NULL,NULL),(109,500,3,NULL,NULL,NULL,NULL),(110,600,3,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rentarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Quản lý','MANAGER',NULL,NULL,NULL,NULL),(2,'Nhân viên','STAFF',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `customerid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `staffid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_transaction` (`customerid`),
  CONSTRAINT `fk_customer_transaction` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'CSKH','tu van khach hang',7,'2026-04-26 23:34:14','2026-04-26 23:34:14','nguyenvanb','nguyenvanb',NULL),(2,'CSKH','tu van khach hang',7,'2026-04-26 23:35:09','2026-04-26 23:35:09','nguyenvanb','nguyenvanb',NULL),(3,'DDX','di xem truc tiep 01',7,'2026-04-26 23:35:22','2026-04-26 23:35:22','nguyenvanb','nguyenvanb',NULL),(4,'','okok1',7,'2026-04-26 23:39:12','2026-04-26 23:52:04','nguyenvanb','nguyenvanb',NULL),(5,'','ok roi do a',7,'2026-04-26 23:41:28','2026-04-26 23:46:26','nguyenvanb','nguyenvanb',NULL),(6,'CSKH','okok1',7,'2026-04-26 23:55:58','2026-04-26 23:56:06','nguyenvanb','nguyenvanb',NULL),(7,'CSKH','okok2',7,'2026-04-26 23:56:02','2026-04-26 23:56:10','nguyenvanb','nguyenvanb',NULL);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'nguyenvana','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van a',NULL,NULL,1,NULL,NULL,NULL,NULL),(2,'nguyenvanb','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van b',NULL,NULL,1,NULL,NULL,NULL,NULL),(3,'nguyenvanc','$2a$10$uZrm7Ju0WDYy97po8yCqk.T5c8XgDBC/IKSY383NHnanS9vr2zV..','nguyen van c',NULL,NULL,1,NULL,'2026-04-26 16:34:58',NULL,'nguyenvana'),(4,'nguyenvand','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','Nguyễn Văn D',NULL,NULL,1,NULL,'2026-04-26 16:38:47',NULL,'nguyenvana'),(5,'nguyenvane','$2a$10$5tG4RUGWMLsx7.C7Ag/jJ.bKd0uNtmhXlMyrzUxCzm0H6wbAWKOpS','Nguyễn Văn E',NULL,NULL,1,'2026-04-26 16:39:35','2026-04-26 16:39:39','nguyenvana','nguyenvana');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role` (`user_id`),
  KEY `fk_role_user` (`role_id`),
  CONSTRAINT `fk_role_user` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1,NULL,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL,NULL),(3,2,3,NULL,NULL,NULL,NULL),(5,2,4,NULL,NULL,NULL,NULL),(6,2,5,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
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

-- Dump completed on 2026-05-01 10:16:14
