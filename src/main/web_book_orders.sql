

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `user_id`int DEFAULT NULL,
  `order_quantity` int DEFAULT NULL,
  `order_date` varchar(45) DEFAULT NULL,
  `status_delivery` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
)