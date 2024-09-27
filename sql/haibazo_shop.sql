-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: haibazo_shop
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `detai_product_size`
--

DROP TABLE IF EXISTS `detai_product_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detai_product_size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `size` varchar(255) DEFAULT NULL,
  `detail_id` int NOT NULL,
  `product_size_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmmhyplvlokkph4dwi944tlx0k` (`detail_id`),
  KEY `FK3h7gpsd5wgy03himj5knj18r1` (`product_size_id`),
  CONSTRAINT `FK3h7gpsd5wgy03himj5knj18r1` FOREIGN KEY (`product_size_id`) REFERENCES `detail` (`id`),
  CONSTRAINT `FKmmhyplvlokkph4dwi944tlx0k` FOREIGN KEY (`detail_id`) REFERENCES `detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detai_product_size`
--

LOCK TABLES `detai_product_size` WRITE;
/*!40000 ALTER TABLE `detai_product_size` DISABLE KEYS */;
INSERT INTO `detai_product_size` VALUES (9,'S',3,3),(10,'M',3,3),(11,'L',3,3),(12,'XL',3,3),(13,'M',3,3),(14,'S',4,4),(15,'M',4,4),(16,'L',4,4),(17,'XL',4,4),(18,'M',3,3);
/*!40000 ALTER TABLE `detai_product_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail`
--

DROP TABLE IF EXISTS `detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_description` varchar(255) DEFAULT NULL,
  `product_hurry_up` date DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKocw3drdx1na1ihuk5nlfm364c` (`product_id`),
  CONSTRAINT `FKnogkshb9tv6mtc9em7efogdni` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail`
--

LOCK TABLES `detail` WRITE;
/*!40000 ALTER TABLE `detail` DISABLE KEYS */;
INSERT INTO `detail` VALUES (3,'An even more comfortable and stylish t-shirt for everyday wear.','2024-11-15',NULL),(4,'A comfortable and stylish t-shirt for everyday wear.','2024-10-15',NULL);
/*!40000 ALTER TABLE `detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_product_color`
--

DROP TABLE IF EXISTS `detail_product_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail_product_color` (
  `id` int NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  `detail_id` int NOT NULL,
  `product_color_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgf0i6y5xrcek68lekkhu8lc0v` (`detail_id`),
  KEY `FKm3wtsxe9d1xsmtakjjsoguqo7` (`product_color_id`),
  CONSTRAINT `FKgf0i6y5xrcek68lekkhu8lc0v` FOREIGN KEY (`detail_id`) REFERENCES `detail` (`id`),
  CONSTRAINT `FKm3wtsxe9d1xsmtakjjsoguqo7` FOREIGN KEY (`product_color_id`) REFERENCES `detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_product_color`
--

LOCK TABLES `detail_product_color` WRITE;
/*!40000 ALTER TABLE `detail_product_color` DISABLE KEYS */;
INSERT INTO `detail_product_color` VALUES (7,'Red',3,3),(8,'Blue',3,3),(9,'Black',3,3),(10,'Green',3,3),(11,'Red',4,4),(12,'Blue',4,4),(13,'Black',4,4),(14,'Green',3,3);
/*!40000 ALTER TABLE `detail_product_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_product_image_description`
--

DROP TABLE IF EXISTS `detail_product_image_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail_product_image_description` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url_image` varchar(255) DEFAULT NULL,
  `detail_id` int NOT NULL,
  `product_image_description_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK15jo3ucosk8qplgwxmnbd4ic8` (`detail_id`),
  KEY `FKlgbp2l9fmdkb7u9tdjbnhjsxu` (`product_image_description_id`),
  CONSTRAINT `FK15jo3ucosk8qplgwxmnbd4ic8` FOREIGN KEY (`detail_id`) REFERENCES `detail` (`id`),
  CONSTRAINT `FKlgbp2l9fmdkb7u9tdjbnhjsxu` FOREIGN KEY (`product_image_description_id`) REFERENCES `detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_product_image_description`
--

LOCK TABLES `detail_product_image_description` WRITE;
/*!40000 ALTER TABLE `detail_product_image_description` DISABLE KEYS */;
INSERT INTO `detail_product_image_description` VALUES (5,'https://example.com/images/tshirt-front.jpg',3,3),(6,'https://example.com/images/tshirt-back.jpg',3,3),(7,'https://example.com/images/updated-tshirt-front.jpg',3,3),(8,'https://example.com/images/tshirt-front.jpg',4,4),(9,'https://example.com/images/tshirt-back.jpg',4,4),(10,'https://example.com/images/updated-tshirt-front.jpg',3,3);
/*!40000 ALTER TABLE `detail_product_image_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `original_price` double NOT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `promotional_price` double NOT NULL,
  `product_detail_id` int NOT NULL,
  `rating_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK12yca5eayx44hoy35re1oo7k8` (`product_detail_id`),
  UNIQUE KEY `UKcpl5yf6l3nfpoocekhwt1pcdi` (`rating_id`),
  CONSTRAINT `FKl8l8p9w68qipyh361bad6cv68` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`id`),
  CONSTRAINT `FKot1k1jr03c49rqrpfhkhli25x` FOREIGN KEY (`product_detail_id`) REFERENCES `detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (3,24.99,'https://example.com/images/updated-stylish-tshirt.jpg','Updated Stylish T-Shirt',19.99,3,3),(4,29.99,'https://example.com/images/stylish-tshirt.jpg','Stylish T-Shirt',24.99,4,4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rating` double NOT NULL,
  `rating_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK9xmokhsr5b19ci77c84gdo88w` (`product_id`),
  CONSTRAINT `FKlkuwie0au2dru36asng9nywmh` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (3,4.8,0,3),(4,4.5,0,4);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `comment_image` varchar(255) DEFAULT NULL,
  `comment_video` varchar(255) DEFAULT NULL,
  `rating_id` int DEFAULT NULL,
  `review_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfoadt2illecegj32wlk5hau9p` (`rating_id`),
  KEY `FKf18j0pnuuchxv5qklesf7uil6` (`review_id`),
  CONSTRAINT `FKf18j0pnuuchxv5qklesf7uil6` FOREIGN KEY (`review_id`) REFERENCES `rating` (`id`),
  CONSTRAINT `FKfoadt2illecegj32wlk5hau9p` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (5,'Great product!','https://example.com/images/review1.jpg',NULL,3,NULL),(6,'Even better than before!','https://example.com/images/review2.jpg',NULL,3,NULL),(7,'Great product!','https://example.com/images/review1.jpg',NULL,4,4),(8,'Even better than before!','https://example.com/images/review2.jpg',NULL,3,3);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-27  7:50:31
