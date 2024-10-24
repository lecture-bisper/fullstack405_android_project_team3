-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 58.239.58.243    Database: java405_team3_mobile
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

--
-- Table structure for table `moodo_mode`
--

DROP TABLE IF EXISTS `moodo_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moodo_mode` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `created_date` varchar(10) NOT NULL,
  `md_mode` int NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `md_daily` varchar(500) NOT NULL,
  `weather` int NOT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `UKqdb350fxjadvxogl4y7b02vge` (`user_id`,`created_date`),
  CONSTRAINT `FK1t5nipj30dlye79g880r551d4` FOREIGN KEY (`user_id`) REFERENCES `moodo_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moodo_mode`
--

LOCK TABLES `moodo_mode` WRITE;
/*!40000 ALTER TABLE `moodo_mode` DISABLE KEYS */;
INSERT INTO `moodo_mode` VALUES (2,'2024-09-09',5,'testUser1','아주 좋아용',2),(3,'2024-09-06',4,'testUser1','ui change',1),(5,'2024-09-08',4,'testUser1','goodddd',2),(8,'2024-09-10',4,'yuni0819','프로젝트가 어느덧 막바지를 향해 달려가고 있다. 기부니가 좋다',1),(9,'2024-09-09',3,'yuni0819','두바이 춰컬릿 맛잇다~',1),(11,'2024-09-12',2,'testUser1','비가오려나',2),(12,'2024-09-11',4,'testUser1','사이드 바 완성',1),(13,'2024-09-13',5,'testUser1','><',1),(14,'2024-09-19',4,'yuni0819','피자 먹고싶네',1),(15,'2024-09-19',2,'yenn0918','연휴끝나서 슬픔',1),(16,'2024-09-18',5,'yenn0918','생일 긋',1),(18,'2024-09-17',4,'testUser1','추석이다 .. 근데 너무 더움 ㅜ\n이게 무슨 추석이야\n완전 한여름이다..',1),(19,'2024-09-20',4,'testUser1','발표날',3),(20,'2024-09-02',5,'testUser1','비만 좀 그쳤으면 좋겠다ㅠㅠ',4),(21,'2024-09-21',4,'moodo1234','무두의 생일!',3);
/*!40000 ALTER TABLE `moodo_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moodo_todo`
--

DROP TABLE IF EXISTS `moodo_todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moodo_todo` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `td_check` varchar(1) NOT NULL,
  `td_list` varchar(400) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `color` varchar(255) NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `FKjx2twa5p6gbyjtdmmvw5n9syn` (`user_id`),
  CONSTRAINT `FKjx2twa5p6gbyjtdmmvw5n9syn` FOREIGN KEY (`user_id`) REFERENCES `moodo_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moodo_todo`
--

LOCK TABLES `moodo_todo` WRITE;
/*!40000 ALTER TABLE `moodo_todo` DISABLE KEYS */;
INSERT INTO `moodo_todo` VALUES (13,'2024-09-11 11:12:24.000000','2024-09-11 23:59','2024-09-11 00:00','Y','save test','testUser1','red'),(16,'2024-09-11 15:11:15.000000','2024-09-13 23:59','2024-09-11 00:00','N','안드로이드 프로젝트 작업','testUser1','orange'),(18,'2024-09-12 10:16:07.000000','2024-10-09 23:59','2024-10-09 00:00','N','제발좀','testUser1','blue'),(19,'2024-09-12 10:46:10.000000','2024-09-12 23:59','2024-09-12 00:00','Y','색깔이 아주 마음에 들어요','testUser1','red'),(20,'2024-09-12 12:41:25.000000','2024-09-12 23:59','2024-09-12 00:00','N','검색 기능 완료!','testUser1','green'),(21,'2024-09-13 15:47:00.000000','2024-09-15 23:59','2024-09-13 00:00','Y','Project...\n','testUser1','orange'),(22,'2024-09-19 09:52:00.000000','2024-09-19 23:59','2024-09-19 00:00','Y','프로젝트 마무리 하기','yuni0819','blue'),(24,'2024-09-19 09:53:00.000000','2024-09-19 23:59','2024-09-19 00:00','Y','병원가기','yuni0819','orange'),(25,'2024-09-19 10:04:00.000000','2024-09-19 23:59','2024-09-19 00:00','Y','\n피자먹기','yuni0819','orange'),(26,'2024-09-19 14:36:00.000000','2024-09-19 23:59','2024-09-19 00:00','N','프로젝트 마무리','yenn0918','green'),(27,'2024-09-19 16:35:00.000000','2024-09-20 23:59','2024-09-20 00:00','N','프로젝트 발표하기 덜덜','yenn0918','orange'),(28,'2024-09-19 16:35:00.000000','2024-09-19 23:59','2024-09-19 00:00','Y','비타민 챙겨먹기','yenn0918','red'),(29,'2024-09-19 16:36:00.000000','2024-09-19 23:59','2024-09-19 00:00','Y','카톡 답장하기','yenn0918','yellow'),(35,'2024-09-20 10:57:00.000000','2024-09-20 23:59','2024-09-20 00:00','Y','프로젝트','testUser1','orange'),(36,'2024-09-21 10:07:00.000000','2024-09-21 23:59','2024-09-21 00:00','Y','시연 영상 제작하기!!','testUser1','blue'),(37,'2024-09-21 10:23:00.000000','2024-09-21 23:59','2024-09-21 00:00','Y','시연 영상 제작하기!!!!','moodo123','orange');
/*!40000 ALTER TABLE `moodo_todo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moodo_user`
--

DROP TABLE IF EXISTS `moodo_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moodo_user` (
  `id` varchar(45) NOT NULL,
  `age` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `profile_picture_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moodo_user`
--

LOCK TABLES `moodo_user` WRITE;
/*!40000 ALTER TABLE `moodo_user` DISABLE KEYS */;
INSERT INTO `moodo_user` VALUES ('1234','1234/12/34','1234','1234',NULL),('aejin123','2001/03/13','aejin','aejin123',NULL),('aejin1234','2000/01/12','aejin','1234',NULL),('hong','2000/01/01','hong','hong1234',NULL),('moodo123','1999/09/22','무두','moodo123',NULL),('moodo1234','1999/09/21','김무두','12341234',NULL),('qwer123','1999/09/22','qwer','qwer123',NULL),('qwer1234','1111/11/11','qwer','12341234',NULL),('sujin123','2000/01/19','sujin','sujin123',NULL),('test123','1999/02/02','홍길동','test123',NULL),('testUser1','1993/09/02','John Doe','12345',NULL),('testUser2','2000/01/19','Olivia Thomas','password123',NULL),('user','1999/09/02','아잉유','1234',NULL),('yenn0918','1997/09/18','정예은	','12345','uploads\\yenn0918_33.jpg'),('yuni0819','1995/08/19','박찬윤	','1234',NULL);
/*!40000 ALTER TABLE `moodo_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'java405_team3_mobile'
--

--
-- Dumping routines for database 'java405_team3_mobile'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-23 17:08:28
