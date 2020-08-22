CREATE DATABASE  IF NOT EXISTS `team-b` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `team-b`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: team-b
-- ------------------------------------------------------
-- Server version	8.0.16

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
-- Table structure for table `alc`
--

DROP TABLE IF EXISTS `alc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alc` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `picpass` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `exppass` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `amount` int(10) NOT NULL,
  `txt` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alc`
--

LOCK TABLES `alc` WRITE;
/*!40000 ALTER TABLE `alc` DISABLE KEYS */;
INSERT INTO `alc` VALUES (1,'ビール','1-beer.jpg','https://ja.wikipedia.org/wiki/ビール',6,'1-beer.txt'),(2,'ハイボール','2-highball.jpg','https://ja.wikipedia.org/wiki/ハイボール',7,'2-highball.txt'),(3,'日本酒','3-sake.jpg','https://ja.wikipedia.org/wiki/日本酒',15,'3-sake.txt'),(4,'梅酒','4-plum-wine.jpg','https://ja.wikipedia.org/wiki/梅酒',14,'4-plum-wine.txt'),(5,'ワイン','5-wine.jpg','https://ja.wikipedia.org/wiki/ワイン',7,'5-wine.txt'),(6,'ウイスキー','6-whisky.jpg','https://ja.wikipedia.org/wiki/ウイスキー',40,'6-whisky.txt'),(7,'ウォッカ','7-vodka.jpg','https://ja.wikipedia.org/wiki/ウォッカ',40,'7-vodka.txt'),(8,'カルーアミルク','8-kahlua-and-milk.jpg','https://ja.wikipedia.org/wiki/カルーア・ミルク',5,'8-kahlua-and-milk.txt'),(9,'カシスオレンジ','9-cassis-and-orange.jpg','https://ja.wikipedia.org/wiki/カシス・オレンジ',5,'9-cassis-and-orange.txt'),(10,'焼酎','10-shochu.jpg','https://ja.wikipedia.org/wiki/焼酎',20,'10-shochu.txt');
/*!40000 ALTER TABLE `alc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `alc_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,'2019-08-09 13:56:59',47,10),(2,'2019-08-09 14:07:38',47,2);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(512) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (47,'aaa@gmail.com','$2y$10$nhKZKS/nmo6rvuc9DmIHq..E8GXI7jmnDsIO4nNbNh9wp8s.PpzX2','yuta',24),(48,'baskk4.dt@gmail.com','$2y$10$yGZjR977LqMGXKkpwRpOQu9/72.OaIDgdGyw1py07IdwHfNJQVIy6','hello',23),(49,'aaaaa@aaaaa','$2y$10$NghIDPdQrWRSq5/WjZZRp.mhYJyzYOSQ8ADtctZfbkIJJmFc7N1JO','aaaaa',21),(50,'hello@gmail.com','$2y$10$TgRIR8G4HwypzU47fQXa0.3SZldakAU/6oWurgWIRpQXmrhsFRO6a','aki',20),(51,'aaaa@gmail.com','$2y$10$2gm6dUcSyEFIYuFO/LUb/edHauevXyGSoNL5Di0uoz8sLHIkqpPcW','ty',22),(52,'a@example.com','$2y$10$UfMYQGHY0vj7qWzXwDbPU.uH2sfYZQwNTlp0Ylh18YjYamN2fmIGq','aaaaa',22),(57,'baskk4.dt+@gmail.com','$2y$10$3HNhlFtwFHWInOToMgT7DOenITszWhjOlGnGunnR1zOaFGN6zsp/O','Yammer',20),(58,'aaaa@gam.com','$2y$10$xmU9rgssyh3cRUxVjKjtQekuiebdgSqjaioLPdwPCL8Ks/5Ip4iqu','aa',21),(59,'aaaaa@gmail.com','$2y$10$xuZQjM1lFMCBRjIDnLn.KuFLHVjkhMS0TsEn3MAroRv9j35OjRASi','aa',43),(61,'hello@example.com','$2y$10$li6DDlpcdnqZUEuuOI.iCOjlX66EH92ePGwPcRhFPJbMi8I3e9K1K','Hello',20),(62,'aaa@a.com','$2y$10$Hvp/OdtLwjgP3KdZsIuYuu.xN0exoqxdSm90lFIX36NEjGr6hJjT2','a',22),(63,'hello@world','$2y$10$PuDOVo8nJSG1Kqx9zxze9OyDWGz/Q9hAg9x/vhRMjCg2aelHNwCIG','hello',21);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'team-b'
--

--
-- Dumping routines for database 'team-b'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-13  9:44:21
