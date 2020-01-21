CREATE DATABASE  IF NOT EXISTS `shoeseshop` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shoeseshop`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: shoeseshop
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mtext` varchar(500) NOT NULL,
  `musername` varchar(30) NOT NULL,
  `mcreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'can i pay cash?','nikos','2020-01-06 17:20:59'),(3,'you have any discount?','john','2020-01-06 18:13:08');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ocode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oquant` int(10) unsigned DEFAULT '0',
  `ototal` int(10) unsigned DEFAULT '0',
  `puid` int(11) DEFAULT NULL,
  PRIMARY KEY (`ocode`),
  KEY `fk_inventory` (`puid`),
  CONSTRAINT `fk_inventory` FOREIGN KEY (`puid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pcode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pcategory` varchar(45) NOT NULL,
  `psubcat` varchar(45) NOT NULL,
  `pcolor` varchar(25) NOT NULL,
  `psize` varchar(25) NOT NULL,
  `pdescr` varchar(45) NOT NULL,
  `pdescr2` varchar(100) NOT NULL,
  `pgender` varchar(25) NOT NULL,
  `pquant` int(10) unsigned NOT NULL,
  `pprice` decimal(7,2) unsigned DEFAULT '0.00',
  `purl` varchar(500) DEFAULT NULL,
  `pcreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pupdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pcode`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
select * from product;
--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'adidas','Superstar','White','44','Lifestyle','Adidas Superstar Foundation','MEN',40,99.00,'https://assets.adidas.com/images/w_600,f_auto,q_auto:sensitive,fl_lossy/4e894c2b76dd4c8e9013aafc016047af_9366/Superstar_Shoes_White_FV3284_01_standard.jpg','2020-01-20 22:02:23','2020-01-20 22:02:23'),(2,'nike','Airmax','Black','41','Lifestyle','Nike Air Max 90 - Men Shoes','WOMEN',40,99.00,'https://c.static-nike.com/a/images/t_PDP_1280_v1/f_auto/gorfwjchoasrrzr1fggt/air-max-270-shoe-ntl0RF.jpg','2020-01-20 22:02:23','2020-01-20 22:02:23'),(3,'nike','Zoom','Black','40','Running','Nike Zoom HyperAce 2 Women Running Shoe','WOMEN',40,166.00,'https://c.static-nike.com/a/images/t_PDP_1280_v1/f_auto/psl4yspu3qw9w624ihyc/zoom-hyperace-2-womens-volleyball-shoe-KlrjdK.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),(4,'nike','Zoom','Blue','43','Running','Nike Blue running shoes for Men','MEN',40,116.00,'https://5.imimg.com/data5/UX/UM/MY-14554186/nike-500x500.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),(5,'nike','React Element','White-Blue','45','Basketball','Nike Royal Kentucky Wildcats React Element 55 Shoes Basketball','MEN',40,102.00,'https://images.footballfanatics.com/FFImage/thumb.aspx?i=/productimages/_3486000/altimages/ff_3486469-dcb8286f7e338efd23caalt1_full.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),(6,'nike','Airmax','White-Blue','44','Crossfit','AIR MAX 90/1 for Crossfit Training','MEN',40,112.00,'https://www.flightclub.com/media/catalog/product/cache/1/image/1600x1140/9df78eab33525d08d6e5fb8d27136e95/8/0/804843_01.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),(7,'nike','Zoom Freak','Blue','46','Basketball','Zoom Freak 1	Basketball','MEN',40,255.00,'https://greekcitytimes.com/wp-content/uploads/2019/08/thumbnail_IMG_4531.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),(8,'nike','SUPERFLY','Blue','45','Football','SUPERFLY 7 ACADEMY FG/MG Football Shoes For Men','MEN',40,199.00,'https://rukminim1.flixcart.com/image/800/960/jyxaw7k0/shoe/b/p/c/at7946-414-10-nike-blue-hero-white-obsidian-original-imafj23sxjfd58pz.jpeg','2020-01-20 22:02:23','2020-01-20 22:02:39'),(9,'adidas','Ultraboost','White','45','Running','Adidas Ultraboost 20 Seoul City Pack Shoes','MEN',40,119.00,'https://www.adidas.com.ph/dw/image/v2/bcbs_prd/on/demandware.static/-/Sites-adidas-products/default/dw6c393ac3/zoom/FX7813_01_standard.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),(10,'adidas','RunFalcon','Indigo-Pink','40','Running','Adidas RunFalcon Girls Running Shoe - Raw Indigo/True Pink/Core Black','WOMEN',40,68.00,'https://sportsmart.com.au/products/A32_870332_500.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),(11,'asics','GT-1000','Shark/Black','43','Running','Asics Women GT-1000 7 Stability Running Shoes Grand Shark/Black','WOMEN',40,78.00,'https://resources.mandmdirect.com/Images/_default/a/s/1/as1794_1_cloudzoom.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),(12,'asics','Gel Excite','Black','45','Running','Asics GEL-EXCITE 6 Running Shoes','MEN',40,87.00,'https://images.sportsdirect.com/images/products/21195540_l.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),(13,'reebok','Nano 5.0','Black','45','Crossfit','Reebok-CrossFit-Nano-5.0 for Crossfit Training','MEN',40,95.00,'https://i.pinimg.com/236x/ab/e4/fe/abe4fea66583d2f5b29d009187ea06b8--gym-products-crossfit-shoes.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),(14,'newbalance','Nubuck','Blue','44','Lifestyle','New Balance Man 991 Lifestyle Shoe Nubuck','MEN',40,91.00,'https://www.khloefemme.com/media/image/8d/75/92/scarpa-new-balance-uomo-991-lifestyle-nubuck-npn-npn-navy-2868071263025-1_400x600.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),(15,'puma','Axelion','Black','45','Running','PUMA Men Axelion Dynamic Running Shoes','MEN',40,68.00,'https://www.famousfootwear.com/ProductImages/shoes_ia75212.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),(16,'skechers','Dyna-Lite','Blue','29','Running','SKECHERS KIDS BOYS DYNA-LITE SNEAKER - BLUE','KIDS',40,35.00,'https://deichmann.scene7.com/asset/deichmann/US_02_620266_00','2020-01-20 22:02:23','2020-01-20 22:02:39'),(17,'lotto','Dinamika','Blue-Black','31','Lifestyle','LOTTO DINAMICA 200 II ','KIDS',40,68.00,'https://www.cosmossport.gr/1603121/lotto-dinamica-200-ii.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `rname` (`rname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(68) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `ucreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uupdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2a$10$PHROMJqyTB3GrbJllGfMG.SLu9apzPFIYTS.DNepEzCwoLxgk4X26','Stelios','Kouimanis','stelios@mail.com','2020-01-06 14:56:56','2020-01-06 14:56:56'),(2,'user','$2a$10$LhovqmxNm7bLaeSZTfYjLOXoSfKMBSyCeVTouEoOC85crijFj3d7q','alex','kot','alexk@gmail.com','2020-01-06 18:04:27','2020-01-06 18:04:27'),(3,'teo','$2a$10$sd9Lx.BBeHLQR46e91zyB.RrmvVoVubH/.Fe0pTR7VqV/..QCUNwe','tt','sgt','stelkoui@yahoo.com','2020-01-13 20:26:00','2020-01-13 20:26:00'),(4,'giannis','$2a$10$2AvCgVb4lSTIKP/T/q7/fOBUcYD0aqg7mn49qd.GenwN/2lpjVnxO','john','gk','gk@yahoo.com','2020-01-21 08:13:32','2020-01-21 08:13:32');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`rid`),
  KEY `userrolefk2` (`rid`),
  CONSTRAINT `userrolefk1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `userrolefk2` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(2,2),(3,2),(4,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-21 23:34:04
