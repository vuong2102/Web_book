

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Khởi nghiệp phiêu lưu ký','Kinh doanh','145','Khởi nghiệp phiêu lưu ký.jpg'),
							(2,'Bí kíp live-stream ','Bí kíp','150','Live-stream.png'),
							(3,'Những câu hỏi tại sao?','Đố vui','50','Những câu hỏi tại sao.jpg'),
							(4,'Sổ kế toán','Kế toán','72','Sổ kế toán.jpg'),
							(5,'Thiên tài không bằng cấp','Self-help','112','Thiên tài không bằng cấp.jpg'),
							(6,'Think and Grow Rich','Self-help','229','Think and Grow Rich.jpg'),
							(7,'Đọc vị khách hàng','Business','213','Đọc vị khách hàng.jpg'),
							(8,'Giải mã vũ trụ','Science','75','Giải mã vũ trụ.jpg'),
							(9,'Kỳ vọng lớn lao','Novel','46','Kỳ vọng lớn lao.jpg'),
							(10,'Một chỗ trong đời','Novel','52','Một chỗ trong đời.jpg');

UNLOCK TABLES;
