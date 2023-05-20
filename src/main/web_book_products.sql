

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `quantityInStore` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Khởi nghiệp phiêu lưu ký','Kinh doanh','145','Khởi nghiệp phiêu lưu ký.jpg',1),
							(2,'Bí kíp live-stream ','Bí kíp','150','Live-stream.png',20),
							(3,'Những câu hỏi tại sao?','Đố vui','50','Những câu hỏi tại sao.jpg',10),
							(4,'Sổ kế toán','Kế toán','72','Sổ kế toán.jpg',5),
							(5,'Thiên tài không bằng cấp','Self-help','112','Thiên tài không bằng cấp.jpg',7),
							(6,'Think and Grow Rich','Self-help','229','Think and Grow Rich.jpg',6),
							(7,'Đọc vị khách hàng','Business','213','Đọc vị khách hàng.jpg',3),
							(8,'Giải mã vũ trụ','Science','75','Giải mã vũ trụ.jpg',8),
							(9,'Kỳ vọng lớn lao','Novel','46','Kỳ vọng lớn lao.jpg',9),
							(10,'Một chỗ trong đời','Novel','52','Một chỗ trong đời.jpg',9);

UNLOCK TABLES;
insert into products (name, category, price, image, description, quantityInStore) values ('Ba chú lợn con', 'Truyện tranh', '10', 'Ba chú lợn con.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Cô bé bán diêm', 'Truyện tranh', '10', 'Cô bé bán diêm.jpg', 'gahshgj', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Nàng tiên cá', 'Truyện tranh', '10', 'Nàng tiên cá.jpg', 'hgjjghk', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Rùa và thỏ', 'Truyện tranh', '10', 'Rùa và thỏ.jpg', 'thstjjk', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Vịt con xấu xí', 'Truyện tranh', '10', 'Vịt con xấu xí.jpg', 'djklflj', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Dế mèn phiêu lưu ký', 'Truyện tranh', '10', 'Dế mèn phiêu lưu ký.jpg', 'xnbvmhg', '1000')
insert into products (name, category, price, image, description, quantityInStore) values ('Thời gian tươi đẹp', 'Tiểu thuyết', '15', 'Thời gian tươi đẹp.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Bên nhau trọn đời', 'Tiểu thuyết', '15', 'Bên nhau trọn đời.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Hóa ra anh vẫn ở đây', 'Tiểu thuyết', '17', 'Hóa ra anh vẫn ở đây.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Hoàng tử bé', 'Tiểu thuyết', '19', 'Hoàng tử bé.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Mắt biết', 'Tiểu thuyết', '18', 'Mắt biết.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Những ngày thơ ấu', 'Tiểu thuyết', '15', 'Những ngày thơ ấu.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Thanh xuân có cậu là đủ rồi', 'Tiểu thuyết', '15', 'Thanh xuân có cậu là đủ rồi.png', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Thất tịch không mưa', 'Tiểu thuyết', '20', 'Thất tịch không mưa.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Thời thơ ấu', 'Tiểu thuyết', '15', 'Thời thơ ấu.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Chí Phèo', 'Văn học', '15', 'Chí Phèo.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Số đỏ', 'Văn học', '15', 'Số đỏ.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Tam Quốc diễn nghĩa', 'Văn học', '17', 'Tam Quốc diễn nghĩa.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Tắt đèn', 'Văn học', '19', 'Tắt đèn.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Truyện Kiều', 'Văn học', '18', 'Truyện Kiều.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Vợ nhặt', 'Văn học', '15', 'Vợ nhặt.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Chiếc lá cuối cùng', 'Văn học', '15', 'Chiếc lá cuối cùng.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Không gia đình', 'Văn học', '20', 'Không gia đình.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Lão Hạc', 'Văn học', '15', 'Lão Hạc.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Giải mã chiến lược đông tây', 'Kinh tế', '55', 'Giải mã chiến lược đông tây.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Quản lý những điều cốt lõi', 'Kinh tế', '81', 'Quản lý những điều cốt lõi.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Việc làm', 'Kinh tế', '17', 'Việc làm.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Mình có rất nhiều thói quen tốt', 'Kỹ năng', '19', 'Mình có rất nhiều thói quen tốt.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Mình làm việc không phân tâm', 'Kỹ năng', '18', 'Mình làm việc không phân tâm.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Tôi tài giỏi bạn cũng thế', 'Kỹ năng', '15', 'Tôi tài giỏi bạn cũng thế.jpg', 'qetewty', '1000');
insert into products (name, category, price, image, description, quantityInStore) values ('Tự bảo vệ bản thân', 'Kỹ năng', '28', 'Tự bảo vệ bản thân.png', 'qetewty', '1000');
