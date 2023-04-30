

CREATE TABLE `products` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `user_id`int DEFAULT NULL,
  `order_quantity` int DEFAULT NULL,
  `order_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
)