-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: food_delivery_db
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `is_available` tinyint DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Margherita Pizza',249.00,5.0,'Margherita Pizza.png','Pizza',1,2),(2,'Hot Cheesy Pizza',299.00,4.7,'hot cheesy pizza.png','Pizza',1,2),(3,'Pepperoni Pizza',349.00,4.8,'pepperoni pizza.png','Pizza',1,2),(4,'Sicilian Pizza',399.00,4.9,'Sicilian pizza.png','Pizza',1,2),(5,'Avocado toast egg tomato healthy',399.00,4.9,'avocado toast egg tomato healthy.png','Healthy',1,2),(6,'Chocolate Shake',149.00,4.6,'chocolate shake.png','Beverage',1,2),(7,'Crispy Chicken Burger with Lettuce',229.00,4.5,'crispy chicken burger with lettuce.png','Burger',1,3),(8,'Crunchy Chicken Burger with Lettuce',249.00,4.6,'crunchy chicken burger with lettuce.png','Burger',1,3),(9,'Veg Burger',199.00,4.4,'burger with vegetable.png','Burger',1,3),(10,'Cranberry Mojito Cocktail',149.00,4.7,'Cranberry mojito cocktail.png','Beverage',1,3),(11,'Fresh Vegetable Salad',179.00,4.5,'fresh vegetable salad .png','Healthy',1,3),(12,'Indian Tandoori Zinger Burger with Cheese',289.00,4.8,'Indian-Tandoori-Zinger-burger---with-cheese.webp','Burger',1,4),(13,'Hot Cheesy Pizza',329.00,4.7,'hot cheesy pizza.png','Pizza',1,4),(14,'Creamy Pasta',249.00,5.0,'creamy pasta.png','Burger',1,4),(15,'Indian Masala Chai',99.00,4.8,'indian masala chai.png','Beverage',1,4),(16,'Delicious Shrikhand with Saffron',159.00,4.9,'Delicious Shrikhand with Saffron.png','Dessert',1,4),(17,'Strawberry Cheesecake with Creamy Layers',199.00,4.9,'Strawberry Cheesecake with Creamy Layers.png','Dessert',1,4),(18,'Deliciously Chocolate  Cookies',149.00,4.8,'Deliciously Chocolate  Cookies.png','Dessert',1,4),(19,'Pancake Stack with Strawberries Syrup',280.00,4.9,'Pancake Stack with Strawberries Syrup.png','Dessert',1,4),(20,'Nutritious  bowl',230.00,4.9,'nutritious salad bowl.png','Healthy',1,3);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (2,2,'Margherita Pizza',1,249.00),(3,2,'Sicilian Pizza',1,399.00),(4,2,'Pepperoni Pizza',1,349.00),(5,3,'Margherita Pizza',1,249.00),(6,3,'Hot Cheesy Pizza',1,299.00),(7,3,'Pepperoni Pizza',1,349.00),(8,4,'Margherita Pizza',1,249.00),(9,4,'Hot Cheesy Pizza',1,299.00),(10,4,'Pepperoni Pizza',1,349.00),(11,5,'Hot Cheesy Pizza',1,299.00),(12,5,'Pepperoni Pizza',1,349.00),(13,6,'Crunchy Chicken Burger with Lettuce',1,249.00),(14,7,'Hot Cheesy Pizza',1,299.00),(15,8,'Margherita Pizza',1,249.00),(16,8,'Hot Cheesy Pizza',1,299.00),(17,8,'Pepperoni Pizza',1,349.00),(18,9,'Margherita Pizza',1,249.00),(19,9,'Hot Cheesy Pizza',1,299.00),(20,10,'Hot Cheesy Pizza',1,299.00),(21,10,'Pepperoni Pizza',1,349.00),(22,11,'Margherita Pizza',1,249.00),(23,12,'Margherita Pizza',1,249.00),(24,13,'Margherita Pizza',1,249.00),(25,14,'Margherita Pizza',1,249.00),(26,15,'Margherita Pizza',1,249.00);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,6,2,997.00,'2026-06-29 15:25:38','goa','UPI','Placed'),(3,6,2,897.00,'2026-06-29 15:44:52','goa','Cash On Delivery','Placed'),(4,6,2,897.00,'2026-06-29 16:31:45','goa','Cash On Delivery','Placed'),(5,6,2,648.00,'2026-06-29 16:40:47','goa','Credit Card','Placed'),(6,6,3,249.00,'2026-06-29 16:41:49','goa','Cash On Delivery','Placed'),(7,6,2,299.00,'2026-06-29 16:43:49','goa','Cash On Delivery','Placed'),(8,6,2,897.00,'2026-06-29 21:51:47','goa','Cash On Delivery','Placed'),(9,6,2,548.00,'2026-06-30 12:09:16','goa','Cash On Delivery','Placed'),(10,6,2,648.00,'2026-07-01 20:48:19','goa','UPI','Placed'),(11,6,2,249.00,'2026-07-02 22:51:06','goa','Cash On Delivery','Placed'),(12,6,2,249.00,'2026-07-03 13:22:05','belgaum','Cash On Delivery','Placed'),(13,6,2,249.00,'2026-07-04 11:26:08','kurbarhatti dhamne ','Cash On Delivery','Placed'),(14,6,2,249.00,'2026-07-04 22:41:50','Goa','Cash On Delivery','Placed'),(15,6,2,249.00,'2026-07-05 17:48:45','goa','Cash On Delivery','Placed');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `admin_id` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cuisine_type` varchar(100) DEFAULT NULL,
  `eta` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `isAvailable` tinyint DEFAULT NULL,
  `rating` double DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (2,'Pizza Palace',102,'Mumbai','Pizza',30,'Pizza Palace.png',1,4.5),(3,'Burger Hub',103,'Pune','Burger',25,'Burger hub.png',1,4.3),(4,'Spice Kitchen',104,'Bangalore','Indian',35,'Spice kitchen.png',1,4.6);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text,
  `phone_number` varchar(15) DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role` enum('Customer','RestaurantAdmin','DeliveryAgent','SuperAdmin') DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alex','1234','alex@gmail.com','Bangalore','9876543210','2026-03-16 11:29:32','2026-03-16 05:59:32','Customer'),(3,'saiprasad','123456','sai@gmail.com','Pune','8888888888','2026-06-15 12:47:20','2026-06-15 07:17:20','Customer'),(4,'Patil','987654321','patil123@gmail.com','benglore','0987654321','2026-06-27 11:43:18','2026-06-27 06:13:18','Customer'),(6,'Adi','4321','adi@gmail.com','Goa','7685947365','2026-06-27 11:48:01','2026-06-27 06:18:01','Customer'),(7,'Dev','12345','dev@gmail.com','Pune','5463789234','2026-06-27 12:03:21','2026-06-27 06:33:21','Customer'),(8,'ritu','767678','ritu@gmail.com','belgaum','7676789087','2026-06-27 13:04:54','2026-06-27 07:34:54','Customer');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-05 22:13:08
